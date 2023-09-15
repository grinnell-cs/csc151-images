#lang racket
(require 2htdp/image)
(require csc151)

;; CSC 151 (SEMESTER)
;; Lab: Conditionals
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
This lab consists of a number of programming and reasoning exercises
about booleans and conditionals.  Start with the A-side exercises with
A-side driving and B-side navigating.  Then switch back and forth as
indicated.
|#

#| AB |#

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

; Our favorite image
(define kitten "kitten.jpg")

; Some colors
(define gray0 (rgb 0 0 0))
(define gray1 (rgb 96 96 96))
(define gray2 (rgb 192 192 192))
(define gray3 (rgb 255 255 255))

;;; (color-brightness c) -> real? (between 0 and 100)
;;;   c : color?
;;; Find the approximate perceived brightness of c
(define rgb-brightness
  (lambda (c)
    (round (* 100/255 
              (+ (* .30 (color-red c))
                 (* .59 (color-green c))
                 (* .11 (color-blue c)))))))

;;; (color-darker-32 c) -> color?
;;;   c : color?
;;; Make c darker by subtracting 32 from each component
(define color-darker
  (lambda (c)
    (rgb (- (color-red c) 32)
         (- (color-green c) 32)
         (- (color-blue c) 32))))

;;; (color-lighter-32 c) -> color?
;;;   c : color?
;;; Make c ligher by adding 32 to each component
(define color-lighter
  (lambda (c)
    (rgb (+ (color-red c) 32)
         (+ (color-green c) 32)
         (+ (color-blue c) 32))))

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|

1. Introduce yourself to your partner.  Make sure to discuss working
habits and other topics.  

2. Save this file as `conditionals.rkt`.

3. Update the `csc151` library.

4. Note that Partner A is the partner closer to the board and Partner
B is the partner further from the board.

5. Optional: Review the Q&A from the readings.

Division of labor:

* A drives on 1, 4, 5
* B drives on 2, 3, 6

|#

#| A |#

; +---------------------------------------------+--------------------
; | Exercise 1: Mixing conditionals and numbers |
; +---------------------------------------------+

#|
In this exercise, we continue to explore how to work with the
primitive types and their standard library functions.  Use functions
from the Racket standard library to implement the following common
functions that utilize booleans.

When you are done, you should experiment with your function in the
interactions pane on a variety of inputs to verify that the program
works as expected.
|#

#|
a. Write a predicate `(is-even? n)` that takes an integer as input
and returns true if `n` is even and false otherwise.

You may not use the built-in `even?` or `odd?` predicates.

You may, however, use the `remainder` procedure you recently learned.
|#

(define is-even?
  (lambda (n)
    ???))

#|
b. In your experiments with `is-even?`, you may have determined that
`is-even?` reports an error when `n` is not an integer.

Write a predicate, `(is-even-integer? n)`, that returns true when
`n` is an even integer and false otherwise.  

Your procedure should return false when `n` is a complex number, a
non-integer real, a string, an image, and, well, anything that's
not an integer.
|#

(define is-even-integer?
  (lambda (n)
    ???))

#|
c. Write a function (number-not-integer? n) that returns true if `n`
is a number that is not an integer and false otherwise.
|#

; TODO: write your function here!

#|
d. Write a function, `(median-of-three x y z)`, that takes three
real numbers as input and returns the number that is the middle
value of the three when put in numerical order.  If two numbers are
the same, you can return that number.  If all three are the same,
you can return that number.

Note that you need not put the numbers in order; the definition above
is for what the median is.
|#

; TODO: write your function here!

#| B |#

; +---------------------------------------------+--------------------
; | Exercise 2: Mixing conditionals and strings |
; +---------------------------------------------+

#|
In this exercise, we continue learning how to work with the primitive
types and their standard library functions.  Use functions from the
Racket standard library to implement the following common functions
that utilize booleans.

When you are done, you should experiment with your function in the
interactions pane on a variety of inputs to verify that the program
works as expected.
|#

#|
a. In a particular company, employees are given IDs that consist of
a string of 6 digits, e.g., "419109".

Write a function, `(employee-id? str)`, that takes a string as input
and determines whether the string is a valid employee id.  You need
not check that `str` is a string.

