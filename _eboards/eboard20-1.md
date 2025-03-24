---
title: "EBoard 20: Recursion (Section 1)"
number: 20
section: eboards
held: 2025-03-24
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff (way too much)
* Quick notes on MP5
* Quick notes on SoLA 2
* Q&A
* Lab

Administrative stuff
--------------------

### Introductory notes

* Welcome back from break!
* Someone cleaned up our room. Let's try to keep it clean.
* Since you can't talk to people during the SoLA, I brought you ducks.
* Today's lab is mostly thinking and tracing rather than programming.
* A member of one section of 151 has severe peanut/nut allergies. If
  you eat food in the class, please don't eat food with peanuts/nuts.
  Even the leftover scent affects them.

### Grading notes

* "The best-laid schemes o' mice an' men Gang aft agley, An' lea'e us 
   nought but grief an' pain, For promis'd joy!"
* That is, I was not as successful as I would have liked getting
  grading done during break. I hope to do a bit more catching
  up over the next few days.
    * Tokens earned are on my agenda for this evening. I'll send out 
      reports afterwards.
* I'm not sure that you feel grief and pain for not getting grades.
  And I'm not sure that grades are promis'd joy. But you get
  the gist.
* I treated most readings as a "check off" opportunity. If you turned it
  in, you got a check. I did not alwaysd look at your answers. If you have
  outstanding questions, let me know.
    * No late penalties for ones I hadn't at least half graded:
        * Pre-reflection for MP5.
        * Readings for class 4: RGB. (I may have half-graded this one.)
        * Readings for class 12: Booleans. (I'd graded all the on-time
          submissions, but never released it. Whoops!)
        * Readings for class 13: Lists.
        * Readings for class 14: List composition and decomp.
        * Readings for class 16: Ethics.
        * Readings for class 17: SE Fundamentals.
        * Readings for class 18: Recursion.
* As I mentioned at the start of the semester, I'll generally try to
  get to the reading responses that are in by 7pm the night before,
  but I won't always succeed.

### Upcoming activities

Scholarly

* Thursday, 27 March 2025, 11 am--noon. JRC 101.
  _Scholars’ Convocation: Lauren Klein 
   "Doing Al Differently: Lessons from Intersectional Feminism"_
    * This convo is important enough that you'll earn two tokens for
      attending. (Fill in two slots, please.)

Artistic

* Thrusday, 27 March 2025, 7:30--9:30 p.m., Herrick Chapel.
  _Butcher Brown_.

Multicultural

* Friday, 28 March 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Why you should visit Nepal_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 26 March 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 26 March 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Friday, 28 March 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 28 March 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 29 March 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)

Misc

* Tuesday, 25 March 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_ (only on conditionals)
* Sunday, 30 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Monday, 24 March 2025
    * [SoLA 2](../las/) released at 4pm.
        * Old topics: Decomposition, Procedural abstraction, Primitive types,
          Collaboration, Lambda-free anonymous procedures (cut and compose).
        * Semi-new topics: Conditionals, documentation, lists
        * New topics: Testing, program style, ethical considerations
