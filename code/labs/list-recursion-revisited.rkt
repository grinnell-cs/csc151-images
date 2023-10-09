#lang racket

(require csc151)
(require rackunit)

;; CSC 151 (SEMESTER)
;; Lab: List recursion, revisited (list-recursion-revisited.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In a prior lab, you practiced reading recursive procedures and
constructing recursive procedures.  Today, you will revisit
some of the basic forms of writing recursive procedures.
|#

; +---------------+--------------------------------------------------
; | Supplied code |
; +---------------+

;;; (singleton? lst) -> boolean?
;;;   lst : list?
;;; Determines if `lst` contains a single value.
(define singleton?
  (lambda (lst)
    (and (not (null? lst))
         (null? (cdr lst)))))

;;; (doubleton? lst) -> boolean?
;;;   lst : list?
;;; Determines if `lst` contains exactly two values.
(define doubleton?
  (lambda (lst)
    (and (not (null? lst))
         (not (null? (cdr lst)))
         (null? (cddr lst)))))

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
a. Introduce yourself to your partner, discuss strengths and weaknesses,
decide upon work procedures, etc.

b. Save this file as `list-recursion-revisited.rkt`.  And don't
forget that when we write recursive procedures, we may accidentally
write procedures that recurse forever.  Save early and often!

c. Review the provided code above.

c. Remind yourselves of the basic steps in designing a recursive 
drocedure.  Once you've done so, we'd prefer that you try to figure
these out using the normal recursive steps, rather than looking
to other labs and readings for how to do them.
|#

#| A |#

; +----------------------------------------+-------------------------
; | Exercise 1: The last element in a list |
; +----------------------------------------+

#|
Write a recursive procedure, `(last lst)`, that finds the last
element in a non-empty list.  You may not use `length` or `list-ref`.
|#

;;; (last lst) -> value?
;;;   lst : list?
;;; Finds the last element in the list.
(define last
  (lambda (lst)
    ???))

#|
(test-equal? "last: Singleton list"
             (last (list "a"))
             "a")
(test-equal? "last: Long list"
             (last (range 50))
             49)
|#

#| B |#

; +-----------------------------------+------------------------------
; | Exercise 2: Selecting odd numbers |
; +-----------------------------------+

#|
Write a recursive procedure, `(select-odd numbers)`, that takes a
list of numbers as a parameter and returns all of the odd numbers
in the list.  You may not use `filter`.  (In effect, we're learning
how to write procedures like filter.)
|#

;;; (select-odd numbers) -> list-of integer?
;;;   numbers : list-of number?
;;; Select all the odd numbers in numbers.  Discard anything
;;; that's not an integer.
(define select-odd
  (lambda (numbers)
    ???))

#|
(test-equal? "select-odd: empty list"
             (select-odd (list))
             (list))
(test-equal? "select-odd: odds at beginning, middle, and end"
             (select-odd (list 1 2 3 4 5))
             (list 1 3 5))
(test-equal? "select-odd: no odd numbers"
             (select-odd (list 2 4 2 0 2))
             (list))
(test-equal? "select-odd: evens at beginning, middle, and end"
             (select-odd (list 2 3 4 5 6))
             (list 3 5))
(test-equal? "select-odd: inexact integers"
             (select-odd (list 1 1.0 2.0 3 3.0 4 5.0 6.0 7))
             (list 1 1.0 3 3.0 5.0 7))
(test-equal? "select-odd: non-integers"
             (select-odd (list 11/2 3.0 4.5 2+3i -4 -5))
             (list 3.0 -5))
|#

#| A |#

; +---------------------------+--------------------------------------
; | Exercise 3: Joining lists |
; +---------------------------+

#|
Write a recursive procedure, `(join lst1 lst2)`, that acts like
`append`.  That is, it creates a new list that consists of the
elements of `lst1` (in the same order) followed by the elements
of `lst2` (in the same order).  You may not use `append`.

Note that you will want to recurse over `lst1` and you may want
to use some of the ideas from `select-odd` (in terms of how
you build a new list).
|#

;;; (join lst1 lst2) -> list?
;;;   lst1 : list?
;;;   lst2 : list?
;;; Combine lst1 and lst2 into a new list that contains the elements
;;; of lst1 (in the same order) followed by the elements of lst2 (in
;;; the same order).
(define join
  (lambda (lst1 lst2)
    ???))

#|
(test-equal? "join: two small lists"
             (join (list 1 2 3) (list "a" "b" "c"))
             (list 1 2 3 "a" "b" "c"))
(test-equal? "join: first list is empty"
             (join (list) (list "a" "b" "c"))
             (list "a" "b" "c"))
(test-equal? "join: second list is empty"
             (join (list 1 2 3) (list))
             (list 1 2 3))
(test-equal? "join: two empty lists"
             (join (list) (list))
             (list))
|#

#| B |#

; +-------------------------------+----------------------------------
; | Exercise 4: Doubling elements |
; +-------------------------------+

#|
Write a recursive procedure, `(double-all numbers)`, that takes
a list of numbers as input and returns a list containing twice
each number in the original list.  You may not use `map`.  (In
effect, you are figuring out how `map` is implemented.)
|#

;;; (double-all numbers) -> list-of number?
;;;   numbers : list-of number?
;;; Create a new list, each of whose values is twice the corresponding
;;; value in the original list.
(define double-all
  (lambda (lst)
    ???))

#|
(test-equal? "double-all: empty list"
             (double-all (list))
             (list))
(test-equal? "double-all: singleton list"
             (double-all (list 1))
             (list 2))
(test-equal? "double-all: longer ist"
             (double-all 4/3 1/2 5 -2 0)
             (list 8/3 1 10 -4 0))
|#

#| A |#

; +--------------------------------------+---------------------------
; | Exercise 5: Counting with predicates |
; +--------------------------------------+

#|
Write a recursive procedure, `(tally-odd int)` that, given a list 
of integers, counts how many are odd.

You should not call `list-length`, `length`, `filter`, `tally`, 
`select-odds`, or anything similar.  Instead, consider how the 
patterns of recursion help you write this procedure.  For example,
how many odd numbers are in the empty list?

Note: In writing this procedure, you are considering the pattern we
use when counting any kind of value.
|#

;;; (tally-odd ints) -> integer?
;;;   ints : list-of integer?
;;; Counts how many odd integers are in `ints`.
(define tally-odd
  (lambda (numbers)
    ???))

#|
(test-equal? "tally-odd: empty list"
             (tally-odd (list))
             0)
(test-equal? "tally-odd: singleton list, odd value"
             (tally-odd (list 5))
             1)
(test-equal? "tally-odd: singleton list, even value"
             (tally-odd (list 18))
             0)
(test-equal? "tally-odd: multiple elements, odd at front"
             (tally-odd (list 7 2 -4 18))
             1)
(test-equal? "tally-odd: multiple elements, odd at back"
             (tally-odd (list 2 -4 18 -5))
             1)
(test-equal? "tally-odd: multiple elements, odd at front, back, and middl"
             (tally-odd (list 81 2 3 -4 18 -5))
             3)
|#

#| B |#

; +------------------------------+-----------------------------------
; | Exercise 6: The longest word |
; +------------------------------+

#|
Implement a procedure, `(longest-word words)`, that takes a nonempty list
of strings as input and finds the longest string in the list.  If there
are multiple strings that have the same length and are longer than any
other strings in the list, you can return any of them.

You may not use `sort` or `reduce` to solve this problem.  (You've
guessed it; this procedure helps you understand how one of the
forms of `reduce` might be implemented.)
|#

;;; (longest-word words) -> string?
;;;   words : list-of string? (nonempty)
(define longest-word
  (lambda (words)
    ???))

#|
(test-equal? "longest-word: singleton list"
             (longest-word (list "hello"))
             "hello")
(test-equal? "longest-word: empty string in singleton list"
             (longest-word (list ""))
             "")
(test-equal? "longest-word: longest word at front"
             (longest-word (list "alphabetical" "alpha" "beta" "phab"))
             "alphabetical")
(test-equal? "longest-word: longest word at end"
             (longest-word (list "a" "aaaa" "aaa" "aa" "aaaaa"))
             "aaaaa")
(test-equal? "longest-word: longest word in middle"
             (longest-word (list "a" "b" "aaaa" "bbbb" "cccccc" 
                                 "aaa" "aa" "aaaaa"))
             "cccccc")
|#

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
