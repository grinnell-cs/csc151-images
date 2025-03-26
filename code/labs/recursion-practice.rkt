#lang racket

(require csc151)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Lab: Recursion Practice (recursion-practice.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In a prior lab, you practiced reading recursive procedures.  Today,
you will explore the construction of some recursive procedures.
|#

; +---------------+--------------------------------------------------
; | Supplied code |
; +---------------+

;;; (sum numbers) -> number?
;;;   numbers : listof number?
;;; Add all the numbers in a list together.
(define sum
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (car numbers) (sum (cdr numbers))))))

;;; (select-numbers values) -> listof? number
;;;   values : list?
;;; Select all the numbers in values, putting them into a new list.
(define select-numbers
  (lambda (values)
    (cond
      [(null? values)
       null]
      [(not (number? (car values)))
       (select-numbers (cdr values))]
      [else
       (cons (car values) (select-numbers (cdr values)))])))

;;; (count-value value values) -> integer?
;;;   value : any?
;;;   values : list?
;;; Count how many times value appears in values.
(define count-value
  (lambda (value values)
    (cond
      [(null? values)
       0]
      [(equal? value (car values))
       (+ 1 (count-value value (cdr values)))]
      [else
       (count-value value (cdr values))])))

;;; (largest numbers) -> integer?
;;;   numbers : listof integer?
;;; Finds the largest number in a list
(define largest
  (lambda (numbers)
    (if (null? (cdr numbers))
        (car numbers)
        (max (car numbers) (largest (cdr numbers))))))


#| AB |#

#|
a. Introduce yourself to your partner, discuss strengths and weaknesses,
decide upon work procedures, etc.

b. Save this file as `recursion-practice.rkt`.  And don't forget that
when we write recursive procedures, we may accidentally write procedures
that recurse forever.  Save early and often!

c. Review the procedures above to make sure that you know what they are 
intended to do; you can go back and look at the details when you write
variants.
|#

#| A |#

; +---------------------------------------------+--------------------
; | Exercise 1: Exploring recursive definitions |
; +---------------------------------------------+

#|
As you may have determined in your initial explorations with
recursion, a typical recursive procedure has three parts: (1) a
*base case*, in which we use a *base case test* to determine whether
the input is simple enough and, if so, return an appropriate *base
case value*; (2) a *recursive call*, in which we call the same
procedure again, albeit on parameters we have *simplified*, and,
in most cases, a (3) *post-recursion step*, in which we do something
with the recursive result.

Some procedures may have different recursive calls or post-recursion
steps.  For example, we might do something different for even-length
and odd-length lists.

Review the procedures above and, for each, note the various parts.
If a procedure has multiple recursive calls, separate them out in
the explanation.

a. sum

base-case-test: ENTER YOUR ANSWER

base-case-value: ENTER YOUR ANSWER

parameter simplification: ENTER YOUR ANSWER

recursive call: ENTER YOUR ANSWER

post-recursion step: ENTER YOUR ANSWER

b. select-numbers

base-case-test: ENTER YOUR ANSWER

base-case-value: ENTER YOUR ANSWER

parameter simplification: ENTER YOUR ANSWER

recursive call: ENTER YOUR ANSWER

post-recursion step: ENTER YOUR ANSWER

c. count-value

base-case-test: ENTER YOUR ANSWER

base-case-value: ENTER YOUR ANSWER

parameter simplification: ENTER YOUR ANSWER

recursive call: ENTER YOUR ANSWER

post-recursion step: ENTER YOUR ANSWER

d. largest

base-case-test: ENTER YOUR ANSWER

base-case-value: ENTER YOUR ANSWER

parameter simplification: ENTER YOUR ANSWER

recursive call: ENTER YOUR ANSWER

post-recursion step: ENTER YOUR ANSWER

|#

#| B |#

; +------------------------------------+-----------------------------
; | Exercise 2: Counting list elements |
; +------------------------------------+

#|
Consider the following attempt at a recursive definition of a function
that computes the length of a list.
|#

(define my-length
  (lambda (l)
    (if (null? l)
        1
        (my-length (cdr l)))))

#|
a. Build a small test suite for this function using `rackunit` in the
   space below. What tests do you need to ensure that you "cover all
   the cases" of this program's execution?
|#

