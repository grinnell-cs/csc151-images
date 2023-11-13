#lang racket

(require csc151)
(require racket/match)
(require rackunit)

;; CSC 151-NN (SEMESTER)
;; Lab: Higher-order recursion
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, we'll wrap up our exploration of fundamental recursion
techniques by exploring what we can write with higher-order
procedures.

We'll be writing a number of functions in this lab, so you are not
obligated to write doc comments or rackunit tests for your work.
However, you should still gain confidence that your code works by
trying it out on a few examples before moving on to the next problem.
(Or you could write some tests, because it shouldn't be much more effort
than running experiments.)
|#

#| AB |#

; +------------------------------------+-----------------------------
; | Exercise 0: Review the self checks |
; +------------------------------------+

#|
Review the first two self checks from the reading.
|#

#|
a. Write `filter`.
|#

;;; (filter proc? lst) -> list?
;;;   proc? : unary procedure
;;;   lst : list?
;;; Select all of the elements of lst for which proc? holds.
;;; proc? must be legally applicable to all elements of lst.
(define filter
  (lambda (proc? lst)
    ???))

#|
b. Implement right section.
|#

;;; (right-section binproc val) -> proc?
;;;   binproc : binary (two parameter) procedure
;;;   val : any/c
;;; Fill in one parameter to binproc, returning a new procedure.
(define right-section
  (lambda (binproc val)
    ???))

#|
c. Verify that right section works as expected.
|#

(define add2 (right-section + 2))
(define sub2 (right-section - 2))

#|
(test-equal? "add2: Quick test"
            (add2 5)
            7)
(test-equal? "sub2: Quick test"
             (sub2 5)
             3)
|#

#| A |#

; +-------------------------------------+----------------------------
; | Exercise 1: Reviewing the big three |
; +-------------------------------------+

#|
You've just written `filter`.  Complete the definitions of the
remaining two elements of the big three: `map` and `reduce`.

*Try to do so from memory rather than copying from the reading or
your notes.*
|#

(define map
  ???)

