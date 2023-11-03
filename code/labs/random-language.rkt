#lang racket

(require csc151)
(require rackunit)

;; CSC-151 (SEMESTER)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------+--------------------------------------------------
; | Supplied code |
; +---------------+

;;; (roll-a-die) -> integer?
;;; Simulate the rolling of a die by returning an unpredictable
;;; integer between 1 and 6, inclusive.
(define roll-a-die
  (lambda ()
    (random 1 7)))   ; Yet another version of `random`

;;; (roll-dice n) -> listof integer?
;;;   n : non-negative-integer?
;;; Create a list consisting of the values from `n` dice rolls
(define roll-dice
  (lambda (n)
    (if (zero? n)
        null
        (cons (roll-a-die) (roll-dice (- n 1))))))

;;; (random-list-element lst) -> any?
;;;   lst : listof any?
;;; Randomly select an element of `lst`
(define random-list-element
  (lambda (lst)
    (list-ref lst (random (length lst)))))

;;; (sentence) -> string?
;;; Generate a random sentence.
(define sentence
  (lambda ()
    (string-append
     (random-person) " "
     (random-transitive-verb) " "
     (random-object) ".")))

;;; people -> listof string?
;;; A list of some of the folks who teach 151
(define people (list "Peter-Michael" "Nicole" "Sarah" "SamR" "Barbara" "Priscilla" "Jerod"))

;;; (random-person) -> string?
;;; Randomly select an element of the people list.
(define random-person
  (lambda ()
    (random-list-element people)))

;;; transitive-verbs -> listof string?
;;; A short list of transitive verbs (those that take a direct object)
(define transitive-verbs (list "saw" "watched" "threw" "ate" "borrowed"))

;;; (random-transitive-verb) -> string?
;;; Randomly select among the transitive verbs
(define random-transitive-verb
  (lambda ()
    (random-list-element transitive-verbs)))

;;; articles -> listof string?
;;; A short list of articles.
(define articles (list "the" "a"))

;;; adjectives -> listof string?
;;; A short list of adjectives.
(define adjectives (list "heavy" "blue" "green" "hot" "cold" "disgusting"))

;;; nouns -> Listof string?
;;; A short list of nouns (or noun phrases).
(define nouns (list "cup of coffee" "computer" "classroom"
                    "PBJ algorithm" "homework assignment"))

;;; (random-object) -> string?
;;; Generate a random noun-phrase that can serve as the object of a
;;; transitive verb.
(define random-object
  (lambda ()
    (string-append
     (random-list-element articles) " "
     (random-list-element adjectives) " "
     (random-list-element nouns))))

;;; (average nums) -> real?
;;;   nums : listof? real
;;; Find the average of a nonempty list of real numbers.
(define average
  (lambda (nums)
    (/ (reduce + nums)
       (length nums))))

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Introduce yourself to your partner, discuss work habits, decide what
you will be doing at the end of class.

b. Quickly skim through the *documentation* for the procedures above to
make sure you understand their goals.  Ask the members of the lab staff
if any seem confusing to you.

c. Save this file as `random-language.rkt`.  And remember to save often;
random things can go wrong.

Do not submit anything for this exercise; it's just a reminder to take
these first steps.
|#

#| A |#

; +----------------------------------+-------------------------------
; | Exercise 1: Averaging dice rolls |
; +----------------------------------+

#|
One way to explore the quality of our `roll-a-die` procedure is to
average a bunch of dice rolls. Arguably, if the dice are "fair",
we should find that the average is about 3.5.

