---
title: "EBoard 05: Mental models (Section 1)"
number: 5
section: eboards
held: 2025-02-03
link: true
---
# {{ page.title }}

_Today's start-of-class procedure_

* Take one of the business cards from outside the jar.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* If you are first, log in, but do not start the lab.
* When a second person arrives, introduce yourselves .

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate optimistic overview_

* Lots of administrative stuff [15 min]
* Questions [10 min]
* Lab [50 min]
* Submit [5 min]

Administrative stuff
--------------------

### Introductory notes

#### Quizzes

* Wednesday's quiz is on decomposing things.
* In sections 2 & 3, we're going to switch to doing quizzes at the end
  of class, rather than the beginning. The "stop then start again" model
  didn't seem to work well.
* Don't forget that you can bring a page of hand-written notes to the quiz!

### Upcoming activities

Scholarly

* Tuesday, 2025-02-04, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: Video Games_
* Thursday, 2025-02-06, 11:00 a.m.--Noon, JRC 101.
  _Grinnell Lecture: Darrius Hills on "The Achievement of Identity: Soul Work, Salvation, and Black Manhood in the Religious Imagination of James Baldwin"_.

Artistic

* Tuesday, 2025-02-04, 4:00-5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Kaufman, Strangfeld, and Yurkevicz_.
* Tuesday, 2025-02-11, 4:00-5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Chen, Kluber, and Tavares.

Multicultural

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 2025-02-04, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 2025-02-04, 4:30--6:30 p.m., BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 2025-02-04, 5:00--6:00 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Tuesday, 2025-02-04, 7:15--8:15 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.

Misc

* Tuesday, 18 February 2025. 6:00--7:00 p.m., HSSC A1231
  _Make a Portfolio Website_.
    * Please register at ????

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Tuesday, 2025-02-04
    * Readings for Wednesday's class.
        * [Anonymous procedures](../readings/anonymous-procedures)
        * [Transforming RGB](../readings/transforming-rgb)
        * [Transforming images](../readings/transforming-images)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5717112)
* Wednesday, 2025-02-05
    * Quiz! (decomposition)
* Thursday, 2025-02-06
    * [Mini-project 2](../mps/mp02) due
    * [Submit mini-project 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5717086)
* Friday, 2025-02-07
    * Mini-project 3 distributed

A note from last class
----------------------

I saw many of you doing something like this.

```
(define ccc
  (lambda (c1 c2 c3)
    (overlay (solid-circle 20 c1)
             (solid-circle 40 c2)
             (solid-circle 60 c3))))
(define red-blue-mix
  (overlay (solid-circle 20 (rgb 255 0 0))
           (solid-circle 40 (rgb 255 0 255))
           (solid-circle 60 (rgb 0 0 255))))
```

Why might I object to that definition of `red-blue-mix`?

Q&A
---

### Administrative

### Racket/Scheme

## Lab

Today's lab is on paper!
