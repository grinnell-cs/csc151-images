#lang racket

(require csc151)
(require 2htdp/image)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Lab: Anonymous procedures
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. Save this file as `anonymous-procedures.rkt`.

b. Introduce yourself to your partner.  Make sure to discuss work 
preferences and what you bring to the partnership.

c. Go over the self-check with your partner.
|#

#| B |#

; +--------------------------+---------------------------------------
; | Exercise 1: Cutting code |
; +--------------------------+

#|
a. Predict the results of the following expressions.

> (map (cut (+ 10 <>)) (range 20))
ANSWER
> (map (cut (+ <> 10)) (range 20))
ANSWER
> (map (cut (- 10 <>)) (range 20))
ANSWER
> (map (cut (- <> 10)) (range 20))
ANSWER
> (map (cut (* 10 <>)) (range 20))
ANSWER
> (map (cut (* <> 10)) (range 20))
ANSWER
> (map (cut (/ 10 <>)) (range 20))
ANSWER
> (map (cut (/ <> 10)) (range 20))
ANSWER
> (map (cut (remainder 10 <>)) (range 20))
ANSWER
> (map (cut (remainder <> 10)) (range 20))
ANSWER
|#

#|
b. Check your answer experimentally.
|#

#| A |#

; +-------------------------------------------+----------------------
; | Exercise 2: Examining multiple approaches |
; +-------------------------------------------+

#|
Consider the following procedures.
|#

(define add5
  (lambda (x)
    (+ 5 x)))

(define add-5-to-each-a
  (lambda (lst)
    (map add5 lst)))

(define add-5-to-each-b
  (lambda (lst)
    (map (lambda (x) (+ 5 x)) lst)))

(define add-5-to-each-c
  (lambda (lst)
    (map add1 (map add1 (map add1 (map add1 (map add1 lst)))))))

(define add-5-to-each-d
  (lambda (lst)
    (map (o add1 add1 add1 add1 add1) lst)))

(define add-5-to-each-e
  (lambda (lst)
    (map (apply o (make-list 5 add1)) lst)))

(define add-5-to-each-f
  (lambda (lst)
    (map (cut (+ 5 <>)) lst)))

(define add-5-to-each-g
  (cut (map (cut (+ 5 <>)) <>)))

#|
a. Do you expect each of the `add-5-to-each-X` procedures to give
the same result when applied to the same list?  If you expect one
to give different results, explain why.

ENTER YOUR ANSWER HERE.
|#

#|
b. Write some tests to confirm your answer.  We've given you a
few sample tests, but you should think of others.
|#

(test-equal? "a, three-element list"
             (add-5-to-each-a (list 1 2 3)) 
             (list 6 7 8))
(test-equal? "b, three-element list"
             (add-5-to-each-b (list 1 2 3)) 
             (list 6 7 8))
(test-equal? "c, three-element list"
             (add-5-to-each-c (list 1 2 3)) 
             (list 6 7 8))

#|
c. Make sure that you understand how each procedure works.  If it
takes more than two or three minutes to figure one of them out,
grab a member of the course staff for help.
|#

#|
d. In your own words, describe how `add-5-to-each-g` works.

ENTER YOUR ANSWER HERE.
|#

#| A |#

; +-------------------------+----------------------------------------
; | Exercise 3: Image lists |
; +-------------------------+

#|
Here are a few simple procedures.  `boxes1` takes a list of colors 
as parameters and makes a list of boxes (squares) of the given colors.
`circles1` takes a list of numbers as a parameter and makes outlined
circles whose radii are five times those numbers.
|#

(define boxes1
  (lambda (colors)
    (map box colors)))

(define circles1
  (lambda (nums)
    (map outlined-circle (map times5 nums))))

(define box
  (lambda (color)
    (square 20 "solid" color)))

(define times5
  (lambda (x)
    (* 5 x)))

(define outlined-circle
  (lambda (radius)
    (circle radius "outline" "black")))

#|
a. Rewrite `boxes1` as `boxes` so that it does not require a separate
`box` procedure.  You should use `cut` to make the procedure you are
mapping.
|#

(define boxes
  (lambda (colors)
    ???))

#|
b. Rewrite `circles1` as `circles2` so that it only does one call
to `map`.  (You can keep relying on `times5` and `outlined-circle`.)
|#

(define circles2
  (lambda (nums)
    (map ??? nums)))

#|
c. Rewrite `circles2` as `circles`, replacing `times5` and `outlined-circle`
by appropriate calls to `cut`.
|#

(define circles
  (lambda (nums)
    (map ??? nums)))

#| B |#

; +-----------------------+------------------------------------------
; | Exercise 4: Rotations |
; +-----------------------+

#|
a. Write a procedure, `(rotations n)`, that makes an image consisting
of n 10 x 40 black rectangles, the first rotated by 0 degrees, the next
by 45 degrees, the next by 90 degrees, ... up to 45x(n-1) degrees, all 
arranged side-by-side.  The result will look something like this.`

| / - \ | / ...

You may not use separate helper procedures.

You will likely need both `cut` and `compose` to solve this problem.
|#

(define rotations
  (lambda (n)
    (apply beside (map ??? (range n)))))

#|
b. Write a procedure, `(full-rotation n)`, that makes an image
consisting of `n` 10x40 black rectangles, the first rotated by 0
degrees, the second by 360/n degrees, the next by 360/2n degrees,
..., all arranged side-by-side.
|#

(define full-rotation
  (lambda (n)
    (apply beside (map ??? (range n)))))

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
You're done with this lab.  Congratulations!  Submit your work.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you finish the lab early, you should attempt one or more of these
problems.
|#

; +---------------------------------+--------------------------------
; | Extra 1: Eliminating the lambda |
; +---------------------------------+

#|
Rewrite `circles` and `boxes` from an earlier exercise so that there
are *no* instances of `lambda`.  Call these new versions `new-circles`
and `new-boxes`.
|#

(define new-boxes
  ???)

(define new-circles
  ???)

; +-----------------------+------------------------------------------
; | Extra 2: Even spacing |
; +-----------------------+

#|
You may have noted a flaw in our rotation procedure: The rotated
rectangles are not evenly spaced.  Write new versions of those
procedures that evenly space the rectangles.  (You can do so by
overlaying each on a 50x50 white rectangle.)
|#

(define evenly-spaced-rotations
  (lambda (n)
    ???))

(define evenly-spaced-full-rotation
  (lambda (n)
    ???))