; (reduce-right op '(v1 v2 ... vn))
;   -> (op v1 (op v2 (op .... (op vn-1 vn))))
(define reduce-right
  ???)

#| B |#

; +--------------------------------------------+---------------------
; | Exercise 2: Generalizing famous procedures |
; +--------------------------------------------+

#|
In many of the recursive functions we have written, we have hard-coded
an equality comparison into the computation. However, we might find
it useful to instead generalize this equality to an arbitrary boolean
predicate.
|#

#|
a. `(index-of lst val)` returns the index of the first occurrence
of `val` in list `lst`. This function is specialized to compare for 
equality on `val`.

Write a recursive function, `(index-of-matching lst pred?)`, that takes a
list, `lst`, and a predicate (unary function that produces a boolean),
`pred?`, and returns the *index* of the first element of `lst` that
satisfies `pred?`. If no element of `lst` satisfies `pred?`, then
your procedure can crash and burn, or return a bad value, or whatever
you'd like.
|#

;;; (index-of-matching lst pred?) -> integer?
;;;   lst : list?
;;;   pred? : procedure? (applicable to the elements of lst)
;;; Finds the index of the first value in `lst` for which `pred?`
;;; holds.  (pred? must hold for at least one element of lst)
(define index-of-matching
  (lambda (lst pred?)
    ???))

#|
b. Use `index-of-matching` to define `(my-index-of lst val)` in a 
non-recursive manner that behaves identically to the standard 
definition of `index-of`.  

Note that while `my-index-of` cannot be recursive, the procedures
you call in `my-index-of` can be.  For example, your body may 
(and probably should) include a call to `index-of-matching`.

(Hint: what predicate do we define that has the same effect as what
       index-of checks?)
|#

;;; (my-index-of lst val) -> integer?
;;;   lst : list?
;;;   val : any?
;;; Finds the index of the first appearance of `val`.  Assumes
;;; that `val` appears somewhere in `lst`.
(define my-index-of
  (lambda (lst val)
    (index-of-matching lst ???)))

#|
c. Rewrite `index-of-matching` so that it returns #f, rather than crashing,
if the value isn't in the list.  You may find the following pattern
helpful.

    (define proc
      (lambda (params)
        (if (base-case-test? params)
            (base-case-computation params)
            (let ([recursive-result (proc (simplify params))])
              (and recursive-result ; That is, it's not false
                   (combine (process params) recursive-result))))))

|#

;;; (new-index-of-matching lst pred?) -> integer? or false?
;;;   lst : list?
;;;   pred? : procedure? (applicable to the elements of lst)
;;; Finds the index of the first value in `lst` for which `pred?`
;;; holds.  If no such element exists, returns false (#f).
(define new-index-of-matching
  (lambda (lst pred?)
    ???))

#| A |#

; +--------------------------------+---------------------------------
; | Exercise 3: Making multipliers |
; +--------------------------------+

#|
Write a procedure, `(make-multiplier n)`, that returns a new procedure
that takes one argument (say, `val`) and returns `n` times that number.
|#

;;; (make-multiplier n) -> procedure?
;;;   n : number?
;;; Return a procedure that takes one parameter and returns
;;; n times that number.
(define make-multiplier
  (lambda (n)
    ???))

#|
(define multiply-by-5 (make-multiplier 5))
(test-equal? "multiply-by-5 test one"
             (multiply-by-5 2)
             10)
|#

#| B |#

; +--------------------------+---------------------------------------
; | Exercise 4: Partitioning |
; +--------------------------+

#|
Here is a trickier recursive function to implement that ties together
all of the fundamentals we've discussed in the course so far:

`(partition pred? lst)` takes a predicate, `pred?`, and a list, `lst`,
and returns a pair of lists where the first element of the pair is a
list of the elements of `lst` that satisfy `pred?` (that is, for which
`pred?` returns a truish value). The second element of the pair is a
list of the elements of `lst` that do not satisfy `pred?` (that is,
for which `pred?` returns false).

For example:

    > (partition even? (list 1 9 2 3 4 5 1 0))
    '((2 4 0) (1 9 3 5 1))
    > (partition (cut (>= <> 5)) (list 1 9 2 3 4 5 1 0))
    '((9 5) (1 2 3 4 1 0))

You can assume that the predicate can be successfully applied to every
element of the list.

Note that the relative order of the elements of the lists should be
preserved.
|#

;;; (partition pred? lst) -> listof list?
;;;   pred? : predicate (can be applied to all elements of lst
;;;   lst : list?
;;; Partitions `lst` into those values for which `pred?` holds and
;;; those for which it does not hold.
(define partition
  (lambda (lst pred?)
    ???))

#|
Hint: There are at least two patterns one might use to write `partition`.

We could use direct recursion.

    (define partition
      (lambda (lst pred?)
        (if (null? lst)
            (list null null)
            (let [(recursive-result (partition (cdr lst) pred?))]
              ???))))

We could use a helper that keeps track of the two lists that we are
building.

    (define partition
      (lambda (lst pred?)
        (partition/helper lst pred? null null)))

    (define partition/helper
      (lambda (lst pred? these those)
        ???))
|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yes, it's that time.  Submit your work.  Then go on and do some of the
extra problems, at least if you have time.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might try one or more of
the following problems.
|#

; +-------------------+----------------------------------------------
; | Extra 1: Tallying |
; +-------------------+

#|
Write a procedure, `(tally lst pred?)`, that counts the number of
values in `lst` for which the predicate holds.
|#

;;; (tally lst pred?) -> integer?
;;;   lst : list?
;;;   pred? : procedure, applicable to elements of `lst`.
;;; Counts the number of `lst` for which `pred?` holds.
(define tally
  (lambda (lst pred?)
    ???))

; +-------------------------+----------------------------------------
; | Extra 2: Left reduction |
; +-------------------------+

#|
a. Complete the definition of `reduce-left` below. Recall that
`reduce-left` is like `reduce-right` except that it treats its binary
function as left-associative rather than right-associative.

You may find it helpful to work an example by hand, such as
`(reduce-left - '(1 2 3 4))`.
|#

; (reduce-left op '(v1 v2 ... vn))
;   -> (op ... (op (op v1 v2) v3) ... vn)
(define my-reduce-left
  (lambda (op lst)
    (reduce-left/kernel op (car lst) (cdr lst))))

(define reduce-left/kernel
  (lambda (op so-far remaining)
    (if (null? remaining)
        so-far
        (reduce-left/kernel op ??? (cdr remaining)))))

#|
b. Complete the definitions of example-list and example-op below
so that left-result and right-result produce *different* lists. In
other words, choose arguments to reduce-left and reduce-right that
depend on the associativity of the binary operations, e.g., in
contrast to (+) which is commutative and thus does not depend on
the associativity of the fold. Try to come up with an example not
found in the reading.  
|#

(define example-list ???)

(define example-op ???)

;;; TODO: uncomment these once you have implemented both `reduce-left`
;;; and `reduce-right`.

#|
(define left-result (reduce-left example-op example-list))
(define right-result (reduce-right example-op example-list))
|#

; +------------------+-----------------------------------------------
; | Extra 3: Zipping |
; +------------------+

#|
a. Define a function (zip l1 l2) that takes lists l1 and l2 and
returns a new list of two-element lists where the two values in new
list are drawn from l1 and l2, elementwise. That is, the first
elements of l1 and l2 are paired together, then the second elements
of l1 and l2 are paired together, and so forth. If one of the lists
is longer than the other, the extra elements of that list are ignored
in the output of zip. For example:

    (zip (list 1 2 3 4 5) (list 6 7 8))
    > '((1 6) (2 7) (3 8))

Hint: You will need to recursively decompose *both* lists that are
given as input.
|#

(define zip
  ???)

#|
b. Frequently, we might want to map over multiple lists in an
elementwise way using zip. Such a function is often called 
zip-with. For example:

    (zip-with + (list 1 2 3 4 5) (list 6 7 8))
    > '(7 9 11)

Where 1+6=7, 2+7=9, and 3+8=11. Similarly,

    (zip-with / (list 1 2 3 4 5) (list 6 7 8))
    > '(1/6 2/7 3/8)

Use zip and map to write a non-recursive version of this function,
called `(zip-with f l1 l2)` where f is a binary function and `l1` and
`l2` are lists. Like zip, if either list has more elements than the
other, the extra arguments are ignored in the computation.

Your answer will look something like this.

    (define zip-with
      (lambda (f l1 l2)
        (map ??? (zip l1 l2))))

Hint: Note that zip gives you a list of two-element lists, but f 
is a function that takes 2 separate arguments, not one
argument that is a two-element list. What lambda can you 
pass to map to get around this incompatibility?
|#

(define zip-with
  ???)

#|
c. zip-with is unoptimal because of the unnecessary creation of
pairs. Consider the execution of zip-with-pair, perhaps by tracing a
small example. In a sentence or two, argue why the creation of pairs in
zip-with is inefficient:

<TODO: give your explanation here>
|#

#|
d. With this observation in mind, implement zip-with in a recursive
fashion without calling `map` or generating unnecessary pairs.
|#

(define new-zip-with
  (lambda (f l1 l2)
    ???))