a. Try a few experiments to see if we usually get an average of
about 3.5 (or 3 1/2, since we're working with exact numbers) if we
roll five dice.

> (average (list (roll-a-die) (roll-a-die) (roll-a-die) (roll-a-die) (roll-a-die))
???

<TODO: ENTER RESULTS AND OBSERVATIONS>

|#

#|
b. Can our experiment ever give a result of exactly 3 1/2? Why or
why not?

<TODO: ENTER ANSWER>
|#

#|
c. Try a few experiments in which you roll ten dice. We assume you can figure
out how to do so by modifying the experiment presented above.

<TODO: ENTER RESULTS AND OBSERVATIONS>
|#

#|
d. Can this revised experiment ever give a result of exactly 3 1/2? Why or why not?

<TODO: ENTER ANSWER>
|#

; +-----------------------------------+------------------------------
; | Exercise 2: Rolling multiple dice |
; +-----------------------------------+

#|
Some students, when confronted with the prior problem, write the
following to find the average of ten dice rolls.  *Do not type
the expression yet!*

> (average (make-list 10 (roll-a-die)))
|#

#|
a. What do you see as the advantages and disadvantages of that approach?
|#

#|
b. Try that experiment a few times. Do you get results that you
expected? If you did not expect the results you got, try to explain
them. If you did get the results you expected, explain those.

|#

#|
c. Try the following expression a following expression a few times
and see if it heps explain what was happening.

> (make-list 10 (roll-a-die))
|#

; +----------------------------------------------+-------------------
; | Exercise 3: Rolling multiple dice, revisited |
; +----------------------------------------------+

#|
As you've likely determined, the `roll-dice` procedure from the reading
is a better way to reliably roll an arbitrary number of dice.
|#

#|
a. Conduct a few experiments with a large number of dice (say 1000 or
more) to see whether we seem to get an appropriate average.  

<TODO: ENTER RESULTS AND OBSERVATIONS>
|#

#|
b. `roll-dice` creates a list.  As you've seen before, rather than
creating a list, we can just add as we go.  Write a recursive
procedure, `(sum-dice n)`, that gives the sum of the rolls of `n`
dice.  You may assume that `n` is a positive integer.  

Your procedure should not create a list.  Among other things, that
means you cannot call `roll-dice` in writing `sum-dice`.  Use 
recursion instead!
|#

(define sum-dice
  (lambda (n)
    ???))

#|
c. Using `sum-dice` as a helper, write a procedure, `(average-roll n)`, 
that computes the average value of `n` dice rolls.  You may assume
that `n` is a positive integer.
|#

(define average-roll
  (lambda (n)
    ???))

#| B |#

; +-----------------------------------------+------------------------
; | Exercise 4: Tallying sevens and elevens |
; +-----------------------------------------+

#|
There are some games of chance in which the player rolls two dice
and if those two dice total seven or eleven, the player wins. It
might be interesting to determine how often we are likely to roll
a seven or eleven in n rolls of two dice.

Consider the following pair of procedures intended to help us achieve
that goal.
|#

;;; (pair-a-dice) -> integer?
;;; Roll two dice and return their result, which should be an
;;; integer between 2 and 12 (but not with an even distribution).
(define pair-a-dice
  (lambda ()
    (+ (roll-a-die) (roll-a-die))))

;;; (play-seven-eleven) -> integer?
;;; Play one round of the seven-eleven game.  Return 1 for a
;;; victory and 0 for a loss.
(define play-seven-eleven
  (lambda ()
    (cond
      [(= 7 (pair-a-dice))
       1]
      [(= 11 (pair-a-dice))
       1]
      [else
       0])))

#|
a. Verify that both `pair-a-dice` and `play-seven-eleven` appear to
work as advertised. (Note that, in our own experiments, it can take
as many as ten rolls before you win; theoretically, it could take
many more.)

> (pair-a-dice)
?
> (pair-a-dice)
?
> (play-seven-eleven)
?
> (play-seven-eleven)
?
> (play-seven-eleven)
?

<TODO: ENTER RESULTS AND OBSERVATIONS>

|#

#|
b. Make a list of all the rolls of a red die and a black die that
will give you seven or eleven.  For example, red 1 and black 6 give
you 7, as do red 6 and black 1; red 6 and and black 5 give you
eleven.  Using that list, compute the probability that you roll
seven or eleven.  (There are thirty-six different possible rolls
on two dice.) How many games would you expect to win if you played
36,000 games?

<TODO: ENTER NOTES AND ANALYSIS>
|#

#|
c. We might also want to compute the experimental probability of
winning.  Write a recursive procedure, `(count-wins n)`, that 
plays the seven-eleven game `n` times and reports how many wins
there are.
|#

;;; (count-wins n) -> integer?
;;;   n : non-negative-integer?
;;; Play `n` games of seven-eleven and determine how many times
;;; you win.
(define count-wins
  (lambda (n)
    ???))

#|
d. Using `count-wins`, determine how many wins you get in 36,000 games.
You may want to conduct a few experiments.   What, if anything, do you 
notice?

<TODO: ENTER RESULTS AND OBSERVATIONS>
|#

; +-------------------------------------+----------------------------
; | Exercise 5: Exploring subtle errors |
; +-------------------------------------+

#|
You may have noted that we got fewer wins than expected.  (The house
cheats, it appears.)  That suggests that there is a subtle error in
`play-seven-eleven`.  You may have even discovered it.  It's okay
if you haven't.

Whether or not you've discovered the error, we're going to consider 
how you might find it.
|#

#|
a. How many dice rolls should happen if we call `(count-wins 10)`?
(The question is not how many do happen; the question is how many
times should we roll the dice if we play ten games of seven-eleven?

<TODO: ENTER AN ANSWER>
|#

#|
b. Replace the `pair-a-dice` procedure above with this variant that
prints out "Rolling ..." each time it is called.

(define pair-a-dice
  (lambda ()
    (displayln "Rolling ...")
    (+ (roll-a-die) (roll-a-die))))

Then verify experimentally that this behaves as expected.

<TODO: ENTER YOUR EXPERIMENT AND ANY COMMENTARY>
|#

#|
c. Determine how many times we roll the dice in `(count-wins 10)`.  Is
it the same as the number you indicated in part a?  Is it always the
same?

<TODO: ENTER YOUR EXPERIMENT AND ANY COMMENTARY>
|#

#|
d. As your experiment likely showed, we seem to be rolling the dice
more times than we expected.  Determine why.

<TODO: ENTER YOUR ANALYSIS>
|#

#|
e. Fix `play-seven-eleven`, deleting the copy from above and putting 
the fixed version here.
|#

; Enter code here

; +----------------------------+-------------------------------------
; | Exercise 6: Choosing names |
; +----------------------------+

#|
Suppose we have a list of names, `students`, that represents all
of the students in a class. 
|#

;;; students : listof string?
;;; A list of students in a fictitious class
(define students
  (list "Andi" "Brook" "Casey" "Devin" "Drew" "Dylan" "Emerson" "Frances"
        "Gray" "Harper" "Jamie" "Kennedy" "Morgan" "Phoenix" "Quinn" "Ryan"))

#|
a. Write a zero-parameter procedure, `(random-student)`, that randomly
selects the name of a student from the class.  You may certainly rely
on other procedures we've written before.
|#

;;; (random-student) -> ???
;;; ???
(define random-student
  ???)

#|
b. Write a zero-parameter procedure, (random-pair), that calls
(random-student) twice and puts the two students together into a
list.
|#

;;; (random-pair) -> ???
;;; ???
(define random-pair
  ???)

#|
c. What are some potential problems with using (random-pair) to select
partners for the class?

<TODO: ENTER AN ANSWER HERE>
|#

#| A |#

; +----------------------------------+-------------------------------
; | Exercise 7: Generating sentences |
; +----------------------------------+

#|
a. Using the `sentence` procedure from the reading, generate about
five different sentences.

<TODO: ENTER THE SENTENCES>
|#

#|
b. Add a few names, verbs, adjectives, and nouns to expand the range
of sentences, then generate five new sentences.

<TODO: Summarize the words you entered (perhaps by copying the
new definitions here.>

<TODO: ENTER THE SENTENCES>
|#

; +-------------------------+----------------------------------------
; | Exercise 8: Madder libs |
; +-------------------------+

#|
There's a famous party game called "Mad Libs" in which one player
starts with a template for a story and asks other players to supply
different types of words without knowing the context.

Here's a sample Racket procedure that does a simple form of Mad Libs.
|#

(define mad-labs
  (lambda (adjective1 adjective2 verb noun1 noun2 noun3 name)
    (string-append "CSC 151 labs made me "
                   adjective2
                   ".  Each day we "
                   verb
                   " "
                   noun3
                   "s.  I had the opportunity to work with many "
                   adjective1
                   " "
                   noun1
                   "s.  I would definitely recommend this class to "
                   name
                   "'s "
                   noun2
                   ".")))

#|
a. Try calling `mad-labs` with the parameters "sleepy", "tearful", 
"defenestrate", "dragon", "dog", "cat", and "President Harris".

<TODO: ENTER THE RESULT>
|#

#|
b. Write a zero-parameter procedure, `(random-mad-labs)`, that uses
mad-labs to generate a story with parameters randomly selected from
the appropriate grammatical category. You should not change the
mad-labs procedure, nor should you copy its body. Rather, random-mad-labs
should generate an appropriate call to mad-labs.
|#

(define random-mad-labs
  (lambda ()
    ???))

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#| 
If, for some reason, you find that you have extra time, you might attempt
one or more of the following extra exercises.
|#

; +--------------------------+---------------------------------------
; | Extra 1: Flipping a coin |
; +--------------------------+

#|
a. Write a zero-parameter procedure, `(heads?)`, that simulates the
flipping of a coin. The `heads?` procedure should return #t (which
represents "the coin came up heads") half the time and #f (which
represents "the coin came up tails") about half the time.

> (heads?)
#f
> (heads?)
#f
> (heads?)
#t
> (heads?)
#f
> (heads?)
#t
|#

(define heads?
  ???)

#|
b. Write a procedure, (count-heads n), that simulates the flipping of n coins (using heads? to simulate the flipping of each coin) and returns the number of times the coin is heads.
|#

(define count-heads
  (lambda (n)
    ???))

#|
c. Use count-heads to explore the distribution heads? gives by
counting the number of heads you get in 100 flips, 1,000 flips, and
10,000 flips.

<TODO: INSERT EXPERIMENTS AND ANALYSIS>
|#

; +----------------+-------------------------------------------------
; | Extra 2: Haiku |
; +----------------+

#|
Haiku are three-line poems that consist of a line with five syllables,
a line with seven syllables, and a line with five syllables. Write
a procedure to generate random Haiku.
|#

; +--------------------+---------------------------------------------
; | Extra 3: Limericks |
; +--------------------+

#|
Read the [Poets.org](https://poets.org) guidance about [the form
of limericks](https://poets.org/glossary/limerick). Then, describe
how you would write a program that randomly generates limericks.

And keep it clean, folks.
|#

; +----------------------+-------------------------------------------
; | Extra 4: Rolling ... |
; +----------------------+

#|
Channel your inner John Belushi, Tina Turner, or John Fogerty to
use the extended pair-a-dice procedure to make variants of "Rawhide"
or "Proud Mary".

Note: This question exists primarily to amuse one of the older CS
faculty.  It's fine if you don't understand it; neither do the
younger CS faculty.  And no, they would not suggest channeling your
inner Frankie Laine.

Note: If you'd really like an explanation, do a Web search for "John
Belushi Rawhide" or "Tina Turner Proud Mary".  
|#
