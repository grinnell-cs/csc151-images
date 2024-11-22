;;; pixel-problems.scm
;;;   A variety of fractals and other shapes, created for MP7 in
;;;   CSC-151 2024Fa
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by Leah and PM. 
;;; * Add other acknowledgements here

(import image)
(import lab)
(import test)

(title "Pixel Problems")

; -------------------------------------------------------------------
(part "Provided Code")

;;; (average-color colors) -> rgb?
;;;   colors : (all-of (list-of rgb?) nonempty?)
;;; Average the colors in the list.
(define average-color
  (lambda (colors)
    (let* ([len (length colors)]
           [average-component
             (lambda (fun)
               (quotient (reduce + (map fun colors)) len))])
      (rgb (average-component rgb-red)
           (average-component rgb-green)
           (average-component rgb-blue)
           (average-component rgb-alpha)))))

;;; (blur img) -> image?
;;;   img : image?
;;; Blur the image by setting each pixel to the average of the 3x3 grid
;;; around that image (or the partial grid around edge/corner pixels).
(define blur
  (lambda (img)
    (let ([pixels (image->pixels img)]
          [width (image-width img)]
          [height (image-height img)])
      (pixels->image (blur-pixels pixels width height)
                     width height
                     (string-append (image-description img)
                                    ", blurred")))))

;;; blur-me : image?
;;; A sample image to blur.
(define blur-me (overlay (above (solid-circle 100 "blue")
                                (solid-rectangle 100 2 "white")
                                (solid-square 100 "red"))
                         (solid-rectangle 110 212 "white")))

;;; (color->number color) -> integer?
;;;   color : rgb?
;;; Use the not-so-secret formulat to convert a color to an appropriately
;;; representative integer.
(define color->number
  (lambda (color)
    (remainder (+ (rgb-red color) (rgb-green color) (rgb-blue color))
               32))) 

;;; (color-decrement-to r g b a target) -> color?
;;;   r : rgb-component?
;;;   g : rgb-component?
;;;   b : rgb-component?
;;;   a : rgb-component?
;;;   target : (all-of exact-integer? (at-least 0) (at-most (+ r g b)))
;;; Randomly decrement `r`, `g`, and `b` until we reach a sum of `target`.
(define color-decrement-to
  (lambda (r g b a target)
    (let ([rgb-sum (+ r g b)])
      (if (= rgb-sum target)
          (rgb r g b a)
          (let ([rand (random rgb-sum)])
            (cond
              [(< rand r)
               (color-decrement-to (- r 1) g b a target)]
              [(< rand (+ r g))
               (color-decrement-to r (- g 1) b a target)]
              [else
               (color-decrement-to r g (- b 1) a target)]))))))

;;; (color-increment-to r g b a target) -> color?
;;;   r : rgb-component?
;;;   g : rgb-component?
;;;   b : rgb-component?
;;;   a : rgb-component?
;;;   target : (all-of nonnegative-integer? (at-most (* 3 255)) (at-least (+ r g b)))
;;; Randomly increment `r`, `g`, and `b` until we reach a sum of `target`.
(define color-increment-to
  (lambda (r g b a target)
    (let ([rgb-sum (+ r g b)])
      (if (= rgb-sum target)
          (rgb r g b a)
          (let ([rand (random (- (* 3 255) rgb-sum))])
            (cond
              [(< rand (- 255 r))
               (color-increment-to (+ r 1) g b a target)]
              [(< rand (+ (- 255 r) (- 255 g)))
               (color-increment-to r (+ g 1) b a target)]
              [else
               (color-increment-to r g (+ b 1) a target)]))))))

;;; (encode-letter color) -> color?
;;;   letter : char?
;;;   color : color?
;;; Encode a letter in a color, creating a nearby color.
(define encode-letter
  (lambda (letter color)
    (let* ([current (color->number color)]
           [target (letter->number letter)]
           [pos-diff (remainder (+ 32 (- target current)) 32)]
           [r (rgb-red color)]
           [g (rgb-green color)]
           [b (rgb-blue color)]
           [a (rgb-alpha color)]
           [goal (+ r g b pos-diff)])
      (if (> (+ r g b) (+ 1 (* 3 127)))
          (color-decrement-to r g b a (+ -32 goal))
          (color-increment-to r g b a goal)))))

