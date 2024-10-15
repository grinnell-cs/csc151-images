;;; fractals.scm
;;;   A variety of fractals and other shapes, created for MP6 in
;;;   CSC-151 2024Fa
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by PM and Leah.  That code includes this 
;;;   header, the "provided code" section below, the documentation for
;;;   the primary procedures in parts 1--4, and "stub definitions" for
;;;   each of those procedures.
;;; * ...

(import image)
(import lab)

(title "Fractals")

; -------------------------------------------------------------------

(part "Provided code")

(description "(Nothing outputted here!)")

;;; (bound-rgb-value v) -> number?
;;;   v: number?
;;; Returns v, but bound to the range [0, 255].
(define bound-rgb-value
  (lambda (v)
    (min (max v 0) 255)))

;;; (rgb-transformer transform-component) -> color-function?
;;;    component-transformer : function from integer to integer
;;; Returns a new function that takes a color as input and applies
;;; `component-trasformer` to each, yielding a new color.
(define rgb-transformer
  (lambda (transform-component)
    (let ([xform (o bound-rgb-value transform-component)])
         (lambda (color)
           (rgb (xform (rgb-red color))
                (xform (rgb-green color))
                (xform (rgb-blue color)))))))

;;; (rgb-darker-32 color) -> rgb?
;;;   color : rgb?
;;; Create a darker version of color by attempting to subtract 32
;;; from each component.
(define rgb-darker-32 (rgb-transformer (section - _ 32)))

;;; (rgb-lighter-16 color) -> rgb?
;;;   color : rgb?
;;; Create a lighter version of color by attempting to add 16
;;; to each component.
(define rgb-lighter-16 (rgb-transformer (section + _ 16)))

;;; (rgb-cyclically-add-64 color) -> rgb?
;;;   color : rgb?
;;; Add 64 to each component of color, cycling when we exceed 255.
(define cyclically-add-64
  (rgb-transformer (lambda (c) (remainder (+ c 64) 256))))

;;; (solid-right-triangle width height color [description]) -> image?
;;;   width : positive-real?
;;;   height : positive-real?
;;;   color : color?
;;; Make a right triangle of the given width, height, and color.
(define solid-right-triangle
  (lambda (width height color)
    (path width height
          (list (pair 0 0) (pair width height) (pair 0 height))
          "solid"
          color)))

;;; (thinly-outlined-square size color) -> image?
;;;   size : non-negative-integer?
;;;   color : color?
;;; Create square of the given color with a thin black outline.
(define thinly-outlined-square
  (lambda (size color)
    (overlay (outlined-square (- size 2) "black" 1)
             (solid-square size color))))

; -------------------------------------------------------------------

(part "Part 1: Fractal triangles")

(problem "Problem 1a: fractal-triangle")

;;; (fractal-triangle side color n) -> image?
;;;   side : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal triangle of the given side length using `color` 
;;; as the primary color.
(define fractal-triangle
  (lambda (side color n)
    {??}))

(description "n = 3")
(display (fractal-triangle 100 (color-name->rgb "red") 3))

(description "n = 0")
(display (fractal-triangle 100 (color-name->rgb "blue") 0))

(description "n = 5")
(display (fractal-triangle 300 (color-name->rgb "green") 5))

(problem "Problem 1b: rgb-fractal-triangle")

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
    {??}))

(description "n = 3")
(display (rgb-fractal-triangle 100 (color-name->rgb "red") 3))

(description "n = 0")
(display (rgb-fractal-triangle 100 "blue" 0))

(description "n = 5")
(display (rgb-fractal-triangle 300 (color-name->rgb "green") 5))

(problem "Problem 1c: new-rgb-fractal-triangle")

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
    {??}))

(description "n = 3")
(display (new-rgb-fractal-triangle 100 (color-name->rgb "red") 3))

(description "n = 0")
(display (new-rgb-fractal-triangle 100 "blue" 0))

(description "n = 5")
(display (new-rgb-fractal-triangle 300 (color-name->rgb "green") 5))

(problem "Problem 1d: fractal-right-triangle")

;;; (fractal-right-triangle height width color n) -> image?
;;;   width : positive-real?
;;;   height : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Make a fractal right triangle using `color` as the primary color.
(define fractal-right-triangle
  (lambda (width height color n)
    {??}))

(description "n = 3")
(display (fractal-right-triangle 100 100 (color-name->rgb "red") 3))

(description "n = 0")
(display (fractal-right-triangle 200 100 "blue" 0))

(description "n = 5")
(display (fractal-right-triangle 400 200 (color-name->rgb "green") 5))

; -------------------------------------------------------------------

(part "Part 2: Carpets")

(problem "Problem 2a: carpet-a")

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
    {??}))

(description "n = 2")
(carpet-a 100 (color-name->rgb "black") (color-name->rgb "red") 2)

(description "n = 0")
(carpet-a 100 (color-name->rgb "black") (color-name->rgb "red") 0)

(description "n = 4")
(carpet-a 300 (color-name->rgb "black") (color-name->rgb "red") 4)

(problem "Problem 2b: carpet-b")

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
    {??}))

(description "n = 2")
(carpet-b 100 (color-name->rgb "black") (color-name->rgb "red") 2)

(description "n = 0")
(carpet-b 100 (color-name->rgb "black") (color-name->rgb "red") 0)

(description "n = 4")
(carpet-b 300 (color-name->rgb "black") (color-name->rgb "red") 4)

(problem "Problem 2c: carpet-c")

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
    {??}))

(description "n = 2")
(carpet-c 100 (color-name->rgb "black") (color-name->rgb "red") 2)

(description "n = 0")
(carpet-c 100 (color-name->rgb "black") (color-name->rgb "red") 0)

(description "n = 4")
(carpet-c 300 (color-name->rgb "black") (color-name->rgb "red") 4)

(problem "Problem 2d: carpet-d")

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
    {??}))

(description "n = 2")
(carpet-d 100 (color-name->rgb "black") (color-name->rgb "red") 2)

(description "n = 0")
(carpet-d 100 (color-name->rgb "black") (color-name->rgb "red") 0)

(description "n = 4")
(carpet-d 300 (color-name->rgb "black") (color-name->rgb "red") 4)

(problem "Problem 2e: carpet-e")

(description "(Note: this is only required for an E!)")

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
    {??}))


(description "pat = XXXXyXXXX, n = 4")
(carpet "XXXXyXXXX" 100 (color-name->rgb "black") (color-name->rgb "red") 4)

(description "pat = XyXxYxXyX, n = 4")
(carpet "XyXxYxXyX" 100 (color-name->rgb "black") (color-name->rgb "red") 4)

(description "pat = xXYXyXYXx n = 4")
(carpet "xXYXyXYXx" 200 (color-name->rgb "black") (color-name->rgb "red") 4)

; -------------------------------------------------------------------

(part "Part 3: Freestyle")

;;; (my-fractal size color n) -> image?
;;;   size : positive-real?
;;;   color : rgb?
;;;   n : non-negative integer
;;; Create an image based on the parameters.
(define my-fractal
  (lambda (size color n)
    {??}))

(description "Three example invocations of my-fractal:")

; TODO: fill in with three example calls showing off your my-fractal
;       implementation!

