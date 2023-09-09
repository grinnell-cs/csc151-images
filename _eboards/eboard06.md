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
* If you arrive first, _get a santizing cloth and wipe down the station_.
  Then log in and load the lab, but don't start.
* When both partners arrive, introduce yourselves.

_Approximate overview_

* Administrivia 
* About quizzes
* Questions on MP1
* Questions on readings
* Lab

Administrivia
-------------

### Introductory notes

* I expect a longer-than-normal pre-lab period today.
* Covid and other illnesses remains issues.  Consider masking.  Clean
  your keyboards.
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
    * Important: Press the blue text to see what Sam or the grader wrote.
* Clarifications on tokens
    * Earn by writing a few sentences about the activity.  Give me the
      date and thing, too.
    * I'll charge them automatically.  At least I'll try to.

### Upcoming Token activities

Academic

* Convocation, tomorrow, 11am, HSSC A2231 (Auditorium).
  Vincent Lloyd on _Abolitionism: Religious Criticism or Secular Criticism?_
    * Insert Sam's convocation spiel.
* CS Extras, Thursday, 4:15-5:15 pm Science 3821, Grad School in CS
  (Snacks in Commons at 4:00.)

Cultural

* Org Fair, Thursday, 4pm-7pm, "Outside"

Peer

* Football vs. Rippon, 1pm Saturday, 9 Sept 2023

Wellness

### Upcoming work

* Two readings for Friday; Complete the reading assignment on Gradescope by 
  Thursday night.
    * Both are nontechnical readings, but important.
* Lab writeup due before class on Friday.
* MP1 due Thursday night.
* MP1 post-assessment due Friday night.
    * I recommend you do it immediately after MP01, but you have an
      extra day.
* Quiz Friday: Tracing
* MP2 distributed Friday.

### Attending class remotely

_Given the illnesses going around campus, some of you may need to
attend class remotely.  That's fine, but please try not to make it
your norm._

a. Let me know via email that you will not be in class.

b. You are still responsible for the work.  Plan to do the lab on your own. 

c. Synchronous: If you wish, you can join the Teams Meeting during
   class.  That gives you an opportunity to hear what I say and ask 
   me questions.

d. Asynchronous: If not, I recommend that you check the recording
   and the eboard.  (You may want to check those anyway.)

e. Let me know if you need extra time on any assignments.

f. If you can't be here for a quiz, you'll need to take a makeup 
   another week.

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

Comments and questions on MP1
-----------------------------

### Comments

In part two, `my-image` is supposed to be an image, not a procedure.
If you've defined it as a procedure, change the procedure name and
define `my-image` in terms of that procedure.  (Our intent was that
you create it first, before designing procedures, but ....)

And you must call it `my-image`.  It helps the graders (and Sam, when
he grades).

Just in case you hadn't noticed, there is a "rubric" at the end of the
assignment.  Our graders will be using that rubric to assign you a 
grade.  It is worth reviewing them.

### Questions

Can we write helper procedures to make the rainbow spaceship simpler?

> Certainly.  But it is not expected or required.

Where should we cite the reading?

> Whatever works best for you.  I care that you cite more than where you
  cite.  If it's best to cite by the particular code that is influenced
  by a reading, that's fine.  If it's easier to just say "I consulted
  ..." at the top, that's fine

Do we have to cite readings and labs?

> Good practice suggests that if you refer to something while working,
  you cite it.

Comments and questions on the readings
--------------------------------------

_These are based on what I saw at about 8pm last night.  You can add
more questions after I go through them._

### A preliminary note

A surprising number of you misunderstood the instructions for the
numeric values reading.

"In the examples above, we gave a wide variety of examples of the
`expt` procedure in action.  Each was intended to reveal something
different about that procedure.  They were also intended to suggest
the kinds of exploration you might do when you encounter or design
a new procedure."

"Suggest what we might be trying to reveal for each of the following. "

a. `(expt 2 10.0)`

Incorrect: 1024.0

Correct: We are checking what happens when the exponent is inexact.
It seems that the result is also inexact.

b. `(expt 2.0 10)`

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

Lab
---

* There's a bug in the autograder.  I'll be spending the first few minutes
  of lab updating it.  (Fixed.)
* Please replace the whole `<TODO: ...>` with the response.

From

```
> (remainder 8 3)
<TODO: fill in the resulting value here>
```

To

```
> (remainder 8 3)
2
```

Brief debrief
-------------

If you didn't finish, add "; SAM SAID I COULD STOP HERE" wherever
you stopped.

* Look over the rest later.
* But you don't have to submit it.
* You can always ask questions on Teams (or from the evening tutors).

Key idea from today: Exploring supplied procedures to understand how 
they work; experimentation is important.  (Documentation is useful, too.)

Apology: We haven't taught you as much about lists this semester as
we normally do, so creating the 

Questions:

* What is `(round 2.5)`?
* What is `(round 3.5)`?
* Why?

