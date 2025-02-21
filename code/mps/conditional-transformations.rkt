#lang racket

(require csc151)

;;; conditional-transformations.rkt
;;;   A variety of procedures that transform images, created for MP4 in
;;;   CSC-151-XX SEMESTER.
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;;
;;; * Starter code provided by SamR.  That code includes this header, 
;;;   the "provided code" section below, and a bit of other material.
;;; * ...

; +---------------------------------+--------------------------------
; | Sample code from the assignment |
; +---------------------------------+

; Some colors
(define gray0 (rgb 0 0 0))
(define gray1 (rgb 96 96 96))
(define gray2 (rgb 192 192 192))
(define gray3 (rgb 255 255 255))

;;; (rgb-brightness c) -> real? (between 0 and 100)
;;;   c : rgb?
;;; Find the approximate perceived brightness of c.
(define rgb-brightness
  (lambda (c)
    (round (* 100/255
              (+ (* .30 (rgb-red c))
                 (* .59 (rgb-green c))
                 (* .11 (rgb-blue c)))))))

;;; (rgb-grayscale c) -> rgb?
;;;   c : rgb?
;;; Convert `c` to a shade of gray of approximately the same brightness as `c`.
(define rgb-grayscale
  (lambda (c)
    (make-gray (round (* 255/100 (rgb-brightness c))))))

;;; (make-gray component) -> rgb?
;;;   component : nonnegative-integer? (in the range 0..255)
;;; Make a gray color all of whose components are `component`.
(define make-gray
  (lambda (component)
    (rgb component component component 255)))

;;; (rgb->4gray c) -> rgb?
;;;   c : rgb?
;;; Convert c to black, white, or a gray.
;;; * Returns `gray0` if the brightness of `c` is less than 25;
;;; * Returns `gray1` if the brightness of `c` is at least 25 but less than 50;
;;; * Returns `gray2` if the brightness of `c` is at least 50 but less than 75;
;;; * Returns `gray3` if the brightness of `c` is at least 75.
(define rgb->4gray
  (lambda (c)
    (brightness->4gray (rgb-brightness c))))

;;; (brightness->4gray b) -> rgb?
;;;   b : real? (between 0 and 100)
;;; Convert b to black, white, or a gray.
;;; * Returns `gray0` if `b` is less than 25;
;;; * Returns `gray1` if `b` is at least 25 but less than 50;
;;; * Returns `gray2` if `b` is at least 50 but less than 75;
;;; * Returns `gray3` if `b` is at least 75.
(define brightness->4gray
  (lambda (b)
    (cond
      [(< b 25)
       gray0]
      [(< b 50)
       gray1]
      [(< b 75)
       gray2]
      [else
       gray3])))

;;; (sample-pos2color-01 x y) -> rgb?
;;;   x : exact-nonnegative-integer?
;;;   y : exact-nonnegative-integer?
;;; Compute a color based on x and y.
(define sample-pos2color-01
  (lambda (x y)
    (cond
      [(< x 50)
       (rgb 0 0 255)]
      [(< y 25)
       (rgb 0 0 255)]
      [(>= x 100)
       (rgb 0 0 255)]
      [(>= y 75)
       (rgb 0 0 255)]
      [else
       (rgb 255 0 0)])))

;;; (sample-pos2color-02 x y) -> rgb?
;;;   x : exact-nonnegative-integer?
;;;   y : exact-nonnegative-integer?
;;; Compute a color based on x and y.
(define sample-pos2color-02
  (lambda (x y)
    (cond
      [(< x 50)
       (rgb 0 0 y)]
      [(< y 25)
       (rgb 0 0 y)]
      [(>= x 125)
       (rgb 0 0 y)]
      [(>= y 100)
       (rgb 0 0 y)]
      [else
       (rgb 255 0 0)])))

;;; (sample-pos2color-03 x y) -> rgb?
;;;   x : exact-nonnegative-integer?
;;;   y : exact-nonnegative-integer?
;;; Compute a color based on x and y.
(define sample-pos2color-03
  (lambda (x y)
    (if (< (+ (sqr (- x 100)) (sqr (- y 75))) (sqr 50))
        (rgb (* x 2) (* x 2) 0)
        (rgb 0 0 (- 255 y)))))

;;; (four-parts img) -> image?
;;;   img : image?
;;; Create a new version of image by dividing it into four quadrants
;;; and then making the top-left quadrant redder, the top-right
;;; quadrant greener, the bottom-left quadrant bluer, and the bottom-right
;;; quadrant yellower.
(define four-parts
  (lambda (img)
    (pixel-pos-map (lambda (pixel col row)
                     (if (< col (* 1/2 (image-width img)))
                         (if (< row (* 1/2 (image-height img)))
                             (rgb-redder pixel)
                             (rgb-greener pixel))
                         (if (< row (* 1/2 (image-height img)))
                             (rgb-bluer pixel) 
                             (rgb-redder (rgb-greener pixel)))))
                   img)))

; +---------------------------------------------+--------------------
; | Part one: Conditional color transformations |
; +---------------------------------------------+

; 1a.

;;; (closest-color color option1 option2 option3 option4) -> ???
;;;   color : rgb?
;;;   option1 : rgb?
;;;   option2 : rgb?
;;;   option3 : rgb?
;;;   option4 : rgb?
;;; ???
(define closest-color
  ???)

; 1b.

;;; (four-color img  option1 option2 option3 option4) -> ???
;;;   color : rgb?
;;;   option1 : rgb?
;;;   option2 : rgb?
;;;   option3 : rgb?
;;;   option4 : rgb?
;;; ???
(define four-color
  ???)

; 1c.

;;; (rgb-enhance-dominant color) -> ???
;;;   color : ???
;;; ???
(define rgb-enhance-dominant
  ???)

; 1d.

;;; (enhance-dominant img) -> ???
;;;   img : ???
;;; ???
(define enhance-dominant
  ???)

; +---------------------------------+--------------------------------
; | Part two: Position-based images |
; +---------------------------------+

; 2a.

;;; (make-rectangle left top width height iwidth iheight color bg) -> ???
;;;   left : ???
;;;   top : ???
;;;   width : ???
;;;   height : ???
;;;   iwidth : ???
;;;   iheight : ???
;;;   color : ???
;;;   bg : ???
;;; ????
(define make-rectangle
  ???)

; 2b.

;;; (make-circle x y radius iwidth iheight color bg) -> ???
;;;   x : ???
;;;   y : ???
;;;   radius : ???
;;;   iwidth : ???
;;;   iheight : ???
;;;   color : ???
;;;   bg : ???
;;; ????
(define make-circle
  ???)

; +--------------------------------------------------+---------------
; | Part three: Position-based color transformations |
; +--------------------------------------------------+

; 3a.

;;; (concentric-rectangles img) -> image?
;;;   img : image?
;;; Break up `img` into four concentric rectangles. Set the hue of the
;;; innermost rectangle to 0, the next rectangle to 90, the next to 180,
;;; and the outermost to 270.
(define concentric-rectangles
  ???)

; 3b.

;;; (emphasize-circle img x y radius) -> image?
;;;   img : image?
;;;   x : real?
;;;   y : real?
;;;   radius : real?
;;; Make a new version of image in which the circular area centered at
;;; (`x`,`y`) with radius `radius` remains unchanged and the rest of
;;; the image is converted to grayscale.
(define emphasize-circle
  ???)

; +----------------------+-------------------------------------------
; | Part four: Freestyle |
; +----------------------+


#|
How to recreate the sample images.

(image-load ???)
...
|#
