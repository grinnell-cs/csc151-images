;; CSC 151 (SEMESTER)
;; Lab: Numeric Recursion (numeric-recursion.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Numeric Recursion")

;; In this lab, you'll implement several recursive functions over the natural
;; numbers. For each function, make sure to follow our procedure for designing
;; recursive functions:
;;
;; 1. Give a recursive decomposition in terms of the definition of the natural
;;    numbers, i.e., what do we do when n is zero and non-zero?
;; 2. Translate your recursive decomposition into an implementation.
;; 3. Write a docstring and test suite for your function.

;; -----------------------------------------------------------------------------

(part "Problem 1: Replicate")

;; (Partner A drives!)

;; Implement a recursive function (replicate v n) that takes a value v and
;; natural number n as input and returns a list that contains n copies of v.
;;
;; (replicate "q" 5)
;; > (list "q" "q" "q" "q" "q")
;; (replicate "hello" 0)
;; > (list)
;;
;; Make sure to give a recursive decomposition, docstring, and test suite
;; for the function.
;;
;; (Note that replicate is really another name for make-list, so you can
;; use make-list to write easily write test cases for your function).
;;
;; To replicate a value v n times:
;; + If n is zero... <TODO: fill me in!>
;; + If n is non-zero... <TODO: fill me in!>

(define replicate
  ; TODO: fill me in!
  null)

;; -----------------------------------------------------------------------------

(part "Problem 2: Harmony")

;; (Partner B drives!)

;; Implement a recursive function (harmonic-sequence-sum n) that takes a
;; natural number n as input and returns the sum of the first n terms of the
;; harmonic sequence. The harmonic sequence is defined as follows:
;;
;; 0 + 1/1 + 1/2 + 1/3 + 1/4 + 1/5 + ...
;;
;; (harmonic-sequence-sum 5)
;; > 2.283333333333333
;; (harmonic-sequence-sum 100)
;; > 5.187377517639621
;; (harmonic-sequence-sum 0) 
;; > 0
;;
;; Make sure to give a recursive decomposition, docstring, and test suite
;; for the function.
;;
;; The sum of the first n terms of the harmonic-sequence is:
;; + If n is zero... <TODO: fill me in!>
;; + If n is non-zero... <TODO: fill me in!>

(define harmonic-sequence-sum
  ; TODO: fill me in!
  0)

;; -----------------------------------------------------------------------------

(part "Problem 3: Drop")

;; (Partner A drives!)

;; Implement a recursive function (my-drop n l) that takes a list l and natural
;; number n and returns l, but with the first n elements of l removed. If
;; n is greater than the length of l, then null is returned.
;;
;; (my-drop 3 (range 10))
;; > (list 3 4 5 6 7 8 9)
;; (my-drop 0 (range 10))
;; > (list 0 1 2 3 4 5 6 7 8 9)
;; (my-drop 5 null)
;; > null
;;
;; For my-drop, you will need to decompose both n and l. Consequently, write
;; your recursive decomposition in terms of the 4 cases we have based on the
;; recursive definitions for natural numbers and lists. To pattern match on
;; both n and l at the same time, you can use pair them up. The (pair n l)
;; function creates a pair of n and l that you can pattern match on with
;; cons as the pattern. It turns out that pair is just an alias for cons!
;;
;; (Note that my-drop is really the list-drop function provided in the
;; standard library. Feel free to use list-drop in your test cases!)
;;
;; To drop n elements from l:
;; <TODO: fill in your recursive decomposition here>

(define my-drop
  ; TODO: fill me in!
  null)

;; -----------------------------------------------------------------------------

(part "Problem 4: Take")

;; (Partner B drives!)

;; Implement a recursive function (my-take n l) that takes a list l and natural
;; number n and returns the first n elements of l as a list. If n is greater
;; than l, then l is returned.
;;
;; (my-take 3 (range 10))
;; > (list 0 1 2)
;; (my-take 0 (range 10))
;; > (list)
;; (my-take 5 null)
;; > null
;;
;; Like my-drop, my-take will need to decompose both n and l. Your recursive
;; decomposition should have 4 cases based on the recursive definitions for
;; natural numbers and lists.
;;
;; (Note that my-take is really the list-take function provided in the
;; standard library. Feel free to use list-take in your test cases!)
;;
;; To take n elements from l:
;; <TODO: fill in your recursive decomposition here>

(define take
  ; TODO: fill me in!
  null)

;; -----------------------------------------------------------------------------

(part "Problem 5: Counting down")

;; (Partner A drives!)

;; Complete the definition of `(count-down n)` below that takes a
;; non-negative integer, `n`, and returns a list that contains the
;; numbers starting with `n` going down to 0.  For example:
;;
;; > (count-down 1)
;; (list 1 0)
;; > (count-down 5)
;; (list 5 4 3 2 1 0)
;; > (count-down 0)
;; (list 0)

(define count-down
  ; TODO: fill me in!
  null)

;; -----------------------------------------------------------------------------

(part "Problem 6: Counting up")

;; (Partner B drives!)

;; Complete the definition of `(count-up n)` below that takes a
;; non-negative integer, `n`, and returns a list that contains the
;; numbers starting with `0` going up to `n`.  For example:
;;
;; > (count-up 1)
;; (list 0 1)
;; > (count-up 5)
;; (list 0 1 2 3 4 5)
;; > (count-up 0)
;; (list 0)

(define count-up
  ; TODO: fill me in!
  null)

;; -----------------------------------------------------------------------------

(part "Extra problem 1: Range")

;; (Either partner drives!)

;; count-up and count-down both approximate the behavior of the range function
;; found in the prelude. Recall that (range m n k) returns a list of the numbers
;; starting from m (inclusive) and ending in n (exclusive), stepping in
;; increments of k.

(test-case "range: simple case"
  equal? (list 3 4 5 6 7 8 9 10 11)
  (lambda ()
    (range 3 12)))

(test-case "range: with increment"
    equal? (list -5 -2 1 4 7)
  (lambda ()
    (range -5 10 3)))

(test-case "range: with decrement"
    equal? (list 10 7 4 1 -2 -5 -8)
  (lambda ()
    (range 10 -10 -3)))

;; Note how we can also go _down_ by specifying a negative step value. In this
;; situation, m must be bigger than n!
;;
;; Implement `(my-range m n k)` that emulates the behavior of the standard
;; range function from the standard library. Make sure to capture the behavior
;; of the function when it is given a negative step value.
;;
;; (Note: for a greater challenge, make your implementation work irrespective
;; of the step value and the ordering of the m and n values!)

(define my-range
  ; TODO: fill me in!
  null)
