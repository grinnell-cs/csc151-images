---
title: Unit testing with RackUnit
summary: |
  In the laboratory, you will explore the ways in which small tests can help you develop and update code.
  You will also familiarize yourself with the RackUnit unit testing library.
  You will also have the opportunity to think more broadly about testing.
---

In this lab, you will work collaboratively to explore testing and the `rackunit` library.  You will be responsible for gathering up the code you write into a file called `testing.rkt` and turning that file in to Gradescope on behalf of the group.  Make sure that `testing.rkt` includes `require` declarations for the appropriate libraries:

```drracket
(require csc151)
(require rackunit)
```

Throughout this lab, we will provide procedure examples that may use language features we have not yet introduced in this course.  That is fine!  The purpose of this lab is to *test* code rather than write new code, so focus on the *intended behavior* of the function rather than its implementation.  (Although we will briefly explore that it is sometimes helpful to know the implementation!)

## Exercise 1: Roundtable

**Side A** should serve as *driver* for this exercise.

The driver should open up DrRacket, `require` both the `csc151`, `rackunit`, and the `rackunit/text-ui` packages in their file, and copy the following function:

~~~racket
;;; (range1 n) -> listof integer?
;;;   n : integer?
;;; Returns the list of numbers from 1 to n, inclusive.  If
;;; n is non-positive, then returns the empty list.
(define range1
  (lambda (n)
    (map (lambda (n) (+ n 1)) (range n))))
~~~

Define a series of tests for this procedure, each of which you write explicitly in the definitions pane.  For example,

~~~racket
(test-equal? "A very small range" (range1 1) (list 1))
~~~

This is a good practice as you are developing your program so you can quickly know if your code meets the current set of tests.

Note: Do not use the `test-suite` procedure!  While that can be useful, we will use direct tests for the time being.