;;; (enhance img) -> image?
;;;   img : image?
;;; "Enhance" the image by increasing the difference between the pixel
;;; and its neighboring pixels.
(define enhance
  (lambda (img)
    (let ([pixels (image->pixels img)]
          [width (image-width img)]
          [height (image-height img)])
      (pixels->image (enhance-pixels pixels width height)
                     width height
                     (string-append (image-description img)
                                    ", enhanced")))))

;;; (enhance-color color base) -> rgb?
;;;   color : rgb?
;;;   base : rgb?
;;; "Enhance" `color` by increasing its difference from `base`.
(define enhance-color
  (lambda (color base)
    (rgb (enhance-component (rgb-red color) (rgb-red base))
         (enhance-component (rgb-green color) (rgb-green base))
         (enhance-component (rgb-blue color) (rgb-blue base))
         (enhance-component (rgb-alpha color) (rgb-alpha base)))))

;;; (enhance-component component base) -> rgb-component?
;;;   component : rgb-component?
;;;   base : rgb-component?
;;; Create a new version of `component` that has twice the distance
;;; from `base` (or as much more as possible).
(define enhance-component
  (lambda (component base)
    (max 0
         (min 255
              (+ component (- component base))))))

;;; (positionally-transform img) -> image?
;;;   img : image?
;;; Transform an image by adding the column of each pixel to its red
;;; component, the row of each pixel to its blue component, and the
;;; average of the row and column to the green component.
(define positionally-transform
  (lambda (img)
    (let ([pixels (image->pixels img)]
          [width (image-width img)]
          [height (image-height img)])
      (begin
        (positionally-transform-pixels! pixels width height)
        (pixels->image pixels width height)))))

;;; (positionally-transform-pixel color col row) -> rgb?
;;;   color : rgb?
;;;   col : nonnegative-integer?
;;;   row : nonnegative-integer?
;;; Transform `color` based on its column and row.
(define positionally-transform-pixel
  (lambda (color col row)
    (rgb (+ (rgb-red color)
            (remainder (round (sqrt (+ (sqr (- col 50)) (sqr (- row 50)))))
                       64))
         (+ (rgb-green color)
            (* 2 (remainder (round (sqrt (+ (sqr (- col 150)) (sqr (- row 50)))))
                            32)))             
         (+ (rgb-blue color)
            (* 3 (remainder (round (sqrt (+ (sqr (- col 200)) (sqr (- row 200)))))
                            25)))
         (rgb-alpha color))))

; -------------------------------------------------------------------
(part "Part 1: Setting rows and columns")

(problem "1a. set-row!")

