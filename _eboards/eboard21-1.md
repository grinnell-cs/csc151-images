---
title: "EBoard 21: Recursion practice (Section 1)"
number: 21
section: eboards
held: 2025-03-26
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Quiz
* Administrative stuff
* Q&A
* Lab

Administrative stuff
--------------------

### Introductory notes

* Happy [Document Freedom Day](https://digitalfreedoms.org/en/dfd)
* Since it's a quiz day, we're going to limit the Q&A.

### Upcoming activities

Scholarly

* Thursday, 27 March 2025, 11 am--noon. JRC 101.
  _Scholars’ Convocation: Lauren Klein 
  "Doing Al Differently: Lessons from Intersectional Feminism"_
    * This convo is important enough that you'll earn two tokens for
      attending. (Fill in two slots, please.)
* Thursday, 3 April 2025, 11am--noon, JRC 101.
  _Scholars’ Convocation: LeAnne Howe
  "A Choctaw In King Abdullah’s Court"_
    * Also important, but not directly relevant to this class.

Artistic

* Thursday, 27 March 2025, 7:30--9:30 p.m., Herrick Chapel.
  _Butcher Brown_.

Multicultural

* Friday, 28 March 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Why you should visit Nepal_ 
* Friday, 28 March 2025, 5:30 p.m., HSSC N2116.
  _A Latine-based dinner and conversation with Dr. Gabriella Soto_.
    * Dinner provided.
    * "It's someting about immigration."

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Friday, 28 March 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 28 March 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 29 March 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Tuesday, 1 April 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 1 April 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* Sunday, 30 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 1 April 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_
* Wednesday, 2 April 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education – and Grinnell College are facing."

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Wednesday, 26 March 2025 (Today)
    * Quiz: Local bindings (`let` and `let*`)
    * Makeup quiz: Tracing
    * _Remember that you can bring a sheet of hand-written notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_
* Thursday, 27 March 2025
    * [SoLA 2](../las/) due.
        * Old topics: Decomposition, Procedural abstraction, Primitive types,
          Collaboration, Lambda-free anonymous procedures (cut and compose).
        * Semi-new topics: Conditionals, documentation, lists
        * New topics: Testing, program style, ethical considerations
    * Readings:
       * [Numeric recursion](../readings/numeric-recursion)
       * [Submit reading response for class 22 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5989919)
    * [Submit lab writeup from class 21 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5989924)
* Friday, 28 March 2025
    * Mini-Project 6 assigned
* Sunday, 30 March 2025
    * [Submit lab writeup from class 22 on Gradescope]
    * Readings
        * [Pairs](../readings/pairs)
        * [Submit reading response for class 23 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5989953)
    * [Submit Pre-reflection for MP6](https://www.gradescope.com/courses/948769/assignments/5989931)
    * MP redos due
        * [Submit second redo of MP 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902141)
        * [Submit second redo of MP 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902142)
        * [Submit second redo of MP 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902145)
        * [Submit redo of MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902148)
        * [Submit redo of MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902152)

Questions
---------

### Administrative

I still don't have my redo for MP N graded.

> It's in the queue. At worst, I'll extend deadlines for the second redos.

Can I get an E on a second redo?

> Nope. Just the original or the first redo.

All that's wrong with my MP is that I forgot to hit Ctrl-I. Do I really
have to redo it?

> Was it that hard to hit Ctrl-I before submitting?

If the MP grades in my email don't match my original MP grades, what does
that mean?

> It means your MP was graded, but since we haven't graded all of them,
  we haven't published it yet.

### SoLA 2

If I've completed the learning assessment for a topic on a quiz, do I also
have to do it on the SoLA?

> Nope. You only need to demonstrate your mastery of the topic on an LA once.

> Focus on the LAs that are not checked off on your grade sheet.

Do I have to do all of my missing LAs?

> Nope. You can do as many or as few as you want. However, you should
  strive to complete all of them by the end of the semester.

### Recursion

How does check 2 relate to recursion?

> A recursive procedure generally has three parts (or kinds of parts).

> _A base-case test_.  When is the input "simple" enough that we can
  give an immediate answer. For lists, this is typically "the list is
  empty" or "the list has one element".  (There may also be multiple
  base case tests, each with a different base-case value.)

> _A base-case value_. The value we return when we reach the base
  case.

> _A recursive call_. If the input is not yet "simple enough", we must
  simplify it (for lists, this usually means taking the cdr), recursively
  solve the problem on the simplified input, and then use the result of
  that call to solve the initial problem.

> Check 2 asks us to do that for a few problems.

Can we go over the example in the reading?

> Maybe on Friday.

Lab
---

Make sure to think about types. What type should `my-product` return?
