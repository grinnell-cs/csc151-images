#lang racket

(require csc151)
(require rackunit)

;; CSC 151-NN (SEMESTER)
;; Lab: Recursion basics (recursion-basics.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, we'll gain some intuition about the *mechanics* of
recursion by practicing reading and interpreting recursive code using
our mental model of computation.
|#

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. If you have not done so already, be sure to discuss work habits
and such with your partner.  Perhaps mention things that have worked
less well, so that you can avoid them.

b. Make sure to save this as `recursion-basics.rkt`.
|#

#| AB |#

; +------------------------------+-----------------------------------
; | Exercise 1: Into the unknown |
; +------------------------------+

#|
In this exercise, each partner will receive a function to analyze.
If you are working together in person, each will go through and
speak aloud about what they are doing.  If you are working online,
please work with your function on your own and then get together
to discuss the functions and what you discovered about them.

a. Note the pre-conditions on the function you were assigned (in
   this case, those are the types of the parameters. With those in
   mind, first explore executions of your function by trying out
   2--3 examples of your function in the interpreter.

b. Next, confirm your intuition by using your mental model of
   computation to give a step-by-step trace/evaluation of the 
   an expression supplied to you.

c. Finally, develop an explanation of what your chosen function does.
   Note that your functions (and many recursive functions over lists)
   have a specific form:

    (if (null? l)
        ; case where l is null
        ; case where l is non-null
        )

   In other words, the behavior of the function can be broken up into
   two independent sub-problems:

   + How do I solve the problem when the list is empty (`null`)?
     We call this the *base case* of the function.
   + How do I solve the problem when the list is non-`null`?
     We call this the *recursive case* of the function.

   Explain your function's behavior below by writing what your
   function does in the base and recursive cases.
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 1a: Into the unknown |
; +-------------------------------+

#|
Consider the following two recursive function definition below.
|#

;;; (func-1a x l) -> ??
;;;   x : any/c
;;;   l : list?
;;; ??
(define func-1a
  (lambda (x l)
    (if (null? l)
        (list x)
        (cons (car l) (func-1a x (cdr l))))))

#|
Analyze your function by doing the following:
|#

#|
a. Examples

<TODO: Try the procedure on multiple inputs and enter your examples from 
the interactions pane here.>
|#

#|
b. Trace

    ; for func-1a
    (func-1a 9 '(1 8 2))
--> (if (null? '(1 8 2)) (list 9) (cons (car '(1 8 2)) (func-1a 9 (cdr '(1 8 2)))))
--> (if #f (list 9) (cons (car '(1 8 2)) (func-1a 9 (cdr '(1 8 2)))))
--> (cons (car '(1 8 2)) (func-1a 9 (cdr '(1 8 2))))
--> 

<TODO: Finish the derivation above. Remember to work left to right.>
|#

#|
c. Explanation

Base case: <TODO: write your explanation here>

Recursive case: <TODO: write your explanation here>

|#


#| B |#

; +-------------------------------+----------------------------------
; | Exercise 1b: Into the unknown |
; +-------------------------------+

#|
Consider the following recursive function definition below.
|#

;;; (func-1b l1 l2) -> ??
;;;   l1 : list?
;;;   l2 : list?
;;; ??
(define func-1b
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (func-1b (cdr l1) l2)))))

#|
a. Examples

<TODO: Try some examples. Enter your examples from the interactions pane here.>
|#

#|
b. Trace

    ; for func-1b
    (func-1b '(8 4 2) '(1 8 9 6 3))
---> 

<TODO: finish the trace here>
|#

#|
c. Explanation

Base case: <TODO: write your explanation here>

Recursive case: <TODO: write your explanation here>
|#

#| AB |#

#| This part is for online partners only. |#

#|
d. Once you and your partner are done with their analysis, take turns
   presenting your work and explanations to each other. Make sure to
   present your examples, step-by-step derivation, and explanation.
   Ask questions of the presenter if you are unsure about how the
   function behaves or why it behaves in the way described.
|#

; +---------------------------+--------------------------------------
; | Exercise 2: Deeper waters |
; +---------------------------+

#|
In this exercise, we'll perform the same activity as the previous 
exercise, but with a more complicated set of recursive functions.

Plan to perform the same steps as the previous problem to analyze your
function's behavior.  Record them as separate sections, as in the
a, b, and c from the prior problem.
|#

#| A |#

; +----------------------------+-------------------------------------
; | Exercise 2a: Deeper Waters |
; +----------------------------+

;;; (func-2a x l) -> ???
;;;   x : any?
;;;   l : list?
;;; ??
(define func-2a
  (lambda (x l)
    (if (null? l)
        null
        (if (equal? (car l) x)
            (func-2a x (cdr l))
            (cons (car l) (func-2a x (cdr l)))))))

#|
a. Examples

|#

#|
b. Trace

When working through the step-by-step evaluation of your function,
use the following expression.  It's fine if you do a more casual trace.

    (func-2a 7 '(2 1 7 2 7))
    ; l is not null. (car l) is 2. 2 is not equal to 7.
--> (cons 2 (func2a 7 '(1 7 2 7)))
    ;
--> 
|#

#|
c. Explanation

|#

#| B |#

; +----------------------------+-------------------------------------
; | Exercise 2b: Deeper waters |
; +----------------------------+


;;; (func-2b l1 l2) -> ???
;;;   l1 : list?
;;;   l2 : list?
;;; ??
(define func-2b
  (lambda (l1 l2)
    (if (null? l2)
        l1
        (func-2b (cons (car l2) l1) (cdr l2)))))

#|
a. Examples

|#

#|
b. Trace

When working through the step-by-step evaluation of your function,
use the following expression.  It's fine if you do a more casual
trace

    (func-2b '(1) '(2 8 3 9))
    ; l2 is not null
--> (func-2 (cons 2 '(1)) '(8 3 9))
    ; Evaluate the cons
--> (func-2 '(2 1) '(8 3 9))
    ;
--> 
|#

#|
c. Explanation

|#

#|
d. What does the following function do?

<ENTER YOUR ANSWER HERE>
|#

(define r
  (lambda (lst)
    (func-2b '() lst)))

#| AB |#

#|
If you are working online, take turns presenting your derivation and
explanation of your function's behavior to your partner. Ask questions
of the presenter if you are unsure  about how the function behaves or
why it behaves in the way described.
|#

#| AB |#

; +----------------------------------------+-------------------------
; | Exercise 3: Go tell it on the mountain |
; +----------------------------------------+

#|
As described in the reading, recursion looks like it shouldn't work
because the definition of a recursive function is circular. Based on
your experiences so far, why does recursion seems to work despite this
initial perception of circularity? In particular, try to identify what
is *necessary* for the program to do to ensure the "circular"
definition doesn't lead to the problems you explored in the second
self-check.

Discuss this prompt with your partner and write up your response in a
few sentences in the space below:

<TODO: write your explanation here>
|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yes, that's right.  Although you haven't written much code, you've done
enough to learn a bit about recursion.  It's time to submit.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might attempt one or more
of the following procedures.
|#

; +--------------------------------+---------------------------------
; | Extra 1: Recursive reflections |
; +--------------------------------+

#|
a. Make a list of all the list procedures you've encountered.

b. Pick one of them.  Consider whether it can be done using the
normal model and, if so, what you do in the empty list case and
what you do after the recursive call.  (Don't actually implement
it; just think about the parts.)  For example:

Procedure: (append l1 l2)
Base case (l1 is empty); return l2
After recursive call: Cons the car of l1 onto the recursive result

Procedure: (length lst)
Base case (lst is empty): return 0
After recursive call: Add 1 to the recursive result

Procedure: 
Base case (___ is empty): return ___
After recursive call: ___ to the recursive result

c. Repeat step b as many as times as you wish.
|#

; +-----------------------------------------------------+------------
; | Extra 2: Finding the alphabetically first character |
; +-----------------------------------------------------+

#|
In class, we developed the following procedures to find the alphabetically
first character in a list of characters.
|#

(define first-of-two
  (lambda (ch ar)
    (if (char<=? ch ar)
        ch
        ar)))

(define alphabetically-first
  (lambda (chars)
    ; If there's only one character
    (if (null? (cdr chars))
        ; It's that one character
        (car chars)
        ; Otherwise, delegate and then compare results
        (first-of-two (car chars) (alphabetically-first (cdr chars))))))

#|
a. Why do we need `first-of-two`?

<ENTER YOUR ANSWER HERE>

b. What purpose does `(null? (cdr chars))` serve?

<ENTER YOUR ANSWER HERE>

c. What happens if we call `alphabetically-first` with the empty list?

<ENTER YOUR ANSWER HERE>
|#