;;; (set-row! pixels width height row color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   row : nonnegative-integer?
;;;   color : rgb?
;;; Sets the given row of the image to the specified color.
(define set-row!
  (lambda (pixels width height row color)
    {??}))

(problem "1b. set-rows!")

;;; (set-rows! pixels width height top bottom color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   top : nonnegative-integer?
;;;   bottom : nonnegative-integer?
;;;   color : rgb?
;;; Sets the rows between top (inclusive) and bottom (exclusive)
;;; to the given color.
(define set-rows!
  (lambda (pixels width height top bottom color)
    {??}))

(problem "1c. set-column!")

;;; (set-column! pixels width height column color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   column : nonnegative-integer?
;;;   color : rgb?
;;; Sets the given column of the image to the specified color.
(define set-column! 
  (lambda (pixels width height column color)
    {??}))

(problem "1d. set-columns!")

;;; (set-columns! pixels width height left right color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   left : nonnegative-integer?
;;;   right : nonnegative-integer?
;;;   color : rgb?
;;; Sets the columns between left (inclusive) to right (exclusive)
;;; to the given color.
(define set-columns!
  (lambda (pixels width height left right color)
    {??}))

(problem "1e. set-region!")

;;; (set-region! pixels width height left right top bottom color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   left : nonnegative-integer?
;;;   right : nonnegative-integer?
;;;   top : nonnegative-integer?
;;;   color : rgb?
;;; Set a rectangular region of the image to `color`. The region is
;;; bounded on the left by `left` (inclusive), on the right by `right`
;;; (exclusive), on the top by `top`, and on the bottom by `bottom`.
(define set-region!
  (lambda (pixels width height left right top bottom color)
    {??}))

; -------------------------------------------------------------------
(part "Part two: Modifying images")

;;; (positionally-transform-pixels! pixels width height) -> ???
;;;   pixels : ???
;;;   width : ???
;;;   height : ???
;;; ???
(define positionally-transform-pixels!
  (lambda (pixels width height)
    {??}))

; -------------------------------------------------------------------
(part "Part three: Steganography")

(problem "3a. letter->number")

;;; (letter->number letter) -> (all-of nonnegative-exact-integer? (less-than 31))
;;;   letter : char?
;;; Convert a letter to a number using the following encoding scheme.
;;; * 0: end of message
;;; * 1: a        
;;; * 2: b
;;; * 3: c
;;; * 4: d
;;; * 5: e
;;; * ...
;;; * 20: t
;;; * 21: u
;;; * 22: v
;;; * 23: w
;;; * 24: x
;;; * 25: y
;;; * 26: z
;;; * 27: period
;;; * 28: space
;;; * 29: newline
;;; * 30: reserved for future use (do not return this value)
;;; * 31: anything else
(define letter->number
  (lambda (letter)
    {??}))

(test-case "t"
  equal? 20
  (lambda ()
    (letter->number #\t)))

(test-case "period"
  equal? 27
  (lambda ()
    (letter->number #\.)))

(test-case "space"
  equal? 28
  (lambda ()
    (letter->number #\space)))

(test-case "question mark"
  equal? 31
  (lambda ()
    (letter->number #\?)))

(test-case "exclamation point"
  equal? 31
  (lambda ()
    (letter->number #\!)))

(problem "3b. color->letter")

;;; (color->letter color) -> ???
;;;   color : ???
;;; ???
(define color->letter
  (lambda (color)
    {??}))

(test-case "null"
  equal? #\null
  (lambda ()
    (color->letter (rgb 0 0 0))))

(test-case "a"
  equal? #\a
  (lambda ()
    (color->letter (rgb 33 0 0))))

(test-case "period"
  equal? #\.
  (lambda ()
    (color->letter (rgb 32 (+ 32 27) 0))))

(test-case "space"
  equal? #\space
  (lambda ()
    (color->letter (rgb 32 64 (+ 128 28)))))

(test-case "newline"
  equal? #\newline
  (lambda ()
    (color->letter (rgb 32 64 (+ 128 29)))))

(test-case "undefined"
  equal? #\_
  (lambda ()
    (color->letter (rgb 32 64 (+ 128 30)))))

(test-case "asterisk"
  equal? #\*
  (lambda ()
    (color->letter (rgb 32 64 (+ 128 31)))))

(problem "3c. extract-text")

;;; (extract-text pixels) -> ???
;;;   pixels : ???
;;; ????
(define extract-text
  (lambda (pixels)
    {??}))

(test-case "extract-text: alphabet"
  equal? "abcdefghijklmnopqrstuvwxyz. \n_*"
  (lambda ()
    (extract-text
      (list->vector (map (lambda (x) (rgb x 0 0)) (range 1 65))))))

(test-case "extract-text: meow"
  equal? "cat"
  (lambda ()
    (extract-text (vector (rgb 1 1 1) (rgb 0 1 0) (rgb 5 5 10) (rgb 8 8 16)))))

(problem "3d. steg-decode")

;;; (steg-decode img) -> ???
;;;   img : ???
;;; ???
(define steg-decode
  {??})
  
(test-case "steg-decode: alphabet"
  equal? "abcdefghijklmnopqrstuvwxyz. \n_*"
  (lambda ()
    (steg-decode
      (pixels->image
        (list->vector (map (section rgb _ 0 0) (range 1 65)))
        8 8))))

(problem "3e. insert-text!")

;;; (insert-text! text pixels) -> ???
;;;   text : ???
;;;   pixels : ???
;;; ???
(define insert-text
  (lambda (text pixels)
    {??}))

(problem "3f. steg-encode")

;;; (steg-encode text img) -> ???
;;;   text : ???
;;;   img : ???
;;; ???
(define steg-encode
  (lambda (text img)
    {??}))

(test-case "steg-encode: aphorism"
  equal? "there is more to life than computer science"
  (lambda ()
    (steg-decode
      (steg-encode "there is more to life than computer science"
                   (drawing->image (solid-circle 20 "blue"))))))
  
(test-case "steg-encode: empty string"
  equal? ""
  (lambda ()
    (steg-decode
      (steg-encode ""
                   (drawing->image (solid-square 5 "white"))))))