> (employee-id? "123456")
#t
> (employee-id? "1")
#f
> (employee-id? "000111")
#t
> (employee-id? "00011x")
#f
> (employee-id? 123456)
Boom!  Crash!

Hint: `string->number` may help.  `string-length` may help.  `substring`
may help.
|#

(define employee-id?
  (lambda (str)
    ???))

#|
b. The founders of the company are given IDs where the first 3
digits are 0s, e.g., "000110".

Write a function `(founder-id? str)` that takes a string as input and
determines whether the string is a valid founder's ID.

Note that you should use `employee-id?` to ensure that the id is a
valid employee id.

Hint: `substring` may help with the additional check.
|#

(define founder-id?
  (lambda (str)
    ???))

; +----------------------------------+-------------------------------
; | Exercise 3: Exploring brightness |
; +----------------------------------+

#|
At the top of this lab, you will find a procedure, `(color-brightness c)`,
gives the approximate perceived brightness of a color as a real number 
between 0 and 100.
|#

#|
a. Write a procedure, `(color-bright? c)`, that takes an RGB color
as a parameter and returns true (#t) if the brightness of c is at
least 50 and returns false (#f) if the brightness is less than 50.
|#

;;; (color-bright? c) -> boolean?
;;;   c : color?
;;; Determines if c is bright (brightness at least 50)
(define color-bright?
  (lambda (c)
    ???))

#|
b. Write a procedure, `(better-color-bright? c)`, that takes an RGB
color OR the name of a color as a parameter and returns true (#t) if 
the brightness of c is at least 50 and returns false (#f) if the 
brightness is less than 50.
|#

;;; (color-bright? c) -> boolean?
;;;   c : color? or color-name?
;;; Determines if c is bright (brightness at least 50)
(define better-color-bright
  (lambda (c)
    ???))

#|
c. Pick five color names and determine if each is bright.  Write
your answers below.  (E.g., "white is bright", "black is not bright".)

i. 

ii.

iii.

iv.

v.
|#

#| A |#

; +-----------------------------------+------------------------------
; | Exercise 4: Brightness, continued |
; +-----------------------------------+

#|
a. Write a procedure, `(color-brighter? c1 c2)`, that takes two RGB
colors as parameters and determines whether c1 is brighter than c2.
|#

;;; (color-brighter? c1 c2) -> boolean?
;;;   c1 : color?
;;;   c2 : color?
;;; Determines if c1 is brighter than c2.
(define color-brighter?
  (lambda (c1 c2)
    ???))

#|
b. Write a procedure, `(color-brighter c1 c2)`, that takes wo
RGB colors as paraemters and returns the brighter of c1 and c2.
|#

;;; (color-brighter c1 c2) -> color?
;;;   c1 : color?
;;;   c2 : color?
;;; Find the brighter of c1 and c2.
(define color-brighter
  (lambda (c1 c2)
    ???))

; +--------------------------------------+---------------------------
; | Exercise 5: A strange transformation |
; +--------------------------------------+

#|
Consider the following procedure.
|#

;;; (color-something c) -> color?
;;;   c : color?
;;; ???
(define color-something
  (lambda (c)
    ((if (color-bright? c) color-lighter color-darker) c)))

#|
a. To the best of your ability, explain what `color-something` does.
You might determine this through experimentation with individual
colors, by applying it to the kitten image, by reading the code,
or through other techniques.  Spend no more than two minutes on
this!

<ENTER YOUR EXPLANATION HERE>
|#

#|
b. To the best of your ability, explain *how* `color-something`
works.  Spend no more than two minutes on this!

<ENTER YOUR EXPLANATION HERE>
|#

#| B |#

; +----------------------------------+-------------------------------
; | Exercise 6: Simplified grayscale |
; +----------------------------------+

#|
Using `cond` (and not nested `if` expressions), write a procedure,
`(color-4gray c)`, that converts a color into black, white, or
a shade of gray using the four `gray#` procedures defined above.

* Return `gray0` if the brightness of `c` is less than 25;
* Return `gray1` if the brightness of `c` is at least 25 but less than 50;
* Return `gray2` if the brightness of `c` is at least 50 but less than 75;
* Return `gray3` if the brightness of `c` is at least 75.
|#

;;; (color->4gray c) -> color?
;;;   c : color?
;;; Convert c to black, white, or a gray.
(define color-4gray
  (lambda (c)
    ???))

#|
You should also try applying this procedure to the kitten.
|#

#| AB |#

; +----------------------+-------------------------------------------
; | Submitting your work |
; +----------------------+

#|
Congratulations on finishing this lab!  To turn in your work:

a. Ensure that your combined file runs properly.
b. Rename this file to `conditionals.rkt` (i.e., no -a or -b in the
   name).
c. Send this completed file to your partner for their records.
d. Submit this final file to Gradescope.  Make sure, if appropriate,
   to submit your work as a group submission and include your
   partner in the submission.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might want to attempt
one or more of these exercises.
|#

; +------------------------------+-----------------------------------
; | Extra 1: Conditional tracing |
; +------------------------------+

#|
Consider the following code snippet:
|#

(define foo
  (lambda (x1 x2)
    (if (< x1 x2)
        #t
        #f)))

(define bar
  (lambda (x1 x2)
    (< x1 x2)))

#|
Here's a trace of two similar expressions.

    (foo 2 4)
--> (if (< 2 4) #t #f)
    ; Evaluate the test
--> (if #t #t #f)
    ; The test is truish; Use the consequent
--> #t

    (bar 2 4)
--> (< 2 4)
--> #t

Remember that to trace an `if` expression, you first evaluate the guard
(the first "parameter" to `if`).  If the guard holds, you replace the
`if` with the consequent (the second "parameter" to `if`).  If the guard
does not hold, you replace the `if` with the alternate (the third "parameter"
to `if`).

Give execution traces for each of the following expressions.  Check
with the interactions pane that your final value coincides with the
result of evaluating the expression in Racket.
|#

#|
a. (foo 5 3)

<TODO: give your trace here>
|#

#|
b. (bar 5 3)

<TODO: give your trace here>
|#

#|
c. What do you see as the similarities and differences between
`foo` and `bar`?

<TODO: give your answer here>
|#

#| B |#

; +------------------------+-----------------------------------------
; | Extra 2: More tracing! |
; +------------------------+

#|
Consider the following code snippet:
|#

(define baz
  (lambda (x1 x2 x3)
    (if (< x1 x2)
        (if (< x2 x3)
            #t
            #f)
        #f)))

(define qux
  (lambda (x1 x2 x3)
    (and (< x1 x2) (< x2 x3))))

#|
Here are some execution traces.

    (baz 2 3 4)
--> (if (< 2 3) (if (< 3 4) #t #f) #f)
    ; Evaluate the test
--> (if #t (if (< 3 4) #t #f) #f)
    ; The test is truish; use the consequent
--> (if (< 3 4) #t #f)
    ; Evaluate the test
--> (if #t #t #f)
    ; The test is truish; use the consequent
--> #t

    (qux 2 3 4)
--> (and (< 2 3) (< 3 4))
    ; Evaluate the first argument to `and`
--> (and #t (< 3 4))
    ; The first argument is truish; drop it
--> (and (< 3 4))
    ; There's only one argument to and, use it
--> (< 3 4)
--> #t

    (baz 3 2 4)
--> (if (< 3 2) (if (< 2 4) #t #f) #f)
    ; Evaluate the test
--> (if #f (if (< 2 4) #t #f) #f)
    ; The test is false, use the alternate
--> #f

    (qux 3 2 4)
--> (and (< 3 2) (< 2 4))
    ; Evaluate the first argument to `and`
--> (and #f (< 2 4))
    ; When the first argument to `and` is false, the result is false.
--> #f

    (baz 3 4 2)
--> (if (< 3 4) (if (< 4 2) #t #f) #f)
    ; Evaluate the test
--> (if #t (if (< 4 2) #t #f) #f)
    ; The test is true, use the consequent
--> (if (< 4 2) #t #f) 
    ; Evaluate the test
--> (if #f #t #f) 
    ; The test is false, use the alternate
--> #f

    (qux 3 4 2)
--> (and (< 3 4) (< 4 2))
    ; Evaluate the first argument to `and`
--> (and #t (< 4 2))
    ; When the first argument to `and` is true or truish, we move on
    ; to the remaining arguments
--> (and (< 4 2))
    ; Evaluate the first argument to `and`.
--> (and #f)
    ; When the first argument to `and` is false, return false
--> #f
|#

#|
a. Why do you think we choose those three example inputs (that is, "2 3 4",
"3 2 4" and "3 4 2")?

<TODO: enter your answer here>
|#

#|
b. What do you see as the similarities and differences between
`baz` and `qux`?

<TODO: enter your answer here>
|#

; +----------------------+-------------------------------------------
; | Extra 3: Boolean Zen |
; +----------------------+

#|
a.  In a previous exercise, you wrote a function, `is-even?` that
determines whether a number is even.  Consider the following functions
that uses `is-even?` to determine if both of its parameters are even.
|#

(define really-bad-both-even?
  (lambda (n1 n2)
    (if (equal? (is-even? n1) #t)
        (if (equal? (is-even? n2) #t)
            #t
            #f)
        #f)))

#|
For example:

> (really-bad-both-even? 2 4)
#t
> (really-bad-both-even? 1 2)
#f

We claim that this implementation is "really bad" not because it
produces the wrong answer, but because it is sylistically offensive!
First, rewrite this function as `bad-both-even?` below using `and`
and `or` to remove the need for a nested conditional expression.

Experiment with `bad-both-even?` on a variety of examples to gain
confidence that your function works identically to
`really-bad-both-even?`.
|#

(define better-both-even?
  (lambda (n1 n2)
    ???))

#|
b. If your implementation of `better-both-even?` still contains a
conditional, then you still have more work to do!  Rewrite the
function one more time as `both-even?` below that uses neither `if`
nor `cond` in its implementation.  Again, experiement with `both-even?`
and a variety of examples to ensure that it works identically to
the previous implementations.
|#

(define both-even?
  (lambda (n1 n2)
    ???))

#|
c. The process of reimplementing `both-even?` so that it is better
designed while keeping its behaviror the same is called "refactoring".
Refactoring this function tells us something profound about booleans
and expressions, a concept that some faculty in the CS department
picked up from Stuart Reges at the University of Washington called
"boolean zen" (or "Boolean Zen").  In this class, we often use the
slightly more verbose "The Zen of Booleans".

Suppose that I have a piece of code that looks as follows:

    (if <expr> #t #f)

Where `<expr>` is a Boolean expression.  Based on `both-even?` or
the code tracing exercises, describe what I can rewrite this code
to that is equivalent to the original version but more concise.  In
a few sentences, describe and justify your answer.

<TODO: give your rewritten code and explanation here!>
|#

#|
d. Finally, use the concept of the Zen of Booleans to write a concise
version of the function `(both-odd? n1 n2)` that returns true only
when both of its arguments are odd?.  You may assume that both
parameters are integers.

Note: simply negating `both-even?` won't work since `both-even?`
will return false if one argument is even and the other is odd.

You may not use the `odd?` predicate here, but you may use the
`is-even?` procedure.
|#

(define both-odd?
  (lambda (n1 n2)
    ???))

; +-------------------------------+----------------------------------
; | Extra 4: Atypical cond blocks |
; +-------------------------------+

#| 
You need not submit your answers to these questions, but you should
make sure to attempt them.
|#
   
#|
As you have no doubt noticed, the blocks in a `cond` statement
normally have the form

    [guard
     consequent]

However, it turns out that they can have a variety of other forms.
Experimentally determine answers to each of the following questions
about alternate forms.
|#

#|
a. What happens if a block has more than one consequent?

<TODO: Enter your answer here>
|#

#|
b. What happens if the guard returns a value other than #t or #f?

<TODO: Enter your answer here>
|#

#|
c. What happens if a block has no consequents and the guard holds?

<TODO: Enter your answer here>
|#

#|
d. What happens if a block has no consequents and the guard returns
false (`#f`)?

<TODO: Enter your answer here>
|#

#|
e. What happens if a block has no consequents and the guard returns
a value other than true (`#t`) or false (`#f`)?

<TODO: Enter your answer here>
|#

#|
f. What happens if a `cond` statement has no `else` and none of the
guards hold?  (That is, all of the guards return false?)

<TODO: Enter your answer here>
|#

; +-------------------------------------+----------------------------
; | Extra 5: Median of three, revisited |
; +-------------------------------------+

#|
Earlier, you wrote `median-of-three`.  Write a version of `median-of-three`
without conditionals.  (You may not even use `and` or `or`.)

Hint: You may find that `max` and `min` help.
|#

(define new-median-of-three
  (lambda (x y z)
    ???))
