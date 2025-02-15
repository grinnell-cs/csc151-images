#lang racket

(require csc151)

;;; fractals.rkt
;;;   A variety of fractals and other shapes, created for MP6 in
;;;   CSC-151 2024Sp
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by SamR and Leah.  That code includes this 
;;;   header, the "provided code" section below, the documentation for
;;;   the primary procedures in parts 1--4, and "stub definitions" for
;;;   each of those procedures.
;;; *

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (rgb-transformer transform-component) -> color-function?
;;;    component-transformer : function from integer to integer
;;; Returns a new function that takes a color as input and applies
;;; `component-trasformer` to each, yielding a new color.
(define rgb-transformer
  (lambda (transform-component)
    (lambda (color)
      (rgb (transform-component (color-red color))
           (transform-component (color-green color))
           (transform-component (color-blue color))))))

;;; (rgb-darker-32 color) -> rgb?
;;;   color : rgb?
;;; Create a darker version of color by attempting to subtract 32
;;; from each component.
(define rgb-darker-32 (rgb-transformer (cut (- <> 32))))

;;; (rgb-lighter-16 color) -> rgb?
;;;   color : rgb?
;;; Create a lighter version of color by attempting to add 16
;;; to each component.
(define rgb-lighter-16 (rgb-transformer (cut (+ <> 16))))

;;; (rgb-cyclically-add-64 color) -> rgb?
;;;   color : rgb?
;;; Add 64 to each component of color, cycling when we exceed 255.
(define cyclically-add-64
  (rgb-transformer (lambda (c) (remainder (+ c 64) 256))))

