#lang racket

(require csc151)
(require rackunit)

;;; recursive-image-construction.rkt
;;;   A variety of procedures that transform images, created for MP6 in
;;;   CSC-151-XX 2025Sp.
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by SamR. That code includes this header, 
;;;   the "provided code" section below, and a bit of other material.
;;; * ...

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; empty-image : image?
;;; An "empty" image. Zero width. Zero height. Transparent.
(define empty-image (solid-square 0 (rgb 0 0 0 0)))

;;; (shape-params shape) -> list?
;;;   shape : image?
;;; Create a list of the width, height, and color of the shape.
(define shape-params
  (lambda (shape)
    (list (image-width shape) (image-height shape) (image-color shape))))

;;; (shape->ellipse shape) -> image?
;;;   shape : image?
;;; Convert `shape` to an ellipse of the same width, height, and color.
(define shape->ellipse
  (lambda (shape)
    (apply solid-ellipse (shape-params shape))))

;;; (shape->rectangle shape) -> image?
;;;   shape : image?
;;; Convert `shape` to a rectangle of the same width, height, and color.
(define shape->rectangle
  (lambda (shape)
    (apply solid-rectangle (shape-params shape))))

;;; (shape-list? val) -> boolean?
;;;   val : any?
;;; Determines whether `val` is a list of shapes.
(define shape-list?
  (list-of shape?))

;;; (image-list? val) -> boolean?
;;;   val : any?
;;; Determines whether `val` is a list of images.
(define image-list?
  (list-of image?))

;;; (grab lst n) -> list?
;;;   lst : list?
;;;   n : exact-nonnegative-integer?
;;; Create a new list consisting of the first `n` elements of `lst`.
;;; If `lst` has fewer than `n` elements, returns `lst`.
(define grab
  (lambda (lst n)
    (if (or (null? lst) (zero? n))
        null
        (cons (car lst) 
              (grab (cdr lst) (- n 1))))))

;;; (skip lst n) -> list?
;;;   lst : list?
;;;   n : exact-nonnegative-integer?
;;; Create a new list consisting of all but the first `n` elements
;;; of `lst`. If `lst` has fewer than `n` elements, returns null.
(define skip
  (lambda (lst n)
    (if (or (null? lst) (zero? n))
        lst
        (skip (cdr lst) (- n 1)))))

; +-------------------------------------+----------------------------
; | Part one: Combining lists of images |
; +-------------------------------------+

; a. combine-pairs-beside

;;; (combine-pairs-beside images) -> list-of image?
;;;   images : list-of image?
;;; Creates a new a list of images in which each neighboring pair from 
;;; `images` is placed beside each other. If `images` has an odd number
;;; of elements, the last remains by itself. If `images` is empty,
;;; returns the empty list.
(define combine-pairs-beside
  (lambda (images)
    ???))

; b. combine-pairs-above

;;; (combine-pairs-above images) -> list-of image?
;;;   images : list-of image?
;;; Creates a new a list of images in which each neighboring pair from 
;;; `images` is placed in a stack of two, the first above the second. 
;;; If `images` has an odd number of elements, the last remains by itself. 
;;  If `images` is empty, returns the empty list.
(define combine-pairs-above
  (lambda (images)
    ???))

; c. Alternating combinations

;;; (repeatedly-combine-pairs-ab images) -> image?
;;;   images : list-of image?
;;; Combine all of the images in images into a single image by first
;;; combining neighboring pairs above each other, then combining those
;;; pairs beside each other, then above, then beside, and so on and
;;; so forth. If `images` is null, returns `empty-image`.
(define repeatedly-combine-pairs-ab
  (lambda (images)
    ???))

;;; (repeatedly-combine-pairs-ba images) -> image?
;;;   images : list-of image?
;;; Combine all of the images in images into a single image by first
;;; combining neighboring pairs beside each other, then combining those
;;; pairs above each other, then beside, then above , and so on and
;;; so forth. If `images` is null, returns `empty-image`.
(define repeatedly-combine-pairs-ba
  (lambda (images)
    ???))

; d. combine-neighbors-above

;;; (combine-neighbors-above n images) -> ???
;;;   n : exact-positive-integer? (at least 2)
;;;   images : list-of image?
;;; ???
(define combine-neighbors-above
  (lambda (n images)
    ???))

; +----------------------------------------+-------------------------
; | Part two: Transforming lists of shapes |
; +----------------------------------------+

; a. Alternating ellipses and rectangles

