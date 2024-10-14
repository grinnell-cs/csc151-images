;; CSC 151-NN (Semester)
;; Lab: Tail Recursion
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Tail Recursion")

; --------------------------------------------------------------------

(part "Exercise 1: Preparation")

; In today's reading, you wrote a tail-recursive implementation of
; `append`. To begin the lab, review your code with your partner and
; agree upon a solution. In this lab, we'll rewrite several functions
; to be tail-recursive and test them in a standardized way. In
; particular, we shouldn't change the external behavior of a function,
; i.e., what output it produces for a given input. So we can use our
; non-recursive function to test our tail-recursion function!
;
; Below is the standard implementation of append, yet again:

(define list-append
  (lambda (l1 l2)
    (match l1
      [null l2]
      [(cons head tail) (cons head (append tail l2))])))

; Fill in the definition of (a) your tail-recursive helper function
; and (b) your wrapper function for append below. (Hint: you should
; have found that so-far is backwards if you just follow the pattern
; from the reading. If you did not already do so, think about how
; you can use the reverse function to fix the issue.)

(define append-helper
  (lambda (so-far l1 l2)
    ; TODO: fill me in
    l1))

(define append-tr
  (lambda (l1 l2)
    ; TODO: fill me in
    l1))

; Observe in the test cases below we use `append` to test `append-tr`.
; Ensure that your implementation passes these tests before continuing!

(test-case
  "append empty"
  equal?
  (append null (list 1 2 3))
  (lambda () (append-tr null (list 1 2 3))))

(test-case
  "append non-empty"
  equal?
  (append (list 1 2 3) (list 4 5 6))
  (lambda () (append-tr (list 1 2 3) (list 4 5 6))))

; Finally, trace through the execution of append-tr on the second
; test case:
;
;      (append-tr (list 1 2 3) (list 4 5 6))
; -->* <TODO: fill me in!>
;
; In a sentence or two below, describe how you know append-tr is tail
; recursive from your trace.

(description "We know append-tr is tail recursive because... <TODO: fill me in!>")

; --------------------------------------------------------------------

(problem "Exercise 2: Tail Recursing Over Lists")

; It's a blast from the past! Let's rewrite some of our basic
; recursives over lists. For each function:
;
;   1. Write a tail-recursive version of the function.
;   2. Write a collection of test cases that uses the original
;      version of the function to test the tail-recursive version.
;
; Alternative driver-navigator for each of these functions.

; (product l) -> number?
;   l : list? of numbers
; Returns the product of the numbers in l.
(define product
  (lambda (l)
    (match l
      [null 1]
      [(cons head tail) (* head (product tail))])))

; TODO: complete the tail-recursive version of the function below.

(define product-tr
  (lambda (l)
    ; TODO: fill me in!
    1))

; TODO: fill in suitable test cases for product/product-tr below.

; ...

