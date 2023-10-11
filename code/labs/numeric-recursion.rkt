#lang racket

(require csc151)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Lab: Numeric recursion (numeric-recursion.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, we'll continue practice designing and writing recursive
functions, this time, functions that recurse over the natural numbers.
|#

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. Identify who is Partner A and who is Partner B.  Ideally, Partner
A will be the partner closer to the board.

b. Have the normal start-of-lab discussion.  Share names, strengths,
approaches, etc.

c. Make sure to save the file as `numeric-recursion.rkt`.  Remember,
infinite recursion can sometimes crash the computer, so it's good
to save early and offer.
|#

#| B |#

; +---------------------------+--------------------------------------
; | Exercise 1: Counting down |
; +---------------------------+

#|
Complete the definition of `(count-down n)` below that takes a
non-negative integer, `n`, and returns a list that contains the
numbers starting with `n` going down to 1.  For example

    > (count-down 1)
    '(1)
    > (count-down 5)
    '(5 4 3 2 1)
    > (count-down 0)
    '()

**You must use recursion to accomplish this task.**  That is,
don't just use `(range n 0 -1)` or something similar.

You should also write appropriate documentation and a set of 
tests for this procedure to ensure that it is correct.
|#

;;; (count-down n) ->
;;;   n :
;;;
(define count-down
  (lambda (n)
    ???))

; +---------------------------------+--------------------------------
; | Exercise 2: Flipping the script |
; +---------------------------------+

#|
The `count-down` function you just implemented is suspiciously close
to the `range` function we use to generate a sequence of numbers in
the range 1 to n. For ease of implementation, we'll consider range to
be *inclusive* on n rather than *exclusive*. It will be relatively
easy to change our final result so that our function after the fact.

Here is a bad implementation of range likely using the same technique
that you used for `count-down`:
|#

;;; (bad-range n) -> listof integer?
;;;   n : non-negative-integer?
;;; Construct a list of all the values from 1 through n, inclusive.
(define bad-range
  (lambda (n)
    (if (zero? n)
        null
        (cons n (bad-range (- n 1))))))

#|
a. Experiment with this function on a few inputs. In a sentence or
two below, describe the problem or problems with this function and 
why we encounter those problems.  

<TODO: describe the problem you encountered here>
|#

#|
b. In a sentence or two, suggest how you might fix the function.
Note that you should *not* fix the function now; just suggest a
general approach.  And spend no more than three minutes thinking
about the issue!

<TODO: describe a possible fix here>
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 3: Dropping elements |
; +-------------------------------+

#|
As you may recall, the procedure `(drop lst n)` takes a list and a
non-negative exact integer as parameters and creates the list that
results from dropping the first `n` elements of `lst`.  

As you might expect, writing `drop` involves recursion over both
parameters.  That is, we'll take the `cdr` of `lst` in each 
recursive call and we'll also subtract 1 from `n` in each recursive
call.

In this exercise, you'll write your own version of `drop`, which
we'll call `my-drop`.
|#

#|
a. At the end of this exercise, you'll see documentation,, a template,
and a test for `my-drop`.  Add at least three more tests.  Make sure
to consider edge cases!
|#

#|
b. Answer the following questions.

What's the base case?  That is, what value of `n` is simple enough
that we can immediately determine the result of dropping `n` elements?

<ANSWER>

What's the base value?  That is, what should you return when you reach
the base case?

<ANSWER>

Suppose we've computed `(my-drop (cdr lst) (- n 1))`.  How does that help
us compute `(my-drop lst n)`?

<ANSWER>
|#

#|
c. Complete the definition of `my-drop`.
|#

;;; (my-drop lst n) -> list?
;;;   lst : list? (with at least n elements)
;;;   n : non-negative-exact-integer?
;;; Remove the first n elements from `lst.
(define my-drop
  (lambda (lst n)
    ???))

#|
(test-equal? "my-drop: remove half the list"
             (my-drop '(a b c d e f) 3)
             '(d e f))
|#

#| A |#

; +-----------------------------+------------------------------------
; | Exercise 4: Taking Elements |
; +-----------------------------+

#|
As you may recall, the procedure `(take lst n)` takes a list and a
non-negative exact integer as parameters and creates a list that
consists of the first `n` elements of `lst`, in the same order.

As you might expect, writing `take` involves recursion over both
parameters.  That is, we'll take the `cdr` of `lst` in each 
recursive call and we'll also subtract 1 from `n` in each recursive
call.

In this exercise, you'll write your own version of `take`, which
we'll call `my-take`.
|#

#|
a. At the end of this exercise, you'll see documentation,, a template,
and a test for `my-take`.  Add at least three more tests.  Make sure
to consider edge cases!
|#

#|
b. Answer the following questions.

What's the base case?  That is, what value of `n` is simple enough
that we can immediately determine the result of taking `n` elements?

<ANSWER>

What's the base value?  That is, what should you return when you reach
the base case?

<ANSWER>

Suppose we've computed `(my-take (cdr lst) (- n 1))`.  How does that help
us compute `(my-take lst n)`?

<ANSWER>
|#

#|
c. Complete the definition of `my-take`.
|#

;;; (my-take lst n) -> list?
;;;   lst : list? (with at least n elements)
;;;   n : non-negative-exact-integer?
;;; Build a list consisting of the first n elements of lst.
(define my-take
  (lambda (lst n)
    '(a b c))) ; This passes all the tests, but is wrong.

(test-equal? "my-take: take half the list"
             (my-take '(a b c d e f) 3)
             '(a b c))
(test-equal? "my-take: take all the list"
             (my-take '(a b c) 3)
             '(a b c))

#| B |#

; +-------------------------+----------------------------------------
; | Exercise 5: Counting up |
; +-------------------------+

#|
Consider a procedure, `(values-between start finish)`, that takes
two exact integers as parameters produces a list of all the values
between `start` (inclusive) and `finish` (exclusive).  For example,

    > (values-between 5 10)
    '(5 6 7 8 9)
    > (values-between 5 5)
    '()
    > (values-between -3 3)
    '(-3 -2 -1 0 1 2)
|#

#|
a. We've written a few tests for `values-between`.  Read over those and
determine whether it would be useful to add a few more.  Also consider
the implications of those tests.
|#

#|
b. Consider the normal questions for recursive design

What's your base case test?

<ANSWER>

What should you return in the base case?

<ANSWER>

What does the recursive call look like?

<ANSWER>

What should you do after the recursive call?

<ANSWER>
|#

#|
c. Implement `values-between`.
|#

;;; (values-between start finish) -> listof? integer?
;;;   start : exact-integer?
;;;   finish : exact-integer?
;;; Create a list of integers between start (niclusive) and finish
;;; (exclusive).
(define values-between
  (lambda (start finish)
    ???))

#|
(test-equal? "five to ten" 
             (values-between 5 10)
             '(5 6 7 8 9))
(test-equal? "zero to zero"
             (values-between 0 0)
             '())
(test-equal? "ten to five"
             (values-between 10 5)
             '())
(test-equal? "negative to positive"
             (values-between -3 3)
             '(-3 -2 -1 0 1 2))
(test-equal? "positive to negative"
             (values-between 3 -3)
             '())
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 6: Repeated division |
; +-------------------------------+

#|
The `rhythm10` of any non-negative number is the number of times
that we must divide the number by 10 to reach a number less than
or equal to 1.  For example,

    > (rhythm10 0)
    0
    > (rhythm10 1)
    0
    > (rhythm10 1.00001)
    1
    > (rhythm10 5)
    1
    > (rhythm10 33)
    2
    > (rhythm10 512)
    3
    > (rhythm10 9812.412)
    4
|#

#|
a. Review the tests we've written below and decide if any other tests
are necessary.  If so, add them.
|#

#|
b. Write `rhythm10` recursively.
|#

;;; (rhythm10 n) -> exact-integer?
;;;   n : non-negative-real?
;;; Compute the number of times we have to divide n by 10 in
;;; order to reach a number less than or equal to one.
(define rhythm10
  (lambda (n)
    ???))

#|
(test-equal? "zero"
             (rhythm10 0)
             0)
(test-equal? "one"
             (rhythm10 1)
             0)
(test-equal? "slightly more than one"
             (rhythm10 1.00001)
             1)
(test-equal? "two"
             (rhythm10 2)
             1)
(test-equal? "two digits"
             (rhythm10 53)
             2)
(test-equal? "three digits"
             (rhythm10 212)
             3)
(test-equal? "one hundred"
             (rhythm10 100)
             2)
(test-equal? "one hundred and one"
             (rhythm10 101)
             3)
(test-equal? "inexact number with fractional part"
             (rhythm10 9312.2321)
             4)
(test-equal? "exact number with fractional part"
             (rhythm10 93123/2)
             5)
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

; +----------------------------+----------------------------------
; | Extra 1: Sums of Fractions |
; +----------------------------+

#|
Consider the sum 1/1 + 1/2 + 1/3 + ... + 1/n.  While there may be
a formula that some mathematicians know for that sum, it may also
be easier to just have the computer calculate it for us.

Finish writing the procedure, `(fractional-sum n)`, below, which
computes that sum.

Hint: You will likely find it easier to think of the sum as 
  1/n + 1/(n-1) + ... + 1/3 + 1/2 + 1/1.
Or, in Scheme notation
  (+ (/ 1 n) (+ (/ 1 (- n 1)) ... (+ (/ 1 3) (+ (/ 1 2) (/ 1 1)))))
|#

;;; (fractional-sum n) -> rational?
;;;   n : positive-integer?
;;; Computes 1/1 + 1/2 + 1/3 + ... + 1/n.
(define fractional-sum
  (lambda (n)
    ???))

#|
(test-equal? "(fractional-sum 1)" (fractional-sum 1) 1)
(test-equal? "(fractional-sum 2)" (fractional-sum 2) (+ 1 1/2))
(test-equal? "(fractional-sum 3)" (fractional-sum 3) (+ 1 1/2 1/3))
(test-equal? "(fractional-sum 4)" (fractional-sum 4) (+ 1 1/2 1/3 1/4))
(test-equal? "(fractional-sum 5)" (fractional-sum 5) (+ 1 1/2 1/3 1/4 1/5))
|#

#| B |#

; +--------------------------------------+---------------------------
; | Extra 2: Repeated division, repeated |
; +--------------------------------------+

#|
Consider the `(rhythm n d)` procedure documented below, which
generalizes `rhythm10`.
|#

#|
a. Write tests for `rhythm`.
|#

#|
b. Implement `rhythm`.
|#

;;; (rhythm n d) -> exact-integer?
;;;   n : non-negative-real?
;;;   b : real? (greater than one)
;;; Compute the number of times we have to divide n by b in
;;; order to reach a number less than or equal to one.
(define rhythm 
  (lambda (n b)
    ???))

#|
(test-equal? "zero/ten"
             (rhythm 0 10)
             0)
(test-equal? "zero/two"
             (rhythm 0 2)
             0)
(test-equal? "zero/small divisor"
             (rhythm 0 1.1)
             0)
|#

; +--------------------------+---------------------------------------
; | Extra 3: Range revisited |
; +--------------------------+

#|
You may recall an earlier problem with a `bad-range` function that
was intended to create a list of numbers from 1 through n, inclusive.

There's a few ways of fixing this function. We could run `bad-range`
and reverse the input, but that requires us to "traverse" the list
twice---once to create the list and once to reverse it. Instead, we'll
use this opportunity to introduce a new recursion technique, the
*accumulator*. Rather than returning an "empty" value in the base
case, we use an *extra argument* to our recursive function that serves
to accumulate the results at each step of the recursion. We then
return this accumlator when we done processing the recursive
structure.

Complete the definition of `(acc-range n so-far)` which takes a
natural number `n` and a list of values created `so-far` and
recursively prepends the numbers n to 1 (inclusive), in order, onto
the front of `so-far`, resulting in a list that begins with the
numbers 1 through n.

**You may not use `range` or `append` to complete this procedure!  You
should be able to complete the procedure using `cons` and appropriate
recursive calls to `acc-range`.**

Here are some examples of `acc-range`'s execution.  We would recommend
that you think through them carefully.
 
    ; Assorted examples
    > (acc-range 5 (list 8 10 12))
    '(1 2 3 4 5 8 10 12)
    > (acc-range 0 (list 4 1 2))
    '(4 1 2)
    > (acc-range 3 (list 3 2 1))
    '(1 2 3 3 2 1)
    > (acc-range 3 (list 4 5 6))
    '(1 2 3 4 5 6)

    ; Accumulating onto the empty list
    > (acc-range 0 '())
    '()
    > (acc-range 1 '())
    '(1)
    > (acc-range 2 '())
    '(1 2)
    > (acc-range 3 '())
    '(1 2 3)

    ; Something that almost looks like recursive tracing
    > (acc-range 4 '())
    '(1 2 3 4)
    > (acc-range 3 '(4))
    '(1 2 3 4)
    > (acc-range 2 '(3 4))
    '(1 2 3 4)
    > (acc-range 1 '(2 3 4))
    '(1 2 3 4)
    > (acc-range 0 '(1 2 3 4))
    '(1 2 3 4)

Don't forget to write appropriate documentation and a set of RackUnit
tests for this function!
|#

;;; (acc-range n so-far) ->
;;;   n : 
;;;   so-far : 
;;; 
(define acc-range
  (lambda (n so-far)
    ???))

#|
c. Use `acc-range` as a helper to implement `(good-range n)` which
correctly produces a list of the numbers 0 through n, inclusive.

Don't forget to write appropriate documentation and a set of rackunit
tests for this procedure.
|#

;;; (good-range n) -> 
;;;   n :
;;;
(define good-range
  (lambda (n)
    (acc-range n ???)))

; +------------------------+-----------------------------------------
; | Extra 4: Powers of ... |
; +------------------------+

#|
a. Write a recursive procedure, `(powers-of-two n)`, that produces a 
list of all of the powers of two less than or equal to n.

    > (powers-of-two 5)
    '(1 2 4)
    > (powers-of-two 8)
    '(1 2 4 8)
    > (powers-of-two 10)
    '(1 2 4 8)
    > (powers-of-two 100)
    '(1 2 4 8 16 32 64)

Hint: You may want to write a helper procedure that takes an extra
parameter.
|#

;;; (powers-of-two n) ->
;;;   n :
;;;
(define powers-of-two
  (lambda (n)
    ???))

#|
b. Write a procedure, (powers-of-three n), that produces a list of
all of the powers of three less than or equal to n.

    > (powers-of-three 100)
    '(1 3 9 27 81)
    > (powers-of-three 1000)
    '(1 3 9 27 81 243 729)
|#

;;; (powers-of-three n) ->
;;;   n :
;;;
(define powers-of-three
  (lambda (n)
    ???))

#|
c. You’ve likely found that powers-of-two and powers-of-three look
remarkably the same. When you find procedures that look the same,
one approach is to write a template that you can copy and paste. But 
a better strategy is to add an extra parameter.

Write a procedure, (powers-of k n), that produces a list of all the
powers of k less than or equal to n.

    > (powers-of 2 100)
    '(1 2 4 8 16 32 64)
    > (powers-of 3 100)
    '(1 3 9 27 81)
    > (powers-of pi 100)
    '(1 3.141592653589793 9.869604401089358 31.006276680299816 97.40909103400242)
|#

;;; (powers-of k n) ->
;;;   k :
;;;   n :
;;;
(define powers-of
  (lambda (k n)
    ???))

#|
d. Rewrite powers-of-two and powers-of-three in terms of powers-of.

Note: If possible, use `section` rather than `lambda`.
|#

(define new-powers-of-two 
  ???)

(define new-powers-of-three
  ???)

; +------------------+-----------------------------------------------
; | Extra 5: Fibbing |
; +------------------+

#|
The Fibonacci sequence (https://oeis.org/A000045) is a classic
numeric sequence in mathematics. It is defined recursively as follows:

fib(0) = 0
fib(1) = 1
fib(n) = fib(n-1) + fib(n-2)
|#

#|
a. Complete the definition of `(naive-fib n)` below directly
translating its recursive definition into code. Write an appropriate
doc comment and set of rackunit tests to ensure its correctness.
|#

;;; (naive-fib n) : non-negative-integer?
;;;   n : non-negative-integer?
;;; Compute the nth number in the Fibonacci sequence, defined in
;;; traditionally mathematical notation as
;;;   fib(0) = 0
;;;   fib(1) = 1
;;;   fib(n) = fib(n-1) + fib(n-2)
(define naive-fib
  (lambda (n)
    ???))

#|
b. Try out `naive-fib` on a variety of inputs, including
reasonably-sized inputs such as in the 20s, 30s, and upwards.  You
should notice that the function starts taking a long to execute as you
go up in numbers.  Remember that you can use `(time exp)` to find out
how long it takes Racket to compute something.  Record a few times
here.

<TODO: Continue filling in the data below.>
> (time (naive-fib 20))
...

|#

#|
c. Use your mental model of computation to sketch out how naive-fib
executes on a small input, say 5. Notice the pattern of function
calls. In a few sentences below, describe what you observed and use
your findings to speculate why `naive-fib` is so slow on these
seemingly reasonable inputs.

<TODO: write your explanation here>
|#

#|
d. Optionally, propose a mechanism or mechanisms you might use to
make `naive-fib` more efficient.

<TODO: write your suggestion here>
|#

; +-----------------------+------------------------------------------
; | Extra 6: More Fibbing |
; +-----------------------+

#|
One approach to the Fibonacci problem is to pass along *three* accumulators,
one for where we are in the sequence, one for the current Fibonacci number,
and one for the prior Fibonacci number.
|#

;;; (fibonacci-helper n k fib-k fib-k-1)
;;;   n : positive integer?
;;;   k : positive integer?
;;;   fib-k : non-negative integer?
;;;   fib-k-1 : non-negative integer?
;;; Compute the nth Fibonacci number given the kth and kth-1st
;;; Fibonacci numbers.
(define fibonacci-helper 
  (lambda (n k fib-k fib-k-1)
    ???))

(define fibonacci
  (lambda (n)
    (fibonacci-helper n 1 1 0)))

#|
Complete the definition above.
|#
