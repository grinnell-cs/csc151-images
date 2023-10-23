#lang racket

(require csc151)
(require rackunit)
(require 2htdp/image)

;; CSC 151 (SEMESTER)
;; Lab: Computing Bitmaps (bitmaps.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, we'll explore a new model of image making, one based on
computing colors based on locations.
|#

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. Update your `csc151` library.

b. Identify who is Partner A and who is Partner B.  Ideally, Partner
A will be the partner closer to the board.

c. Have the normal start-of-lab discussion.  Share names, strengths,
approaches, etc.

d. Make sure to save the file as `bitmaps.rkt`.  

e. Review the procedures in the accompanying lab.
|#

#| A |#

; +--------------------------+---------------------------------------
; | Exercise 1: Color blends |
; +--------------------------+

#|
a. Read the definition of `bitmap-1a` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-1a
  (create-bitmap (lambda (col row)
                    (rgb col 0 0))
                  256
                  256))

#|
b. Check your answer experimentally.  Add any notes about similarities
and differences.

ENTER ANY NOTES HERE.
|#


#|
c. Read the definition of `bitmap-1c` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-1c
  (create-bitmap (lambda (col row)
                    (rgb col 0 0))
                  512
                  256))

#|
d. Check your answer experimentally.  Add any notes about similarities
and differences.

ENTER ANY NOTES HERE.
|#

#|
e. Read the definition of `bitmap-1e` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-1e
  (create-bitmap (lambda (col row)
                    (rgb 0 0 row))
                  255
                  255))

#|
f. Check your answer experimentally.  Add any notes about similarities
and differences.

ENTER ANY NOTES HERE.
|#


#|
g. Read the definition of `bitmap-1g` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-1g
  (create-bitmap (lambda (col row)
                    (rgb col 0 row))
                  255
                  255))

#|
h. Check your answer experimentally.  Add any notes about similarities
and differences.

ENTER ANY NOTES HERE.
|#

#| B |#

; +------------------------------+-----------------------------------
; | Exercise 2: Selecting colors |
; +------------------------------+

#|
a. Read the definition of `bitmap-2a` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-2a
  (let ([colors (list (rgb 255 0 0) (rgb 0 255 0) (rgb 0 0 255))])
    (create-bitmap (lambda (col row)
                      (list-ref colors (remainder col (length colors))))
                    32
                    32)))

#|
b. Check your answer experimentally.  Add any notes about similarities
and differences.

If you have trouble seeing the image, you could try something like

> (scale 10 (bitmap->image bitmap-2a))

ENTER ANY NOTES HERE.
|#

#|
c. As you may have discovered, `bitmap-2a` consists of thin columns
of alternating red, green, blue colors.  Write a procedure, 
`(create-vertical-stripes-bitmap colors width height)`, that uses this
technique to create an image using any list of colors, width, and
height.
|#

;;; (create-vertical-stripes-bitmap colors width height) -> bitmap?
;;;   colors : listof color?
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; Create a set of vertical stripes using the specified colors.
(define create-vertical-stripes-bitmap
  (lambda (colors width height)
    ???))

#|
d. Make horizontal stripes instead.
|#

;;; (create-horizontal-stripes-bitmap colors width height) -> bitmap?
;;;   colors : listof color?
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; Create a set of horizontal stripes using the specified colors.
(define create-horizontal-stripes-bitmap
  (lambda (colors width height)
    ???))

#|
e. Make diagonal stripes instead.
|#

;;; (create-diagonal-stripes-bitmap colors width height) -> bitmap?
;;;   colors : listof color?
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; Create a set of diagonal stripes using the specified colors.
(define create-diagonal-stripes-bitmap
  (lambda (colors width height)
    ???))

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 3: Alternate stripes |
; +-------------------------------+

#|
As you may have observed, the original stripes (from exercise 2a)
follow the pattern R G B R G B R G B.  The image may be a bit more
"interesting" if we do a pattern like R G B G R G B G R G B ...
More generally, if we have the list `(c0 c1 c2 c3 c4)`, we will see 
the pattern c0 c1 c2 c3 c4 c3 c2 c1 c0 c1 c2 c3 c4 c3 c2 c1 c0 c1 c2 ...

Write a procedure, `(create-vertical-stripes-alt-bitmap colors width height)`
that uses this pattern, rather than the original pattern.
|#

;;; (create-vertical-stripes-alt-bitmap colors width height) -> bitmap?
;;;   colors : listof color?
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; Create a set of vertical stripes using the specified colors, using
;;; a different pattern..
(define create-vertical-stripes-alt-bitmap
  (lambda (colors width height)
    ???))

#|
Hint: You can write this as a call to `create-vertical-stripes-bitmap`
using a modified list of colors.
|#

#| A |#

; +---------------------------+--------------------------------------
; | Exercise 4: Wider stripes |
; +---------------------------+

