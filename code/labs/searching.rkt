#lang racket

(require csc151)
(require racket/match)
(require rackunit)

;; CSC-151-NN (SEMSESTER)
;; Lab: Searching and Analysis (searching.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------+--------------------------------------------------------
; | Structs |
; +---------+

; (student given-name surname id major year) -> student?
; A simple representation of students.
(struct student (given-name surname id major year)
  #:transparent)

; +-----------------------------+------------------------------------
; | Provided code: Sets of data |
; +-----------------------------+

;;; simulated-students : vectorof student?
;;; Students organized by name
(define simulated-students
  (vector
   (student "Amy"       "Zevon"    1336804 "Computer Science"  2023)
   (student "Bob"       "Smith"    1170605 "Mathematics"       2020)
   (student "Charlotte" "Davis"    1304091 "Independent"       2022)
   (student "Danielle"  "Jones"    1472662 "Undeclared"        2021)
   (student "Devon"     "Smith"    1546921 "Computer Science"  2022)
   (student "Erin"      "Anderson" 1320727 "Philosophy"        2023)
   (student "Fred"      "Stone"    1260057 "Linguistics"       2022)
   (student "Greg"      "Jones"    1668280 "Classics"          2020)
   (student "Heather"   "Jones"    1046860 "Classics"          2021)
   (student "Ira"       "Jackson"  1070103 "Political Science" 2022)
   (student "Janet"     "Smith"    1488985 "Chemistry"         2023)
   (student "Karla"     "Hill"     1821167 "Psychology"        2022)
   (student "Leo"       "Levens"   1399810 "English"           2023)
   (student "Maria"     "Moody"    1168059 "Computer Science"  2020)
   (student "Ned"       "Black"    1177023 "Russian"           2022)
   (student "Otto"      "White"    1908656 "Chinese"           2023)
   (student "Paula"     "Hall"     1218704 "Psychology"        2022)
   (student "Quentin"   "Smith"    1679081 "Art History"       2022)
   (student "Rebecca"   "Davis"    1658200 "Biology"           2020)
   (student "Sam"       "Sky"      1085519 "Mathematics"       2022)
   (student "Ted"       "Tedly"    1480618 "GWSS"              2023)
   (student "Urkle"     "Andersen" 1681805 "Anthropology"      2022)
   (student "Violet"    "Teal"     1493989 "Economics"         2023)
   (student "Xerxes"    "Homer"    1547425 "Economics"         2023)
   (student "Yvonne"    "Stein"    1748611 "Sociology"         2022)
   (student "Zed"       "Rebel"    1540899 "Computer Science"  2024)
  ))

;;; simulated-students-by-id : vectorof student?
;;; Students organized by id
(define simulated-students-by-id
  (vector
   (student "Heather"   "Jones"    1046860 "Classics"          2025)
   (student "Ira"       "Jackson"  1070103 "Political Science" 2026)
   (student "Sam"       "Sky"      1085519 "Mathematics"       2022)
   (student "Maria"     "Moody"    1168059 "Computer Science"  2024)
   (student "Bob"       "Smith"    1170605 "Mathematics"       2024)
   (student "Ned"       "Black"    1177023 "Russian"           2022)
   (student "Paula"     "Hall"     1218704 "Psychology"        2022)
   (student "Fred"      "Stone"    1260057 "Linguistics"       2022)
   (student "Charlotte" "Davis"    1304091 "Independent"       2022)
   (student "Erin"      "Anderson" 1320727 "Philosophy"        2023)
   (student "Amy"       "Zevon"    1336804 "Computer Science"  2023)
   (student "Leo"       "Levens"   1399810 "English"           2023)
   (student "Danielle"  "Jones"    1472662 "Undeclared"        2025)
   (student "Ted"       "Tedly"    1480618 "GWSS"              2023)
   (student "Janet"     "Smith"    1488985 "Chemistry"         2023)
   (student "Violet"    "Teal"     1493989 "Economics"         2023)
   (student "Zed"       "Rebel"    1540899 "Computer Science"  2021)
   (student "Devon"     "Smith"    1546921 "Computer Science"  2022)
   (student "Xerxes"    "Homer"    1547425 "Economics"         2023)
   (student "Rebecca"   "Davis"    1658200 "Biology"           2024)
   (student "Greg"      "Jones"    1668280 "Classics"          2024)
   (student "Quentin"   "Smith"    1679081 "Art History"       2022)
   (student "Urkle"     "Andersen" 1681805 "Anthropology"      2022)
   (student "Yvonne"    "Stein"    1748611 "Sociology"         2022)
   (student "Karla"     "Hill"     1821167 "Psychology"        2022)
   (student "Otto"      "White"    1908656 "Chinese"           2023)
   ))

;;; simulated-students-by-year : vectorof student?
(define simulated-students-by-year
  (vector
   (student "Zed"       "Rebel"    1540899 "Computer Science"  2021)
   (student "Ned"       "Black"    1177023 "Russian"           2022)
   (student "Yvonne"    "Stein"    1748611 "Sociology"         2022)
   (student "Karla"     "Hill"     1821167 "Psychology"        2022)
   (student "Paula"     "Hall"     1218704 "Psychology"        2022)
   (student "Charlotte" "Davis"    1304091 "Independent"       2022)
   (student "Fred"      "Stone"    1260057 "Linguistics"       2022)
   (student "Quentin"   "Smith"    1679081 "Art History"       2022)
   (student "Sam"       "Sky"      1085519 "Mathematics"       2022)
   (student "Urkle"     "Andersen" 1681805 "Anthropology"      2022)
   (student "Devon"     "Smith"    1546921 "Computer Science"  2022)
   (student "Ted"       "Tedly"    1480618 "GWSS"              2023)
   (student "Leo"       "Levens"   1399810 "English"           2023)
   (student "Otto"      "White"    1908656 "Chinese"           2023)
   (student "Janet"     "Smith"    1488985 "Chemistry"         2023)
   (student "Violet"    "Teal"     1493989 "Economics"         2023)
   (student "Xerxes"    "Homer"    1547425 "Economics"         2023)
   (student "Erin"      "Anderson" 1320727 "Philosophy"        2023)
   (student "Amy"       "Zevon"    1336804 "Computer Science"  2023)
   (student "Rebecca"   "Davis"    1658200 "Biology"           2024)
   (student "Greg"      "Jones"    1668280 "Classics"          2024)
   (student "Bob"       "Smith"    1170605 "Mathematics"       2024)
   (student "Maria"     "Moody"    1168059 "Computer Science"  2024)
   (student "Heather"   "Jones"    1046860 "Classics"          2025)
   (student "Danielle"  "Jones"    1472662 "Undeclared"        2025)
   (student "Ira"       "Jackson"  1070103 "Political Science" 2026)
   ))

;;; small-primes : vectorof integer?
;;; All of the prime numbers less than 1000, arranged in increasing order.
(define small-primes
  (vector 2 3 5 7 11 13 17 19 23 29 31 37
          41 43 47 53 59 61 67 71 73 79 83 89 97
          101 103 107 109 113 127 131 137 139 149
          151 157 163 167 173 179 181 191 193 197 199
          211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293
          307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397
          401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499
          503 509 521 523 541 547 557 563 569 571 577 587 593 599
          601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691
          701 709 719 727 733 739 743 751 757 761 769 773 787 797
          809 811 821 823 827 829 839 853 857 859 863 877 881 883 887
          907 911 919 929 937 941 947 953 967 971 977 983 991 997))

; +--------------------------+---------------------------------------
; | Provided code: Searching |
; +--------------------------+

;;; (binary-search vec key get-key less-equal?) -> integer?
;;;   vec : vector?
;;;   get-key? : procedure? unary?
;;;   less-equal? : procedure? binary?
;;; Search the vector for a value whose key is key.  Returns
;;;   the index of the matching element or #f.
;;; get-key is used to extract the keys and less-equal?
;;;   specifies the ordering.
;;; Pre: The vector is "sorted".  That is,
;;;   (less-equal? (get-key (vector-ref vec i)) 
;;;                (get-key (vector-ref vec (+ i 1))))
;;; holds for all reasonable i.  
(define binary-search
  (lambda (vec key get-key less-equal?)
    ; Search a portion of the vector from lower-bound (inclusive) 
    ; to upper-bound (exclusive)
    (letrec ([search-portion 
              (lambda (lower-bound upper-bound)
                ; A bit of feedback
                ; (displayln (list 'search-portion lower-bound upper-bound))
                ; (counter-increment! BSC 'search-portion)
                ; If the portion is empty
                (if (>= lower-bound upper-bound)
                    ; Indicate the value cannot be found
                    #f
                    ; Otherwise, identify the middle point, the element at that 
                    ; point and the key of that element.
                    (let* ([midpoint (quotient (+ lower-bound upper-bound) 2)]
                           [middle-element (vector-ref vec midpoint)]
                           [middle-key (get-key middle-element)])
                      (cond
                        ; If the middle key equals the value, we use the middle value.
                        [(and (less-equal? key middle-key)
                              (less-equal? middle-key key))
                         midpoint]
                        ; If the middle key is too large, look in the left half
                        ; of the region.
                        [(less-equal? key middle-key)
                         (search-portion lower-bound midpoint)]
                        ; Otherwise, the middle key must be too small, so look 
                        ; in the right half of the region.
                        [else
                         (search-portion (+ midpoint 1) upper-bound)]))))])
      (search-portion 0 (vector-length vec)))))

;;; (lookup-by-given-name directory name) -> student? (or boolean?)
;;;   directory : vectorof student?
;;;   name : string?
;;; Find the entry associated with name
(define lookup-by-given-name
  (lambda (directory name)
    (let ([index (binary-search directory name student-given-name string-ci<=?)])
      (and index
           (vector-ref directory index)))))

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
;;; with procname since (a) the counter was created or (b) counter-reset!
;;; has been called with that procedure name.
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

(define AFC (counter "experiments with alphabetically-first"))

(define RC (counter "experiments with reverse"))

(define BSC (counter "experiments with binary-search"))

; +--------------------------------+---------------------------------
; | Provided code: List operations |
; +--------------------------------+

;;; (alphabetically-first string) -> string
;;;   strings: both (listof string?) nonempty?
;;; Find the alphabetically first string in the list.
(define alphabetically-first-1
  (lambda (strings)
    (counter-increment! AFC 'alphabetically-first-1)
    (cond
      [(null? (cdr strings))
       (car strings)]
      [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
       (car strings)]
      [else
       (alphabetically-first-1 (cdr strings))])))

(define alphabetically-first-2
  (lambda (strings)
    (counter-increment! AFC 'alphabetically-first-2)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))

;;; (first-of-two str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Find the alphabetically first of str1 and str2.
(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))

;;; (list-append l1 l2) -> list?
;;;   l1, l2 : list?
;;; Returns the list formed by placing the elements of l2 after the elements
;;; of l1, preserving the order of the elements of l1 and l2.
(define list-append
  (lambda (l1 l2)
    (writeln (list 'list-append l1 l2))
    (cond
      [(null? l1)
       l2]
      [else
       (cons (car l1)
             (list-append (cdr l1) l2))])))

;;; (list-reverse l) -> list?
;;;   l : list?
;;; Returns l with the elements in the opposite order.
(define list-reverse-1
  (lambda (l)
    (match l
      ['()
       null]
      [(cons x tail)
       (list-append (list-reverse-1 tail) (list x))])))

(define list-reverse-2
  (lambda (l)
    (letrec ([helper
              (lambda (l so-far)
                (match l
                  ['() 
                   so-far]
                  [(cons x tail)
                   (helper tail (cons x so-far))]))])
      (helper l null))))

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

; +----------------------------------+-------------------------------
; | Exercise 1: Initial explorations |
; +----------------------------------+

#|

a. Verify that binary search can correctly find the entry for
`"Heather"` in `simulated-students`. That is, write an expression
to find `"Heather"`.

> (binary-search simulated-students "Heather" ___ ___)

<TODO: Enter the result here>

*Hint:* If you can't fill in the blanks yourself, the example is in the
reading. We are asking you to run the search yourself.
|#

#|
b. Verify that binary search can correctly find the entry for a student
of your choice in `simulated-students`.

<TODO: Enter your experiment here>
|#

#|
c. Verify that binary search can correctly find the first entry in
`simulated-students`. You will need to supply the name associated with
that entry.

<TODO: Enter your experiment here>
|#

#|
d. Verify that binary search can correctly find the last entry in
`simulated-students`. You will need to supply the name associated with
that entry.

<TODO: Enter your experiment here>
|#

#|
e. Verify that binary search terminates and returns #f for something that
would fall in the middle of the vector and is not there. That is, pick
a name that starts with M or N and that does not appear in the vector.

<TODO: Enter your experiment here>
|#

#|
f. Verify that binary search terminates and returns #f for something that
comes before the first entry in `simulated-students`. You will need to
pick a name that alphabetically precedes `"Amy"`.

<TODO: Enter your experiment here>
|#

#|
g. Verify that binary search terminates and returns #f for something
that comes after the last entry. You will need to pick a name that
alphabetically follows `"Zed"`.

<TODO: Enter your experiment here>
|#

#|
h. Why do you think we had you verify each of these conditions?

<TODO: Enter your answer here>
|#

; +--------------------------------------+---------------------------
; | Exercise 2: Counting recursive calls |
; +--------------------------------------+

#|
It is often useful when exploring a recursive algorithm to observe the
steps the algorithm performs.  In Racket, we can sometimes observe steps
in recursive calls by printing out the steps

Begin by uncommenting the lines at the start of `search-portion` that 
display values.
|#

#|
a. Redo the examples above, reporting on the number for each call.
You should be counting manually.  If you choose to use the BSC
counter, make sure to reset it before each.

<TODO: Enter numbers below>

Heather #
??????  #
Amy     #
Zed     #
Middle  #
< Amy   #
> Zed   #
|#

#|
b. Why do you think we had you re-check each of these conditions?

<TODO: Enter your answer here>
|#

#| B |#

; +----------------------------+-------------------------------------
; | Exercise 3: Duplicate keys |
; +----------------------------+

#|
a. What do you expect binary search to do if there are entries with 
duplicate keys?  

<TODO: Enter your answer here>
|#

#|
Consider the following copy of `simulated-students` with three
entries that have a key of "Otto" and three that have a key of "Amy"
|#

;;; simulated-students-new : vectorof student?
;;; Students organized by first name, with some duplicate names.
(define simulated-students-new
  (vector
   (student "Amy"       "One"      1336804 "Computer Science"  2023)
   (student "Amy"       "Two"      2336804 "Computer Science"  2023)
   (student "Amy"       "Three"    3336804 "Computer Science"  2023)
   (student "Bob"       "Smith"    1170605 "Mathematics"       2024)
   (student "Charlotte" "Davis"    1304091 "Independent"       2022)
   (student "Danielle"  "Jones"    1472662 "Undeclared"        2025)
   (student "Devon"     "Smith"    1546921 "Computer Science"  2022)
   (student "Erin"      "Anderson" 1320727 "Philosophy"        2023)
   (student "Fred"      "Stone"    1260057 "Linguistics"       2022)
   (student "Greg"      "Jones"    1668280 "Classics"          2024)
   (student "Heather"   "Jones"    1046860 "Classics"          2025)
   (student "Ira"       "Jackson"  1070103 "Political Science" 2026)
   (student "Janet"     "Smith"    1488985 "Chemistry"         2023)
   (student "Karla"     "Hill"     1821167 "Psychology"        2022)
   (student "Leo"       "Levens"   1399810 "English"           2023)
   (student "Maria"     "Moody"    1168059 "Computer Science"  2024)
   (student "Ned"       "Black"    1177023 "Russian"           2022)
   (student "Otto"      "One"      1908656 "Chinese"           2023)
   (student "Otto"      "Two"      2908656 "Chinese"           2023)
   (student "Otto"      "Three"    3908656 "Chinese"           2023)
   (student "Paula"     "Hall"     1218704 "Psychology"        2022)
   (student "Quentin"   "Smith"    1679081 "Art History"       2022)
   (student "Rebecca"   "Davis"    1658200 "Biology"           2024)
   (student "Sam"       "Sky"      1085519 "Mathematics"       2022)
   (student "Ted"       "Tedly"    1480618 "GWSS"              2023)
   (student "Urkle"     "Andersen" 1681805 "Anthropology"      2022)
   (student "Violet"    "Teal"     1493989 "Economics"         2023)
   (student "Xerxes"    "Homer"    1547425 "Economics"         2023)
   (student "Yvonne"    "Stein"    1748611 "Sociology"         2022)
   (student "Zed"       "Rebel"    1540899 "Computer Science"  2021)
   ))

#|
b. Which of the three Otto entries do you expect binary search to return 
if you search for `"Otto"`?

<TODO: Enter an answer>

Check your answer experimentally.  Revise your answer above as necessary.
|#

#|
c. Which of the three Amy entries do you expect binary search to return if
you search for `"Amy"`?

<TODO: Enter an answer>

Check your answer experimentally.  Revise your answer above as necessary.
|#

#|
e. What does your experience in this exercise suggest about what
binary search will do with duplicate keys?

<TODO: Enter an answer>
|#

; +----------------------------+-------------------------------------
; | Exercise 4: Counting calls |
; +----------------------------+

#| 
a. The reading on analysis had a series of experiments that
involved `alphabetically-first`.  Rerun those experiments and
verify that the results are the same as those in the reading.

    > (define animals (list "armadillo" "badger" "capybara" "donkey" "emu"))
    > (counter-reset-all! AFC)
    > (alphabetically-first-1 animals)
    ???
    > (alphabetically-first-2 animals)
    ???
    > (display-counter AFC)
    ???

    > (counter-reset-all! AFC)
    > (alphabetically-first-1 (reverse animals))
    ???
    > (alphabetically-first-1 (reverse animals))
    ???
    > (display-counter AFC)
    ???
|#

#|
If we wanted to conduct more experiments, we might consider writing a helper
procedure.
|#

;;; (af-experiment! n) -> void?
;;;   n -> integer? non-negative?
;;; Conduct an experiment with the varous versions alphabetically-first, 
;;;   using (a) a list of length n ordered alphabetically and (b) a list
;;;   of length n ordered reverse-alphabetically.  
;;; n must be less than or equal to 26.
;;; The results of the experiment are printed on the screen.
(define af-experiment!
  (let ([letters (map (o (section make-string 2 <>)
                         integer->char
                         (section + <> (char->integer #\a)))
                      (range 26))])
    (lambda (n)
      (display n) (display " ") (display "ALPHABETICAL") (newline)
      (counter-reset-all! AFC)
      (alphabetically-first-1 (take letters n))
      (alphabetically-first-2 (take letters n))
      (display-counter AFC)
      (display n) (display " ") (display "REVERSE ALPHABETICAL") (newline)
      (counter-reset-all! AFC)
      (alphabetically-first-1 (reverse (take letters n)))
      (alphabetically-first-2 (reverse (take letters n)))
      (display-counter AFC))))
      
#|
b. Try a few experiments with ordered and reverse-ordered lists of 
length 4, 8, 12, 14, 15, 16, and 17.

<TODO: Enter your data here>
|#

#|
c. What do you observe about the growth of `alphabetically-first-1`
and `alphabetically-first-2`?  You don't need an exact formula.  Spend
no more than three minutes on this part of the exercise.

<TODO: Enter your answer here>
|#

#|
Consider the following procedure procedure for conducting 
experiments with randomly generated lists.
|#

;;; (af-random-experiment! n) -> void?
;;;   n : integer? non-negative?
;;; Run both versions of alphabetically-first on a random list of 
;;;   length n.
;;; Prints the results of the experiment.
(define af-random-experiment!
  (lambda (n)
    (let ([lst (random-list n random-id)])
      (display n) (display " ") (display "RANDOM") (newline)
      (counter-reset-all! AFC)
      (alphabetically-first-1 lst)
      (alphabetically-first-2 lst)
      (display-counter AFC))))

#|
d. You've seen that `alphabetically-first-1` ranges from 16 to
65535 calls for a list of length 16.  How many do you expect for
a random list of 16 elements?

<TODO: Enter your answer here>

Try some experiments to check your answer.

How many do you expect for a random list of 17 elements?

<TODO: Enter your answer here>
|#

#| A |#

; +---------------------------------------------+--------------------
; | Exercise 5: Analyzing the reverse procedure |
; +---------------------------------------------+

#|
At the top of this file, there are a variety of procedures for dealing
with lists.  Add a line of code to each of the procedures involved in
reversing lists so that it increments the appropriate counter in `RC`.
You should plan to count `list-reverse-1`, `list-reverse-2`, the helper in
`list-reverse-2`, and `list-append`.  For example,

(define list-append
  (lambda (front back)
    (counter-increment! RC 'list-append)
    ...))

(define list-reverse-2
  ...
    (letrec ([helper
              (lambda (l so-far)
                (counter-increment! RC 'helper)
                ...)])))
|#

#|
a. Find out how many times `list-append` is called in reversing a list of seven elements by entering the following commands in the interactions pane.

    > (counter-reset-all! RC)
    > (list-reverse-1 (range 7)
    > (display-counter RC)

<TODO: Enter the results of your experiment>
|#

#|
b. Did you get the same answer as in self-check 2(c)? If not, why do
you think you got a different result?

<TODO: Enter you comments>
|#

#|
c. Find out how many times `helper` is called in reversing a list of
seven elements with `list-reverse-2`.

<TODO: Enter the results of your experiment>
|#

#|
d. Did you get the same answer as in self-check 2(e)? If not, what
difference do you see?

<TODO: Enter any more results>
|#

#|
e. Write a procedure like `af-experiment!` or `af-random-experiment!`
that lets you quickly find the number of calls for each version of
`list-reverse`, given a list of length `n`.  

Note: Make sure to reset the counter between runs of `list-reverse-1`
and `list-reverse-2`.
|#

;;; (reverse-experiment! n) -> void?
;;;   n : integer? non-negative?
;;; Run some experiments in the running time of both versions of
;;;   `reverse` on a list of length `n`, printing out the results.
(define reverse-experiment!
  (lambda (n)
    ???))

#|
f. Conduct some experiments to see how the number of total steps
`list-reverse-1` and `list-reverse-2` take on different size lists.

<TODO: Enter your results here>
|#

#|
g. What patterns do you see in the running times?  That is, how does
each procedure grow with respect to the input size?  Spend no more
than three minutes on this subproblem and the next.

<TODO: Enter your analysis here>
|#

#|
h. Explain, to the best of your ability, why we get those results.

<TODO: Enter your explanation here>
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might try the following
problem, which ties together the two parts of this lab.
|#

; +-----------------------------------------------------------+------
; | Extra 1: Closing the circle: An analysis of binary search |
; +-----------------------------------------------------------+
#|
As you may have noted, we've already included a line in `binary-search`
for you to uncomment.  Do so now.
|#

#|
a. How would you use binary search to search a list of strings
to determine if a particular string is present?

<TODO: Enter code below.>

Hint: Review how we found small primes.
|#

;;; (binary-search-strings vec string) -> string? or boolean?
;;;   vec : vectorof string?
;;;   string : string?
;;; Search strings for a string equal to string, ignoring case.
(define binary-search-strings
  (lambda (vec string)
    ???))

#|
Here are some procedures to help you analyze binary search.
|#

;;; (random-sorted-strings n) -> listof string?
;;;   n : integer? non-negative?
;;; Create a random, sorted, vector of strings
(define random-sorted-strings
  (lambda (n)
    (list->vector (sort (random-list n random-id) string-ci<=?))))

;;; (binary-search-experiment! source value) -> void?
;;;   source : or (integer? non-negative?) (vectorof string?)
;;;   value : string?
;;; Run one experiment with binary search, searching for the given value
;;; in either (a) a vector of length source, if source is an integer,
;;; or (b) source, if source is a vector.
(define binary-search-experiment!
  (lambda (source value)
    (let ([vec (cond
                 [(and (integer? source) (not (negative? source)))
                  (random-sorted-strings source)]
                 [(vector? source)
                  source]
                 [else
                  (error "Invalid source: " source)])])
      (counter-reset-all! BSC)
      (write "Searching for ") (writeln value)
      (binary-search-strings vec value)
      (display-counter BSC))))
    
#|
b. Run some experiments using `binary-search-experiment!`.  For small
experiments, you might create the vector by hand.  For larger experiments,
you'll likely want to use an integer as a parameter.

<TODO: Enter your experiments>
|#

#|
c. In the interactions pane, create a large sorted vector of strings
using `random-sorted-strings`.  "large" means 10,000 or more elements.

E.g., (define subject (random-sorted-strings 200))
|#


#|
d. Determine how many steps it takes to search for

i. Some random elements that are in the vector.  (You can generate a random
element of the vector by generating a random index and grabbing the value
at that index.)

ii. Some random elements unlikely to be in the vector.  (You can use random-id
to generate those elements.)

iii. The first element of the vector.

iv. The last element of the vector.

v. Something less than the first element of the vector, such as "AAAAAA"

vi. Something after the last element of the vector, such as "ZZZZZZ".

<TODO: Enter the results of your experiments>
|#

#|
e. Create another large vector of double that size and repeat those
experiments.

<TODO: Enter the results of your experiments>
|#

#|
f. What did your experiments tell you about the running time for
binary search?

<TODO: Enter your analysis>
|#

; +----------------------------------+-------------------------------
; | Extra 2: Searching by other keys |
; +----------------------------------+

#|
a. As you may have observed, `simulated-students-by-id` contains the same
entries as in `simulated-students`, but with the students organized by
their id, rather than by name.

Write an expression to find a student with an id of 1658200
|#

;(define student-1658200
;  (binary-search simulated-students-by-id 1658200 ___ ___))

#|
b. As you may have observed, `simulated-students-by-year` contains the same
entries as in `simulated-students`, but with the students organized by
their year, rather than by name.

Write an expression to find a student with a graduation year of 2024
|#

;(define graduate-2024
;  (binary-search simulated-students-by-year 2024 ___ ___))

