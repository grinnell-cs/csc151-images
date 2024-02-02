#lang racket

(require csc151)

;; CSC 151 (SEMESTER)
;; Lab: Numbers
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab you will be working with your partner to discover
common ways we manipulate the basic numeric types of Racket.
Please refer to the lab write-up as well as the reference page
on the course website for more information about the various
functions we introduce in this lab.

For this lab, the partner nearer the board will drive on the
exercises marked "A" and the partner further from the board
will drive on the exercises marked "B".
|#

#| AB |#

#|

1. Make sure to introduce yourself to your partner.

2. Make sure to save this file as numbers.rkt.

3. Optional: Review the Q&A.

|#

#| A |#

; +----------------------------------------+-------------------------
; | Exercise 1: Simple numeric computation |
; +----------------------------------------+

#| Please don't spend more than five minutes on this exercise. |#

#|
a. Determine the type DrRacket gives for the square root of
two, computed by (sqrt 2).  Is it exact or inexact?  Real?
Rational?  An Integer?

<TODO: fill in the type of (sqrt 2) here>

|#

#|
b. As we discussed last class, one way to check our answer
is to "undo" the square root function via multiplication.
We can even observe that the difference of this result and the
expected value 2 evaluates to 0.

Write a pair of expressions that calculates the square of
(sqrt 2) via multiplication and then takes the difference of that
result from the expected value.  We call this latter value
the error of computation.
|#

(define square-root-of-two-squared ???)

;(define difference-between-that-number-and-two 
; (- square-root-of-two-squared 2))

#|
c. You may find the values that these two values evaluate to a bit
surprising!  In the space below, write a few sentences describing
what you discovered and why you believe that to be the case.

<TODO: fill in the requested information here>
|#

#|
d. In the space below, describe whether you expect your answer
to be the same if you instead used (sqrt 4) rather than (sqrt 2).
Explain your reasoning and check your work experimentally with
the interactions panel of DrRacket.

<TODO: Fill in some notes here.>
|#

#| A |#

; +------------------------+-----------------------------------------
; | Exercise 2: Remainders |
; +------------------------+

#|
As the reading suggests, the remainder procedure computes the amount
"left over" after you divide one number by another.  The reading
suggests that remainder provides an interesting alternative to using
max and min to limit (but not cap) the values of functions.

a. `(remainder x y)` gives you the amount "left over" when you 
divide x by y.  For example (remainder 13 3) should give you 1,
because 13 divided by 3 is 4 with 1 left over.

Predict the values of each expressions in the space provided
below.  **Do not use the interpreter yet!**

> (remainder 8 3)
<TODO: fill in the resulting value here>
> (remainder 3 8)
<TODO: fill in the resulting value here>
> (remainder 8 8)
<TODO: fill in the resulting value here>
> (remainder 9 8)
<TODO: fill in the resulting value here>
> (remainder 16 8)
<TODO: fill in the resulting value here>
> (remainder 827 8)
<TODO: fill in the resulting value here>
> (remainder 0 8)
<TODO: fill in the resulting value here>
> (remainder -8 8)
<TODO: fill in the resulting value here>
> (remainder -7 8)
<TODO: fill in the resulting value here>
> (remainder -9 8)
<TODO: fill in the resulting value here>
> (remainder -8 3)
<TODO: fill in the resulting value here>
> (remainder -3 8)
<TODO: fill in the resulting value here>
|#

#|
b. Check your answers experimentally with DrRacket, one at a time.
If you any of your answers disagree, try to come up with an explanation
why.  If you cannot come up with one, feel free to hail down a
member of the course staff for help (with @staff, if you are online).

<TODO: Insert any notes you have>
|#

#| B |#

; +------------------------------------+-----------------------------
; | Exercise 3: From reals to integers |
; +------------------------------------+

#|
As the reading on numbers suggests, Racket provides four
functions that convert real numbers to nearby integers: floor,
ceiling, round, and truncate.  The reading also claims there are
differences between all four.

To the best of your ability, figure out what each does, and what
distinguishes it from the other three.  In your test, you should
try both positive and negative numbers, numbers close to integers,
and numbers far from integers.  (Numbers whose fractional part is
0.5 are about as far from an integer as any real number can be.)

Write your descriptions of each function in the spaces below:

(floor r): <TODO: insert your description here>
(ceiling r): <TODO: insert your description here>
(truncate r): <TODO: insert your description here>
(round r): <TODO: insert your description here>

When you are done, feel free to read the notes on this problem
which can be found in the lab page.
|#

#| B |#

; +---------------------------+-------------------------------------
; | Exercise 4: Large numbers |
; +---------------------------+

#|
Many programming languages have limits on the size of the numbers they
represent. In some cases, if the number is large enough, they
approximate it. In other cases, if the number is large enough, the
calculations you do with the error are erroneous. (You’ll learn why in
a subsequent course.) And in still others, the language treats large
enough values as the special value "infinity".
|#

#|
a. See what happens if you try to have DrRacket compute with some very
large exact integers. You may find the expt function helpful. Then see
what happens if you try convert those integers to inexact values. Here
are two examples to start with, but you should try more.

