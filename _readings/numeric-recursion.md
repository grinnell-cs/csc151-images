---
title: Numeric recursion
summary: |
  We consider techniques for recursion over integers.
---

## Introduction

We have written a wide variety of recursive procedures so far.
We have written recursive procedures that return lists (*e.g.*, a variety of procedures that select or filter elements from lists), numbers (*e.g.*, procedures that tally elements in a list, as well as things like `sum` and `product`), and even Boolean values (*e.g.*, the `all-___?` and `any-___?` predicates).
Yet the procedures have had one thing in common: All of them took lists as parameters.

While the recursive procedures we've written so far have used lists as the basis of recursion, we can also write recursive procedures with other types as the basis of recursion.
All we really need to do recursion are (a) a way to determine if a value is simple enough that we can compute an answer directly and (b) a way to simplify the value.

Natural numbers provide a nice basis of recursion.
Like lists, positive integers have a recursive structure of which we can take advantage when we write direct-recursion procedures.
A positive integer, `n`, is either:

+ Zero, or
+ The *successor* of a smaller positive integer, which we can obtain by subtracting 1 from `n`.

## The structure of recursive procedures

Recall that the common format of a recursive procedure is

```racket
(define recursive-proc
  (lambda (val)
    (if (base-case-check)
        (base-case val)
        (combine (partof val)
                 (recursive-proc (simplify val))))))
```

For lists, the check for a base case was typically "is the list empty" or "does the list have only one value", which we would express as `(null? lst)` and `(null? (cdr lst))`, respectively.
We typically simplify a list by taking the `cdr` of the original list.
Hence, the simplest form of a recursive procedure for lists is:

```racket
(define recursive-proc
  (lambda (lst)
    (if (null? lst)
        (base-case)
        (combine (car lst)
                 (recursive-proc (cdr lst))))))
```

Clearly, with other data types, we'll have different tests for the base case and different mechanisms for simplifying values.

## Numeric base cases

To write recursive procedures with numeric arguments, we first need a technique for identifying the base case.
With positive integers, 0 often provides an appropriate base case.
Standard Scheme provides the predicate `zero?` to distinguish between the base and recursive cases, which permits us to use an `if`-expression to ensure that only the expression for the appropriate case is evaluated.
Of course, we can also compare for equality directly with `0`, *i.e.*, `(zero? n)` produces the same result as `(equal? n 0)` for any `n`, but you will find `zero?` more convenient to use in this specialized scenario.

Mirror our recursive definition for integers above, we can potentially write a procedure that applies to *any* positive integer if we know:

+   What value to return when the argument is 0, 
+   How to convert the value that the procedure would return for the next smaller positive integer into the appropriate return value for a given non-zero integer.

Hence, a typical numeric recursive procedure will look something like:

```racket
(define recursive-proc
  (lambda (val)
    (if (zero? val)
        (base-case)
        (combine val (recursive-proc (- val 1))))))
```

In this sample code, we subtract 1 to simplify the number.
However, one can also subtract more than 1, or divide the number by 2, or do anything else that gives a result that is closer to zero.

## An example: The termial

For instance, here is a procedure that, given a positive integer, `number`, computes the result of adding together all of the positive integers up to and including *`number`*.
At Grinnell, this result is traditionally called the "*termial*" of the number, a play on the term "factorial":

```
;;; Procedure:
;;;   termial
;;; Parameters:
;;;   number, a positive integer
;;; Purpose:
;;;   Compute the sum of the positive integers not greater than a given integer
;;; Produces:
;;;   sum, an integer
;;; Preconditions:
;;;   number is a number, exact, an integer, and non-negative.
;;;   The sum is not larger than the largest integer the language
;;;     permits.
;;; Postconditions:
;;;   sum is the sum of positive integers not greater than number.
;;;   That is, sum = 0 + 1 + 2 + ... + number
(define termial
  (lambda (number)
    (if (zero? number)
        0
        (+ number (termial (- number 1))))))
```

Whereas in [list recursion]({{ "/readings/recursion-basics.html" | relative_url }}), we called the `cdr` procedure to reduce the length of the list in making the recursive call, the operation that we apply in recursion with integers is reducing the number by 1.

### Watching `termial` in action

As an example, here is how our mental model of execution operates with `termial` procedure:

```
    (termial 5)
--> (+ 5 (termial 4))
--> (+ 5 (+ 4 (termial 3)))
--> (+ 5 (+ 4 (+ 3 (termial 2))))
--> (+ 5 (+ 4 (+ 3 (+ 2 (termial 1)))))
--> (+ 5 (+ 4 (+ 3 (+ 2 (+ 1 (termial 0))))))
--> (+ 5 (+ 4 (+ 3 (+ 2 (+ 1 0)))))
--> (+ 5 (+ 4 (+ 3 (+ 2 1))))
--> (+ 5 (+ 4 (+ 3 3)))
--> (+ 5 (+ 4 6))
--> (+ 5 10)
=> 15
```

### Preconditions for `termial`