; Here's one to get you started.  Uncomment it when you're ready.
; (test-equal? "sample test" (my-length '(1 2 3)) 3)

;;; <TODO: write your additional rackunit tests for my-length here>

#|
b. In your testing, you should have noted that the function doesn't
   behave as expected! Using the debugging techniques we've developed
   as well as your mental model of computation, determine the cause
   of the problem and FIX IT IN THE CODE ABOVE. Ensure that your
   modified function passes all of your tests. Describe the problem
   and your fix in the space below.  (Note, your goal is to define
   `my-length` in such a way that it mimics the behavior of `length`.
   Hence, you should not call `length` in your definition.)

;;; <TODO: write your explanation of the code's problem and your fix>

|#

#| A |#

; +---------------------------------------+--------------------------
; | Exercise 3: The joy of multiplication |
; +---------------------------------------+

#|
Consider the following attempt at a recursive definition of a function
that computes the product of the elements of a list.  (The product is
the result of multiplying them together.)
|#

(define my-product
  (lambda (l)
    (if (null? l)
        0
        (my-product (cdr l)))))

#|
a. Build a small test suite for this function using `rackunit` in the
   space below. What tests do you need to ensure that you "cover all
   the cases" of this program's execution?
|#

; Here are two to get you started.  Uncomment them when you're ready.
; (test-equal? "sample test" (my-product '(2 3 4)) 24)
; (test-equal? "special case of empty list" (my-product '()) 1)

;;; Write your additional rackunit tests for my-product here

#|
b. In your testing, you should have noted that the function doesn't
   behave as expected! Using the debugging techniques we've developed
   as well as your mental model of computation, determine the cause
   of the problem and FIX IT IN THE CODE ABOVE. Ensure that your modified
   function passes all of your tests. Describe the problem and your
   fix in the space below.

;;; Write your explanation of the code's problem and your fix

|#

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 4: Counting with predicates |
; +--------------------------------------+

#|
The `length` procedure counts all the values in a list.  The `count-value` 
procedure counts how many time a supplied value appears in a list.  What 
if we want something in between the two: Rather than counting all the values,
we only want to count some of them, and rather than counting a single value,
we want to count all values matching a particular criterion?  (You may
think of this as `tally`.)
|#

#|
Document, write tests for, and implement a recursive procedure, 
`(tally-odd numbers)` that, given a list of integers, counts how
many are odd.

Note: You should not call list-length, length, filter, tally, or
count-value in your solution. Instead, use the ideas behind some
or all of these functions in crafting your own recursive solution.
|#

(define tally-odd
  (lambda (numbers)
    -1))

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 5: What comes first? |
; +-------------------------------+

#|
Document, write tests for, and implement a recursive procedure, 
`(alphabetically-first words)`, that finds the alphabetically first
string in a nonempty list of strings.

You can use `string-ci<=?` to compare any two strings for alphabetical 
order.

You may not use `sort` to solve this problem.

Note: You should not use the empty list as the base case.
|#

(define alphabetically-first
  (lambda (words)
    ""))

#| B |#

; +-----------------------------+------------------------------------
; | Exercise 6: Singleton lists |
; +-----------------------------+

#|
As you've seen, `(null? lst)` checks if a list has zero elements.

Suppose we want to write a procedure, `(singleton? lst)`, that checks 
whether a list has exactly one element.

Many students are tempted to write the following.

(define singleton?
  (lambda (lst)
    (= 1 (length lst))))

We very much prefer this alternate definition.

(define singleton?
  (lambda (lst)
    (and (not (null? lst))
         (null? (cdr lst)))))

a. Explain how the second `singleton?` procedure works.

ENTER YOUR ANSWER HERE
|#

#|
b. The first version of `singleton?` is definitely easier to read.
Explain why we might still prefer the second one.  (Consider the
definition of length from before as you answer this question.)

ENTER YOUR ANSWER HERE
|#

#|
c. Write a non-recursive procedure, `(simple-length lst)` that returns 

* "empty", if the list has no elements;
* "one", if the list has one element; 
* "two", if the list has two elements; and
* "many", if the list has more than two elements.

You may not use `length` or `my-length` or recursion in solving this 
problem.
|#

(define simple-length
  (lambda (lst)
    ???))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
You know the drill!
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time and want to further explore some
of these issues, consider implementing any of the following procedures.
|#

; +--------------------------+---------------------------------------
; | Extra 1: Skipping values |
; +--------------------------+

#|
Document, write tests for, and write a procedure, `(find-first-skip lst)` 
that takes a list of symbols as a parameter and returns the index
of the first instance of the symbol `'skip` in `lst`, if `skip` appears
in `lst`, and false otherwise.

> (find-first-skip (list 'hop 'skip 'and 'jump))
1
> (find-first-skip (list 'skip 'hop 'jump 'skip 'and 'skip 'again))
0
> (find-first-skip (list 'hop 'to 'work 'jump 'to 'school 'but 'never 'skip 'class))
8
|#

(define find-first-skip
  (lambda (lst)
    #f))

; +--------------------------+---------------------------------------
; | Extra 2: Finding indices |
; +--------------------------+

#|
Document, write tests for, and implement a recursive procedure, 
`(find-index val lst)`, that takes a value and a list of values as
its parameters and returns the index of the first instance of val
in lst, if the value appears in the list. If the value does not
appear, find-index should return #f.
|#

(define find-index
  (lambda (val lst)
    #f))

; +-------------------------+----------------------------------------
; | Extra 3: Riffling lists |
; +-------------------------+

#|
Document, write tests for, and implement a recursive proceure,
(riffle first second) that produces a new list containing alternating
elements from the lists first and second. If one list runs out
before the other, then the remaining elements should appear at the
end of the new list.

> (riffle (list 'a 'b 'c) (list 'x 'y 'z))
(a x b y c z)
> (riffle (list 'a 'b 'c) (range 0 10))
(a 0 b 1 c 2 3 4 5 6 7 8 9)
|#

(define riffle
  (lambda (first second)
    null))
