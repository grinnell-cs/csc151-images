---
title: "EBoard 06 (Section 1): Basic Types"
number: 6
section: eboards
held: 2023-09-06
link: true
---
# {{ page.title }}

_Reminders to Self_

* **Warning** This class is being recorded.
* Post link to Otter.ai.

_Getting started_ (this will be our normal start-of-class sequence)

**Updated for Covid spread**

* Grab a card.  The card will have a computer name and a location.
* Remember the name and location.
* Drop the card back in the jar.
* Navigate to the computer.
* If you arrive first, get a santizing cloth and wipe down the station.
  Then log in and load the lab, but don't start.
* When both partners arrive, introduce yourselves.

_Approximate overview_

* Administrivia 
* About quizzes
* About MP2
* Questions
* Lab

Administrivia
-------------

### Introductory notes

* Attendance
* Remember: Support is available
    * Mentor sessions: Sundays 1-2 in Science 3813 (this room).
    * Evening tutors: Sunday 3-5, Sunday-Thursday 7-10pm in 3813/3815.
    * Sam (via office hours, email, and Teams Chat).
    * Individual tutors.
* Please TeamsChat or email me when you notice something missing (such
  as the symbols reading).
* Tracing should work (albeit slightly oddly) with procedures, provided
  you use `(define/trace proc defn)` rather than `(define proc defn)`.
    * Demo
* Using Gradescope
    * Demo
* Clarifications on tokens
    * Earn by writing a few sentences about the activity.  Give me the
      date and thing, too.
    * I'll charge them automatically.  At least I'll try to.

### Upcoming Token activities

Academic

Cultural

* Org Fair, Thursday, 4pm-7pm, "Outside"

Peer

* Football vs. Rippon, 1pm Saturday, 9 Sept 2023

Wellness

### Upcoming work

* Two readings for Friday; Complete the reading assignment on Gradescope by 
  Tuesday night.
* Lab writeup(s) due before class on Friday.
* MP01 due Thursday night.
    * Gradescope submission form should appear this afternoon.
* MP01 post-assessment due Friday night.
    * I recommend you do it immediately after MP01.
* MP02 pre-assessment also due Friday night
* MP02 due next Thursday.
* Quiz Friday: Tracing

About quizzes
-------------

* We have fifteen-minute paper quizzes most Fridays at the start 
  of class.  These count as learning assessments (or "LAs").
* It's fine if you don't get it right; you'll have other chances.
    * I'll announce the other chances.  I'm still working on 
      scheduling those correctly.
* If you need or would like extended time, please come to class at 
  8:00 a.m. on Friday. (Let me know if that doesn't work.)
* This Friday's quiz will be on tracing and mental models of
  computation.

MP2
---

Questions on the readings
-------------------------

### A preliminary note

A surprising number of you misunderstood the instructions for the
numeric values reading.

"In the examples above, we gave a wide variety of examples of the
`expt` procedure in action.  Each was intended to reveal something
different about that procedure.  They were also intended to suggest
the kinds of exploration you might do when you encounter or design
a new procedure."

"Suggest what we might be trying to reveal for each of the following. "

a. `(expt 2 10.0)

Incorrect: 1024.0

Correct: We are checking what happens when the exponent is inexact.
It seems that the result is also inexact.

b. `(expt 2.0 10)

Incorrect: 1024.0

Correct: We are checking what happens when the base is inexact.  It
seems that the result is also inexact.

c. `(expt 3 -5)`

Incorrect: 1/243

Correct: We are checking what happens with negative exponents.  It
appears that `(expt x -y)` is the same as `(/ 1 (expt x y))`.

d. `(expt 4 1/2)`

e. `(expt 1/9 1/2)`

f. `(expt 2 1/2)`

g. `(expt 243 1/5)`

This is 3.0 (inexact) rather than 3 (exact).  It seems like an odd comparison 
to d, which was exact.

h. `(expt 1+i 4)`

i. `(expt 1.0+i 4)` `


### The questions

Why are collating sequences useful?

> We use collating sequences when we have to put things in order, such as organi
zing books by title or author.  Computers are much better at comparing numbers,
so a comparison of collating sequence numbers is usually at the core of any char
acter or string comparison.

Why does `(char-lower-case? #\ñ)` return true (#t)?

> Because it's a lowercase n with a tilde, as opposed to #\Ñ.

What do you call ǝ?

> I call it schwa.  I think most people do.

Why isn't there a `#\schwa`?

> Because the designers of Racket didn't think it important enough to provide it.

Why does (expt 4 1/2) lead to an exact result?

> It leads to an exact result because expt gives exact results when (a) the first parameter is exact, (b) the second parameter is 1/2, and (c) the first parameter has an exact square root.

Why doesn't `(expt 8 1/3)` give an exact result?

> That's puzzling, isn't it?  I'm pretty sure that `expt` uses a different algorithm when the parameter is 1/2 than when it's any other exponent.  For 1/2, it does the right thing for perfect squares.

Questions on MP 1
-----------------

Lab
---
