---
title: "EBoard 30: Data abstraction"
number: 30
section: eboards
held: 2024-04-12
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [5 min]
* Questions [15 min]
* Lab [40 min]
* Turn in lab (maybe) [5 min]

Administrative stuff
--------------------

* There is no reading for Monday. Monday will be a bit of a "catch up" day.
* Depending on how far we get on the lab, we may also finish the lab on
  Monday.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-16, noon, some PDR
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-16, 7pm, Science 3819
  _Mentor Session_.
* **Thursday, 2024-04-18, 11am, JRC 101**.
  **_Ruha Benjamin on "Viral Justice: How We Grow the World We Want"_**
* Thursday, 2024-04-18, 7pm, Science 3819
  _Mentor Session_.

Cultural

* Friday, 2024-04-12, 4:00-5:00pm, HSSC N1170
  _Middle of Everywhere_.

Peer

* Saturday, 2024-04-13, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit._
* Saturday, 2024-04-13, 2:30--5:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited._
* Saturday, 2024-04-14, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Knox._
* Sunday, 2024-04-21, 2:00--5:00pm, Tennis Courts.
  _Men's Tennis vs. Cornell (College)._
* Sunday, 2024-04-21, 10:00am--1:00pm, Tennis Courts.
  _Men's Tennis vs. Coe._
* Sunday, 2024-04-21, noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloited, revisited. The Sequel!_

Wellness

* Friday, 2024-04-12, 3:00--5:00pm, JRC Courtyard
  _Get Nostalgic_.
* Tuesday, 2024-04-16, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-16, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-16, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

* Saturday, 2024-04-13, 1:00--3:00pm, Pioneer Park.
  _Softball vs. Ripon._
* Saturday, 2024-04-13, 3:00--5:00pm, Pioneer Park.
  _Softball vs. Ripon, revisited._

### Upcoming work

* Friday, 2024-04-12, 11:00pm, [SoLA 3](../las/) post-reflection
    * [_Submit SoLA 3 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248183)
* Friday, 2024-04-12, 11:00pm, MP7 pre-reflection due
    * [_Submit MP7 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330325)
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)
* Sunday, 2024-04-14, 11:00pm, [MP2](../mps/mp02) Second Redo
    * [_Submit MP2 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323413)
* Sunday, 2024-04-14, 11:00pm, [MP3](../mps/mp03) Second Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323418)
* Sunday, 2024-04-14, 11:00pm, [MP1](../mps/mp01) Third Redo
    * [_Submit MP1 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323410/)
* Don't forget to submit the `CHANGES.rkt` file (summarizes your changes).
* Monday, 2024-04-15, 8:30am, [Lab writeup](../labs/data-abstraction)
    * [_Submit todays's lab on Gradescope_](???)
    * Preferred: Finish it during class today.

Data abstraction
----------------

### Overview: What are the key ideas in the reading?

### Self-check 1: Printing names (‡)

Write a procedure, `(name->string name)`, that takes a name
and converts it to the appropriate string.  `name->string` should
work no matter what representation we use, even if we use a 
representation we have not yet covered.

```racket
> (name->string qe2)
"Queen Elizabeth II"
> (name->string clay) 
"Roy Clay Sr"
```

A solution and a thought process.

```
;;; (name->string name) -> string?
;;;   name : name?
;;; Convert a name to a string, no matter how names are implemented.
(define name->string
  (lambda (name)
    ...))
```

### Self-check 2: Yet another representation (‡)

Suppose we were planning to represent names as strings with the
components separated by vertical bars.  For example,
`"|Barack|Hussein|Obama|II"` or `"Queen|Elizabeth|||II"`.  Sketch
how you would write procedures like `name-given` and `name-family`
that extract the various parts of the name.  You might, for example,
use `string-split`.

A solution and a thought process.

```
(define name-prefix
  (lambda (name)
    ???))

(define name-given
  (lambda (name)
    ???))
```

Questions
---------

### Administrative

Are we permitted to use a page of notes on quizzes?

> Of course.

### Dictionaries / Maps / Hash Tables

In `(hash-ref hash key "")`, what does the "" do?

### Registration

### MP7

Lab!
----

