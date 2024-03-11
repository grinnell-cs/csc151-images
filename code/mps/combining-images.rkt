#lang racket

(require csc151)
(require rackunit)

;;; combining-images.rkt
;;;   A variety of procedures that combine images, created for MP5 in
;;;   CSC-151-XX 2024Sp.
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by SamR and Leah.  That code includes 
;;;   this header, the "provided code" section below, and a bit of
;;;   other material.
;;; * ...

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (arrange-horizontally images) -> image?
;;;   images : (list-of image?)
;;; Arrange all of the images in `images` in a row, beside each other.
(define arrange-horizontally
  (lambda (images)
    (cond
      [(null? images)
       (solid-rectangle 0 0 (rgb 0 0 0 0))]
      [(null? (cdr images))
       (car images)]
      [else
       (apply beside images)])))

;;; (digit? val) -> boolean?
;;;   val : any?
;;; Determine if `val` is a single digit.
(define digit?
  (all-of exact-integer? nonnegative? (less-than 10)))

;;; (half-size img halign valign) -> image?
;;; Create a half-size version of the image, aligned in the space of
;;; the image as specified.
;;;
;;; * `halign` should be "left", "center", or "right".
;;; * `valign` should be "top", "center", or "bottom".
(define half-size
  (lambda (img halign valign)
    (overlay/align halign valign
                   (scale img 1/2)
                   (transparent-rectangle (image-width img)
                                          (image-height img)))))

;;; (overlay-alt top-image bottom-image) -> image?
;;;   top-image : image?
;;;   bottom-image : image?
;;; Overlay `top-image` on `bottom-image`, combining the two images
;;; in the positions in which they overlap.
(define overlay-alt
  (lambda (top-image bottom-image)
    (set-transparency (overlay (set-transparency top-image 140)
                               bottom-image)
                      255)))

;;; (restrict-size img max-width max-height) -> image?
;;;   img : image?
;;;   max-width : positive-integer?
;;;   max-height : positive-integer?
;;; Restrict the size of `img` to be no more than `max-width` by
;;; `max-height`. If the image is larger than that, scales
;;; appropriately (and uniformly).
(define restrict-size
  (lambda (img max-width max-height)
    (if (or (zero? (image-width img))
            (zero? (image-height img)))
        img
        (restrict-size/helper img
                              (min (/ max-width (image-width img))
                                   (/ max-height (image-height img)))))))

;;; (restrict-size/helper img factor) -> image?
;;;   img : image?
;;;   factor : positive-real?
;;; Rescale `img` by `factor`, provided `factor` is less than one.
(define restrict-size/helper
  (lambda (img factor)
    (if (< factor 1)
        (scale img factor)
        img)))

;;; (rgb-set-transparency color alpha) -> rgb?
;;;   color : rgb?
;;;   alpha : rgb-component?
;;; Build a new version of `color` whose alpha channel is
;;; `alpha` and whose RGB components are the same.
(define rgb-set-transparency
  (lambda (color alpha)
    (rgb (rgb-red color)
         (rgb-green color)
         (rgb-blue color)
         alpha)))

;;; (set-transparency img alpha) -> image?
;;;   img : image?
;;;   alpha : rgb-component?
;;; Build a new version of `img` in which the transparency of
;;; each non-transparent pixel is set to `alpha`.
(define set-transparency
  (lambda (img alpha)
    (pixel-map (cut (set-transparency/helper <> alpha)) img)))

;;; (set-transparency/helper color alpha) -> rgb?
;;;   color : rgb?
;;;   alpha : rgb-component?
;;; If the alpha channel of `color` is not zero, build a new
;;; version of `color` with the alpha channel set to `alpha`.
(define set-transparency/helper
  (lambda (color alpha)
    (if (zero? (rgb-alpha color))
        color
        (rgb-set-transparency color alpha))))

;;; (string->digits str) -> (list-of digit?)
;;;   string : string?
;;; Convert a string to a list of digits in a strange but predictable
;;; way.
;;;
;;; Used primarily to build lists of digits for various procedures.
(define string->digits
  (lambda (str)
    (map (o string->number string)
         (string->list (reduce string-append
                               (map (o number->string char->integer)
                                    (string->list str)))))))

; +----------------------------------+-------------------------------
; | Provided code: Converting digits |
; +----------------------------------+

;;; (digit->color digit) -> rgb?
;;;   digit : (all-of exact-integer? (at-least 0) (at-most 9))
;;; Convert a digit to a color (e.g., when building a list of shapes from
;;; a list of digits).
(define digit->color
  (lambda (digit)
    (list-ref (list (rgb 255 0 0) (rgb 255 255 0) (rgb 0 255 0) (rgb 0 255 255)
                    (rgb 0 0 255) (rgb 255 0 255) (rgb 0 0 0) (rgb 255 255 255)
                    (rgb 85 85 85) (rgb 170 170 170))
              digit)))

