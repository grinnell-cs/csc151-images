#lang racket

(require csc151)
(require rackunit)

;; CSC-151-NN (SEMESTER)
;; Lab: Vectors Continued (vectors-continued.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. Introduce yourselves and have the normal start of lab discussion.

b. Make sure to save this file as `vectors-continued.rkt`.

c. Remind yourself of the patterns of vector recrusion from the
reading.
|#

#| A |#

; +-----------------------------+------------------------------------
; | Exercise 1: Summing vectors |
; +-----------------------------+

#|
Write a recursive procedure, `(vector-sum numbers)`, that takes one
argument, a vector of numbers, and returns the sum of the elements
of that vector.

You can use the recursion pattern(s) and the model of
`number-vector-largest` from the reading as starting points. If you
do, be sure to cite your sources appropriately.

You may not convert your vector into a list.

Note: In case you hadn't noticed it yet, vector recursion is usually
a form of numeric recursion, where you are use the index in the
vector as the value you recurse over.

Note: In case you hadn't noticed it yet, vector recursion generally
involves a helper procedure that takes the position as an extra
parameter.
|#

(define vector-sum
  (lambda (nums)
    ???))

#| B |#

; +-----------------------------+------------------------------------
; | Exercise 2: Filling vectors |
; +-----------------------------+

#|
Write a recursive procedure, `(my-vector-fill! vec val)`, that takes
two parameters, a mutable vector and a value, and puts that value
in every position of the vector.

> (define vec (vector 'a 'b 'c))
> vec
'#(a b c)
> (my-vector-fill! vec 0)
> vec
'#(0 0 0)
> (my-vector-fill! vec 'a)
> vec
'#(a a a)

Some implementations of Scheme come with vector-fill!. You may not
use that procedure.

Note: `my-vector-fill!` is supposed to modify an existing vector. It
is pointless to create a new vector.

Note: You may find that you want to do two things for a particular
position: fill the value at that position and recur. Remember that
in cases in which you want to sequence multiple actions when a test 
succeeds, you should use a `cond` or `when` rather than an `if`.
|#

(define my-vector-fill!
  (lambda (vec val)
    ???))

; +----------------------------------+-------------------------------
; | Exercise 3: Searching in vectors |
; +----------------------------------+

#|
Write a recursive procedure, `(vector-index-of vec elt)`, that looks
for `elt` in vector and returns the index of the first appearance
of `elt` if it appears in the vector and #f otherwise.

> (vector-index-of (vector 'a 'b 'c) 'b)
1
> (vector-index-of (vector 'a 'b 'c 'c 'b 'c) 'c)
2
> (vector-index-of (vector 'a 'b 'c) 'd)
#f

Once again, you should not convert the vector to a list.
|#

(define vector-index-of
  (lambda (vec elt)
    ???))

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 4: Reversing vectors |
; +-------------------------------+
#|
a. Write a procedure, `(vector-reverse vec)`, that creates a new
vector whose elements appear in the reverse order of the elements
in `vec`.

    > (define letters (vector 'a 'b 'c 'd))
    > letters
    '#(a b c d)
    > (define srettel (vector-reverse letters))
    > srettel
    '#(d c b a)
    > letters
    '#(a b c d)

You may not use `list->vector` or `vector->list` in defining
`vector-reverse`.
|#

(define vector-reverse
  (lambda (vec)
    ???))

#|
b. Write a procedure, `(vector-reverse! vec`), that reverses *`vec`*
“in place”. That is, instead of producing a new vector, it rearranges
the elements within `vec`.

    > (define letters (vector 'a 'b 'c 'd))
    > letters
    '#(a b c d)
    > (vector-reverse! letters)
    > letters
    '#(d c b a)

Once again, you may not use `list->vector` or `vector->list` in
defining `vector-reverse!`.
|#

(define vector-reverse!
  (lambda (vec)
    ???))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yes, it's time for your favorite part of the lab.  Submit your work.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have time left at the end of lab, consider
doing one or more of the following problems.
|#

; +---------------------------+--------------------------------------
; | Extra 1: Rotating vectors |
; +---------------------------+

#|
Write a procedure, `(vector-rotate-l! vec)` that shifts the elements
in `vec` left by one position, moving the first element to the end.
That is, `vector-rotate-l!` puts the initial element of `vec` at the end,
the element at position 1 in position 0, the element at position 2
in position 1, and so on and so forth.

    > (define letters (vector 'a 'b 'c 'd))
    > letters
    '#(a b c d)
    > (vector-rotate-1! letters)
    > letters
    '#(b c d a)
    > (vector-rotate-1! letters)
    > letters
    '#(c d a b
    )
|#

(define vector-rotate-l!
  (lambda (vec)
    ???))

; +--------------------------------------+---------------------------
; | Extra 2: Rotating vectors, revisited |
; +--------------------------------------+

#|
Write a procedure, `(vector-rotate! vec amt)`, that rotates
the values in `vec` by `amt` positions. That is, the first `amt`
values in `vec` move to the end, the value in position `amt` moves
to position 0, the value in position `amt`+1 moves to position 1,
and so on and so forth.

Please do not use repeated calls to `vector-rotate-1!`.
|#

(define vector-rotate!
  (lambda (vec amt)
    ???))

; +--------------------------------+---------------------------------
; | Extra 3: Patterns of recursion |
; +--------------------------------+

#|
In a number of previous exercises, you wrote procedures that iterated over
the vector, changing values as you went. (For example, `vector-fill!`
had this form.) Summarize the form of a procedure that recurs over
vectors, setting the value at each position to a new value, much like
the recursion patterns given in the reading.
|#
