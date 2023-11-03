---
title: Random language generation
summary: |
  We explore Racket's `random` procedure and ways to use that procedure
  and a variety of associated procedures to generate language.  We 
  consider the implications of having a procedure that does not behave
  consistently.  We also simulate some games of chance.
link: true
todo: 
  - It's generally the right level of difficulty and the right length.
  - Consider using some of the infamous lac language generating procs.
---

## Important procedures

* `(random n)`: given a positive integer, generate a difficult-to-predict integer value between 0 (inclusive) and `n` (exclusive).
* `(random)`: generate a difficult-to-predict real value between 0 (inclusive) and 1 (exclusive).
* `(random a b)`: Given two exact integers, the second of which is larger than the first, generate a difficult-to-predict value between `a` (inclusive) and `b` (exclusive).

## Preparation

<!--
a. Decide who is side A and who is side B.  

A side: [random-language-a.rkt](../code/labs/random-language-a.rkt)

B side: [random-language-b.rkt](../code/labs/random-language-b.rkt)

b. Decide who will submit the lab.
-->

a. Introduce yourself to your partner, discuss strengths and weaknesses, decide how you wll approach the lab.

b. Download the lab.

* [random-language.rkt](../code/labs/random-language.rkt)

c. Review the procedures included in the lab to make sure you
understand what they are intended to do.

## Acknowledgements

This laboratory was inspired by [an earlier lab on randomness from
the spring 2018 version of CSC
151](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/readings/randomness).
That lab was, itself, based on a sequence of earlier labs on
randomness and simulation.

This version also adds some new exercises on language generation using
new procedures in the `csc151` library.  Those exercises were inspired
by similar exercises designed for the summer 2018 "language of code"
camp.

For those who care, the punny `pair-a-dice` first appeared in [an
exercise in spring
2001](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2001S/Labs/simulation.html).
It then resurfaced (with a definition) in [a Web-game exercise in
fall
2002](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2002F/Labs/simulation.html).