As this example suggests, your tests should be defined using the `test-*` functions described in [the RackUnit api](https://docs.racket-lang.org/rackunit/api.html).

To develop the tests, you should alternate volunteering test cases which the driver then transcribes in the definitions pane.  Continue identifying test cases until your group is satisfied withthe the set of tests.  You should agree on when you all feel that you have reasonably validated the function's behavior.

Make sure that the procedure passes all the tests.  Then "comment-out" the tests by placing `#|` before the tests and `|#` after the tests so that we do not run the tests in the auto-grader.

## Exercise 2: Positive and negative cases

**Side B** should serve as *driver* for this exercise.

One way to organize our tests is by exploring *positive* and *negative* test cases.  A _positive test case_ is an example that exercises when the function reports "yes"---*e.g.*, returns true, computes a result---when the inputs are "good".  A _negative test case_ is an example that exercises when the function reports "no"---*e.g.*, returns false, returns an error value, does not modify the input---when the inputs are "bad".  (For the time being, you can't test for error values, so stick to the other kinds of negative tests.) Follow the same process as in the prior exercise.

~~~racket
;;; (palindrome? str) -> boolean?
;;;   str : string?
;;; Returns true iff the string s is a palindrome, i.e., the letters
;;; in str are the same backwards and forewards.
(define palindrome?
  (lambda (str)
    (and (string? str)
         (let ([stuff (map char-downcase 
                           (filter char-alphabetic?
                                   (string->list str)))])
           (string=? (list->string stuff)
                     (list->string (reverse stuff)))))))
~~~

As in the previous exercise, collaboratively develop a set of tests for this procedure.  For this exercise, make sure to keep in mind the idea of positive and negative test cases.  You'll use `test-true` for positive tests and `test-false` for negative tests.

When you are done, the driver should make sure that the completed function and its test suite are in the file and then comment out the code.

## Exercise 3: Types and corners

**Side A** should serve as *driver* for this exercise.

Another way to organize our tests is by exploring the range of possible inputs.  If the type of the input admits a finite set of values, we ought to test all those values directly.  However, if an infinite set of values is possible, we need to be more judicious in what values we examine.

One way to do this is to identify *corner* and *non-corner* case values.  Think of a corner case as an example input that exercises the "boundaries" of how the function ought to work.  For example, if you are operating over a certain range of numbers, a corner case might be an input at the lower or upper end of that range.  In contrast, the values in the middle of the range are non-corner case values.  We expect that the function will likely operate in the same way over these non-corner values, so we would then surmise that we don't have to test all of these non-corner values; a few of them will suffice!

*Note*: `dedup-adjacent`, below, relies on aspects of Scheme you do not yet know.  That's okay.  You should focus on the documentation and the testing that might be appropriate given that documentation.

~~~racket
;;; (dedup-adjacent l) -> listof any?
;;;   l : listof any?
;;; Returns the original list l but with all duplicates found
;;; adjacent to each other removed from the list.  For example:
;;;   > (dedup-adjacent (list 3 4 7 8 1 1 0 9 9 9 6 5 5 2 4))
;;;   '(3 4 7 8 1 0 9 6 5 2 4)
(define dedup-adjacent
  (lambda (l)
    (cond 
      [(null? l)
       null]
      [(null? (cdr l)) 
       l]
      [else
       (let ([c1 (car l)]
             [c2 (cadr l)]
             [rest (cddr l)])
         (if (equal? c1 c2)
             (dedup-adjacent (cons c2 rest))
             (cons c1 (dedup-adjacent (cons c2 rest)))))])))
~~~

a. As in the the previous exercises, collaboratively develop a set of tests for this function.  For this exercise, keep in mind the idea of types and corner cases/edge cases.

b. Here's a not-quite-correct version of `dedup-adjacent`.  Do your tests identify the error?  If not, you need more tests.

```drracket
(define dedup-adjacent
  (lambda (l)
    (cond
      [(null? l)
       null]
      [(null? (cdr l))
       l]
      [else
       (let ([c1 (car l)]
             [c2 (cadr l)]
             [rest (cddr l)])
         (if (equal? c1 c2)
             (dedup-adjacent (cons c2 rest))
             (cons c1 (cons c2 (dedup-adjacent rest)))))])))
```


c. Once again, make sure the code and tests are in `testing.rkt` and are commented out.

## Turning it in!

At this point, you are ready to turn in the lab.  (That doesn't mean that you're done with the lab; just that you've done enough work to turn in.) Take a few minutes to make sure that file has everything.  Then submit the work on Gradescope.

## Exercise 5: Test-driven development

**Side B** should serve as *driver* for this exercise.

_You will not turn in this part of the lab._

Tests don't have to be created after you write your function!  Because we frequently implement a function with examples in mind to begin with, it is useful to codify these examples as tests *first* and then use those tests to guide development.  Such a development methodology is called *test-driven development* where the *tests drive the design of the code*.

Consider the following procedure description.

```drracket
;;; (describe-triangle side1 side2 side3) -> string? or #f
;;;   side1 : rational?
;;;   side2 : rational?
;;;   side3 : rational?
;;; Describe the triangle whose three sides are as given.
;;; * If all three sides are equal, the description is "equilateral".
;;; * If exactly two sides are equal, the description is "isosceles".
;;; * If no two sides are equal, description is "scalene".
;;; * If the sides do not describe a triangle, return #f.  
;;;
;;; Note: Degenerate triangles are not real triangles, so parameters
;;; that describe a degenerate triangle will normally result in a
;;; return value of false (#f).
```

Here's an *incorrect* implementation.

```drracket
(define describe-triangle
  (lambda (side1 side2 side3)
    #f))
```

An incorrect implementation is enough to get us started writing tests.

a. As before, write a set of tests for this function. 

b. Write your own version of `describe-triangle`.  Make sure it passes your tests.

c. Here's an incorrect implementation.  How many errors do your tests find?

```
#|
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(or (< (+ side1 side2) side3) 
           (< (+ side1 side3) side2)
           (< (+ side2 side3) side1))
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3)
           (equal? side1 side3))
       "isosceles"]
      [else
       "scalene"])))
|#
```

d. Find another group who has written `describe-triangle` and trade procedures with them.  Do you pass all of their tests?  Do they pass all of your tests?

<!-- 
Issues tests of `describe-triangle` should check.

In an ideal world, we'd look at each group's test suite and design
an algorithm that is incorrect, but passes their test suite.  I'm
crossing my fingers that this is a natural progression.  If you
have the time, you can build your own from the ones below.  For
example, if they figure out the issue of inexact/exact early on,
you can replace "equal?" with "=" in some of the earlier ones.

* Inputs with zero or negative side-lengths.  #f
    * Version 1 only checks this for the first parameter.
  Remaining versions check it for all three sides.
* All reasonable pairs of sides for isosceles.  "isosceles"
    * Versions 1 and 2 only check side1/side2 and side2/side3, which
      are the most common pairs.
    * Remaining versions check it for all three pairs.
* Other non-triangles: Sum of two sides <= the remaining side
    * Versions 1-3 don't check
    * Version 4 only checks the first two versus the third
* Exact/inexact sides (e.g., (2.1 21/10 3), which should be isosceles.)
* Degenerate triangles (two or more sides are equal).

; Version 1 (incorrect)
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(<= side1 0)
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3))
       "isosceles"]
      [else
       "scalene"])))

; Version 2 (incorrect)
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3))
       "isosceles"]
      [else
       "scalene"])))

; Version 3 (incorrect)
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3)
           (equal? side1 side3))
       "isosceles"]
      [else
       "scalene"])))

; Version 4 (incorrect)
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(<= (+ side1 side2) side3)
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3)
           (equal? side1 side3))
       "isosceles"]
      [else
       "scalene"])))

; Version 5 (incorrect)
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(or (<= (+ side1 side2) side3) 
           (<= (+ side1 side3) side2)
           (<= (+ side2 side3) side1))
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3)
           (equal? side1 side3))
       "isosceles"]
      [else
       "scalene"])))

; Final version
(define describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(or (<= (+ side1 side2) side3)
           (<= (+ side1 side3) side2)
           (<= (+ side2 side3) side1))
       #f]
      [(= side1 side2 side3)
       "equilateral"]
      [(or (= side1 side2)
           (= side2 side3)
           (= side1 side3))
       "isosceles"]
      [else
       "scalene"])))

-->
