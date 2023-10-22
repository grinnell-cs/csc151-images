#lang racket

(require csc151)
(require csc151/rex)
(require rackunit)


;; CSC-151-NN (SEMESTER)
;; Lab: Vectors (vectors.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (random-list-elt lst) -> any/c?
;;;   lst : list?
;;; Randomly select an element from the list.
(define random-list-elt
  (lambda (lst)
    (list-ref lst (random (length lst)))))

;;; (random-vector-elt vec) -> any/c?
;;;   vec : vector?
;;; Randomly select an element from the vector.
(define random-vector-elt
  (lambda (vec)
    (vector-ref vec (random (vector-length vec)))))

;;; (random-nums len max) -> listof integer?
;;;    len : non-negative-integer?
;;;    max : positive-integer?
;;; Make a list of length `len`, containing unpredictable numbers
;;; from the range [0..max).
(define random-nums
  (lambda (len max)
    (letrec ([helper
              (lambda (len so-far)
                (if (zero? len)
                    so-far
                    (helper (- len 1) (cons (random max) so-far))))])
      (helper len '()))))

;;; (ref-experiment collection rounds) -> void?
;;;   collection : (vectorof integer?) or (listof integer?)
;;;   rounds : natural?
;;; Look for integers selected randomly from the range between 
;;; 0 and the length of collection.  
;;;
;;; Returns nothing.  Used mostly for timing purposes.
(define ref-experiment
  (lambda (collection rounds)
    (let* ([ref (if (vector? collection) 
                    vector-ref 
                    list-ref)]
           [len (if (vector? collection) 
                    (vector-length collection)
                    (length collection))])
      (letrec ([kernel
                 (lambda (n)
                   (when (> n 0)
                     (ref collection (random len))
                     (kernel (- n 1))))])
        (kernel rounds)))))

;;; word-list : listof string?
;;; A sample list of strings, taken from one of the Project Gutenberg
;;; collection.
;;; N.B., the paragraph is adapted from our old friend, Jane Eyre, 
;;  in the version from Gutenberg:
;;;   https://www.gutenberg.org/cache/epub/1260/pg1260.txt
(define word-list
  (rex-find-matches (rex-repeat (rex-any-of (rex-char-range #\a #\z) 
                                            (rex-char-range #\A #\Z)))
                    "A preface to the first edition of Jane Eyre being unnecessary, I gave none; this second edition demands a few words both of acknowledgment and miscellaneous remark.  My thanks are due in three quarters.  To the Public, for the indulgent ear it has inclined to a plain tale with few pretensions.  To the Press, for the fair field its honest suffrage has opened to an obscure aspirant.  To my Publishers, for the aid their tact, their energy, their practical sense and frank liberality have afforded an unknown and unrecommended Author. The Press and the Public are but vague personifications for me, and I must thank them in vague terms; but my Publishers are definite: so are certain generous critics who have encouraged me as only large-hearted and high-minded men know how to encourage a struggling stranger; to them, _i.e._, to my Publishers and the select Reviewers, I say cordially, Gentlemen, I thank you from my heart.  Having thus acknowledged what I owe those who have aided and approved me, I turn to another class; a small one, so far as I know, but not, therefore, to be overlooked.  I mean the timorous or carping few who doubt the tendency of such books as \"Jane Eyre:\" in whose eyes whatever is unusual is wrong; whose ears detect in each protest against bigotry--that parent of crime--an insult to piety, that regent of God on earth.  I would suggest to such doubters certain obvious distinctions; I would remind them of certain simple truths."))

;;; word-vector : vectorof string?
;;; A sample vector of strings, taken from one of the Project Gutenberg
;;; collection.
(define word-vector
  (list->vector word-list))

;;; (random-word words) : string?
;;;   words : (or/c (listof string?) (vectorof string?))
;;; Randomly select a string from words.
(define random-word
  (lambda (words)
    (if (vector? words)
        (random-vector-elt words)
        (random-list-elt words))))
    
;;; (random-words words) -> listof? string
;;;   words : (or/c (listof string?) (vectorof string?))
;;; Create a list of `n` words randomly selected from `words`.
(define random-words
  (lambda (words n)
    (if (zero? n)
        null
        (cons (random-word words)
              (random-words words (- n 1))))))

;;; (number-vector-increment-at! vec index) -> (void)
;;;   vec : vectorof number?
;;;   index : integer?
;;; Add 1 to the value at the given index.  Requires that the vector
;;; have at least index+1 elements.
(define number-vector-increment-at!
  (lambda (vec index)
    (vector-set! vec 
                 index 
                 (+ 1 (vector-ref vec index)))))

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
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 1: Modifying vectors |
; +-------------------------------+

#|
Suppose we are considering two names for the same vector and want to
try to change the first element. Consider the following code. (That is,
*read it, don't enter it*.)

    > (define chinchilla (vector "a" "b" "c" "d"))
    > (define dingo chinchilla)
    > (define emu (vector-copy chinchilla))
    > (vector-set! chinchilla 0 "Z")

a. What do you expect the output of the following commands to be? (That
is, think about the answers and type the results; don't type the commands
in the Interactions pane.)

    > (vector-ref chinchilla 0)
    _____
    > (vector-ref dingo 0)
    _____
    > (vector-ref emu 0)
    _____
|#

#|
b. Check your answer experimentally. That is, type the commands in
the interactions pane now.  Then enter your answers.

    > (vector-ref chinchilla 0)
    _____
    > (vector-ref dingo 0)
    _____
    > (vector-ref emu 0)
    _____
|#

#|
c. What do you expect the results of the following to be?

    > (let* ([gibbon (vector "a" "b" "c" "d")]
             [hippo gibbon]
             [ibex (vector-copy gibbon)])
        (vector-set! gibbon 0 "Z")
        (list gibbon hippo ibex))

    <TODO: Enter expected output.>
|#

#|
d. Check your answer experimentally.

<TODO: Enter actual output>
|#

#|
e. What do your results of these experiments suggest about vectors in Scheme?

<TODO: Enter your notes.>
|#

; +---------------------------------------+--------------------------
; | Exercise 2: Selecting random elements |
; +---------------------------------------+

#|
a. Explain the difference between `random-list-elt`, `random-vector-elt`, 
and `random-word`.

<TODO: Enter your explanation.>
|#

#|
b. Using `random-words` and `word-list`, make a list of ten randomly
selected words.

<TODO: Enter your code and the output, copied from the interactions pane.>
|#

#|
c. Using `random-words` and `word-vector`, make a list of ten randomly
selected words.

<TODO: Enter your code and the output, copied from the interactions pane.>
|#

#|
d. What do you expect to get from each of the following?  (That is,
how many values do you expect to get and what range of values do
you expect to get?)

    (random-nums 10 20)
    (random-nums 20 10)

|#

#|
e. Check your answer experimentally.

<TODO: Enter the results from the interactions pane here.>
|#

#| B |#

; +-------------------------------+----------------------------------
; | Exercise 3: Vector efficiency |
; +-------------------------------+

#|
We've claimed that vectors are much faster than lists.  Let's
conduct an experiment to see how much of a difference we see.

Here's a quick experiment that might give us a sense as to how
well `list-ref` works on a long list.

    (define size 10000)
    (define rounds 50000)
    (define list-of-values (range size))
    (define list-of-probes (random-nums rounds size))
    (define list-result 
      (time (map (section list-ref list-of-values <>) list-of-probes)))
|#

#|
a. Explain what it happening in this experiment.

<TODO: ENTER EXPLANATION>
|#

#|
b. Find values for `size` and `rounds` that make the computation
of `list-result` take around half a second (500 milliseconds; anywhere
between 300 milliseconds and 800 milliseconds should be fine). 

<TODO: ENTER NUMBERS AND RESULT TIME>
|#

#|
c. What do you expect to happen to the time for the computation of
`list-result` if we double the number of rounds (`rounds`)?  What
if we triple it?  

Check your answer experimentally and update as appropriate.  Make
sure to start with the values from b.

<TODO: ENTER YOUR EXPERIMENTS HERE, WITH NOTES AS TO SIZE>

<TODO: ENTER YOUR FINAL ANSWER HERE>
|#

#|
d. What do you expect to happen to the time for the computation if
we double the list size (`size`)?  What if we triple it?

Check your answer experimentally and update as appropriate.  Make
sure to start with the values from b.

Check your answer experimentally and update as appropriate.

<TODO: ENTER YOUR EXPERIMENTS HERE, WITH NOTES AS TO SIZE>

<TODO: ENTER YOUR FINAL ANSWER HERE>
|#

#|
e. Here's a followup experiment for vectors.

    (define vector-of-values (list->vector list-of-values))
    (define vector-result 
      (time (map (section vector-ref vector-of-values <>) list-of-probes)))

Will `vector-result` be the same as `list-result`?  Why or why not?

<ENTER YOUR ANSWER HERE>
|#

#|
f. Check your answer experimentally

    (equal? list-result vector-result)
|#

#|
g. Without changing `size`, find a value of `rounds` that makes
the computation of `vector-result` take about 50 milliseconds 
(anywhere between 30 and 80 should be fine.  

**Make sure that you do not recompute list-result**.  

    (define size 10000)
    (define rounds 2000000)
    (define list-of-values (range size))
    (define list-of-probes (random-nums rounds size))
    (define vector-of-values (list->vector list-of-values))
    (define vector-result 
      (time (map (section vector-ref vector-of-values <>) list-of-probes)))
|#

#|
h. What do you expect to happen to the time for the computation of
`vector-result` if we double the number of rounds (`rounds`)?  What
if we triple it?

Check your answer experimentally and update as appropriate.

<TODO: ENTER YOUR EXPERIMENTS HERE, WITH NOTES AS TO SIZE>

<TODO: ENTER YOUR FINAL ANSWER HERE>
|#

#|
i. What do you expect to happen to the time for the computation if
we double the vector size (given by `size`)?  What if we triple
it?

Check your answer experimentally and update as appropriate.

<TODO: ENTER YOUR EXPERIMENTS HERE, WITH NOTES AS TO SIZE>

<TODO: ENTER YOUR FINAL ANSWER HERE>
|#

#|
j. What have you taken from these experiments?

<TODO: ENTER AN ANSWER HERE>
|#

#| A |#

; +------------------------------+-----------------------------------
; | Exercise 4: Tallying letters |
; +------------------------------+

#|
a. Fill in the missing parts of the documentation for the following
procedure.
|#

;;; (lowercase->number letter) -> ___
;;;   letter : char? (#\a through #\z)
;;; ____
(define lowercase->number
  (let ([a-num (char->integer #\a)])
    (lambda (letter)
      (- (char->integer letter) a-num))))

#|
b. Using `lowercase->number` and `number-vector-increment-at!`, write
a procedure, `(record-letter! tallies letter)`, that takes as input a
vector of integers (representing tallies of the 26 letters) and a letter,
and updates the appropriate entry in the tallies.

    > (define tallies (make-vector 26 0))
    > tallies
    '#(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
    > (record-letter! tallies #\c)
    > (record-letter! tallies #\z)
    > (record-letter! tallies #\c)
    > tallies
    '#(0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1)
|#

;;; (record-letter! tallies letter) -> void?
;;;   tallies : vectorof integer? (length 26)
;;;   letter : char? (#\a through #\z)
;;; Add to the tally for the given letter.
(define record-letter!
  (lambda (tallies letter)
    ???))

#|
c. Finish the following definition of `tally-letters-in-string`, which
takes as input a string and returns a vector that tallies the letters
of the string.

Note that `(when TEST EXP1 EXP2 ...)` first evaluates the test.  If
the test holds, it then evaluates the expressions in sequence,
returning the value of the last one.  It is essentially the same
as `(cond [TEST EXP1 EXP2 ...])`.
|#

;;; (tally-letters-in-string str) -> vectorof integer?
;;;   str : string?
;;; Count how many time each lowercase letter appears in str.
(define tally-letters-in-string
  (lambda (str)
    (let ([tallies (make-vector 26 0)])
      (tally-letters-in-string/helper str 
                                      tallies
                                      (- (string-length str) 1))
      tallies)))

;;; (tally-letters-in-string/helper str tallies pos) -> (void)
;;;   str : string?
;;;   tallies : vectorof integer? (length 26)
;;;   pos : non-negative integer?
;;; Tallies the letters in str from 0 to pos (inclusive)
(define tally-letters-in-string/helper
  (lambda (str tallies pos)
    (when (>= pos 0)
      (let ([ch (string-ref str pos)])
        (when (char<=? #\a ch #\z)
          ???))
      ???)))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yup, it's that time.  You should know the drill.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might try the following
exercise.
|#

; +--------------------------------------+---------------------------
; | Extra 1: Tallying letters, revisited |
; +--------------------------------------+

#|
Write a new version of `tally-letters-in-string` that counts
up from 0 to the string length, rather than down from the length
to 0.
|#