;;; (solid-right-triangle width height color [description]) -> image?
;;;   width : positive-real?
;;;   height : positive-real?
;;;   color : color?
;;;   description : string?
;;; Make a right triangle of the given width, height, and color.
(define solid-right-triangle
  (lambda (width height color [description #f])
    (solid-polygon (list (pt 0 0) (pt width height) (pt 0 height))
                   color
                   description)))

;;; (thinly-outlined-square size color) -> image?
;;;   size : non-negative-integer?
;;;   color : color?
;;; Create square of the given color with a thin black outline.
(define thinly-outlined-square
  (lambda (size color)
    (overlay (outlined-square (- size 2) "black" 1)
             (solid-square size color))))

; +---------------------------+--------------------------------------
; | Part 1: Fractal triangles |
; +---------------------------+

;;; (fractal-triangle side color n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal triangle of the given side length using `color` 
;;; as the primary color.
(define fractal-triangle
  (lambda (side color n)
    ???)) 

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

;;; (new-rgb-fractal-triangle side color n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal triangle using `color` as the primary color.  In the
;;; recursive steps, the base color of the top triangle is `(redder color)`,
;;; the base color of the lower-left triangle is `(greener color)`, and the
;;; base color of the lower-right triangle is `(bluer color)`.  The base
;;; color of the central triangle should be `color`.
(define new-rgb-fractal-triangle
  (lambda (side color n)
    ???))

;;; (fractal-right-triangle height width color n) -> image?
;;;   height : positive-real?
;;;   width : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal right triangle using `color` as the primary color.
(define fractal-right-triangle
  (lambda (height width color n)
    ???))

; +-----------------+------------------------------------------------
; | Part 2: Carpets |
; +-----------------+

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

;;; (carpet-c size color-x color-y n) -> image?
;;;   size : positive real?
;;;   color-x : color?
;;;   color-y : color?
;;;   n : non-negative integer.
;;; Create a `size`-by-`size` image of a fractal carpet with `n` levels
;;; of recursion, using `color-x` as the "primary" color and `color-y`
;;; as the "secondary" color.  Our pattern looks something like this.
;;; 
;;;     X Y X
;;;     Y Y X
;;;     X X X
;;; 
;;; where `X` means "recurse keeping colors as they are" and `Y` means
;;; "recurse swapping the two colors".
(define carpet-c
  (lambda (size color-x color-y n)
    ???))

;;; (carpet-d size color-x color-y n) -> image?
;;;   size : positive real?
;;;   color-x : color?
;;;   color-y : color?
;;;   n : non-negative integer.
;;; Create a `size`-by-`size` image of a fractal carpet with `n` levels
;;; of recursion, using `color-x` as the "primary" color and `color-y`
;;; as the "secondary" color.  Our pattern looks something like this.
;;; 
;;;     X y X
;;;     x Y x
;;;     X y X
;;; 
;;; where `X` means "recurse keeping colors as they are", `Y` means
;;; "recurse swapping the two colors", `x` means "square in `color-x`"
;;; and `y` means "square in `color-y`".
(define carpet-d
  (lambda (size color-x color-y n)
    ???))

;;; (carpet pattern size color-x color-y n) -> image?
;;;   pattern ; string? (length 9, composed only of x, X, y, and Y)
;;;   size : positive real?
;;;   color-x : color?
;;;   color-y : color?
;;;   n : non-negative integer.
;;; Create a `size`-by-`size` image of a fractal carpet with `n` levels
;;; of recursion, using `color-x` as the "primary" color and `color-y`
;;; as the "secondary" color.
;;;
;;; The pattern is given by the letters in pattern, where `X` means
;;; "recurse" keeping colors as they are", `Y` means "recurse swapping
;;; the two colors", `x` means "square in `color-x`" and `y` means
;;; "square in `color-y`".
;;;
;;; The positions of the letters correspond to the parts of the pattern
;;;
;;;      0 1 2
;;;      3 4 5
;;;      6 7 8
(define carpet
  (lambda (pattern size color-x color-y n)
    ???))

; +------------------------+-----------------------------------------
; | Part 3: Rotated shapes |
; +------------------------+

;;; (spiral-squares-a side color angle n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   angle : real?
;;;   n : non-negative integer
;;; Create an image of `n`+1 outlined squares of the given side-length and
;;; color.  The bottom square is in the normal orientation.  The one on
;;; top of that is rotated by `angle` degrees.  The one on top of that is
;;; rotated by an additional `angle` degrees.  And so on and so forth.
(define spiral-squares-a
  (lambda (side color angle n)
    ???))

;;; (spiral-squares-b side color angle n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   angle : real?
;;;   n : non-negative integer
;;; Create an image of `n`+1 outlined squares of the given side-length and
;;; color.  The bottom square is in the normal orientation.  The one on
;;; top of that is rotated by `angle` degrees and has `darker-32` applied
;;; to the color.  The one on top of that is rotated by an additional `angle`
;;; degrees and has `darker-32` applied to the color twice.  And so on and
;;; so forth.
(define spiral-squares-b
  (lambda (side color angle n)
    ???))

;;; (spiral-squares-c side color angle ratio n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   angle : real?
;;;   ratio : positive-real? (usually less-than 1)
;;;   n : non-negative integer
;;; Create an image of `n`+1 outlined squares of the given side-length and
;;; color.  The bottom square is in the normal orientation.  The one on
;;; top of that is rotated by `angle`, has `darker-32` applied to the
;;; color, and has a side of `(* side ratio)`.  The one on top of that is
;;; rotated by an additional `angle` degrees, has `darker-32` applied to
;;; the color twice, and has a side length of `(* side ratio ratio)`.
;;; And so on and so forth.
(define spiral-squares-c
  (lambda (side color angle ratio n)
    ???))

;;; (spiral-squares-d side color angle ratio) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   angle : real?
;;;   ratio : positive-real? (usually less-than 1)
;;; Create an image many outlined squares.  The bottom square is in the
;;; normal orientation, has side-length `side`, and is colored `color`.
;;; The one on top of that is rotated by `angle`, has lighter-16` applied
;;; to the color, and has a side of `(* side ratio)`.  The one on top
;;; of that is rotated by an additional `angle` degrees, has `lighter-16`
;;; applied to the color twice, and has a side length of
;;; `(* side ratio ratio)`.  And so on and so forth.  The smallest square
;;; has a side length of ten or less.
(define spiral-squares-d
  (lambda (side color angle ratio)
    ???))

;;; (spiral-squares-e side color angle ratio color-transform) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   angle : real?
;;;   ratio : positive-real? (usually less-than 1)
;;;   color-transform : procedure? (from color to color)
;;; Create an image many outlined squares.  The bottom square is in the
;;; normal orientation, has side-length `side`, and is colored `color`.
;;; The one on top of that is rotated by `angle`, has `color-tranform`
;;; applied to the color, and has a side of `(* side ratio)`.  The one
;;; on top of that is rotated by an additional `angle` degrees, has
;;; `color-transform` applied to the original color twice, and has a side
;;; length of `(* side ratio ratio)`.  And so on and so forth.  The smallest
;;; square has a side length of ten or less.
(define spiral-squares-e
  (lambda (side color angle ratio color-transform)
    ???))

; +-------------------+----------------------------------------------
; | Part 4: Freestyle |
; +-------------------+

;;; (my-fractal size color n) -> image?
;;;   size : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Create an image based on the parameters.
(define my-fractal
  (lambda (size color n)
    ???))

#|
I created `fractal-01.png` using 

    (image-save (my-fractal ___ ___ ___)
                "fractal-01.png")

I created `fractal-02.png` using 

    (image-save (my-fractal ___ ___ ___)
                "fractal-02.png")

I created `fractal-03.png` using 

    (image-save (my-fractal ___ ___ ___)
                "fractal-03.png")

|#