* Tuesday, 25 March 2025
    * [Submit lab writeup from class 20 (recursion basics)](https://www.gradescope.com/courses/948769/assignments/5978041)
    * Readings:
        * [The magic of recursion](../readings/recursion-magic)
        * [Submit reading response on Gradescope](https://www.gradescope.com/courses/948769/assignments/5978086)
* Wednesday, 26 March 2025
    * Quiz: Local bindings (`let` and `let*`)
    * Makeup quiz: Tracing
    * _Remember that you can bring a sheet of hand-written notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_
* Thursday, 27 March 2025
    * [SoLA 2](../las/) due.
    * Readings:
       * [Numeric recursion](../readings/numeric-recursion)
* Friday, 28 March 2025
    * Mini-Project 6 assigned
* Sunday, 30 March 2025
    * Submit Pre-reflection for MP6 due
    * MP redos due
        * [Submit second redo of MP 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902141)
        * [Submit second redo of MP 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902142)
        * [Submit second redo of MP 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902145)
        * [Submit redo of MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902148)
        * [Submit redo of MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902152)

Short notes on MP5 (and related issues)
---------------------------------------

### Miscellaneous

* As you might expect, we were dealing with similar procedures that work
  on lists of lists of ... to start you thinking about recursion.
* We also wanted to give you practice with `map` and `apply`/`reduce`.
* A few people said that this was the most straightforward mini-project
  so far. Others said that it was the hardest. Nested lists require a
  bit of brain twisting.

### Freestyle

* There was some confusion about the freestyle section. In general, the
  freestyle section is intended to be fun and to encourage you to explore.
  In this one, you didn't need to write anything significant for an M.
  However, you needed new versions of procedures for an E.
* Freestyle is supposed to be fun! It's okay to play with procedures
  rather than have a fixed goal.
    * I'll admit that I also struggle with freestyle. Sometimes it's that
      I have a goal (or an expected output) and discover that what I thought
      would achieve that goal doesn't. Sometimes it's that I just have
      fun saying "What if I do _this_?"

### Doing better

* I was glad to hear many of you say that you planned to ask more questions.
  I look forward to seeing them on your pre-reflections for MP6 and to hear
  them in class.
* I appreciate the comment that "I was able to complete this in a
  decent amount of time because I took the time to understand what
  the questions were asking me."
    * One good question to ask yourself is "What are the input and output
      types of this procedure?"
    * (Okay, you should always ask that question.)
* I also liked the idea of "Make a checklist of what needs to be done and
  use it and the grading rubric."

### Addressing workload issues

* A new MP policy for MPs 6, 7, and 8:
    * MPs will be "due" on Thursday and have a late submission on Sunday.
    * Turning in the MP on Thursday earns you two tokens.
    * There is no penalty for the Sunday submission.
* If you have other things you think I should consider implementing, 
  let me know.

Short notes on SoLA 2
---------------------

### Academic integrity

* Reminder: I will not wear my Pollyanna hat when grading SoLA 2.
* New policy: You must cite any resources that you refer to during the
  problem.
    * You must still respond to an academic integrity statement.
* There is (or should be) [a sample LA](https://www.gradescope.com/courses/948769/assignments/5975023/outline/edit) for you to check out.
* If you define procedures using a form we haven't covered (e.g., other 
  than `lambda`, `cut`, `section`, composition, or aliasing) I will assume
  that you've used inappropriate resources and will report you to CAS.

### The pre-assessment

* A note on the pre-assessment: Everything I've heard from Academic
  Advising and other folks who specialize in learning suggests that
  regular "brain dumps" are good for you. The goal here is to see how
  much you can recall without resources. "Um ... composition looks
  like `(o fun1 fun2 fun3)`. I recall writing something like
  `(o (cut (+ <> 2)) sqr (cut - <> 2))`. [Note that the syntax there
  isn't quite right.]
* This should hold for every subject: Trying to generate info is better
  than re-reading.

### Particular topics

* I'll make sure to provide you with a list of stylistic issues to
  cover in the program style question.
    * Many of the key ones appear in [the sample LA](../las/program-style)

Questions
---------

### Administrative

Do I earn a token when I attend my own (athletic/theatrical/musical) event?

> No. Those kinds of tokens are for supporting classmates.

### MP5

Do I really have to document values in addition to procedures?

> You shouldn't have to. But you can. Send me a regrade request.

```
;;; my-list : list-of color?
;;; A list of really awesome colors for building strange images.
```

What should I do if there's essentially no feedback on my MP?

> Email me.

What does "edge case" mean?

> Your tests should look at something a bit more complex ("edgy") in 
  the input, such as empty lists or singleton lists.

### SoLA 2

How do I check the line width?

> First, go to Preferences -> Editor -> General Editor.

> Set the line width to 80 (I think it starts at 102)

> Then, View -> Show Column Width Guide

How do I come up with good tests?

> Think about figurative edges; things at the ends of the valid
  inputs.  For numbers, that's often things that are zero or near
  zero. For numbers, it's also good to think about exact and inexact
  numbers or integer vs. real vs. complex. For colors, that may be
  colors with components that are at or near the extremes (0 or
  255). For lists, that may be small and large lists. Perhaps
  lists with duplicates. Lists in which the first or last element
  has special properties.

> Remember that it's good to have some straightforward tests, too.

> In the end, practice is the best way to become good at testing.

### Other

Lab
---