> (define x (expt 2 100))
> (define ex (exact->inexact x))

<TODO: Fill in your observations here>
|#

#|
b. See what happens if you try to have DrRacket compute with some very
small exact rational numbers (say, 1 divided by one of those large
numbers). Then see what happens if you convert those rational numbers
to inexact values. Describe what you observe in your file in a few
sentences below.

<TODO: fill in your observations here>
|#

#|
When you are done, feel free to read the notes on this problem which
can be found in the accompanying lab.
|#

#| B |#

; +----------------------------------------+-------------------------
; | Exercise 5: Exploring design decisions |
; +----------------------------------------+

#|
As you may have noted, some procedures, such as `max`, sometimes
return an exact number and sometimes return an inexact number.

    > (max 3.0 5.0)
    5.0         ; inexact
    > (max 31 5)
    31          ; exact
|#

#|
a. Present a hypothesis as to when `max` will return an exact
number and when they will return an inexact number.

`max` will return an exact number when:
ADD AN ANSWER

`max` will return an inexact number when:
ADD AN ANSWER

Note that your answers should be comprehensive; someone should be able 
to use your answers to predict the exactitude of any call to `max`.
|#

#|
b. Conduct a few experiments to check your hypothesis. That is,
enter expressions that match the criteria for exact results and
inexact results. Copy and paste the results here.


|#

#|
c. Do you expect to get an exact or inexact result for `(max 300 0.1)`?
Why?

ENTER YOUR ANSWER

Check your anwers by entering the expression in DrRacket.
|#

#|
d. As you have likely discovered, `max` returns an inexact number
if *any* of its parameters are inexact. It's not a law of the
universe that `max` must behave that way; the authors of the
Racket programming language decide to make it behave that way.

Why might they have made that decision? Be prepared to discuss your
answer with the class.

ENTER YOUR ANSWER
|#

#| AB |#

; +-------------+----------------------------------------------------
; | Wrapping Up |
; +-------------+

#|
Congratulations on finishing this lab!  To turn in your work:

a. Make sure that you saved this as `numbers.rkt`.
b. Email a copy of the lab to your partner.
c. Submit this final file to Gradescope.  Make sure to submit your 
   work as a group submission and include your partner in the submission.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you finish all of these problems early, try one
or more of the following problems.  Note that some of these problems
require you to write functions.
|#

; +-----------------------+------------------------------------------
; | Extra 1: Digit tricks |
; +-----------------------+

#|
For these programming problems over numbers, think carefully about
how you might use integer division and rounding to accomplish the
desired behavior.
|#

#|
a. Write a procedure, (ones-digit-of n), that takes an integer n as
input and returns the value of the ones digit (i.e., the rightmost
digit) in that number.  For example:

> (ones-digit-of 21904)
4
> (ones-digit-of 0)
0
|#

(define ones-digit-of
  (lambda (n)
    ???))

#|
b. Write a procedure (truncate-ones-from n) that takes an integer n
and returns n, but with the digit in the ones position removed.  If
the number has only one digit, then 0 is returned.  For example:

> (truncate-ones-from 4210)
421
> (truncate-ones-from 3)
0
|#

(define truncate-ones-from
  (lambda (n)
    ???))

#|
c. Check your functions on negative numbers.  Do they work as expected?
If not, how might you fix that issue?

> (ones-digit-of -42)
2 ; -2 would also be okay
> (truncate-ones-from -42)
-4

<TODO: Insert notes on how you might fix the issue, if you have it.>
|#

; +-------------------------------------+----------------------------
; | Extra 2: Exploring rational numbers |
; +-------------------------------------+

#|
DrRacket's implementation of Scheme permits you to treat any real
number as a rational number, which means we can get the numerator
and denominator of any real number.  Let's explore what numerator
and denominator that implementation uses for a variety of values.
|#

#|
a.  Determine the numerator and denominator of the rational
representation of the square root of 2.
  numerator: 
  denominator: 

b.  Determine the numerator and denominator of the rational
representation of 1.5.
  numerator: 
  denominator: 

c.  Determine the numerator and denominator of the rational
representation of 1.2.
  numerator: 
  denominator: 

d.  Determine the numerator and denominator of 6/5.
  numerator: 
  denominator: 

If you are puzzled by some of the later answers, you may want to read the
notes on the problem, which you can find in the lab instructions.

Note that we will not expect you to regularly figure out these
strange numerators and denominators.
|#

; +-----------------------------+------------------------------------
; | Extra 3: Rounding revisited |
; +-----------------------------+

#|
You may recall that we have a number of mechanisms for rounding real
numbers to integers. But what if we want to round not to an integer,
but to only two digits after the decimal point? Scheme does not include
a built-in operation for doing that kind of rounding. Nonetheless,
it is fairly straightforward.

Suppose we have a value, `val`. Write instructions that give val rounded
to the nearest hundredth. For example,

    > (define val 22.71256)
    > (your-instructions val)
    22.71
    > (define val 10.7561)
    > (your-instructions val)
    10.76

Hint: You know how to round at the decimal point.  Thik about ways
to shift the decimal point.

It's fine if your procedure does not work perfectly for all values.
|#

