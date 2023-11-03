---
title: "EBoard 27: Vectors, continued again"
number: 27
section: eboards
held: 2023-11-01
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Activity
* Questions
* Lab

Administrivia
-------------

* Happy November!
* Happy NaNoWriMo, if any of you celebrate!
* Our graders say that MP4 is finished.  If you don't seem to have a
  grade, please let me know.
* Please grab a sheet of paper from the back of the room.

### Upcoming Token activities

Academic

* Mediating Polarizing Debates, TODAY at 4pm in the HSSC Kernel
  (aka "Multipurpose Room", A1231).
* Scholars Convocation, Thursday at 11am in JRC 101. Jarvis Givens
  on "Black Reconstructions: Archival Assembly and the History of
  African American Education"
* CS Extras, Thursday at 4pm: Side-Channel Attacks

Cultural

* Shift, the Documentary about RAGBRAI, 4:15 pm, Thursday, in the 
  HSSC Auditorium.
* An evening of Ukranian Poetry and Music, Thursday, November 2, at
  7:30 pm.

Peer

* Awesome physics talk TODAY at noon on making pretty pictures
  of galaxies.  Noyce 1023.
* Women's Volleyball vs. Cornell, TODAY at 7pm.
  Wear pink!  Show up early for a pink t-shirt.
* Swimming vs. Iowa Central CC, Friday, November 3, at 6pm.
* Football vs. UofC, Saturday, November 4, at noon

Wellness

Misc

### Other good things (no tokens)

### Upcoming work

* Today: SoLA 2 (due Thursday at 10:30 pm)
* Thursday night: Reading on randomness
* Friday: Pre-class quizzes (7:30am; finish by 8:30am)
    * Diagramming structures
    * Vectors and vector recursion
    * Tracing (if you ask in advance)
* Sunday: Various MP redos (posted to Gradescope)

Comments on Pre-Assessments
---------------------------

I looked at the first dozen or so pre-assessments.  I'd like to see
deeper brain dumps.  I also think it would help you.  (Evidence suggests
that brain dumps help in every class.)

* What procedures are relevant?
* What are common program structures (e.g., for list recursion or 
  numeric recursion)
* What procedures have you written or read?  What do they look like?

Let's practice: Brain dump on vectors.  Spend five minutes writing down
what you can remember (focusing on things like the above).

Questions
---------

### Registration

What are the odds that CSC-161 will be available after priority registration.

> I'll tell you Friday at 11:59 pm, when I see the waiting list numbers.

> 29 + 24 + 24 = 77 students who might want to take 161.  If our class
  is representative, there are 80-90% of students who want to take 161.
  .8 * 77 ~= 62.

> There are 48 slots available.  Damn.  Maybe the other sections don't
  like CS as much as you do.

> I'm guessing most people will put it in round 1, and it will be full.

Will I get into CSC-161?

> I certainly hope so.  That's the department's goal.  But we can't
  work magic.

Is it bad to priority register for two classes?

> No.  The two should not affect each other.

Can I hack the computer system to increase my priority?

> Please don't.

Is prioritizing two sections of the same class a good idea?

> Yes, if you can.  They count as one class (or are supposed to) and
  it increases your odds.

Should I learn game theory to optimize my chances and then look at what
things look like Friday at 11:50 p.m.?

> Sure.

### Vectors

### Administrative

If we don't get into CSC-161 and we want to be CS majors, what should
we do?

> Remember that you can start a CS major as late as your third semester;
  it will be fine if  you take CSC-161 in the fall.  (And third-semester
  students will be prioritized for CSC-161 in the fall.)

> Take one of the hundreds of other awesome courses Grinnell offers.

### SoLA 2

How will we know if we should take the quizzes on vectors or diagramming 
structures on Friday?

> I will do my best to grade any of those that come in by 7pm on Thursday.

### Other

Lab
---

_Finally, we get to do a lab on vectors._

IF YOU FINISH EARLY, PLEASE WRITE

```
;;; (ivec-closest-to-zero vec) -> integer?
;;;   vec : vector-of integer? (nonempty)
;;; Find an element of vec whose absolute value is less than or
;;; equal to all the other elements of vec.
```

```
(test-equal? "singleton, positive"
             (ivec-closest-to-zero (vector 10))
             10)
(test-equal? "singleton, negative"
             (ivec-closest-to-zero (vector -5))
             10)
(test-equal? "a bunch of values, positive closest to zero at end"
             (ivec-closest-to-zero (vector 9 -3 22 -11 -2 5 1))
             1)
(test-equal? "a bunch of values, negative closest to zero at front"
             (ivec-closest-to-zero (vector -2 44 -7 -8 -4 11 3 15))
             -2)
(test-equal? "a bunch of values, positive closest to zero in middle"
             (ivec-closest-to-zero (vector -2 44 -7 -8 1 -4 11 3 15))
             1)
```
