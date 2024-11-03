---
title: Randomness and simulation
summary: |
  Up to this point, all of the programs we have written are,
  in some sense, predictable. That is, the output depends only on the
  input. However, we want some programs, such as games and simulations,
  to be less predictable. We may also want to have make drawings using
  unpredictable procedures, so that we can derive inspiration from
  unexpected results. In this reading, we consider Scheme's tools for
  supporting such unpredictability, particularly the `random` procedure.
---

## Introduction: Simulation

Many computing applications involve the simulation of games or
events, with the hope of gaining insights and identifying underlying
principles. In some cases, simulations can apply definite, well-known
formulae. For example, in studying the effect of a pollution source
in a lake or stream, one can keep track of pollutant concentrations in
various places. Then, since the flow of water and the interactions of
pollutants is reasonably well understood, one can follow the flow of
the pollutants over a period of time, according to known equations.

In other cases, specific outcomes involve some chance. For example,
when an automobile begins a trip and encounters a traffic light, it may
be a matter of chance whether the light is green, yellow, or red. Similar
uncertainties arise when considering genetic mutations or when tabulating
outcomes involving flipping a coin, tossing a die, or dealing cards. In
these cases, one may know about the probability of an event occurring
(a head occurs about half the time), but the outcome of any one event
depends on chance.

In studying events that involve some chance, one approach is to model the event or game, using a random-number generator as the basis for decisions. If such a model is simulated many times on a computer, the results may give some statistical information about what outcomes are likely and how often each type of outcome might be expected to occur. This approach to problem solving is called the *Monte Carlo Method*.

## The `random` procedure

A random number generator for a typical computer language is a procedure
that produces an unpredictable value each time it is called. Such
procedures simulate a random selection process. Scheme provides the
procedure `random` for this purpose. This procedure returns integer
values that depend on its parameter. In particular, `random` returns an
unpredictable integer value between 0 and one less than its parameter,
inclusive. By "unpredictable" we mean that we are unlikely to be
able to predict the number that `random` will return.

(_Note_: remember that the code snippets in the reading are live. You can
reload this page to see new random values!)

<pre class="scamper source">
(random 10)

(random 10)

(random 10)

(random 10)

(random 10)

(random 10)

(random 10)
</pre>

## Simulating a die

We can use `random` to write a program to simulate the rolling of a die. The simulation generates integers from 1 to 6, to correspond to the faces on the die cube. The details of this simulation are shown in the following procedure:

<pre class="scamper source">
;;; (roll-a-die) -> number
;;; Returns a random number in the range 1–6
(define roll-a-die
  (lambda ()
    ; N.B., translates a value in the range 0–5 to 1–6
    (+ (random 6) 1)))

(roll-a-die)
(roll-a-die)
(roll-a-die)
</pre>

We can use that procedure to simulate the roll of multiple dice.
The following procedure uses recursion to generate a list of random rolls by repeatedly calling `random`.

<pre class="scamper source">
(define roll-a-die
  (lambda ()
    (+ (random 6) 1)))

;;; (roll-dice n) -> list?
;;;   n : natural-number?
;;; Returns a list of randomly generated numbers in the range 1–6
(define roll-dice
  (lambda (n)
    (if (zero? n)
        null
        (cons (roll-a-die) (roll-dice (- n 1))))))

(roll-dice 4)
(roll-dice 12)
</pre>

## Generating text

We can also use `random` to select "unpredictable" elements of a list.
Let's start with a simple procedure.

<pre class="scamper source-only">
;;; (random-elt lst) -> any?
;;;   lst: list?
;;; Returns a random value from lst.
(define random-elt
  (lambda (lst)
    (list-ref lst (random (length lst)))))
</pre>

There are many ways to apply `random-elt`.  For example, here's
a collection of procedures that make an unpredictable sentence.
Make sure to study this so that you understand how it works!

<pre class="scamper source">
;;; (random-elt lst) -> any?
;;;   lst: list?
;;; Returns a random value from lst.
(define random-elt
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
(define people (list "Charlie" "Eric" "Fernanda" "Jerod" "Leah" "Nicole" "Peter-Michael" "Sam" "Sarah"))

;;; (random-person) -> string?
;;; Randomly select an element of the people list.
(define random-person
  (lambda ()
    (random-elt people)))

;;; transitive-verbs -> listof string?
;;; A short list of transitive verbs (those that take a direct object)
(define transitive-verbs (list "saw" "watched" "threw" "ate" "borrowed"))

;;; (random-transitive-verb) -> string?
;;; Randomly select among the transitive verbs
(define random-transitive-verb
  (lambda ()
    (random-elt transitive-verbs)))

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
     (random-elt articles) " "
     (random-elt adjectives) " "
     (random-elt nouns))))

(sentence)

(sentence)

(sentence)
</pre>

## Self checks

### Check: Testing `random` (‡)

{:type="a"}
1.  When you give the procedure `random` the parameter *`n`* (a non-negative integer), it will produce one of how many unique values?  What is the smallest value?  What is the largest?

2.  Evaluate the expression `(random 10)` several times.  Write down the values that you get.

3.  What values do you expect to get if you call `random` with 1 as a parameter?  Check your hypothesis experimentally.

4.  What do you expect to happen if you call `random` with 0 or -1 as a parameter?  Check your hypothesis experimentally.

5.  What do you expect to happen if you call `random` with non-integer parameters.  Check your hypothesis experimentally.

6.  Try calling `random` with no parameters. What happens?