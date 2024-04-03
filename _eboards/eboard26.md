---
title: "EBoard 26: Pairs and pair structures"
number: 26
section: eboards
held: 2024-04-03
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [10 min]
* Questions [10 min]
* Lab [55 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Reminder: Grinnellians have returned from around the world. 
    * **Consider masking.**
* Friday is the last day to withdraw from classes. Please chat with me
  if you are questioning whether or not you will pass the course.
    * Thursday's office hours are all booked. I should also be
      available from 8:30--9:00 a.m., from 12:15--1:00 p.m., and
      from 3:30--4:00 p.m. (Email me to et up a time.)
* As you preregister for next semester, please consider taking CSC-161.
* Our graders are still working on MP5 and the various redos.
* Note: The primary goal of today's topic is to help you better understand
  what's going on "behind the scenes" when you work with lists and other
  structures that you build with `cons`.

### Token opportunities

Academic/Scholarly

* Thursday, 2024-04-04, 11:00am, JRC 101.
  _Scholars' Convocation: Motherblame-stigma, Epistemic Injustice, and the Government’s Failure to Care_ (w Tammy Nyden in Philosophy).
* Thursday, 2024-04-04, 7:00pm, Science 3819.
  _Mentor Session_ (review for quiz, review for SoLA).
* Thursday, 2024-04-04, 8pm, JRC 101.
  _Book talk: Austin Frerick '12 on Barons: Money, Power, and the Corruption of America’s Food Industry_

Cultural

* Thursday, 2024-04-04, 4pm, Grinnell College Museum of Art.
  _Writers@Grinnell presents Sam Naikhara '19_.
* Friday, 2024-04-05, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._

Peer

Wellness

* Tuesday, 2024-04-09, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-09, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-09, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

* Wednesday, 2024-04-03, 11:45am, JCC Lower-Level Conf. Room.
  _CLS Lunch and Learn with Sam Naikhara '19_.
* Wednesday, 2024-04-03, 4pm, Science 3821.
  _CS Extras: Study abroad at AIT Budapest_. Pizza and Hungarian Candy!
  (Probably fruit, too.)

### Other good things (no tokens)

### Upcoming work

* Thursday, 2024-04-04, 11:00pm, [MP6](../mps/mp06)
    * [_Submit MP6 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217671/)
* Thursday, 2024-04-04, 11:00pm, [Vectors reading](../readings/vectors)
    * [_Submit reading reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4312955)
* Friday, 2024-04-05, 8:30am, [Lab writeup](../labs/pairs)
    * [_Submit today's lab on Gradescope_](...)
    * Preferred: Finish it during class
* Friday, 2024-04-05, Between 8:00 and 8:30am, Quiz
    * Topic: Pairs and pair structures. We'll give you an expression.
      You'll draw a picture.
    * Makeup for tracing available
* Friday, 2024-04-05, 11:00pm, [MP6](../mps/mp06) post-reflection
    * [_Submit MP6 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217839)
* Friday, 2024-04-05, 11:00pm, [SoLA 3](../las) pre-reflection
    * [_Submit SoLA 3 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248181)
* Sunday, 2024-04-07, 11:00pm, [MP4](../mps/mp04) Redo
    * [_Submit MP4 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217681)
* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)

Notes on resolving programming problems
---------------------------------------

### Check your types

In helping students, Maddy and I have observed that one of the most
important sets of qustions you should be asking yourself are "What
type does _this procedure_ take as input?" and "What type does
_this procedure_ return?"

That applies for both procedures you use and procedures you write.

For example, some of you were returning `null` when you should have
been returning a number (e.g., in `tally-wins`).

### Runaway recursion

If you encounter runaway recursion,

(a) Make sure that you are simplifying an appropriate parameter.

(b) Make sure that the recursion happens after you ensure that you
haven't reached the base case.

(c) Reread your base-case test.

Questions
---------

### Administrative

### Pairs

### Randomness

### MP6

Lab
---

