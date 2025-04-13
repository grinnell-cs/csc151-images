#lang racket

(require csc151)
(require rackunit)

;;; pixel-problems.rkt
;;;   A variety of fractals and other shapes, created for MP7 in
;;;   CSC-151-NN SEMESETER
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by SamR and Leah.  
;;; * Add other acknowledgements here.

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

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
    (remainder (+ (color-red color) (color-green color) (color-blue color))
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
           [r (color-red color)]
           [g (color-green color)]
           [b (color-blue color)]
           [a (color-alpha color)]
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
      (positionally-transform-pixels! pixels width height)
      (pixels->image pixels width height))))

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
            (* 2
               (remainder (round (sqrt (+ (sqr (- col 150)) (sqr (- row 50)))))
                            32)))             
         (+ (rgb-blue color)
            (* 3
               (remainder (round (sqrt (+ (sqr (- col 200)) (sqr (- row 200)))))
                            25)))
         (rgb-alpha color))))

;;; sample-pixels : (vector-of rgb?)
;;; A set of sixteen sample pixels for our tests. 
(define sample-pixels
  (list->vector (map (lambda (x) (rgb (* 16 x) 0 0))
                     (range 16))))

;;; (red-less-than? c1 c2) -> boolean?
;;;   c1 : rgb?
;;;   c2 : rgb? 
;;; Determine if the red component of `c1` is less than the red component
;;; of `c2`.
(define red-less-than? 
  (lambda (c1 c2)
    (< (rgb-red c1) (rgb-red c2))))

; +------------------------------------+-----------------------------
; | Part one: Setting rows and columns |
; +------------------------------------+

; 1a. set-row!

;;; (set-row! pixels width height row color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   row : nonnegative-integer?
;;;   color : rgb?
;;; Sets the given row of the image to the specified color.
(define set-row!
  (lambda (pixels width height row color)
    ???))

; 1b. set-rows!

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
    ???))

; 1c. set-column!

;;; (set-column! pixels width height column color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   column : nonnegative-integer?
;;;   color : rgb?
;;; Sets the given column of the image to the specified color.
(define set-column! 
  (lambda (pixels width height column color)
    ???))

; 1d. set-columns!

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
    ???))

; 1e. set-region!

;;; (set-region! pixels width height left right top bottom color) -> void?
;;;   pixels : (all-of (vector-of rgb?) (has-length (* width height)))
;;;   width : positive-integer? (represents the width of the image)
;;;   height : positive-integer? (represents the height of the image)
;;;   left : non-negative integer? (at-most right)
;;;   right : non-negative integer? (at-most width)
;;;   top : non-negative integer? (at-most bottom)
;;;   bottom : non-negative integer? (at-most width)
;;;   color : rgb?
;;; Set a rectangular region of the image to `color`. The region is
;;; bounded on the left by `left` (inclusive), on the right by `right`
;;; (exclusive), on the top by `top`, and on the bottom by `bottom`.
(define set-region!
  (lambda (pixels width height left right top bottom color)
    ???))

; +----------------------------+-------------------------------------
; | Part two: Modifying images |
; +----------------------------+

;;; (positionally-transform-pixels! pixels width height) -> ???
;;;   pixels : ???
;;;   width : ???
;;;   height : ???
;;; ???
(define positionally-transform-pixels!
  (lambda (pixels width height)
    ???))

; +-----------------------------------------+------------------------
; | Part three: Modifying images, revisited |
; +-----------------------------------------+

; 3a. neighboring-pixels

;;; (neighboring-pixels pixels width height col row) -> ???
;;;   pixels : ???
;;;   width : ???
;;;   height : ???
;;;   col : ???
;;;   row : ???
;;; ???
(define neighboring-pixels
  (lambda (pixels width height col row)
    ???))

#|
(test-equal? "sample, upper-left corner"
             (sort (neighboring-pixels sample-pixels 4 4 0 0) red-less-than?)
             (list (rgb 0 0 0) (rgb 16 0 0)
                   (rgb 64 0 0) (rgb 80 0 0)))
(test-equal? "sample, col 1 row 0"
             (sort (neighboring-pixels sample-pixels 4 4 1 0) red-less-than?)
             (list (rgb 0 0 0) (rgb 16 0 0) (rgb 32 0 0)
                   (rgb 64 0 0) (rgb 80 0 0) (rgb 96 0 0)))
(test-equal? "sample, upper-right corner"
             (sort (neighboring-pixels sample-pixels 4 4 3 0) red-less-than?)
             (list (rgb 32 0 0) (rgb 48 0 0)
                   (rgb 96 0 0) (rgb 112 0 0)))
