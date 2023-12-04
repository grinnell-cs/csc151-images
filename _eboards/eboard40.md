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
* Lab

Administrivia
-------------

* Computer technology is not working well this morning; apologies.
* Don't attempt to trim your beard when you are over-tired.
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

* Monday, 2023-12-04, noon--1pm, some Bio room on the second floor of the
  elbow.  _Lunch & Learn: Summer Research_
* Tuesday, 2023-12-05, 7pm, 3821, _Mentor session: Review for SoLA 3_
    * If you really want a mentor session for SoLA 4, let me know.

Cultural

* Wednesday, 2023-12-06, Noon--1:30pm, _Vox Feminae Christmas Concert_

Peer

* Wednesday, 2023-12-06, 7:30pm, Darby, _Women's Basketball vs. Cornell_
* Monday, 2023-12-04, 9:00--11:00pm, Bob's, _Bob's Underground Open Mic_

Wellness

* Monday, 2023-12-04, 4:00--5:00pm, HSSC North Atrium, _Therapy Dogs_

Misc

* Monday, 2023-12-04, noon--1pm, JRC 101, _Registration Feedback_

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Tonight: Late (Mini-)Project 8 post-assessment.
* Wednesday the 6th: Project presentations. Please be in class ON TIME.
* Wednesday the 6th: SoLA 3 distributed.
* Thursday the 7th: SoLA 3 due.
* Friday the 8th: Attendance is expected.

### Notes on binary search quiz

* Remember that when we recurse on the left half, the midpoint becomes
  the new upper bound. _Make sure you understand why._
* Remember that when we recurse on the right half, 1 + the midpoint
  becomes the new lower bound. _Make sure you understand why._
* We only return false when we determine that the element is not there.
  We determine that the element is not there because the lower bound
  is greater than or equal to the upper bound. _Make sure you understand
  why._

Questions
---------

### Administrative

Damn! I forgot to submit the required `CHANGES.rkt` file. I blame Sam
for not reminding me. Can I still add it and not get charged a token?

> Sure. Let me know if I accidentally charge you a token.

Will there be a SoLA 3 pre-assessment or post-assessment?

> I don't remember.  Whoops, there should be.  Aw, screw it, you're too
  busy.

> No.

Will you give us an opportunity to fix it if we forgot something on
the 8th project?

> Yes.

If I have five E's and 3M's on mini-projects, I'm arrogant for announcing
it to the class, right?

> Yes.

> You have an A on the MPs. You must still get an A on the LAs as well
  as not have significantly missing numbers of labs/readings/assessments
  and a non-negative number of tokens.

### Trees, tree recursion, and binary search trees

What will the LA on tree recursion look like?

> See <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2023Fa/las/tree-recursion.html>

I'm not sure how to deal with the issues in `binary-tree-largest`.

> Chat with your partner when you get to the problem on the lab. If
  you're still not sure, ask me or one of the mentors.

### Other

What's the presentation order?

> 1. The Bens

> 2. Random 

> 3. Random

> 4. Random

> 5. Random

> 6. Random

> 7. Random

> When you have a chance to talk to update those, let me know.

What happens with spare tokens at the end of the semester?

> You enjoy the memories of earning them.

Can I gave my tokens to my friends?

> No.

Will we get another grade report?

> Yes. Probably tomorrow, maybe tonight.

Lab
---

Let's let $$trees(n)$$ be "the number of trees of size $$n$$".

* $$trees(0)$$ = 1
* $$trees(1)$$ = 1
* $$trees(2)$$ 
    * = $$trees(0)\times trees(1) + trees(1)\times trees(0)$$ 
    * $$= 1\times 1 + 1\times 1$$ 
    * $$= 1 + 1$$ 
    * $$= 2$$
* $$trees(3)$$ 
    * = $$trees(0)\times trees(2) + trees(1)\times trees(1) +
        trees(2)\times trees(0)$$ 
    * $$= 1\times 2 + 1\times 1 + 2\times 1$$
    * $$= 2 + 1 + 2$$
    * $$= 5$$
* $$trees(4)$$
    * $$= trees(0)\times trees(3) + trees(1)\times trees(2) + trees(2)\times trees(1) + trees(3)\times trees(0)$$
    * $$= 1\times 5 + 1\times 2 + 2\times 1 + 5\times 1$$
    * $$= 5 + 2 + 2 + 5$$
    * $$= 14$$
* $$trees(5)$$
    * $$= trees(0)\times trees(4) + trees(1)\times trees(3) + trees(2)\times trees(2) + trees(3)\times trees(1) + trees(4)\times trees(0)$$
    * $$= 1\times 14 + 1\times 5 + 2\times 2 + 5\times 1 + 14\times 1$$
    * $$= 40$$

Look at the eboard for what this should look like (I hope).

I don't think Otter worked.  I'm sorry.
