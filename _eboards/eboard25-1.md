---
title: "EBoard 25: Vectors (Section 1)"
number: 25
section: eboards
held: 2025-04-04
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff 
* About MP7
* Q&A (not on Vectors)
* Notes and questions on Vectors
* Lab

Administrative stuff
--------------------

### Introductory notes

* I have not yet had time to get the quizzes graded. They should be graded
  and available on Gradescope by Saturday night. I'll bring the hardcopies 
  on Monday.
* I overslept this morning, so some links are missing from the eboard. I'll
  add them at the start of lab.
* If you sent me a recent email or TM asking for an extension, I may have 
  missed it. Please Teams Message me again.

### Upcoming activities

Scholarly

* Thursday, 10 April 2025, 11am--noon, HSSC A1231.
  _Scholars' Convocation: Instead of RedFace: Relational Trails in "Indian Country," Onstage, Online, and IRL_
* Thursday, 10 April 2025, 4:00--5:30pm, the Kernel (HSSC Multipurpose Room).
  _CS Poster Session_
* Tuesday, 15 April 2025, noon--1pm, Some PDR.
  _CS Table: ???_

Artistic

* Friday, 4 April 2025 5:00--7:00 p.m., Saturday, 5 April 2025, 1:00--4:00 p.m.,
  and Sunday, 6 April 2025, 1:00--4:00 p.m.
  _Educational Comics Workshop_.
    * You must attend all three sessions.
    * But you'll earn three tokens.
* Sunday, 6 April 2025 2:00 p.m. Sebring-Lewis.
  _Grinnell Singers_

Multicultural

* Friday, 4 April 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Vietnam_
* Friday, 4 April 2025, 6:00--9:00 p.m.,. JRC 101.
  _Eid Fest_
* Friday, 11 April 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere:??? 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Read articles by your fellow CSC-151 students and comment on them online.
* Saturday, 5 April 2025, Noon, Baseball field.
  _Baseball vs. Monmouth_.
* Saturday, 5 April 2025, 2:30 p.m., Baseball field.
  _Baseball vs. Monmouth_.
* Sunday, 6 April 2025, Noon, Baseball field.
  _Baseball vs. Monmouth_.

Wellness

* Friday, 4 April 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 4 April 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 5 April 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Tuesday, 8 April 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 8 April 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Thursday, 10 April 2025. ???. ???.
  _Forest Bathing._
* Tuesday, 15 April 2025, 5:00--6:00 p.m., HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 15 April 2025, 7:15--8:15 p.m., HSSC Atrium.
  _Therapy Dogs_.

Misc

* Friday, 4 April 2025, 3:00--5:00 p.m., Burling Digital Studio.
  _GCIEL / Digital Studio Workshop: Spatial Audio and Immersive Soundscapes_
* Sunday, 6 April 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 8 April 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_
* Wednesday, 9 April 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education and Grinnell College face."
    * Also online.
    * This week: Karen Edwards on Immigration Regulations.

### Other good things

_These do not earn tokens, but are worth your consideration._

* Lots of softball games this weekend.

### Upcoming work

* Friday, 4 April 2025
    * [MP7](../mps/mp07) releaaed
    * [Submit post-reflection for MP6 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5989932)
* Sunday, 6 April 2025
    * [Submit pre-reflection for MP7 on Gradescope]
    * [Submit lab writeup for Class 25 on Gradescope]
    * [Submit late but not late MP6 on Gradescope]
    * No readings
* Monday, 7 April 2025
    * [Submit late but not late MP6 post-reflection on Gradescope]
* Tuesday, 8 April 2025
    * [Submit lab writeup for Class 26 on Gradescope]
    * Readings
        * 
* Wednesday, 9 April 2025
    * Quiz: Diagramming structures (paper only)
    * Makeup quiz: List recursion
    * Makeup quiz: Tracing

### Friday PSA

Mini-Project 7
--------------

* Key idea: Play with an underlying representation of images.
* Part one: Explore rows and columns.
* Part two: Using the idea to make variants of images.
* Part three: More variants.
* Part four: Steganography.
* Part five: Freestyle.
* _You only need to do one of parts three and four._

### Questions

Questions
---------

### Administrative

### Mini-project 6

### Other

Vectors
-------

### Introductory comments

_TPS_

What is a vector?

What distinguishes vectors from lists?

Why would you use one rather than the other?

How does `vector-set!` differ from other procedures we've seen?

How might programming with vectors differ from the other kinds of programming we've done? (Think especially about recursive programming.)

### Some exercises

```
;;; (vector-tally-odd vec) -> integer?
;;;   vec : (vector-of exact-integer?)
;;; Count how many odd numbers are in the vector.
```

```
;;; (vector-increment-odd! vec) -> void
;;;   vec : (vector-of exact-integer?)
;;; Add one to all the odd numbers in the vector.
```

### Q&A (from reading and elsewhere)

Can we go over how to make `tn3`?

> Sure.

Why is `tn1` immutable?

> Rules of Scheme: If you make a vector with the octothorpe, you get an immutable vector.

In our first self-check, `tn1`, `tn2`, and `tn3` all contain the same
elements. Why is `tn1` not equal to `tn2` or `tn3`?

> `tn1` is immutable. `tn2` and `tn3` are mutable. Immutable and mutable
  structures are not equal.

What is the 'file' type referred to in the reading? Are we talking about an actual .rkt file here?

> Whoops. Sometimes we cover how to build text and data files in the course. We didn't this semester.

I don't think I'm clear on what you mean by "DrRacket displaying the value of the vector" in Check 1. Does that just mean the result of calling `tn1`, `tn2`, etc?

> Yes, displaying the value in a vector is just what you get when you type the identifier.



Lab
---

Note: We'll do a second vector lab on Monday.

Note: This uses randomness, which we don't officially learn until next
week. For now, assume that `random` means `unpredictable`.
