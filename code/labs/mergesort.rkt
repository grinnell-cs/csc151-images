#lang racket

(require csc151)
(require rackunit)

;; CSC-151-NN 
;; Lab: Merge Sort
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

; +---------------------+------------------------------------------------------
; | Procedures Provided |
; +---------------------+

;;; (merge sorted1 sorted2 less-than?) -> list?
;;;   sorted1 : list? (sortedby less-than?)
;;;   sorted2 : list? (sortedby less-than?)
;;;   less-than? : binary-predicate?
;;; Merge the two lists into a new sorted list.
(define merge
  (lambda (sorted1 sorted2 less-than?)
    ; (writeln (list 'merge sorted1 sorted2))
    (cond
      ; If the first list is empty, return the second
      [(null? sorted1) 
       sorted2]
      ; If the second list is empty, return the first
      [(null? sorted2) 
       sorted1]
      ; If the first element of the first list is smaller or equal,
      ; make it the first element of the result and recurse.
      [(less-than? (car sorted1) (car sorted2))
       (cons (car sorted1) 
             (merge (cdr sorted1) sorted2 less-than?))]
      ; Otherwise, do something similar using the first element
      ; of the second list
      [else
       (cons (car sorted2) 
             (merge sorted1 (cdr sorted2) less-than?))])))

;;; (split lst) -> listof lists
;;;   lst : lists?
;;; Split a list into two nearly-equal halves.
(define split
  (lambda (lst)
    ;;; helper
    ;;;   Remove the first count elements of a list.  Return the
    ;;;   pair consisting of the removed elements (in order) and
    ;;;   the remaining elements.
    (letrec ([helper
              (lambda (remaining removed count)
                ; (writeln (list 'helper remaining removed count))
                ; If no elements remain to be used,
                (if (= count 0)
                    ; The first half is in removed and the second half
                    ; consists of any remaining elements.
                    (list (reverse removed) remaining)
                    ; Otherwise, use up one more element.
                    (helper (cdr remaining)
                            (cons (car remaining) removed)
                            (- count 1))))])
      (helper lst null (quotient (length lst) 2)))))

;;; (merge-sort lst less-than?) -> list?
;;;   list : list?
;;;   less-than? : binary-predicate?
;;; Sort the list using the merge sort algorithm, comparing elements
;;; with `less-than?`.
(define merge-sort
  (lambda (lst less-than?)
    ; If there are only zero or one elements in the list,
    ; the list is already sorted.
    (if (or (null? lst) (null? (cdr lst)))
        lst
        ; Otherwise, 
        ;   split the list in half,
        ;   sort each half,
        ;   and then merge the sorted halves.
        (let* ([halves (split lst)]
               [some (car halves)]
               [rest (cadr halves)])
          (merge (merge-sort some less-than?)
                 (merge-sort rest less-than?)
                 less-than?)))))

;;; (new-merge-sort lst less-than?) -> list?
;;;   list : list?
;;;   less-than? : binary-predicate?
;;; Sort the list using the merge sort algorithm, comparing elements
;;; with `less-than?`.
(define new-merge-sort
  (lambda (lst less-than?)
    (letrec (; Merge neighboring pairs in a list of lists
             [merge-pairs
              (lambda (list-of-lists)
                (cond
                  ; Base case: Empty list.
                  [(null? list-of-lists) 
                   null]
                  ; Base case: Single-element list (nothing to merge)
                  [(null? (cdr list-of-lists)) 
                   list-of-lists]
                  ; Recursive case: Merge first two and continue
                  [else 
                   (cons (merge (car list-of-lists) 
                                (cadr list-of-lists)
                                less-than?)
                         (merge-pairs (cddr list-of-lists)))]))]
             ; Repeatedly merge pairs
             [repeat-merge
              (lambda (list-of-lists)
                ; Show what's happening
                ; (writeln (list 'repeat-merge list-of-lists))
                ; If there's only one list in the list of lists
                (if (null? (cdr list-of-lists))
                    ; Use that list
                    (car list-of-lists)
                    ; Otherwise, merge neighboring pairs and start again.
                    (repeat-merge (merge-pairs list-of-lists))))])
      (repeat-merge (map list lst)))))

; +-----------+------------------------------------------------------
; | EXERCISES |
; +-----------+

#| A |#

; +------------------------------------+-----------------------------
; | Exercise 1: Reflections on merging |
; +------------------------------------+

#|
a. Write a call to `merge` to merge the lists `'(1 3 5 7 9)` and
`'(2 3 6 8)`. Define the result as `ex1a`.
|#

(define ex1a ???)

#|
b. Write a call to `merge` to merge the lists `'("all" "dogs" "eat" "rainbows")` and `'("crazy" "fictional")`. Define the result as `ex1b`
|#

(define ex1b ???)

#|
c. What do you expect to happen if you call `merge` with unsorted lists 
as the two list parameters?  For example, what will happen if you merge
'(1 3 5 2 9) with '(2 0 3 4 6)?

<TODO: Enter your answer here>
|#

#|
d. Check your answer by experimentation.  To help you understand
what is happening, you may wish to modify `merge` so that it displays
the values of `sorted1` and `sorted2`.  Make sure to try experiments
other than the one we suggested above.

<TODO: Enter a log of your experiments here>
|#


#|
e. How many times will `merge` be called in computing the answer
in the following expression?  

    > (merge '(1 2 3 4) '(5 6 7 8) <=)

<TODO: Enter your answer here>

Check your answer experimentally.  If you haven't already uncomment
the line to display the steps, you should probably do so now.

<TODO: Enter a log of your experiments here>
|#

#|
f. How many times will `merge` be called in computing the answer
in the following expression?

    > (merge '(1 3 5 7) '(2 4 6 8) <=)

<TODO: Enter your answer here>

Check your answer experimentally. 

<TODO: Enter a log of your experiments here>
|#

#|
g. In general, in merging lists of length `n` and `m`, what the fewest
times we will call `merge` and what's the most?  (You may assume that
`n` is less than or equal to `m`.)

Fewest: <TODO: Enter your answer here>

Most: <TODO: Enter your answer here>
|#

#|
h. At this point, you should understand what's happening in `merge`.
Please comment out the line that displays the steps in merge.
|#

#| B |#

; +---------------------+--------------------------------------------
; | Exercise 2: Sorting |
; +---------------------+

#|
a. Write instructions to generate a list of twenty-one random integers.
You can make them in a restricted range if that's easier.

Note: You should check the provided procedures above that help you
create lists of random values.
|#

(define random-sample-ints ???)

#|
b. Write instructions to sort that list using `new-merge-sort`.
Store the result in `ex2b`.
|#

(define ex2b ???)

#|
c. Write instructions to sort that list using `merge-sort`. Store
the result in `ex2c`.
|# 

(define ex2c ???)

#|
d. Write instructions to generate a list of twenty "random" ids. 
Once again, you should rely on the provided procedures to help
generate this list.
|#

(define random-ids ???)

#|
e. Write instructions to sort that list using `new-merge-sort`.
Store the result in `ex2e`.
|#

(define ex2e ???)

#|
f. Write instructions to sort that list using `merge-sort`.
Store the result in `ex2f`.
|#

(define ex2f ???)

#| B |#

; +-------------------------------------------------+----------------
; | Exercise 3: Exploring the details of merge sort |
; +-------------------------------------------------+

#|
Uncomment the command to display what's happening in `new-merge-sort`.
(The line has a `writeln` command.)

    (writeln (list 'repeat-merge list-of-lists))

Then review the code in `new-merge-sort`.
|#

#|
a. What output do you expect to get from the writeln command you
just uncommented if you run your updated `new-merge-sort` on a list
you design of ten strings?

<TODO: Enter the list and the expected output here>

Check your answer experimentally.

<TODO: Enter the actual output here>
|#

#|
b. Rerun `new-merge-sort` on a list of twenty integers.

<TODO: Enter the actual output here.
|#

#| AB |#

; +---------------+--------------------------------------------------
; | A short pause |
; +---------------+

#|
By now, you may have a variety of calls to `writeln` that provide
information that was useful at one point, but may no longer be
useful.  For example, you should know how `merge` works, so you 
need not see the individual calls to `merge`.  Feel free to comment
out any of those calls to `writeln` at any point in the lab.
|#

#| A |#

; +---------------------------+--------------------------------------
; | Exercise 4: Special cases |
; +---------------------------+

#|
As we've seen, in exploring any algorithm, it's a good idea to check
a few special cases that might cause the algorithm difficulty.  Here
are some to start with.
|#

#|
a. Run both versions of merge sort on the empty list.

<TODO: Enter the results of your experiment here>
|#

#|
b. Run both versions of merge sort on a one-element list.

<TODO: Enter the results of your experiment here>
|#

#|
c. Run both versions of merge sort on a list with duplicate elements.

<TODO: Enter the results of your experiment here>
|#

#|
d. Run both versions of merge sort on any other lists that you 
think might provide appropriate challenges to the algorithms.

<TODO: Enter the results of your experiment here>
|#

#| A |#

; +----------------------------------+-------------------------------
; | Exercise 5: Analyzing merge sort |
; +----------------------------------+

#|
We've claimed that merge sort takes approximately `n`\*log_2(`n`) steps.
Let's explore that claim experimentally.  We'll focus on the
number of calls to `less-than?`.

Remind yourself of the uses of `counter`, `counter-increment!`,
`counter-reset!`, `counter-reset-all!, and `display-counter`, all of 
which appeared in the reading on analyzing procedures.
|#

#|
a. There is an `int-less-than?` procedure in the supplied code.
Explain how it will help us analyze merge sort.

<TODO: Enter an answer>
```
|#

#|
b. Add a line to `merge` to keep track of the number of times `merge`
is called.

<TODO: Enter the line above and copy it here>
|#

#|
c. Determine what `merge-sort-experiment` does and then add documentation 
to the procedure.
|#

;;; (merge-sort-experiment lst) -> 
;;;
;;;
(define merge-sort-experiment
  (lambda (lst)
    (counter-reset-all! COUNT)
    (let ([result (merge-sort lst int-less-than?)])
      (display-counter COUNT)
      result)))

#|
d. Using the counter, count the number of calls to `merge` and
`less-than?` in sorting a few lists of size 8, 16, 32, and 64.  Try
a few lists of each size.  You should use `random-numbers` to generate 
the lists.

         Merge    Less-Than?
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
f.  Does the running time seem to grow faster than `n`?  (In such
functions, when you double the input size, you double the number of
steps.)  Does the running time seem to grow slower than `n`\*`n`?
(In such functions, when you double the input size, you should
approximately quadruple the number of steps.)  Which does it seem
closer to?

<TODO: Enter your answers here>
|#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
It's the last time you have to submit a CSC-151 lab to Gradescope!
Yay!
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, try one or more of the following
exercises.
|#

; +-------------------------------+----------------------------------
; | Extra 1: Analyzing merge sort |
; +-------------------------------+

#|
a. In an exercise above, you conducted an experiment to determine the
number of steps `merge-sort` takes on different lists, measured in
terms of comparisons and/or calls to `merge`.

Conduct a similar experiment for `new-merge-sort`

         Merge    Less-Than?
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
b. Are your times similar or different to those from `merge-sort`?  Why?

<TODO: Enter an answer here>
|#

; +-------------------------------+----------------------------------
; | Extra 2: Rewriting merge sort |
; +-------------------------------+

#|
At this point, you should be fairly familiar with the basic approach
of merge sort.

* Split the list in half
* Sort both halves
* Merge them together.

Without looking at our definition of `merge-sort`, write your own
version.  Don't forget the base cases!
|#

(define our-merge-sort
  (lambda (lst less-than?)
    ???))

