#lang racket

(require csc151)
(require rackunit)

;; CSC-151-NN  (SEMESTER)
;; Lab: Sorting (sorting.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-------------------------+----------------------------------------
; | Provided code: Analysis |
; +-------------------------+

(struct counter-kernel (name counts)
  #:reflection-name 'counter)

;;; (counter name) -> counter?
;;;   name : string
;;; Create a new counter that can be used for the other counter procedures.
(define counter 
  (lambda (name)
    (let ([counts (make-hash)])
      (hash-set! counts "" 0)
      (counter-kernel name counts))))

;;; (counter-get tallies procname) -> integer?
;;;   tallies : counter?
;;;   procname : symbol?
;;; Get the number of times that counter-increment! has been called
;;; with procname since (a) the counter was created, (b) counter-reset!
;;; has been called with that procedure name, or (c) counter-reset-all!
;;; was called.
(define counter-get
  (lambda (tallies procname)
    ; hash-ref lets us supply a default value
    (hash-ref (counter-kernel-counts tallies) procname 0)))

;;; (counter-increment! tallies procname) -> void?
;;;   tallies : counter?
;;;   procname : symbol?
;;; Increment the count for a particular procedure.
(define counter-increment!
  (lambda (tallies procname)
    (let ([counts (counter-kernel-counts tallies)])
      (hash-set! counts procname (+ 1 (hash-ref counts procname 0)))
      (hash-set! counts "" (+ 1 (hash-ref counts "" 0))))))

;;; (counter-reset! tallies procname) -> void?
;;;   tallies : counter?
;;;   procname : symbol?
;;; Purpose:
;;;   Reset the counter for the given procedure.
(define counter-reset!
  (lambda (tallies procname)
    (let ([counts (counter-kernel-counts tallies)])
      (hash-set! counts "" (- (hash-ref counts "" 0)
                              (hash-ref counts procname 0)))
      (hash-remove! counts procname))))

;;; (counter-reset-all! tallies) -> void?
;;;   tallies : counter?
;;; Reset the elements of the counter counter.
(define counter-reset-all!
  (lambda (tallies)
    (hash-clear! (counter-kernel-counts tallies))))

;;; (display-counter tallies) -> void?
;;;   tallies : counter?
;;; Print all the values in a counter in a semi-useful way.
(define display-counter
  (lambda (tallies)
    (let ([counts (counter-kernel-counts tallies)])
      (display "Counts for ")
      (display (counter-kernel-name tallies))
      (newline)
      (display "  Total: ")
      (display (hash-ref counts "" 0))
      (newline)
      (hash-for-each counts
                     (lambda (proc count)
                       (when (not (eq? proc ""))
                         (display "  ")
                         (display proc)
                         (display ": ")
                         (display count)
                         (newline)))))))

; +-------------------------+----------------------------------------
; | Provided code: Counters |
; +-------------------------+

(define COUNT (counter "Counts"))

;;; (int-less-than? left right) -> boolean?
;;;   left : integer?
;;;   right : integer?
;;; A version of less-than for integers that lets us keep track
;;; of how many times it's called.
(define int-less-than?
  (lambda (left right)
    (counter-increment! COUNT 'less-than?)
    (<= left right)))

;;; (string-less-than? left right) -> boolean?
;;;   left : integer?
;;;   right : integer?
;;; A version of less-than for stringsthat lets us keep track
;;; of how many times it's called.
(define string-less-than?
  (lambda (left right)
    (counter-increment! COUNT 'less-than?)
    (string-ci<=? left right)))

; +----------------------------+-------------------------------------
; | Provided code: Random data |
; +----------------------------+

;;; (random-vector-element vec) -> any?
;;;   vec : vector
;;; Randomly select an element from a non-empty vector
(define random-vector-element
  (lambda (vec)
    (vector-ref vec (random (vector-length vec)))))

;;; (random-list n rproc) -> list?
;;;   n : non-negative integer
;;;   rproc : procedure? (0 parameters)
;;; Create a random list of length n.
(define random-list
  (lambda (n rproc)
    (letrec ([helper
              (lambda (n so-far)
                (if (zero? n)
                    so-far
                    (helper (- n 1) (cons (rproc) so-far))))])
      (helper n null))))

;;; (random-numbers n) -> list?
;;;   n : non-negative integer
;;; Create a list of `n` random numbers in the range [0 .. 1000)
(define random-numbers
  (lambda (n)
    (random-list n (lambda () (random 1000)))))

;;; (random-id) -> string
;;; Create a "random" user id
(define random-id
  (let* ([consonants (list->vector (string->list "BCDFGHJKLMNPQRSTVWXYZ"))]
         [vowels (list->vector (string->list "AEIOU"))]
         [c (lambda () (random-vector-element consonants))]
         [v (lambda () (random-vector-element vowels))])
    (lambda ()
      (string (c) (v) (c) (v) (c) (v)))))

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Conduct the traditional start-of-lab discussion.
|#

#|
b. Spend no more than five minutes reviewing any provided procedures
at the top of the file to see what is new.  You should feel free
to quickly experiment with any new procedures, but we'll also be
looking at most of them in the lab.
|#

#| A |# 

; +-------------------------------------------------+----------------
; | Exercise 1: Inserting values into a sorted list |
; +-------------------------------------------------+

#|
a. Without referring to the reading, write the following procedure.
You will likely find it easiest to write it with direct recursion.
Please use `int-less-than?` to compare integers.
|#

;;; (insert-integer ints i) -> (list-of integer?) [sorted]
;;;   ints : (list-of integer?) [sorted]
;;;   i : integer?
;;; Insert `i` into the correct place in `int`.
(define insert-integer
  ???)

#|
b. Write the following procedure. Please use `string-less-than? to
compare strings.
|#

;;; (insert-string strings str) -> (list-of string?) [sorted]
;;;   strings : (list-of string?) [sorted]
;;;   str : string?
;;; Insert `str` into the correct place in `strings`.
(define insert-string
  ???)

#| B |#

; +---------------------------------+--------------------------------
; | Exercise 2: Sorting basic lists |
; +---------------------------------+

#|
a. Without referring to the reading, write the following procedure.
You will likely find it easiest to use direct recursion. (I.e.,
sort the cdr of the list and then insert the car of the list in
the result.)

Make sure to check that it works correctly!
|#

;;; (integer-insertion-sort ints) -> (list-of integer?) [sorted]
;;;   ints : (list-of integer?) [any order]
;;; Sort `ints` using insertion sort.
(define integer-insertion-sort
  ???)

#|
b. Without referring to the reading, write the following procedure.

Make sure to check that it works correctly!
|#

;;; (string-insertion-sort strings) -> (list-of string?) [sorted]
;;;   strings : (list-of string?) [any order]
;;; Sort `strings` using insertion sort.
(define string-insertion-sort
  ???)

#| A |#

; +------------------------+-----------------------------------------
; | Exercise 3: Edge cases |
; +------------------------+

#|
As we've seen, in exploring any algorithm, it's a good idea to check
a few special cases that might cause the algorithm difficulty.  Here
are some to start with.
|#

#|
a. Run both versions of insertion sort on the empty list.

<TODO: Enter the results of your experiment here>
|#

#|
b. Run both versions of insertion sort on a one-element list.

<TODO: Enter the results of your experiment here>
|#

#|
c. Run both versions of insertion sort on lists with duplicate elements.

<TODO: Enter the results of your experiment here>
|#

#|
d. Run both versions of insertion sort on any other lists that you
think might provide appropriate challenges to the algorithms.

<TODO: Enter the results of your experiment here>
|#

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 4: Analyzing insertion sort |
; +--------------------------------------+

#|
We've claimed that insertion sort takes approximately n*n steps.
Let's explore that claim experimentally. We'll focus on the number
of calls to the comparison procedure (e.g., `int-less-than?`.
|#

#|
a. There is an `int-less-than?` procedure in the supplied code.
Explain how it will help us analyze insertion sort.

<TODO: Enter an answer>
```
|#

#|
b. Add a line to `insert-integer` to keep track of the number of times 
it is called.

<TODO: Enter the line above and copy it here>
|#

#|
c. Determine what `insertion-sort-experiment` does and then add
documentation to the procedure.
|#

;;; (insertion-sort-experiment lst) -> 
;;;
;;;
(define insertion-sort-experiment
  (lambda (ints)
    (counter-reset-all! COUNT)
    (let ([result (insertion-sort-experiment ints)])
      (display-counter COUNT)
      result)))

#|
d. Using the counter, count the number of calls to `insert-integer` and
`int-less-than?` in sorting a few lists of size 8, 16, 32, and 64.  Try
a few lists of each size.  You should use `random-numbers` to generate
the lists.

         insert-integer         int-less-than?
   8:
   8:
   8:
  16:
  16:
  16:
  32:
  32:
  32:
  64:
  64:
  64:
|#

#|
e.  Is the number of calls to `merge` similar or different for different
lists of the same size?  Is the number of calls to `less-than?` similar
or different for different lists of the same size?  What explains the
similarities or differences?

<TODO: Enter your answers here>
|#

#|
f. We said that the number of steps should approximately quadruple
each time we double the length of the list. Did you find that to
be true?

<TODO: Enter your answer here.>
|#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
It's the last time you have to submit a CSC-151 lab to Gradescope!
Yay!
|#

