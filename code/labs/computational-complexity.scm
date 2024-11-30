;; CSC-151-NN (SEMESTER)
;; Computational complexity (computational-complexity.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Computational Complexity")

;; -----------------------------------------------------------------------------
(part "Provided Definitions")

;;; A global counter for counting relevant operations
(define counter (ref 0))

;;; (counter-increment) -> void
;;; Increments the global counter by 1.
(define counter-increment
  (lambda ()
    (ref-set! counter (+ 1 (deref counter)))))

;;; (counter-reset) -> void
;;; Resets the global counter back to 0.
(define counter-reset
  (lambda ()
    (ref-set! counter 0)))

;;; (count-ops f) -> pair?
;;;   f : function? a zero-argument function
;;; Resets the global counter, calls function f, and returns both the
;;; result of the function and the value of the counter at the end of
;;; execution of f.
(define count-ops
  (lambda (f)
    (begin
      (counter-reset)
      (let ([result (f)]
            [counts (deref counter)])
        (pair result counts)))))

(description "Example usage of counter functions and count-ops:")

(define my-length
  (lambda (l)
    (begin
      (counter-increment)
      (match l
        [null 0]
        [(cons _ tail) (+ 1 (my-length tail))]))))

(description "Length and #/recursive calls of (range 10):")

(display (count-ops
  (lambda ()
    (my-length (range 10)))))

;; -----------------------------------------------------------------------------
(part "Part 1: Graphing Counts")

; Below, we've replicated alphabetically-first-1 and alphabetically-first-2
; from the reading, instrumented with our counter.

;;; (alphabetically-first string) -> string
;;;   strings: both (listof string?) nonempty?
;;; Find the alphabetically first string in the list.
(define alphabetically-first-1
  (lambda (strings)
    (begin
      (counter-increment)
      (cond
        [(null? (cdr strings))
         (car strings)]
        [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
         (car strings)]
        [else
         (alphabetically-first-1 (cdr strings))]))))

;;; (first-of-two str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Find the alphabetically first of str1 and str2.
(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))

(define alphabetically-first-2
  (lambda (strings)
    (begin
      (counter-increment)
      (if (null? (cdr strings))
          (car strings)
          (first-of-two (car strings)
                        (alphabetically-first-2 (cdr strings)))))))

; We declared that the number of recursive calls alphabetically-first-1
; makes grows quadratically as the size of the input list grows. In
; contrast, the number of calls only grows linearly with
; alphabetically-first-2. This arises when the input list is in _reverse
; order_ as demonstrated below:

(define rletters
  (reverse (list "aa" "bb" "cc" "dd" "ee"
                 "ff" "gg" "hh" "ii" "jj"
                 "kk" "ll" "mm" "nn" "oo" "pp")))

(description "Counts for (alphabetically-first-1 letters):")

(display (cdr (count-ops
  (lambda ()
    (alphabetically-first-1 rletters)))))

(description "Counts for (alphabetically-first-2 letters):")

(display (cdr (count-ops
  (lambda ()
    (alphabetically-first-2 rletters)))))

; Experimentally show this trend by generating all possible counts
; by taking sub-lists of rletters from size 1 to 16. (Note that the
; functions' behavior are undefined for empty lists!) To generate
; these sublists, you can use (list-take lst n) that creates a new
; list consisting of the first n elements of lst.
;
; Fill in the table below with your findings and then graph your
; findings, e.g., in an Excel spreadsheet to observe that the
; observations 
;
;         alphabetically-first-1    alphabetically-first-2
; n = 1
; n = 2
; n = 3
; n = 4
; n = 5
; n = 6
; n = 7
; n = 8
; n = 9
; n = 10
; n = 11
; n = 12
; n = 13
; n = 14
; n = 15
; n = 16
;
; (Hint: rather than manually writing out 32 calls to our functions,
; can you write a pipeline that starts with (range 16) and turns that
; list of numbers into a list of counts for the functions?)

(description "Code for generating counts:")

; TODO: write your code for generating counts here

;; -----------------------------------------------------------------------------
(part "Part 2: Counting Reversal")

; As alluded to in the reading, we'll now perform the same analysis of counting
; function calls for our two implementations of reverse, provided below.

;;; (list-append l1 l2) -> list?
;;;   l1, l2 : list?
;;; Returns the list formed by placing the elements of l2 after the elements
;;; of l1, preserving the order of the elements of l1 and l2.
(define list-append
  (lambda (l1 l2)
    (cond
      [(null? l1)
       l2]
      [else
       (cons (car l1)
             (list-append (cdr l1) l2))])))

;;; (list-reverse lst) -> list?
;;;   lst : list?
;;; Returns a list with the elements of lst in the opposite order.
(define list-reverse-1
  (lambda (lst)
    (match lst
      [null null]
      [(cons head tail)
       (list-append (list-reverse-1 tail) (list head))])))

(define list-reverse-2-helper
  (lambda (so-far remaining)
    (match remaining
      [null so-far]
      [(cons head tail)
       (list-reverse-2-helper (cons head so-far) tail)])))

(define list-reverse-2
  (lambda (lst)
    (list-reverse-2-helper null lst)))

(problem "Problem 2a: Instrumentation")

; First, go through the two implementations of reverse and instrument
; them so that we can count the number of recursive calls each function
; makes. For list-reverse-1, record the number of calls made to
; list-append and for list-reverse-2, record the number of calls made
; to list-reverse-2-helper. (Can you explain why we're picking these
; functions to record to your partner?)

(test-case "list-reverse-1 example counts"
  equal? 55
  (lambda ()
    (cdr (count-ops (lambda ()
      (list-reverse-1 (range 10)))))))

(test-case "list-reverse-2 example counts"
  equal? 11
  (lambda ()
    (cdr (count-ops (lambda ()
      (list-reverse-2 (range 10)))))))

(problem "Problem 2b: Experimental Analysis")

; Next, repeat your analysis for the alphabetically-first functions here.
; Choose at least 10 lists of various sizes from 0 to 100 (creating them
; via range should be sufficient) and fill in the table below:
;
;         reverse-1    reverse-2
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?

; Graph your results and based on your graphs, declare how each function
; scales as a function of its input. Are they linear or quadratic?

(description "reverse-1 scales ... as a function of the size of the input list.")
(description "reverse-2 scales ... as a function of the size of the input list.")

;; -----------------------------------------------------------------------------
(part "Part 3: Dedup")

; Next let's write a function that removes duplicates from a list and then
; analyze its computational complexity!

(problem "Problem 3a: list-remove-all")

; First write a function (list-remove-all lst v) that removes all occurrences
; of value v from lst.

;;; (list-remove-all lst v) -> list?
;;;   lst: list?
;;;   v: any
;;; Returns lst but with all occurrences of v removed.
(define list-remove-all
  (lambda (lst v)
    {??}))

(test-case "list-remove-all: empty"
  equal? null
  (lambda ()
    (list-remove-all null 7)))

(test-case "list-remove-all: not in list"
  equal? (range 10)
  (lambda ()
    (list-remove-all (range 10) -7)))

(test-case "list-remove-all: in list"
  equal? (list 7 9 3 0 8 9)
  (lambda ()
    (list-remove-all (list 1 7 9 1 1 3 0 1 8 9 1) 1)))

(problem "Problem 3b: dedup")

; Now, use list-remove-all to implement (list-dedup lst) which
; removes all duplicate elements from the given input lst.

;;; (list-dedup lst) -> list?
;;;   lst: list?
;;; Return lst but with all duplicate elements removed.
(define list-dedup
  (lambda (lst)
    {??}))

(test-case "list-dedup: empty"
  equal? null
  (lambda ()
    (list-dedup null)))

(test-case "list-dedup: all unique"
  equal? (range 10)
  (lambda ()
    (list-dedup (range 10))))

(test-case "list-dedup: duplicates"
  equal? (list 1 1 3 7 9 0 9 1 5 1 3 2)
  (lambda ()
    (list-dedup (list 1 3 7 9 0 5 2))))

(problem "Problem 3c: Instrumentation")

; Now, let's instrument list-dedup to assess its complexity. Since
; list-dedup calls out to list-remove-all, instrument both functions
; so that we count the number of recursive calls to both of them.
; (A single count of the number of calls to both functions is fine.)

(description "Nothing to display here!")

(problem "Problem 3d: Experimental Analysis")

; Like with reversal, use your instrumented code to count the number
; of recursive calls made by list-dedup and list-remove-all on at
; least 10 lists of sizes ranging from 0 to 1000 elements.
;
;         list-dedup/list-remove-all
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
;
; Graph your results and based on your graphs, declare how list-dedup
; scales as a function of its input. Is it linear or quadratic?

(description "list-dedup scales ... as a function of the size of the input list.")

(part "Part 4: Sorted Deduplication")

(problem "Problem 4a: Designing a Better Algorithm")

; Review your implementation of list-dedup and complete the following
; high-level description of how it works which explains what we
; experimentally validated previously?

(description "For each element of the list, list-dedup...")

; Can we do better than this? Perhaps, but we need to put a condition
; on the lists we dedup. What if the list was _sorted_ instead? For
; example:
;
;   (list 1 1 1 2 2 5 8 8 9 10 10)
;
; With your partner, design a recursive algorithm that removes the
; duplicates from a _sorted_ list of elements. Your algorithm should
; take advantage of the fact the list is sorted and should only operate
; in a _single pass_ of the list, unlike the current implementation of
; list-dedup!
;
; TODO: write your algorithm for deduplicating a sorted list here!

(problem "Problem 4b: sorted-list-dedup")

; Implement your algorithm as (sorted-list-dedup lst) below. (Hint:
; you will need to write a helper function to keep track of the extra
; information necessary to remove duplicates as you traverse the list.)

;;; (sorted-list-dedup lst) -> list?
;;;   lst: list?
;;; Return lst but with all duplicate elements removed.
(define sorted-list-dedup
  (lambda (lst)
    {??}))

(test-case "sorted-list-dedup: empty"
  equal? null
  (lambda ()
    (sorted-list-dedup null)))

(test-case "sorted-list-dedup: all unique"
  equal? (range 10)
  (lambda ()
    (sorted-list-dedup (range 10))))

(test-case "sorted-list-dedup: duplicates"
  equal? (list 1 1 1 2 2 5 8 8 9 10 10)
  (lambda ()
    (list-dedup (list 1 2 5 8 9 10))))

(problem "Problem 4c: Complexity Analysis")

; As in the previous problems:
;   (a) Instrument your implementation of sorted-list-dedup to count
;       the number of recursive calls it makes.
;   (b) Populate the table below of counts for lists of varying size
;       from 0 to 1000. Generate at least 10 counts.
;   (c) Graph your results and declare whether your function behaves
;       linearly or quadratically.
;
;         sorted-list-dedup
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?
; n = ?

(description "sorted-list-dedup scales ... as a function of the size of the input list.")