(test-equal? "sample, col 1 row 1"
             (sort (neighboring-pixels sample-pixels 4 4 1 1) red-less-than?)
             (list (rgb 0 0 0) (rgb 16 0 0) (rgb 32 0 0)
                   (rgb 64 0 0) (rgb 80 0 0) (rgb 96 0 0)
                   (rgb 128 0 0) (rgb 144 0 0) (rgb 160 0 0)))
(test-equal? "sample, lower-left corner"
             (sort (neighboring-pixels sample-pixels 4 4 0 3) red-less-than?)
             (list (rgb 128 0 0) (rgb 144 0 0)
                   (rgb 192 0 0) (rgb 208 0 0)))
(test-equal? "sample, lower-right corner"
             (sort (neighboring-pixels sample-pixels 4 4 3 3) red-less-than?)
             (list (rgb 160 0 0) (rgb 176 0 0)
                   (rgb 224 0 0) (rgb 240 0 0)))
|#

; 3b. blur-pixels

;;; (blur-pixels pixels width height) -> (vector-of rgb?)
;;;   pixels : (vector-of rgb?)
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; Blur all the pixels in `pixels` by averaging them with the surrounding
;;; pixels.
(define blur-pixels
  ???)

; 3c. enhance-pixels

;;; (enhance-pixels pixels width height) -> (vector-of rgb?)
;;;   pixels : (vector-of rgb?)
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; "Enhance" all the pixels in `pixels` by increasing the difference
;;; with the surrounding pixels.
(define enhance-pixels
  ???)

; +--------------------------+---------------------------------------
; | Part four: Steganography |
; +--------------------------+

; 4a. letter->number

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
    20))        ; STUB

#|
(test-equal? "t" (letter->number #\t) 20)
(test-equal? "period" (letter->number #\.) 27)
(test-equal? "space" (letter->number #\space) 28)
(test-equal? "question mark" (letter->number #\?) 31)
(test-equal? "exclamation point" (letter->number #\!) 31)
|#

; b. color->letter

;;; (color->letter color) -> ???
;;;   color : ???
;;; ???
(define color->letter
  ???)

#|
(test-equal? "null" (color->letter (rgb 0 0 0)) #\nul)
(test-equal? "a" (color->letter (rgb 33 0 0)) #\a)
(test-equal? "period" (color->letter (rgb 32 (+ 32 27) 0)) #\.)
(test-equal? "space" (color->letter (rgb 32 64 (+ 128 28))) #\space)
(test-equal? "newline" (color->letter (rgb 32 64 (+ 128 29))) #\newline)
(test-equal? "undefined" (color->letter (rgb 32 64 (+ 128 30))) #\_)
(test-equal? "asterisk" (color->letter (rgb 32 64 (+ 128 31))) #\*)
|#

; c. extract-text

;;; (extract-text pixels) -> ???
;;;   pixels : ???
;;; ????
(define extract-text
  ???)

#|
(test-equal? "extract-text: alphabet"
             (extract-text (list->vector (map (lambda (x) (rgb x 0 0))
                                              (range 1 65))))
             "abcdefghijklmnopqrstuvwxyz. \n_*")
(test-equal? "extract-text: meow"
             (extract-text (vector (rgb 1 1 1) (rgb 0 1 0) (rgb 5 5 10) 
                                   (rgb 8 8 16)))
             "cat")
|#

; d. steg-decode

;;; (steg-decode img) -> ???
;;;   img : ???
;;; ???
(define steg-decode
  ???)

#|
(test-equal? "steg-decode: aaa"
             (steg-decode (overlay (solid-circle 10 "black")
                                   (solid-square 10 (rgb 1 0 0))))
             "aaa")
(test-equal? "steg-decode: alphabet"
             (steg-decode (pixels->image (list->vector (map (cut (rgb <> 0 0)) 
                                                            (range 1 65)))
                                         8 8
                                         "encoded text"))
             "abcdefghijklmnopqrstuvwxyz. \n_*")
|#

; e. insert-text!

;;; (insert-text! text pixels) -> ???
;;;   text : ???
;;;   pixels : ???
;;; ???
(define insert-text
  ???)

; f. steg-encode

;;; (steg-encode text img) -> ???
;;;   text : ???
;;;   img : ???
;;; ???
(define steg-encode
  ???)

#|
(test-equal? "steg-encode: aphorism"
             (steg-decode (steg-encode "there is more to life than computer science"
                                       (solid-circle 20 "blue")))
             "there is more to life than computer science")
(test-equal? "steg-encode: empty string"
             (steg-decode (steg-encode "" (solid-square 5 "white")))
             "")
|#

; +----------------------+-------------------------------------------
; | Part five: Freestyle |
; +----------------------+