;;; (shapes->ellipses&rectangles shapes) -> list-of shape?
;;;   shapes : list-of shape?
;;; Create a list of alternating ellipses and rectangles from `shapes`,
;;; with each element having the same width, height, and color as the
;;; corresponding element of `shapes`. The list begins with an ellipse.
(define shapes->ellipses&rectangles
  (lambda (shapes)
    ???))

;;; (shapes->rectangles&ellipses shapes) -> list-of shape?
;;;   shapes : list-of shape?
;;; Create a list of alternating rectangles and ellipses from `shapes`,
;;; with each element having the same width, height, and color as the
;;; corresponding element of `shapes`. The list begins with a rectangle.
(define shapes->rectangles&ellipses
  (lambda (shapes)
    ???))

;; Tests!
#|
(test-equal? "just one shape (provided by Sam)"
             (shapes->ellipses&rectangles (list (solid-square 10 "blue")))
             (list (solid-ellipse 10 10 "blue")))
|#

; b. shapes->rects&tris&diamonds

;;; (shapes->rects&tris&diamonds shapes) -> list-of shape?
;;;   shapes : list-of shape?
;;; Create a list of rectangles, triangles, and diamonds, rotating through
;;; the three kinds of shapes, with each element having the same width, 
;;; height, and color as the corresponding element of `shapes`. The list 
;;; begins with a rectangle.
(define shapes->rects&tris&diamonds
  (lambda (shapes)
    ???))

;; Tests!
#|
(test-equal? "five identical squares (from SamR)"
             (shapes->rects&tris&diamonds 
              (make-list 5 (solid-square 10 "purple")))
             (list (solid-rectangle 10 10 "purple")
                   (solid-isosceles-triangle 10 10 "purple")
                   (solid-diamond 10 10 "purple")
                   (solid-rectangle 10 10 "purple")
                   (solid-isosceles-triangle 10 10 "purple")))
|#

; +-------------------------------+----------------------------------
; | Part three: Fractal triangles |
; +-------------------------------+

; a. fractal-triangle

;;; (fractal-triangle side color n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal triangle of the given side length using `color` 
;;; as the primary color.
(define fractal-triangle
  (lambda (side color n)
    ???)) 

; b. rgb-fractal-triangle

;;; (rgb-fractal-triangle side color n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal equilateral triangle of the given side length using
;;; `color` as the primary color.  In the recursive steps, the base
;;; color of the top triangle is `(rgb-redder color)`, the base color
;;; of the lower-left triangle is `(rgb-greener color)`, and the base
;;; color of the lower-right triangle is `(rgb-bluer color)`.  
(define rgb-fractal-triangle
  (lambda (side color n)
    ???))

; +--------------------+---------------------------------------------
; | Part four: Carpets |
; +--------------------+

; a. carpet-a

;;; (carpet-a size color-x color-y n) -> image?
;;;   size : positive real?
;;;   color-x : color?
;;;   color-y : color?
;;;   n : non-negative integere
;;; Create a `size`-by-`size` image of the standard fractal carpet with
;;; `n` levels of recursion, using `color-x` as the "primary" color and
;;; `color-y` as the center color.
(define carpet-a
  (lambda (size color-x color-y n)
    ???))

; b. carpet-b

;;; (carpet-b size color-x color-y n) -> image?
;;;   size : positive real?
;;;   color-x : color?
;;;   color-y : color?
;;;   n : non-negative integer.
;;; Create a `size`-by-`size` image of a fractal carpet with `n` levels
;;; of recursion, using `color-x` as the "primary" color and `color-y`
;;; as the "secondary" color.  Our pattern looks something like this.
;;;
;;;     X y X
;;;     y y X
;;;     X X X
;;;
;;; where `X` means "recurse" and `y` means "square with `color-y`.
(define carpet-b
  (lambda (size color-x color-y n)
    ???))

; +----------------------+-------------------------------------------
; | Part five: Freestyle |
; +----------------------+

; a. A new procedure

;;; (??? images ???) -> ???
;;;   images : list-of image?
;;;   ??? : ???
;;; ???

; b. Three images

#|
I created `combination-1.png` using 

    (image-save ???
                "combination-1.png")

I created `combination-2.png` using 

    (image-save ???
                "combination-2.png")

I created `combination-3.png` using 

    (image-save ???
                "combination-3.png")

|#

; c. A new fractal procedure

;;; (???) -> ???
;;;   ??? : ???
;;; ???

; d. Three fractal images

#|
I created `fractal-1.png` using 

    (image-save ???
                "fractal-1.png")

I created `fractal-2.png` using 

    (image-save ???
                "fractal-2.png")

I created `fractal-3.png` using 

    (image-save ???
                "fractal-3.png")

|#
