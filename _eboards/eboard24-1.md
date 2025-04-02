---
title: "EBoard 24: Pairs and pair structures (Section 1)"
number: 24
section: eboards
held: 2025-04-02
link: false
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff 
* Q&A
* Lab

Administrative stuff
--------------------

### Introductory notes

* Next week is preregistration. Yay! I hope that many of you are
  considering pre-registering for CSC-161. Feel free to chat with me
  if you have questions about the course.
    * We should be able to fit all interested parties.
* Section 1 only: One of you told a friend that you felt that I wasn't
  very snarky in class and wished that I were more so. Hence, we have
  a survey.
    * Sam needs to be more snarky.
    * Sam's snarkiness is about right.
    * Sam needs to be less snarky.
* Sorry about the delay on MP6 on Gradescope.
* Every person needs a piece of paper.

### Upcoming activities

Scholarly

* Thursday, 3 April 2025, 11am--noon, JRC 101.
  _Scholars’ Convocation: LeAnne Howe
  "A Choctaw In King Abdullah’s Court"_
    * Also important, but not directly relevant to this class.
* Thursday, 3 April 2025, 4:00--5:30pm, the Kernel.
  _CS Poster Session_
* Thursday, 10 April 2025, 4:00--5:30pm, the Kernel.
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

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

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
* Tuesday, 8 April 2025, Anywhere, Anytime.
  _Conduct and reflect on a non-harmful April Fool's Day prank._
* Tuesday, 8 April 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 8 April 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 15 April 2025, 5:00--6:00 p.m., HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 15 April 2025, 7:15--8:15 p.m., HSSC Atrium.
  _Therapy Dogs_.

Misc

* Wednesday, 2 April 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education and Grinnell College face."
* Friday, 4 April 2025, 3:00--5:00 p.m., Burling Digital Studio.
  _GCIEL / Digital Studio Workshop: Spatial Audio and Immersive Soundscapes_
* Sunday, 6 April 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 8 April 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Wednesday, 2 April 2025 
    * Quiz: List recursion
    * Makeup quiz: Local bindings (`let` and `let*`)
    * Makeup quiz: Program style
    * Makeup quiz: Tracing
    * _Remember that you can bring a sheet of hand-written notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_
* Thursday, 3 April 2025
    * [Mini-project 6](../mps/mp06) is due.
    * Readings
       * [Vectors](../readings/vectors)
       * [Submit reading response on Gradescope](https://www.gradescope.com/courses/948769/assignments/6026647)
    * [Submit lab writeup from today's class on Gradescope](https://www.gradescope.com/courses/948769/assignments/6026671)
* Friday, 4 April 2025
    * [Submit post-reflection for MP6 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5989932)
    * MP7 releaaed
* Sunday, 6 April 2025
    * Submit pre-reflection for MP7 on Gradescope
    * Submit lab writeup for Class 25 on Gradescope
    * No readings
* Wednesday, 2 April 2025
    * Quiz: Diagramming structures (paper only)
    * Makeup quiz: List recursion
    * Makeup quiz: Tracing

Questions
---------

### Administrative

Gradescope is confusing. How do I know what work is coming up?

> I'd suggest the "upcoming work" section of the daily eboard.

What does AFK mean?

> Away from Keyboard. If I tell you that I'm AFK, it means I'm probably
  answering a Teams Message or an email from my phone.

### Reading on Pairs

I'm not exactly seeing the benefits of viewing pairs.

> We study pairs so that we have a better understanding of how
  Scheme functions (and why we get some of the outputs we do).
  Understanding pairs also permits us to build more complex structures.

Just like there are some procedures that only work with lists, are there any procedures that work only with nested pairs?

> Most of the procedures that work with nested pairs also work with lists.
  I suppose we could write some that only work with nested pairs.

When the racket compiler displays pairs, it puts the dots in somewhat
strange places, not just in between each element. How does it decide
where to put them?

> It puts it before the last element if the last element isn't null.

Is this useful for MP6?

> Probably not. Perhaps if you see periods in your output, it will
  explain why.

I would like you to go over the check 2 in class.

> Okay.

> a. How does the base case test for pair recursion differ from the
  base case test for other types of recursion you have seen?

> b. Why are there two calls to sum-of-number-tree in its recursive case?

### Mini-project 6

Should `combine-pairs-above` look remarkably like `combine-pairs-beside`?

> Yes.

### Other

Lab
---

The first problem requires paper. Die, trees, die! I suppose you could
use a whiteboard.
