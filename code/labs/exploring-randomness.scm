;; CSC 151-NN (TERM)
;; Lab: Exploring Randomness
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import image)
(import lab)
(import music)

;; -----------------------------------------------------------------------------
(part "Introduction")

;; In this lab, we will explore exactly one new function in the standard
;; library: random! Try executing this program now to observe how calls
;; to random work.

(random 10)

(random 10)

(random 10)

;; You should see that (random 10) evaluates to a number in the range 0
;; to 10 (exclusive, i.e., 0--9). Try running the program a few times
;; and observe how on each invocation of the program, the result of
;; random is just that, random!
;;
;; Up until this point, our programs have always behaved deterministically,
;; that is, they have always produced the same output, no matter how many times
;; we executed them. While convenient, sometimes we want to have our programs
;; exhibit "random" behavior. The random function in Scheme allows us to do
;; just that!

;; -----------------------------------------------------------------------------
(part "Problem 1: Guessing Game")

;; Using random, write a function (guessing-game n guess) that takes two inputs:
;;
;; + n, a non-negative integer, is a bound on the guessing game.
;; + guess, a non-negative integer, is a number that you, the user, guesses.
;;
;; The function generates a random number in the range 0 to n-1. If guess is
;; equal to that number, then the function outputs "you win!" Otherwise, the
;; function outputs "you lose!"
;;
;; (guessing-game 10 3)  [internally, the function randomly generates 3]
;; > "you win!"
;; (guessing-game 10 3)  [internally, the function randomly generates 8]
;; > "you lose!"

(define guessing-game
  (lambda (n guess)
    ;; TODO: implement me!
    "..."))

(display (guessing-game 10 3))

;; -----------------------------------------------------------------------------
(part "Problem 2: Making Lists Randomly")

;; In the reading, (roll-dice n) make a list of n numbers randomly generated
;; in the range 1–6. This function was implemented recursively. However, was
;; that necessary? Consider the following alternative implementation of
;; roll-dice that uses the make-list function.

(define roll-a-die
  (lambda ()
    (+ (random 6) 1)))

(define roll-dice
  (lambda (n)
    (make-list n (roll-a-dice))))

;; Test roll-dice by calling it a few times below. You should observe a problem
;; with this implementation! Fill in the description below with your
;; observation.

(description "The problem with roll-dice is...")

;; Now, use your mental model of computation to explain why the lab version of
;; roll-dice does not work and why the recursive version found in the reading
;; does work. Fill in your explanation below.

(description "Lab roll-dice is broke because...")

(description "Reading roll-dice works because...")


;; -----------------------------------------------------------------------------
(part "Problem 3: Do the Shuffle")

;; A common operation we might want to do to collections of elements is
;; shuffling them. A common algorithm for shuffling a vector of elements is the
;; Fisher-Yates shuffle (https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle)
;; which we can implement using numeric recursion. The core idea is to swap each
;; element of the list with an element to the left of it in the vector.
;;
;; To shuffle the ith element of a vector v:
;; - i = 0: There are no elements to the left of the 0th element, so do nothing.
;;          We can "do nothing" by returning void.
;; + i > 0: Let j be a random number in the range 0–i. Swap the ith element of v
;;          with the jth element of v.
;;
;; Implement (shuffle vec) below using numeric recursion. Make sure to create
;; a helper function that implements the recursive strategy above as per our
;; previous labs on vectors!

(define shuffle
  (lambda (vec)
    ;; TODO: implement me
    void))

(define vec (vector-range 10))

; N.B., the ignore function surpressing the automatic displaying of values
; to the output, useful for functions that return void.
(ignore (shuffle vec))

(display vec)

;; -----------------------------------------------------------------------------
(part "Problem 4: Random Art")

;; Randomness is a fun way to generate novel images or music. For this final
;; problem, freestyle with your partner on creating an interesting drawing, e.g.,
;; a simple fractal, or a musical composition, that uses random in some way.
;; Examples of way you might employ randomness:
;;
;; + Randomly choose from among a list of shapes.
;; + Randomly generate one or more RGB components to a color.
;; + Randomly generate note values.
;; + Randomly choose a duration from a list.

;; TODO: implement and display your random art below!
 