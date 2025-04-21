#lang racket

(require csc151)
(require rackunit)

;; CSC 151-NN (Semester)
;; Lab: Tail and helper Recursion
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (new-sum number) -> number?
;;;   numbers : listof number?
;;; Find the sum of all the values in numbers
(define new-sum
  (lambda (numbers)
    (new-sum/helper 0 numbers)))

;;; (nem-sum/helper sum-so-far remaining) -> number?
;;;   sum-so-far : number?
;;;   remaining : listof number?
;;; Find the sum of sum-so-far plus all the values
;;; in numbers.
(define new-sum/helper
  (lambda (sum-so-far remaining)
     (displayln (list 'helper sum-so-far remaining))
     (if (null? remaining)
         sum-so-far
         (new-sum/helper (+ sum-so-far (car remaining))
                         (cdr remaining)))))

;;; (longest-string strings) -> string?
;;;   strings : listof string?
;;; Determine which string in strings is longest.
(define longest-string
  (lambda (strings)
    (letrec ([helper
              (lambda (longest-so-far remaining)
                ; (displayln (list 'helper longest-so-far remaining))
                (if (null? remaining)
                    longest-so-far
                    (helper (longer-string longest-so-far (car remaining))
                            (cdr remaining))))])
      (helper (car strings) (cdr strings)))))

;;; (longer-string str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Identify the longer of str1 and str2.  If both are the
;;; same length, could return either one.
(define longer-string
  (lambda (str1 str2)
    ; (displayln (list 'longer-string str1 str2))
    (if (>= (string-length str1) (string-length str2))
        str1
        str2)))

;;; An alternate version of longest-string
(define longest-string/alt
  (lambda (strings)
    (displayln (list 'longest-string/alt strings))
    (if (null? (cdr strings))
        (car strings)
        (if (>= (string-length (car strings))
                (string-length (longest-string/alt (cdr strings))))
            (car strings)
            (longest-string/alt (cdr strings))))))

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Have the normal start-of-lab discussion.  Consider strengths,
weaknesses, working styles, etc.
|#

#|
b. Save this file as `tail-recursion.rkt`.
|#

#|
c. Discuss the self checks with your partner.
|#

#|
d. Review the purposes of the procedures above.
|#

#| A |#

; +---------------------------+--------------------------------------
; | Exercise 1: A quick trace |
; +---------------------------+

#|
`new-sum/helper` (above) is intended to give a quick trace of
its own behavior.  Verify that it does with a few examples.

TODO: Paste your examples from the interactions pane here.
|#

; +--------------------------------+---------------------------------
; | Exercise 2: Tracing, revisited |
; +--------------------------------+

#| 
a. Trace (at a high level) the following call.

  (longest-string '("a" "bc" "def" "gh" "i" "jklmn"))

Your sketch should start something like the following.  (Note that
we are not expanding the calls to `longer-string`.)

    (longest-string '("a" "bc" "def" "gh" "i" "jklmn"))
--> (helper "a" '("bc" "def" "gh" "i" "jklmn"))
--> (helper (longer-string "a" "bc") '("def" "gh" "i" "jklmn"))
--> (helper "bc" '("def" "gh" "i" "jklmn"))
--> ...

<TODO: Finish that trace>
|#

#|
b. Uncomment the calls to `displayln` in those two procedures
so that you can have them trace themselves.
|#

#|
c. Evaluate the expression in DrRacket to see if you get a similar
trace.  (You won't see the nesting.)

<TODO: Post the trace here.>
|#

#| B |#

; +------------------------------+-----------------------------------
; | Exercise 3: Tallying symbols |
; +------------------------------+

#|
Consider the following procedure `(tally-symbols` lst)`, that takes
as input a list of mixed values (both symbols and other types of
values) and returns a count of the number of symbols in the list.

    (define tally-symbols
      (lambda (lst)
        (if (null? lst)
            0
            (if (symbol? (car lst))
                (+ 1 (tally-symbols (cdr lst)))
                (tally-symbols (cdr lst))))))

We will be rewriting `tally-symbols` using tail recursion.  The
helper procedure will likely have two parameters: a count of all
the symbols you've seen so far and a list of all the values you
have left to look at.
|#

#|
a.  Complete the following table, which represents what we 
expect to see at every step evaluating the helper on the list 
`'(5 a b 1 c 2 3 b 4)`.

        tally-so-far                    remaining
        ------------                    ---------
        0                               '(5 a b 1 c 2 3 b 4)
        0                               '(a b 1 c 2 3 b 4)
        1                               '(b 1 c 2 3 b 4)
        2                               '(1 c 2 3 b 4)
        2                               '(c 2 3 b 4)

<TODO: Fill in the remaining rows.>
|#

#|
b. Using the ideas you gained in those steps, implement this new
`tally-symbols` using a tail-recursive helper.  You'll need to fill
in the missing parts of the procedures below.
|#

(define tally-symbols/helper
  (lambda (tally-so-far remaining)
    ???))
    
(define tally-symbols
  (lambda (lst)
    (tally-symbols/helper ??? ???)))

#|
c. Check your answers on some of the following lists

> (tally-symbols null)
> (tally-symbols (list 1 2 3))
> (tally-symbols (list 'a 'b 'c))
> (tally-symbols (list 1 'a 2 'b 3 'c))

<TODO: Enter the results>
|#

#|
d. Update `tally-symbols/helper` to print out calls using a line
like the following.

    (displayln (list 'tally-symbols/helper tally-so-far remaining))

Then call `tally-symbols` on the list `'(5 a b 1 c 2 3 b 4)` to see
if it matches your answer to part a.

<TODO: Fill in the results of your call.>
|#

; +-------------------------------+----------------------------------
; | Exercise 4: Selecting numbers |
; +-------------------------------+

#|
a. You may recall that in the distant past, we wrote a procedure,
`select-numbers`, that, given a list of values, returns a list with
just the numbers from the original list.

Here's an attempt to implement that procedure using helper recursion.

;;; (select-numbers values) -> listof number?
;;;   values : list?
;;; Selects all the numbers in values
(define select-numbers
  (lambda (values)
    (letrec ([helper 
              (lambda (nums-so-far remaining)
                ; (displayln (list 'helper nums-so-far remaining))
                (cond
                 [(null? remaining)
                  nums-so-far]
                 [(not (number? (car remaining)))
                  (helper nums-so-far 
                          (cdr remaining))]
                 [else
                  (helper (cons (car remaining) nums-so-far)
                          (cdr remaining))]))])
      (helper null values))))

Add the code and documentation to your definitions pane.
|#

#|
b. As you may have observed in a previous problem, it can be 
helpful to understand tail recursive procedures by creating
a table whose columns are labeled with the parameters and which
each row gives the values of those parameters in one call.

Here's what we might expect those columns to have after we've done the
first few steps of the helper on the list `'(a b 1 c 2 3 b 4)`

        num-so-far                      remaining
        ----------                      ---------
        '()                             '(a b 1 c 2 3 b 4)
        '()                             '(b 1 c 2 3 b 4)
        '()                             '(1 c 2 3 b 4)
        '(1)                            '(c 2 3 b 4)

<TODO: Fill in the remaining five or so rows.>
|#

#|
c. Given that experiment, what output do you expect to get from 
`(select-numbers '(a b 1 c 2 3 b 4))`?

<TODO: Enter your answer here.>
|#

#|
d. Check your answer experimentally.

<TODO: Enter the expression and response from the interactions pane.>
|#

#|
e. If you did not get the answer you expected, uncomment the line that
logs procedure calls and run it again.  Then enter an explanation.
Note: We'll fix the issue in the next exercise.

<TODO: Enter "I got the expected answer" or an explanation>
|#

#| A |#

; +------------------------------------------+-----------------------
; | Exercise 5: Selecting numbers, revisited |
; +------------------------------------------+

#|
As you may have noted, the prior implementation of `select-numbers`
produces the list of values in reverse order that they appear in the
original list.  Rewrite the procedure so that it produces the list of
values in the same order as they appear in the original list.  You
may not use `append` in that implementation.
|#

(define select-numbers/new
  (lambda (values)
    (letrec ([helper 
              (lambda (nums-so-far remaining)
                ; (displayln (list 'helper nums-so-far remaining))
                (cond
                 [(null? remaining)
                  nums-so-far]
                 [(not (number? (car remaining)))
                  (helper nums-so-far 
                          (cdr remaining))]
                 [else
                  (helper (cons (car remaining) nums-so-far)
                          (cdr remaining))]))])
      (helper null values))))

#| B |#

; +-----------------------------+------------------------------------
; | Exercise 6: Exploring costs |
; +-----------------------------+

#|
You may have noted that we have two versions of `longest-string`
above.  The first uses a recursive kernel.  The second, called
`longest-string/alt`, uses direct recursion.

Believe it or not, but the direct recursive version is incredibly
expensive.

Or at least we claim it is.  Let's check that claim.
|#

#|
a. Explain, in your own words, how `longest-string/alt` works.
|#

#|
b. What output do you expect from the following procedure call?
(Detail both the answer and the log messages from `displayln`.)

    > (longest-string/alt (list "abcdef" "ghij" "klm" "no" "p"))

Output: <TODO: Enter>

Log messages:
  <TODO: Enter>
|#

#|
c. Check your answer experimentally.

<TODO: Enter the expression and results from the interactions pane.>
|#

#|
d. What output do you expect from the following procedure call?
(Detail both the answer and the log messages from `displayln`.)

    > (longest-string/alt (list "p" "no" "klm" "ghij" "abcdef"))

Output: <TODO: Enter>

Log messages:
  <TODO: Enter>
|#

#|
e. Check your answer experimentally.

<TODO: Enter the expression and results from the interactions pane.>
|#

#|
f. Explain, in your own words, why one of the two results looks so
much worse.

<TODO: Enter your explanation.>
|#

#|
g. How many calls to `longest-string/alt` do you expect to see
if we ask for the values of 

   (longest-string/alt (list "1" "22" "333" "4444" "55555" "666666" "7777777" "88888888"))

<TODO: Enter your answer.>
|#

#|
h. Check your answer experimentally.

<TODO: Copy and paste from the interactions pane.>
|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Submit your work.  Then go on to the extra time activities.
|#

#| AB |#
; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might choose to take
on one or more of the following exercises.  (You need not do
them in the order presented.)
|#

; +----------------------------------+-------------------------------
; | Extra 1: Tallying multiple types |
; +----------------------------------+

#|
Write a procedure, `tally-numbers-strings-and-symbols`, that takes
as input a mixed list and produces a list of tallys of the number
of numbers, strings, and values.

    > (tally-numbers-strings-and-symbols null)
    '(0 0 0)
    > (tally-numbers-strings-and-symbols '(a 1 2 b "c" 3))
    '(3 2 1)
    > (tally-numbers-strings-and-symbols '(a b "c" "3" "e"))
    '(0 2 3)

You will find it useful to base `tally-numbers-strings-and-symbols` on
the helper-recursive `tally-symbols` your wrote earlier in this lab.

This time, you may to add more parameters to the recursive helper.
|#

(define tally-numbers-strings-and-symbols
  (lambda (lst)
    ???))

; +---------------------------------+--------------------------------
; | Extra 2: Checking preconditions |
; +---------------------------------+

#|
Rewrite the original `longest-string` so that the primary procedure
(that is, `longest-string`) checks all of its preconditions before
calling the helper.
|#

; +-------------------------------------+----------------------------
; | Extra 3: Improving direct recursion |
; +-------------------------------------+

#|
As you noted above, the direct-recursive version of `longest-string` (the 
one called `longest-string/alt`) ended up duplicating a lot of work.  Find
a way to rewrite the procedure so that it avoids the duplicate work.  Here
are two suggestions.

a. Use a `let` binding.

b. Use `longer-string`.
|#

; +-----------------------------------------------+------------------
; | Extra 4: Too many ways to find extreme values |
; +-----------------------------------------------+

#|
We ask you to find the longest string because finding "most extreme"
value in a list is a common task.  You've now approached the problem in
four ways:

* Using direct recursion.
* Using helper/tail recursion.
* Using direct recursion with a `let` binding.
* Using direct recursion with a helper procedure (`longer-string`) to 
  choose the more extreme of the values.
|#

#|
a. Which of the four ways do you prefer.  Why?

<TODO: Enter an answer.>
|#

#|
b. Which of these seems most like what you'd do with `reduce`?

<TODO: Enter an answer.>
|#

; +--------------------------------------------+---------------------
; | Extra 5: Converting to tail-recursive form |
; +--------------------------------------------+

#|
We will often decide to convert a direct recursive procedure to
a tail-recursive procedure.  Give a process for doing so (or
at least approximately doing so).

<TODO: Enter an answer.>
|#