;;; (digit->pen-size digit) -> positive-integer?
;;;   digit : digit?
;;; Determine a pen-size based on a digit
(define digit->pen-size
  (lambda (digit)
    (+ 1 digit)))

;;; (digit->scale-factor digit) -> positive-real?
;;;   digit : digit?
;;; Determine a scale factor based on the digit.
(define digit->scale-factor
  (lambda (digit)
    (+ 1 (* 1/30 (+ 1 (* (- digit 5) 2))))))

;;; (digit->shift digit) -> positive-integer?
;;;   digit : digit?
;;; Determine a horizontal or shift based on digit.
(define digit->shift
  (lambda (digit)
    (+ 3 (* (- digit 5) 4))))

;;; (digit->size digit) -> positive-integer?
;;;   digit : digit?
;;; Determine a size based on digit.
(define digit->size
  (lambda (digit)
    (+ 20 (* 2 digit))))

;;; (digit->halignment digit) -> (one-of "left" "center" "right")
;;;   digit : digit?
;;; Convert a digit to a horizontal alignment.
(define digit->halignment
  (lambda (digit)
    (list-ref (list "left" "center" "right")
              (remainder digit 3))))

;;; (digit->valignment digit) -> (one-of "top" "center" "bottom")
;;;   digit : digit?
;;; Convert a digit to a vertical alignment.
(define digit->valignment
  (lambda (digit)
    (list-ref (list "top" "center" "bottom")
              (remainder digit 3))))

; +----------------------------+-------------------------------------
; | Part 1: Combining elements |
; +----------------------------+

; a. pair-horizontally

;;; (pair-horizontally images) -> ???
;;;   images : ???
;;; ???
(define pair-horizontally
  ???)

; At least three tests for pair-horizontally

; b. pair-vertically

;;; (pair-vertically images) -> ???
;;;   images : ???
;;; ???
(define pair-vertically
  ???)

; At least three tests for pair-vertically

; c. gridify

;;; (gridify-hv images) -> ???
;;;   images : ???
;;; ???
(define gridify-hv
  (lambda (images)
    (cond
      [(null? images)
       (transparent-rectangle 0 0)]
      [(null? (cdr images))
       (car images)]
      [else
       (gridify-vh (pair-horizontally images))])))

;;; (gridify-vh images) -> ???
;;;   images : ???
;;; ???
(define gridify-vh
  (lambda (images)
    (cond
      [(null? images)
       (transparent-rectangle 0 0)]
      [(null? (cdr images))
       (car images)]
      [else
       (gridify-hv (pair-vertically images))])))

#|
Explanation of gridify code

???
|#

; d. overlay-pairs

;;; (overlay-pairs images) -> (list-of image?)
;;;   images : (list-of image?)
;;; For each neighboring pair in `images` (e.g., the values at indices
;;; 0 and 1, indices 2 and 3, indices 4 and 5, and so on and so forth),
;;; combine the pair into a single image by putting them beside each
;;; other.
(define overlay-pairs
  ???)

; e. overlaid-grids

;;; (overlaid-grids images) -> image?
;;;   images : (list-of image?)
;;; Combine the images in images by alternately (a) putting neighboring
;;; elements together side-by-side, (b) putting the results together
;;; in pairs one-over-the-other (effectively making a 2x2 grid), and (c)
;;; overlaying neighboring elements.
(define overlaid-grids
  ???)

; +--------------------------------+---------------------------------
; | Part 2: Making lists of images |
; +--------------------------------+

; a. simple-shape

;;; (simple-shape type colornum) -> image?
;;;   type : digit?
;;;   colornum : digit?
;;; Create a simple shape based on `type` and `colornum`. The color
;;; is given by `(digit->color colornum)`. The shape is chosen as follows
;;;
;;; * If `type` is 0, 1, or 2, the shape is a solid circle of diameter 30.
;;; * If `type` is 3, 4, or 5, the shape is a solid square of side-length 30.
;;; * If `type` is 6 or 7, the shape is a solid diamond of width 30 and
;;;   height 30.
;;; * If `type` is 8 or 9, the shape is a solid equilateral triangle of
;;;   edge length 30.
(define simple-shape
  ???)

; At least five tests of simple-shape

; b. simple-shapes

;;; (simple-shapes digits) -> (list-of image?)
;;;   digits : (list-of digit?)
;;; Create a list of shapes by applying `simple-shape` to each neighboring
;;; pair of digits. If any digits are left over, drop them.
(define simple-shapes
  ???)

; At least three tests for simple-shapes

; c. more-shapes

