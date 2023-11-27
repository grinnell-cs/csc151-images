---
title: "EBoard 37: Searching and analysis"
number: 37
section: eboards
held: 2023-11-27
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided the technology has not broken again.

_Approximate overview_

* Administrivia
* Questions
* Lab

Administrivia
-------------

* Good news: We've opened another section of CSC-161 (8:30--9:50 a.m. MWF).
* I've set up redos, second redos, and third redos for all assignments.
    * Make sure to include a "CHANGES" file with every redo.
* Today's lab is on searching and analysis; please make sure you have your
  notes from our discussion of these topics.
* Lots of confusion on the data abstraction LA/Quiz, so please review
  the [sample LA](../las/data-abstraction.html).

### Upcoming Token activities

Academic

* Tuesday, 2023-11-28, Noon, Day PDR: _CS Table: TBD_. 
* Tuesday, 2023-11-28, 7pm, 3821: _Mentor session: Binary search, data abtraction, and more._

Cultural

* Thursday, 2023-11-30, 11am, JRC 101: _Let's talk institutional memory_.

Peer

* Friday, 2023-12-01, 5:00ish, Fieldhouse: _Indoor Track and Field_
* Friday, 2023-12-01, 5:30pm, Natatorium: _Swimming (Pioneer Classic)_
* Saturday, 2023-12-02, all day, Natatorium: _Swimming (Pioneer Classic)_
* Saturday, 2023-12-02, 3pm, Darby: _Women's Baskeball vs. Lawrence_

Wellness

_We need more wellness activities!_

* Reminder: A reflection on thankfulness counts.

Misc

* Please fill out the peer mentor evaluation form.

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Tuesday: NO Reading.
* Thursday the 30th: (Mini-)Project 8.
* Thursday the 30th: Reading on Trees
* Friday December 1st: Our last set of quizzes!

### Friday quiz topics

_Available starting at 7:30 a.m.  Collected at 8:45 a.m._

* Binary search (new)
* Data abstraction (newish)
* Tracing (old)
* Others as appropriate

Comments on mini-project 7
--------------------------

* I had expected people to use hash tables to build the frequency
  information.  (I'll make that much clearer next year.)
    * If you didn't use hash tables, you likely wrote a program that
      did not work very efficiently; repeatedly iterating a list is
      expensive/slow.
* Our graders are still working on grading MP7.  They hope to get
  it back soon.

Questions
---------

### Administrative

When will the project presentations happen?

> Wednesday of week 14.

Can we get a new set of grade reports?

> Sure.  Tokens may not be up to date, though.

Sam, you are evil and way underestimate the amount of time each part of
a mini-project will take. Be nicer next semester.

> I will take that under advisement. (Seriously.)

> My goal is that the class take 8 hours per week outside of class,
  so MPs should not be more than 4 hours.

Our amazing model student isn't here today. What should we do?

> Appoint a new model student.

### Project

### Binary search

### Analysis

### Other

Lab
---

Note: Exercise 4 has a typo. Please `alphabetically-first-2` on the second
part of the second example.

The "Faberge Organics" TV add from years ago ("and she told two friends")
explains why `alphabetically-first-1` takes so many steps (at least when 
the smallest value is at the end).

The issues with `alphabetically-first-1` also suggest why I worry when
you have identical calls to the same procedure. Doing so can singificantly
slow down your program.  (Using a local binding would help, but it does
require a non-trivial rewrite.)

The issues with `list-reverse-1` suggest why I worry when you use
repeatedly use `append` (or `list-ref`).

