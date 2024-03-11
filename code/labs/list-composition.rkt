#lang racket

;; CSC-151-NN (SEMESTER)
;; Lab: List composition and decomposition
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-----------------------+------------------------------------------
; | Requirements and such |
; +-----------------------+

(require rackunit)
(require csc151)

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|

There are 6 exercises; here's the division.

Exercise 1: A-Side
Exercise 2: B-Side
Exercise 3: A-Side
Exercise 4: B-Side
Exericse 5: B-Side
Exercise 6: A-Side

The partner closest to the boad is the A partner. The partner
further from the board is the B partner.

The person with the problem description should drive and their
partner should navigate.  Again, make sure to be good partners and
focus completely on solving the current problem together rather
than working ahead on your own.

a. Don't forget our "start of session" steps.  Introduce yourself
to your partner. Chat with your partner about working habits and
strengths.  Perhaps share something interesting about yourself.

b. Update the csc151 library.

c. If you haven't done so yet, make sure to open tabs in your browser
for the lab and the recent readings.

d. Don't forget to save this file as `list-composition.rkt`!
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 1: Some simple lists |
; +-------------------------------+

#| 
a. Using the `cons` procedure, build a one-element list that contains the 
value "red". The result of your call should be '("red").
|#

(define ex1a ???)

#|
(test-equal? "ex1a" ex1a '("red"))
|#

#|
b. Use the `cons` procedure to build a list of the value 5 followed
by the value "red". The result of your call should be '(5 "red").
Note that you will need to call `cons` twice to build this list.
|#

(define ex1b ???)

#|
(test-equal? "ex1b" ex1b '(5 "red"))
|#

#|
c. Call the `cons` procedure to build a list of the value 2, followed
by the value 5, followed by "red". The result of your call should
be '(2 5 "red"). Note that you will need to call `cons` three times
to build this list.
|#

(define ex1c ???)

#|
(test-equal? "ex1c" ex1c '(2 5 "red"))
|#

#|
d. Build the same list as in step c, using `list` rather than `cons`.
|#

(define ex1d ???)

#|
(test-equal? "ex1d" ex1d '(2 5 "red"))
|#

#| B |#

; +-----------------------------------------------+------------------
; | Exercise 2: Extracting information from lists |
; +-----------------------------------------------+

#|
Consider the following list definition. 
|#

(define letters (list 'a 'b 'c 'd 'e 'f 'g 'h 'i))

#|
a. What do you expect the result of `(car letters)` to be? Check your
answer experimentally.

> (car letters)
???

b. What do you expect the result of `(cdr letters)` to be? Check your
answer experimentally.

> (cdr letters)
???

c. What do you expect the result of `(car (cdr letters))` to be? Check
your answer experimentally.

> (car (cdr letters))
???

d. What do you expect the result of `(cdr (cdr letters))` to be?
Check your answer experimentally.

> (cdr (cdr letters))
???

e. What do you expect the result of `(cdr (car letters))` to be? Check
your answer experimentally.

> (cdr (car letters))
???

f. Write an expression using `car` and `cdr` that extracts element 5
of letters. (That is, your expression should extract the f.) You may
not use `list-ref`.
|#

(define ex2f ???)

#|
(test-equal? "ex2f" ex2f 'f)
|#

#| A |#

; +---------------------------------+--------------------------------
; | Exercise 3: It's so cons-fusing |
; +---------------------------------+

#|
As you may recall, the `cons` procedure takes two parameters, a value
and a list. It builds a new list by prepending the value to another
list. However, it is also possible to apply `cons` to two non-list
values. (You should not regularly do so at this point in your career,
but some accidentally apply `cons` in this different way, so we want
you to see what happens.)

Consider the following:
|#

(define one-two-a (cons 1 2))
(define one-two-b (list 1 2))
(define one-two-c (cons 1 (cons 2 null)))

#|
a. Look at the values of `one-two-a`, `one-two-b`, and `one-two-c`. How
are they the same and how are they different?

ENTER YOUR ANSWER
|#

#|
b. What do you expect to have happen when you apply list? predicate to each 
value? 

> (list? one-two-a)
???

> (list? one-two-b)
???

> (list? one-two-c)
???

Check your answers experimentally.
|#

#|
c. What do you expect to have happen when you call `reverse` on
each? 

> (reverse one-two-a)
???

> (reverse one-two-b)
???

> (reverse one-two-c)
???

Check your answers experimentally.
|#

#|
d. What do you expect to have happen if you try to get the `car` and
the `cdr` of each of these values? 

> (car one-two-a)
???

> (cdr one-two-a)
???

> (car one-two-b)
???

> (cdr one-two-b)
???

> (car one-two-c)
???

> (cdr one-two-c)
???

Check your answers experimentally.
|#

#|
e. What do you expect to have happen if you append the list '(3 4)
to each of these values? 

> (append one-two-a (list 3 4))
???

> (append one-two-b (list 3 4))
???

> (append one-two-c (list 3 4))
???

Check your answers experimentally.
|#


#|
f. What do you expect to have happen if you append each of these
values to the list '(0 0), as in the following example? 

> (append (list 0 0) one-two-a)
???

> (append (list 0 0) one-two-b)
???

> (append (list 0 0) one-two-c)
???

Check your answers experimentally.
|#

#|
If you are confused by any of the results, please look at the notes
on this problem (on the lab web page).
|#

#| B |#

; +--------------------------+---------------------------------------
; | Exercise 4: Nested lists |
; +--------------------------+

#|
Consider the following lists.
|#

(define ex6 (list "a" (list "b" "c") "d" (list "e" (list "f" "g"))))

#|
a. What value do you expect to see for `ex6`?

> ex6
???

Check your answer experimentally.
|#

#|
b. What is the length of `ex6`?

???

Check your answer experimentally.
|#

#|
c. What do you expect to get if you reverse `ex6`?

> (reverse ex6)
???

Check your answer experimentally.
|#

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 5: Extracting list elements |
; +--------------------------------------+

#|
We currently use the `list-ref` procedure to extract elements. But
what if we didn't have that procedure? We might have to write our own
procedures to extract elements. We'll write a few such procedures in
this exercise.
|#

#|
a. Here's a sample procedure that purports to find the third element
of a list (the element at index 2).
|#

(define element-two
  (lambda (lst)
    (car (cdr (cdr lst)))))

#|
As you might expect, this procedure generally works fine.

> (element-two (list 'a 'b 'c 'd 'e))
'c
> (element-two (list 'd 'e 'f))
'f

Unfortunately, if the list has fewer than three elements, `element-two`
crashes.

    > (element-two (list 'a 'b))
    . . car: contract violation
      expected: pair?
      given: '()
    > (element-two (list 'eh))
    . . cdr: contract violation
      expected: pair?
      given: '()
    > (element-two null)
    . . cdr: contract violation
      expected: pair?
      given: '()

Write a procedure, `element-2`, that returns the element at index
2 of a list with at least three elements and returns false `#f` if
the list has fewer than three elements. You may not use `length`
or `list-ref` in writing `element-2`.
|#

;;; (element-2 lst) -> any?
;;;   lst : list?
;;; Returns the element at index 2 of `lst`, using zero-based indexing.
;;; Returns false (#f) if there is no such element.
(define element-2
  ???)

#|
(test-equal? "three elements"
             (element-2 (list "one" "two" "three"))
             "three")
(test-equal? "many elements"
             (element-2 (list "just" "how" "many" "elemens" "is" "'many'"))
             "many")
(test-false "two elements"
            (element-2 (list "just" "two")))
(test-false "one element"
            (element-2 (list "alone")))
(test-false "empty-list"
            (element-2 null))
|#

#|
b. Write a procedure, `(element-4 lst)`, that grabs the element at index
4 from a list of at least five elements and returns false otherwise.
You may not use `length` or `list-ref` in writing `element-4`.
|#

;;; (element-4 lst) -> any?
;;;   lst : list?
;;; Returns the element at index 4 of `lst`, using zero-based indexing.
;;; Returns false (#f) if there is no such element.
(define element-4
  ???)

#|
c. Write at least four tests for `element-4`.
|#

#| A |#

; +-------------------------+----------------------------------------
; | Exercise 6: Short lists |
; +-------------------------+

#|
You will often find that you have to check whether a list has a certain
number of elements, or at least a certain number of elements. Let's write
a few predicates to help check that.

a. Write a predicate `(singleton? lst)`, that determines whether `lst`
contains just one element. You may not use `length` in writing `singleton`.
|#

;;; (singleton? lst) -> boolean?
;;;   lst : list?
;;; Determine if `lst` has only one element.
(define singleton?
  ???)

#|
(test-false "a zero-element list"
            (singleton? (list)))
(test-true "a one-element list"
           (singleton? (list "one")))
(test-false "a two-element list"
            (singleton? (list "one" "two")))
(test-false "a three-element list"
            (singleton? (list "uno" "dos" "tres")))
|#

#|
b. Write a predicate `(at-least-two? lst)`, that determines whether `lst`
contains at least two elements. You may not use `length` in writing 
`at-least-two?`.
|#

;;; (at-least-two? lst) -> boolean?
;;;   lst : list?
;;; Determine if `lst` has at least two elements.
(define at-least-two?
  ???)

#|
(test-false "a zero-element list"
            (at-least-two? (list)))
(test-false "a one-element list"
            (at-least-two? (list "one")))
(test-true "a two-element list"
           (at-least-two? (list "one" "two")))
(test-true "a three-element list"
           (at-least-two? (list "uno" "dos" "tres")))
|#

#|
c. Write a predicate `(dyad? lst)`, that determines whether `lst` contains 
exactly two elements. You may not use `length` in writing `dyad`.
|#

;;; (dyad? lst) -> boolean?
;;;   lst : list?
;;; Determine if `lst` has exactly two elements.
(define dyad?
  ???)

#|
(test-false "a zero-element list"
            (dyad? (list)))
(test-false "a one-element list"
            (dyad? (list "one")))
(test-true "a two-element list"
           (dyad? (list "one" "two")))
(test-false "a three-element list"
            (dyad? (list "uno" "dos" "tres")))
|#

#|
d. Write a predicate `(at-least-three? lst)`, that determines whether 
`lst` contains at least three elements. You may not use `length` in 
writing `at-least-three?`.
|#

;;; (at-least-three? lst) -> boolean?
;;;   lst : list?
;;; Determine if `lst` has at least three elements.
(define at-least-three?
  ???)

#|
(test-false "a zero-element list"
            (at-least-three? (list)))
(test-false "a one-element list"
            (at-least-three? (list "one")))
(test-false "a two-element list"
            (at-least-three? (list "one" "two")))
(test-true "a three-element list"
           (at-least-three? (list "uno" "dos" "tres")))
(test-true "a four-element list"
           (at-least-three? (list "uno" "dos" "tres" "quatro")))
|#

#|
e. Write a predicate `(short? lst)`, that determines whether `lst` 
contains fewer than three elements. You may not use `length` in 
writing `short?`.
|#

;;; (short? lst) -> boolean?
;;;   lst : list?
;;; Determine if `lst` is short (has fewer than three elements).
(define short?
  ???)

#|
(test-true "a zero-element list"
           (short? (list)))
(test-true "a one-element list"
            (short? (list "one")))
(test-true "a two-element list"
           (short? (list "one" "two")))
(test-false "a three-element list"
            (short? (list "uno" "dos" "tres")))
(test-false "a four-element list"
            (short? (list "uno" "dos" "tres" "quatro")))
|#

#| AB |#

; +----------------------+-------------------------------------------
; | Submitting your work |
; +----------------------+

#|
Congratulations on finishing this lab!  To turn in your work:

a.  Ensure that your file runs properly.
b.  Make sure you save as `list-composition.rkt` using 
    File -> Save Other -> Save Definitions As Text...
c.  Send this completed file to your partner for their records.
d.  Submit this final file to Gradescope.  Make sure, if appropriate,
    to submit your work as a group submission and include your
    partner in the submission.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you may wish to attempt the
following exercise.
|#

; +-------------------+----------------------------------------------
; | Extra 1: Sublists |
; +-------------------+

#|
Write a procedure, `(sublist lst n m)`, that extracts the elements from
indices `n` (inclusive) to `m` (exclusive) of `lst`.

You will likely find `take` and `drop` useful.
|#

;;; (sublist lst n m) -> list?
;;;   lst : list?
;;;   n : (all-of nonnegative-exact-integer? (less-equal (length lst)))
;;;   m : (all-of nonnegative-exact-integer? (less-equal (length lst)) (greater-equal n))
;;; Extract the elements of `lst` from indices `n` (inclusive) to `m`
;;; (exclusive)
(define sublist
  ???)

#|
(test-equal? "(sublist 0 1)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 0 1)
             (list "a"))
(test-equal? "(sublist 0 2)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 0 2)
             (list "a" "b"))
(test-equal? "(sublist 3 4)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 3 4)
             (list "d"))
(test-equal? "(sublist 2 5)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 2 5)
             (list "c" "d" "e"))
(test-equal? "(sublist 6 7)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 6 7)
             (list "g"))
(test-equal? "(sublist 7 7)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 7 7)
             (list))
(test-equal? "(sublist 0 7)"
             (sublist (list "a" "b" "c" "d" "e" "f" "g") 0 7)
             (list "a" "b" "c" "d" "e" "f" "g"))
|#