;;; (more-shapes digits) -> (list-of image?)
;;;   digits : (list-of digit?)
;;; Create a list of shapes by grabbing sets of digits and using
;;; the following policies.
;;;
;;; * If the first digit is 0, make a solid circle using the next digit 
;;;   as the size, and the digit after that as the color.
;;; * If the first digit is 1, make a solid square using the next digit 
;;;   as the size and the digit after that as the color.
;;; * If the first digit is 2, make a solid equilateral triangle using 
;;;   the next digit as the size and the digit after that as the color.
;;; * If the first digit is 3, make an outlined circle using the next digit 
;;;   as the size, the digit after that as the color, and the digit after 
;;;   that as the pen size.
;;; * If the first digit is 4, make an outlined square using the next digit 
;;;   as the size, the digit after that as the color, and the digit after 
;;;   that as the pen size.
;;; * If the first digit is 5, make a solid rectangle using the next digit 
;;;   as the width, the digit after that as the height, and the digit after 
;;;   that as the color.
;;; * If the first digit is 6, make a solid ellipse using the next digit 
;;;   as the width, the digit after that as the height, and the digit after 
;;;   that as the color.
;;; * If the first digit is 7, make a solid diamond using the next digit 
;;;   as the width, the digit after that as the height, and the digit after 
;;;   that as the color.
;;; * If the first digit is 8, make an outlined ellipse using the next digit 
;;;   as the width, the digit after that as the height, the digit after that 
;;;   as the color, and the digit after that as the pen size.
;;; * If the first digit is 9, make an outlined rectangle using the next digit 
;;;   as the width, the digit after that as the height, the digit after that 
;;;   as the color, and the digit after that as the pen size.
;;;
;;; After that, discard those digits and continue making shapes from
;;; the remaining digits.
;;;
;;; If insufficient digits remain to apply the appropriate policy, 
;;; generate the empty list.
(define more-shapes
  ???)

; At least three tests for more-shapes

; +---------------------------------+--------------------------------
; | Part 3: Lists of image variants |
; +---------------------------------+

; a. variants

;;; (variants img digits) -> (list-of image?)
;;;   img : image?
;;;   digits : (list-of digit?)
;;; Make a list of variants of `img` using the following policies.
;;;
;;; * If the first digit is 0, 1, or 2, use `pixel-map` to average each 
;;;   pixel with a color computed from the next three digits. Multiply 
;;;   each digit by 25 to determine the corresponding red, blue, or green 
;;;   component.
;;; * If the first digit is 3, make a horizontally flipped version of the 
;;;   image (using `hflip`).
;;; * If the first digit is 4, make a vertically flipped version of the 
;;;   image (using `vflip`).
;;; * If the first digit is 5, make a rotated version of the image. Use 
;;;   the next digit to determine what the rotation should be.
;;;     * 0, 1, 2: 90 degrees
;;;     * 3, 4, 5, 6: 180 degrees
;;;     * 7, 8, 9: -90 degrees or 270 degrees
;;; * If the first digit is 6, horizontally shift by a number computed 
;;;   from the next digit. 
;;; * If the first digit is 7, vertically shift by a number computed from 
;;;   the next digit. 
;;; * If the first digit is 8, scale by a factor computed from the next digit.
;;; * If the first digit is 9, make a half-size copy aligned according to 
;;;   the next two digits.
(define variants
  ???)


; b. Complex variants (optional)

;;; (complex-variants img digits) -> (list-of image?)
;;;   img : image?
;;;   digits : (list-of digit?)
;;; Make a list of variants of `img` using the rules of `variants`
;;; along with the additional policy that the first remaining number
;;; in the list indicates how many transformations to apply together.
;;;
;;; * If the first digit is 0, 1, or 2, does one transformation based on 
;;;   the following digits. 
;;; * If the first digit is 3, 4, or 5, does two transformations.
;;; * If the first digit is 6, 7, or 8, does three transformations.
;;; * If the first digit is 9, does four transformations.
(define complex-variants
  ???)

; +-------------------+----------------------------------------------
; | Part 4: Freestyle |
; +-------------------+

; a. Shifting perspectives

;;; (shifting-perspectives img str) -> image?
;;;   img : image?
;;;   str : string?
;;; Make a new image by combining variants of `img` in various ways,
;;; using `str` to help guide the combination.
(define shifting-perspectives
  ???)

; b. Image creation

#|
I created `uncertain-01.png` using the following command.

    > (image-save (shifting-perspectives IMAGE "STRING")
                  "uncertain-01.png")

I created `uncertain-02.png` using the following command.

    > (image-save (shifting-perspectives IMAGE "STRING")
                  "uncertain-02.png")

I created `uncertain-03.png` using the following command.

    > (image-save (shifting-perspectives IMAGE "STRING")
                  "uncertain-03.png")
|#
