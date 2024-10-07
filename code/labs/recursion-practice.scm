;; CSC 151 (SEMESTER)
;; Lab: Recursion Practice (recursion-practice.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)

(title "Recursion practice")

; In today's lab, you will practice applying the recursive
; decomposition techniques discussed in the reading towards writing
; recursive functions over lists. We have stated the mantra that
; "programming is not a spectator sport" at the beginning of the
; course, and that holds especially true for recursive programming.
; Thinking recursively and applying recursive design to problems
; does not come naturally and require dedicated practice. Don't be
; discouraged; put in the effort, and you will succeed!
;
; What follows is a number of recursive functions for you to
; implement with you partner. For each function, you should follow
; the steps outlined in the reading:
;
; 1. Give a recursive decomposition of the problem in terms of the
;    recursive definition of a list. This means you should describe
;    a solution to the problem in terms of the case when the list
;    is empty and when it is non-empty.
; 2. Translate that recursive decomposition directly into code,
;    ideally using the match construct to express the
;    decomposition precisely.
;
; For each function, you should also write an docstring and provide
; a brief, yet complete test suite using test-case demonstrating
; that your implementation works. Make sure to use the examples
; given in the problem description as a starting point!
;
; There are many more problems on this lab than what we expect you
; accomplish in class to give you ample opportunity to work through
; this process. For this lab, you are required to only do the first
; four of these problems. However, I highly, highly recommend you
; tackle as many of them as time allows so that you can get your
; practice in!

; ------------------------------------------------------------------------------

(problem "Problem 1: Product")

; (Partner A drives!)

; Write a function (product lst) that computes the product of
; all the elements contained in lst, assumed to all be numbers.
; If lst is empty, then (product lst) returns 1. For example:
;
; (product (list 3 5 4))
; > 60
; (product (list))
; > 1
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, the product is ...
; + When lst is non-empty (with a head and tail), the product is...

(define product
  (lambda (lst)
    ; TODO: implement me!
    0))

; ------------------------------------------------------------------------------

(problem "Problem 2: All")

; (Partner B drives!)

; Write a function (all lst) that returns #t if all of the elements
; of lst are #t and #f otherwise. It is assumed that lst only
; contains booleans. If the list is empty then the function returns
; #t. For example:
;
; (all (list #t #t #t))
; > #t
; (all (list #t #f #t))
; > #f
; (all (list))
; > #t
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, then all returns #t when...
; + When lst is non-empty (with a head and tail), then all returns
;   #t when...

(define all
  (lambda (lst)
    ; TODO: implement me!
    #f))

; ------------------------------------------------------------------------------

(problem "Problem 3: Contains")

; (Partner A drives!)

; Write a function (contains x lst) that returns #t if x is contained
; somewhere inside of list lst. You should use equals? to determine
; whether x is one of the elements of lst. For example:
;
; (contains 1 (list 3 1 8))
; > #t
; (contains 4 (list 1 1))
; > #f
; (contains 12 (list))
; > #f
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, ...
; + When lst is non-empty, ...

(define contains
  (lambda (x lst)
    ; TODO: implement me!
    #f))

; ------------------------------------------------------------------------------

(problem "Problem 4: Dup")

; (Partner B drives!)

; Write a function (dup lst) that returns lst but with every
; element of lst repeated or duplicated. For example:
;
; (dup (list 1 2 3))
; > (list 1 1 2 2 3 3)
; (dup (list))
; > (list)
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, ...
; + When lst is non-empty, ...

(define dup
  (lambda (lst)
    ; TODO: implement me!
    #f))

; ------------------------------------------------------------------------------

(problem "Problem 5: Uppercase")

; (Partner A drives!)

; This is a two-parter! First, write a function (list-uppercase lst)
; that takes a list of characters, lst, as input and returns lst but
; with all characters uppercased. Non-alphabetic characters are left
; unmodified. For example:
;
; (list-uppercase (list #\h #\i #\!))
; > (list #\H #\I #\!)
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, ...
; + When lst is non-empty, ...

(define list-uppercase
  (lambda (lst)
    ; TODO: implement me!
    null))

; Next, using list-uppercase and string-list conversion functions,
; write a function (uppercase str) that returns the uppercase
; version of string str.

(define uppercase
  (lambda (str)
    ; TODO: implement me!
    str))

; ------------------------------------------------------------------------------

(problem "Problem 6: Descending")

; (Partner B drives!)

; This is a two-parter, too! First, write a function (list-descending? lst)
; that takes a list of characters, lst, as input and returns #t if the
; characters are in descending order according to char-ci>=?.  The empty
; list is considered to be in descending order.
; For example:
;
; (list-descending (list #\z #\q #\a))
; > #t
; (list-descending (list #\h #\i #\!))
; > #f
; (list-descending (list))
; > #t
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, ...
; + When lst is non-empty, ...

(define list-descending?
  (lambda (lst)
    ; TODO: implement me!
    null))

; Next, using list-descending? and string-list conversion functions,
; write a function (descending? str) that returns #t if and only if
; the characters of string str are in descending order according to
; char-ci>=?.

(define descending?
  (lambda (str)
    ; TODO: implement me!
    str))

; ------------------------------------------------------------------------------

(problem "Problem 7: Snoc")

; (Partner A drives!)

; Write a function `(snoc v l)` that returns list l but with value
; v added to the end of the list. For example:
;
; (snoc 22 (list 1 2 3))
; > (list 1 2 3 22)
; (snoc 0 (list))
; > (list 0)
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, ...
; + When lst is non-empty, ...

(define snoc
  (lambda (v l)
    ; TODO: implement me!
    null))

; ------------------------------------------------------------------------------

(problem "Problem 8: Reverse")

; (Partner B drives!)

; Using snoc from the previous problem, write a function
; `(rev l)` that returns list l but with the order of its
; elements reversed. For example:
;
; (rev (list 1 2 3 4 5))
; > (rev (5 4 3 2 1))
; 
; (NOTE: reverse is already in the standard library; don't use it for this
;        problem but it may be useful in writing test cases!)
;
; <TODO: complete the recursive decomposition sketched below.>
; + When lst is empty, ...
; + When lst is non-empty, ...

(define rev
  (lambda (l)
    ; TODO: implement me!
    null))