The restriction that `termial` takes only non-negative integers as arguments is an important one: If we gave it a negative number or a non-integer, we'd have a runaway recursion.
We cannot get to zero by subtracting 1 repeatedly from a negative number or from a non-integer, and so the base case would never be reached.
For example,

```
   (termial -5)
=> (+ -5 (termial -6))
=> (+ -5 (+ -6 (termial -7)))
=> (+ -5 (+ -6 (+ -7 (termial -8))))
=> (+ -5 (+ -6 (+ -7 (+ -8 (termial -9)))))
=> ...
```

Similarly, if we gave the `termial` procedure an approximation rather than an exact number, we might or might not be able to reach zero, depending on how accurate the approximation is and how much of that accuracy is preserved by the subtraction procedure.

```
   (termial 4.1)
=> (+ 4.1 (termial 3.1))
=> (+ 4.1 (+ 3.1 (termial 2.1)))
=> (+ 4.1 (+ 3.1 (+ 2.1 (termial 1.1))))
=> (+ 4.1 (+ 3.1 (+ 2.1 (+ 1.1 (termial 0.1)))))
=> (+ 4.1 (+ 3.1 (+ 2.1 (+ 1.1 (+ 0.1 (termial -0.9))))))
=> (+ 4.1 (+ 3.1 (+ 2.1 (+ 1.1 (+ 0.1 (+ -0.9 (termial -1.9)))))))
=> ...
```

Hence, we might use a husk-and-kernel strategy to protect our procedure.

```racket
(define termial
  (lambda (number)
    (cond
     [(not (number? number))
      (error "termial expects a number, received" number)]
     [(not (integer? number))
      (error "termial expects an integer, received" number)]
     [(< number 1)
       (error "termial expects a positive integer, received" number)]
     [(inexact? number)
      (error "termial expects an exact integer, received" number)]
     [else
      (termial-kernel number)])))

(define termial-kernel
  (lambda (number)
    (if (zero? number)
        0
        (+ number (termial-kernel (- number 1))))))
```

### A note on the implementation of `termial`

Note that our "sum all the values" algorithm is not the only way to compute the termial of an integer.
Many of you may have learned a more efficient (or at least more elegant) algorithm.
We'll return to this algorithm later.

## Other numeric base cases

The important part of getting recursion to work is making sure that the base case is inevitably reached by performing the simplification operation enough times.
For instance, we can use direct recursion on exact positive integers with a base case of 1, rather than 0.

```racket
;;; Procedure:
;;;   factorial
;;; Parameters:
;;;   n, a positive integer
;;; Purpose:
;;;   Compute n!, the product of positive integers less than or
;;;   equal to a given positive integer.
;;; Produces:
;;;   product, an integer
;;; Preconditions:
;;;   * n is a number, exact, an integer, and positive.
;;;   * The product is not larger than the largest integer the
;;;     language permits.  (Not an issue in our implementation of
;;;     Scheme, but we mention ;;;     it anyway.)
;;; Postconditions:
;;;   * product is the product of the positive integers less than or
;;;     equal to n.  That is,
;;;       product = 1 * 2 * ... * n
(define factorial
  (lambda (n)
    (if (= n 1)
        1
        (* n (factorial (- n 1))))))
```

We require the invoker of this `factorial` procedure to provide an exact, strictly positive integer.
(Zero won't work in this case, because we can't reach the base case, 1, by repeated subtractions if we start from 0.)

Our base case need not be a small number.
We can, for example, use direct recursion to approach the base case from below by repeated additions of 1, provided we are sure that our starting point is less than or equal to that target.
Here's a variant of `termial` that sums the values from `a` to `b` (rather than 1 to `n`), inclusive.

```racket
;;; Procedure:
;;;   sum-between
;;; Parameters:
;;;   a, an integer
;;;   b, an integer
;;; Purpose:
;;;   Compute the sum of the numbers from a to b, inclusive.
;;; Produces:
;;;   sum, an integer
;;; Preconditions:
;;;   a <= b.
;;; Postconditions:
;;;   sum = a + (a+1) + (a+2) + ... + (b-1) + b.
(define sum-between
  (lambda (a b)
    (if (= a b)
        b
        (+ a (sum-between (+ a 1) b)))))
```

```racket
> (sum-between 1 3)
6
> (+ 1 2 3)
6
> (sum-between 7 11)
45
> (+ 7 8 9 10 11)
45
> (sum-between -5 5)
0
```

## Returning other types of values

In the examples above, our recursive procedures returned numbers.
But we can also have numeric recursive procedures return lists.
For example, here's one way we might write `make-list` if it did not already exist.

```racket
(define my-make-list
  (lambda (n val)
    (if (zero? n)
        null
        (cons val (my-make-list (- n 1) val)))))
```

## Self checks

### Check 1: Recursive Forms (‡)

The reading shows you how the basic [patterns of recursion]({{ "/readings/list-recursion-revisited.html" | relative_url }}) we have seen apply to numbers just as well as lists.
Identify the standard pieces of the recursive procedure `sum-between` by filling in the blanks below.

-   The *base case check* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which checks whether \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *base-case-computation* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *partof* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *simplify* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, thereby giving us a "simpler value."
-   Finally, the *combine* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
