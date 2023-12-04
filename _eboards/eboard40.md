---
title: "EBoard 40: Recursion over binary trees"
number: 40
section: eboards
held: 2023-12-04
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided the technology has not broken again.

_Approximate overview_

* Administrivia
* Questions
* Labs

Administrivia
-------------

* I have returned Friday's quizzes and updated the reports.
* Our graders will only grade your MP redos if you include a `CHANGES.txt`
  or `CHANGES.rkt` file. (That's a way for you to check the autograder
  without having them grade it.)
* If you have a compelling reason that you will need an extension on
  SoLA 3, please let me know asap.
* I have no scheduled office hours during Finals Week. I will be in
  my office as much as I can. Feel free to DM me to check if I'm there
  or to ask questions.
* For some reason, some of you never did the Ethics LA. I've reopened that.
  (It will be listed as late, but there's no penalty.)

### Upcoming Token activities

Academic

* Monday, 2023-12-04, noon--1pm, _Lunch & Learn: Summer Research_
* Tuesday, 2023-12-05, 7pm, 3821, _Mentor session: Review for SoLA 3_

Cultural

* Wednesday, 2023-12-06, Noon--1:30pm, _Vox Feminae Christmas Concert_

Peer

* Wednesday, 2023-12-06, 7:30pm, Darby, _Women's Basketball vs. Cornell_

Wellness

* Monday, 2023-12-04, 4:00--5:00pm, HSSC North Atrium, _Therapy Dogs_

Misc

* Monday, 2023-12-04, noon--1pm, JRC 101, _Registration Feedback_

### Other good things (no tokens)

* Monday, 2023-12-04, 9:00--11:00pm, Bob's, _Bob's Underground Open Mic_

### Upcoming work

_Please put these in your notes!_

* Tonight: Late (Mini-)Project 8 post-assessment.
* Wednesday the 6th: Project presentations.
* Wednesday the 6th: SoLA 3 distributed.
* Thursday the 7th: SoLA 3 collected.
* Friday the 8th: Attendance is expected.

### Notes on binary search quiz

* Remember that when we recurse on the left half, the midpoint becomes
  the new upper bound. _Make sure you understand why._
* Remember that when we recurse on the right half, 1 + the midpoint
  becomes the new lower bound. _Make sure you understand why._
* We only return false when we determine that the element is not there.
  We determine that the element is not there because the lower bound
  is greater than or equal to the upper bound.

Questions
---------

### Administrative

### Trees, tree recursion, and binary search trees

What will the LA on tree recursion look like?

> See <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2023Fa/las/tree-recursion.html>

I'm not sure how to deal with the issues in `binary-tree-largest`.

> Chat with your partner when you get to the problem on the lab. If
  you're still not sure, ask me or one of the mentors.

### Other

Lab
---
