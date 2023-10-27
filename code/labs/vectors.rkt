#lang racket

(require csc151)
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

#| B |#

; +-------------------------------+----------------------------------
; | Exercise 2: Vector efficiency |
; +-------------------------------+

#|
We've claimed that vectors are much faster than lists.  Let's
conduct an experiment to see how much of a difference we see.

Here's a quick experiment that might give us a sense as to how
well `list-ref` works on a long list.

    (define size 10000)
    (define rounds 50000)
    (define list-of-values (range size))
    (define list-result 
      (time (map (section list-ref list-of-values <>) list-of-values)))
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
      (time (map (section vector-ref vector-of-values <>) list-of-values)))

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
    (define vector-of-values (list->vector list-of-values))
    (define vector-result 
      (time (map (section vector-ref vector-of-values <>) list-of-values)))
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

#| B |#

; +-----------------------------------+------------------------------
; | Exercise 3: Vector-based palettes |
; +-----------------------------------+

#| A |#

#|
It is possible to represent a collection of colors (a “palette”)
as a vector. Why would we do so? Well, once we’ve chosen a palette,
we can represent an image as a collection of indices into that
palette. Such a representation is typically much more compact than
representing each color with the full RGB triplet.

For example, here is a palette that represents the colors in the
rainbow.
|#

(define rainbow-palette
  (list->vector
   (map color-name->color
        (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))))

; +---------------------------------------------+--------------------
; | Exercise 4: Darkening vector-based palettes |
; +---------------------------------------------+

#|
Write a procedure, (palette-darker! palette), that, given a vector of integer-encoded RGB colors, makes each color in the palette slightly darker (i.e., using color-darker).

Note that you will not build a new vector. Rather, you will replace each color in the existing vector by the darker version. You may use the recursion pattern(s) from the reading and number-vector-divide! as a starting point. If you do, be sure to cite your sources appropriately.
|#

(define palette-darker!
  (lambda (palette)
    ???))

#| A |#

; +---------------------------------+--------------------------------
; | Exercise 4: The brightest color |
; +---------------------------------+

#|
Write a procedure, (palette-brightest palette), that takes one argument,
a vector of colors, and returns the brightest color in that vector.
You can assume that every position in the vector contains a color.

You will need the definitions of color-brightness and color-brighter-of-two.
|#

;;; (color-brightness color) -> integer?
;;;   color : color?
;;; Compute the brightness of a color on a 0 .. 100 range.
(define color-brightness
  (lambda (color)
    (round (* 100 (/ (+ (* 30/100 (color-red color))
                        (* 59/100 (color-green color))
                        (* 11/100 (color-blue color)))
                      255)))))

;;; (color-brighter-of-two color1 color2) -> color?
;;;    color1 : color?
;;;    color2 : color?
;;; Find the brighter of two colors.
(define color-brighter-of-two
  (lambda (color1 color2)
    (if (>= (color-brightness color1) (color-brightness color2))
        color1
        color2)))

#| A |#

; +----------------------------+-------------------------------------
; | Exercise 5: Using palettes |
; +----------------------------+


#| B |#


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

; +---------------------------+--------------------------------------
; | Extra 1: Tallying letters |
; +---------------------------+
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

; +--------------------------------------+---------------------------
; | Extra 1: Tallying letters, revisited |
; +--------------------------------------+

#|
Write a new version of `tally-letters-in-string` that counts
up from 0 to the string length, rather than down from the length
to 0.
|#