; (any l) -> boolean?
;   l : list? of booleans
; Returns #t iff at least one of the booleans in l is #t
(define any
  (lambda (l)
    (match l
      [null #f]
      [(cons head tail) (or head (any tail))])))

; TODO: complete the tail-recursive version of the function below.

(define any-tr
  (lambda (l)
    ; TODO: fill me in!
    #f))

; TODO: fill in suitable test cases for any/any-tr below:

; ...

; --------------------------------------------------------------------

(problem "Exercise 3: Tail Recursing Over Numbers")

; It's yet another blast from the past! Now let's tackle
; tail-recursion over the natural numbers. Again, for each function:
;
;   1. Write a tail-recursive version of the function.
;   2. Write a collection of test cases that uses the original
;      version of the function to test the tail-recursive version.
;
; Alternative driver-navigator for each of these functions.

; (harmonic-sequence-sum n) -> number?
;   n : intenger? >= 0
; Returns 0 + 1/1 + 1/2 + 1/3 + ... + 1/n
(define harmonic-sequence-sum
  (lambda (n)
    (if (= n 0)
        0
        (+ (harmonic-sequence-sum (- n 1)) (/ 1.0 n)))))

; TODO: complete the tail-recursive version of the function below.

(define harmonic-sequence-sum-tr
  (lambda (n)
    ; TODO: fill me in!
    1))

; TODO: fill in suitable test cases for
; harmonic-sequence-sum/harmonic-sequence-sum-tr below.

; ...

; (take l n) -> list?
;   l : list?
;   n : integer?
; (take l n) returns the first n elements of l.
(define take
  (lambda (l n)
    (if (= n 0)
        null
        (match l
          [null null]
          [(cons head tail) (cons head (take tail (- n 1)))]))))

; TODO: complete the tail-recursive version of the function below.
; (Hint: like with append, you will need to use reverse to fix up
; the result of the function!)

(define take-tr
  (lambda (l n)
    ; TODO: fill me in!
    1))

; TODO: fill in suitable test cases for take/take-tr below.

; ...

; --------------------------------------------------------------------

(problem "Exercise 4: Cheeky Reversal")

; With append and take, you observed that you needed to call reverse
; in order to fix up the result. This is problematic if the reverse
; function itself is not tail-recursive! Previously, we've
; implemented reverse in terms of a snoc or "cons-on-end" operator.
; In this exercise, we'll take advantage of the cheeky behavior of
; cons on so-far to implement reverse in a tail-recursive way.

; First, fill in this recursive decomposition for reverse in terms of
; the so-far argument. If the recursive decomposition is not
; apparent, try playing with the following example first.
;
; (reverse-helper (list 3 2 1) (list 4 5))
;
; Where the initial list given was (list 1 2 3 4 5), (list 3 2 1) is
; the result accumulated so far and (list 4 5) is the remaining list
; to process. (Hint: when I cons onto the front of so-far, what
; happens?)
;
; To reverse a list `l`, assuming that we have accumulated a reversed
; list `so-far`:
; + If `l` is empty, ... <TODO: fill me in!>
; + If `l` is non-empty, ... <TODO: fill me in!>

; Now, implement the recursive helper for reverse and its suitable
; wrapper function. Ensure that the function behaves identically to
; the library reverse function (which is implemented in a
; tail-recursive style, don't worry!)

(define reverse-helper
  (lambda (so-far l)
    ; TODO: fill me in!
    null))

(define reverse-tr
  (lambda (l)
    ; TODO: fill me in!
    null))

; TODO: fill in suitable test cases for take/take-tr below.

; ...

; --------------------------------------------------------------------

(problem "Extra exercise: To Fold or Not Fold")

; In our lab on implementing the big-three, you were tasked with
; implementing fold. You should have noticed two possible
; implementations:

; (fold1 f v l) -> any
;   f: procedure?, a binary function
;   init: any
;   l: list?
; Returns the result of accumulating the result of applying f to
; each element of l, starting with initial value init.
(define fold1
  (lambda (f init l)
    (match l
      [null init]
      [(cons head tail) (f (fold1 f init tail) head)])))

; (fold2 f v l) -> any
;   f: procedure?, a binary function
;   init: any
;   l: list?
; Returns the result of accumulating the result of applying f to
; each element of l, starting with initial value init.
(define fold2
  (lambda (f init l)
    (match l
      [null init]
      [(cons head tail) (fold2 f (f init head) tail)])))

; Answer the following questions about fold1/fold2 below in a sentence
; or two each:
;
; + What is the difference in fold1 and fold2 in terms of the order
;   of traversal of elements through the list? (Hint: if you are 
;   unsure, try using fold1 and fold2 on a non-communative function
;   such as subtraction and see if you can observe a difference).

(description "The difference between the two fold operations are... <TODO: fill me in!>")

; + Which of fold1 and fold2 is tail-recursive? Why?

(description "... is tail-recursive because ... <TODO: fill me in!>")

; + How can you use the "reverse" trick to fix up the non-tail
;   recursive version of the function. In particular, where do you need
;   to call reverse?

(description "We can use \"reverse\" to fix up ... by ... <TODO: fill me in!>")