#|
One of the issues you've likely found with the prior procedures is that
the stripes are "thin"; only one pixel wide.  Write a procedure
`(create-wide-vertical-stripes-bitmap colors stripe-width width height)`,
that creates stripes in which each stripes is `stripe-width` wide.

You may not use `scale`.  And you should *not* simply create a much
longer list of colors.
|#

(define create-wide-vertical-stripes-bitmap 
  (lambda (colors stripe-width width height)
    ???))

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 5: Making blends, revisited |
; +--------------------------------------+

#|
a. Write a procedure, `(make-vertical-black-red-blend-bitmap width height)`,
that makes a width-by-height image in which the top of the image is
black `(rgb 0 0 0)`, the bottom of the image is red `(rgb 255 0 0)`,
and the image gradually blends from black to red, no matter what the 
width and height are.
|#

(define make-vertical-black-red-blend-bitmap
  (lambda (width height)
    ???))

#|
b. Write a procedure, `(make-vertical-red-black-blend-bitmap width height)`,
that makes a width-by-height image in which the top of the image is
red `(rgb 255 0 0)` and the bottom of the image is black `(rgb 0 0 0)`,
and the image gradually blends from red to black, no matter what the 
width and height are.
|#

(define make-vertical-red-black-blend-bitmap
  (lambda (width height)
    ???))

#|
c. Write a procedure, `(make-vertical-white-red-blend-bitmap width height)`,
that makes a width-by-height image in which the top of the image is
white `(rgb 0 0 0)`, the bottom of the image is red `(rgb 255 0 0)`,
and the image gradually blends from white to red, no matter what the 
width and height are.
|#

(define make-vertical-white-red-blend-bitmap
  (lambda (width height)
    ???))

#| B |#

; +--------------------------------+---------------------------------
; | Exercise 6: Generalized blends |
; +--------------------------------+

#|
Write a procedure, `(make-vertical-blend-bitmap ctop cbottom width height)`,
that makes a width-by-height image in which the top of the image is
`ctop`, the bottom of the image is `cbottom`, and the image gradually
blends from `ctop` to `cbottom`.
|#

(define make-vertical-blend-bitmap 
  (lambda (ctop cbottom width height)
    ???))

#| A |#

; +-----------------------------+------------------------------------
; | Exercise 7: Blended stripes |
; +-----------------------------+

#|
Write a procedure, `(simple-blended-stripes-bitmap width height)`, that
creates an image of vertical stripes, each of width 10, in which the 
stripes alternate between black->red vertical color blends and 
red->black vertical color blends.
|#

(define simple-blended-stripes-bitmap 
  (lambda (width height)
    ???))

#| B |#

; +----------------------------+-------------------------------------
; | Exercise 8: Another puzzle |
; +----------------------------+

#|
a. Read the definition of `bitmap-8a` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-8a
  (create-bitmap (lambda (col row)
                    (if (< (sqrt (+ (sqr (- col 100)) (sqr (- row 150)))) 50)
                        (rgb 255 255 0)
                        (rgb 0 0 0)))
                  256
                  256))

#|
b. Check your answer experimentally.  Add any notes about similarities
and differences.

ENTER ANY NOTES HERE.
|#

#|
c. Read the definition of `bitmap-8c` below.  What do you think the
image will look like?

ENTER YOUR ANSWER HERE.
|#

(define bitmap-8c
  (create-bitmap (lambda (col row)
                    (if (< (sqrt (+ (sqr (- col 100)) (sqr (- row 100)))) 75)
                        (rgb col row 0)
                        (rgb 0 0 (quotient (+ col row) 2))))
                  256
                  256))

#|
d. Check your answer experimentally.  Add any notes about similarities
and differences.

ENTER ANY NOTES HERE.
|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
You know the drill.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time and want to further explore some
of these issues, consider implementing any of the following procedures.
|#

#| B |#

; +-------------------------+----------------------------------------
; | Extra 1: Making circles |
; +-------------------------+

#|
Write a procedure, `(create-circle-bitmap cx cy r c1 c2 width height)`,
that creates a `width`-by-`height` bitmap of a circle of r `radius`,
centered at (`cx`,`cy), with color `c1`, on a background of `c2`.
|#

(define create-circle-bitmap
  (lambda (cx cy r c1 c2 width height)
    ???))

#| A |#

; +------------------------------+-----------------------------------
; | Extra 2: Making more circles |
; +------------------------------+

#|
Write a procedure, `(create-patterned-circle-bitmap cx cy r f1 f2 width height)`,
that creates a `width`-by-`height` bitmap of a circle of r `radius`, centered at (`cx`,`cy), with the colors of the circle computed by applying `f1` to
the column/row pair and the colors of the background coputed by applying
`f2` to the column/row pair.
|#

(define create-patterned-circle-bitmap
  (lambda (cx cy r f1 f2 width height)
    ???))

