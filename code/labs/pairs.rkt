#lang racket

(require csc151)
(require rackunit)

;; CSC-151-NN (SEMESTER)
;; Lab: Pairs (pairs.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (count-pairs struct) -> integer?
;;;   struct : pair-struct?
;;; Counts the number of pairs that appear in `struct`.
(define count-pairs
  (lambda (struct)
    (if (pair? struct)
        (+ 1
           (count-pairs (car struct))
           (count-pairs (cdr struct)))
        0)))

;;; (count-nulls struct) -> integer?
;;;   struct : pair-struct?
;;; Count the number of nulls that appear in `struct`.
(define count-nulls
  (lambda (struct)
    (cond
      [(null? struct)
       1]
      [(pair? struct)
       (+ (count-nulls (car struct))
          (count-nulls (cdr struct)))]
      [else
       0])))

;;; (struct->code struct) -> list?
;;;   struct : pair-structure?
;;; Converts a pair structure into an approximation of the Scheme
;;; expression that builds the pair structure.
(define struct->code
  (lambda (struct)
    (cond
      [(null? struct)
       'null]
      [(pair? struct)
       (list 'cons (struct->code (car struct)) (struct->code (cdr struct)))]
      [else
       struct])))

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. If you have not done so, please conduct the normal "start of class
algorithm".  Introduce yourself to your partner.  Discuss work habits,
strengths, and areas to improve. 

b. Review the documentation for the supplied procedures to
ensure you understand what they are suposed to do.  If you're
not sure, feel free to experiment or to ask the staff.

c. Make sure to save this code as `pairs.rkt`.
|#

; +--------------------------------------+---------------------------
; | Exercise 1: Box and pointer diagrams |
; +--------------------------------------+

#|
a. Draw box-and-pointer diagrams (on paper) for the following
expressions.  Each student should draw their own diagrams.

i. '(("x") "y" "z")
ii. '("x" ("y" "z"))
iii. '(("a") "b" ("c" ()))

b. Compare your answers to reach consensus.

c. Count the number of cons cells (pairs) in each.

d. Using `count-pairs`, determine how many cons cells (pairs) are
in each.  If the numbers differ, use `struct->code` to explore the
code used to build each.

There is nothing to submit for this problem, but make sure you 
understand the results.

Please ask the lab staff to review your results.
|#

#| A |#

; +-----------------------------+------------------------------------
; | Exercise 2: Are they pairs? |
; +-----------------------------+

#|
Enter each of the following expressions into Scheme. In a comment,
for each case, explain why Scheme does or does not use the dot
notation when displaying the value.

(cons 'a "Runner")
; <TODO: Enter a comment>

(cons 'a null)
; <TODO: Enter a comment>

(cons 'a "null")
; <TODO: Enter a comment>

(cons 'a "()")
; <TODO: Enter a comment>

(cons null 'a)
; <TODO: Enter a comment>

(cons 'a (cons 'b 'c))
; <TODO: Enter a comment>

(cons null null)
; <TODO: Enter a comment>

(cons null (cons null null))
; <TODO: Enter a comment>
|#

#| B |#

; +-----------------------------+------------------------------------
; | Exercise 3: Are they lists? |
; +-----------------------------+

#|
What do you think that `pair?` will return for each of the following?
How about `list?`. Attempt to confirm each answer experimentally and
explain any that you found particularly tricky.

i. (cons 'a 'b)
ii. (cons 'a (cons 'b 'c))
iii. (cons 'a null)
iv. null
v. (list 'a 'b 'c)
vi. (list 'a)
vii. (list)

There is nothing to submit for this problem, but make sure that you
can answer these questions.
|#

#| A |#

; +---------------------------+--------------------------------------
; | Exercise 4: Is it a list? |
; +---------------------------+

#|
You may recall that we told you that many kinds of data are defined
recursively. For example, a list is either (1) null or (2) cons of
anything and a list.

Using that recursive definition of lists, write a procedure,
`(listp? val)`, that determines whether or not `val` is a list.

*You may not use `list?` in your definition of `listp?`*.
|#

(define listp?
  (lambda (val)
    ???))

#| B |#

; +-------------------------------------------------------+----------
; | Exercise 5: Lists and list-like structures to Strings |
; +-------------------------------------------------------+

#|
a. Write a recursive procedure, `(spaces-and-ints ints)`, that takes
a potentially empty list of integers as a parameter and produces a
string that consists of each integer preceded by a space.

    > (spaces-and-ints '())
    ""
    > (spaces-and-ints '(4))
    " 4"
    > (spaces-and-ints '(3 4))
    " 3 4"
    > (spaces-and-ints '(2 3 4))
    " 2 3 4"

Recall that you can use `number->string` to convert a number to a string.
|#

(define spaces-and-ints
  (lambda (ints)
    ???))

#|
b. Write a procedure, `(int-list->string ints)` that takes as input a
list of integers and returns a string that represents the list.

    > (int-list->string null)
    "()"
    > (int-list->string '(1))
    "(1)"
    > (int-list->string '(1 2 3))
    "(1 2 3)"
    > (int-list->string (cons 1 2))
    BOOM!

Hint: You can treat the empty list as a special case and then take advantage
of `spaces-and-ints` for the nonempty list.  Please don't use `substring`;
you'll likely need to call `spaces-and-ints` on the cdr of `ints` in the
nonemtpy case.
|#

(define int-list->string
  (lambda (ints)
    ???))

#|
c. Write an extended version of `int-list->string`, called
`int-listish->string`, that behaves much the same except that it
prints a period and the cdr when the cdr is neither a pair nor null.

    > (int-listish->string null)
    "()"
    > (int-list->string '(1 2 3))
    "(1 2 3)"
    > (int-listish->string (cons 1 2))
    "(1 . 2)"
    > (int-listish->string (cons 1 (cons 2 3)))
    "(1 2 . 3)"
|#

(define int-listish->string
  (lambda (ints)
    ???))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yup, it's time to submit your work.  You should know the drill by now.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you were able to complete the primary exercises with time to spare,
you might want to consider the following problems, which you can
do in any order.
|#

; +-----------------------------------------------------------+------
; | Extra 1: Converting lists and list-like things to strings |
; +-----------------------------------------------------------+

#|
In an earlier problem, you wrote a procedure that converted
lists and almost-lists to strings.  But what happens if the
list contains other lists?

Extend your `listish->string` procedure to handle nested pair structure.

> (int-pairs->string null)
"()"
> (int-pairs->string (list (list 1)))
"((1))"
> (int-pairs->string (list 1 (list 2 3) 4))
"(1 (2 3) 4)"
> (int-pairs->string (list 1 (cons 2 3) 4))
"(1 (2 . 3) 4)"
|#

(define int-pairs->string
  (lambda (ints)
    ???))

; +-----------------------------+------------------------------------
; | Extra 2: Counting non-pairs |
; +-----------------------------+

#|
a. Write a procedure, `(count-non-pairs struct)`, that counts the
things that *are not* pairs in struct. 

> (count-non-pairs 1)
1
> (count-non-pairs (cons 1 2))
2
> (count-non-pairs null)
1 ; the null is not a pair
> (count-non-pairs (cons 1 null))
2 
> (count-non-pairs '(1))
2 ; the 1 and the null
> (count-non-pairs (cons (cons 1 2) (cons 3 (cons 4 5))))
5

Hint: You may want to look at `count-pairs` for ideas.
|#

(define count-non-pairs
  (lambda (struct)
    ???))

#|
b. What is the relationship between the value you get from `count-pairs`
and from `count-non-pairs` for the same structure?  Why?

<TODO: Enter your answer here.>
|#

; +-----------------------------+------------------------------------
; | Extra 3: Rewriting `listp?` |
; +-----------------------------+

#|
Write a new version of `listp?` without using `if` or `cond`.  

Hint: You will need to use `and` and `or`.
|#

(define listp-alt?
  (lambda (val)
    ???))


; +-----------------------------------+------------------------------
; | Extra 4: Finding the last element |
; +-----------------------------------+

#|
Write a procedure, `(last pairthing)` that finds the "last" value in
a list-like pairs structure. If the pair structure is actually a list,
return the last element of the list. Otherwise, follow the cdrs until
you find the last pair, and return the cdr of that pair.

In solving this problem you should only step through the structure once.
|#

(define last
  (lambda (pairthing)
    ???))

