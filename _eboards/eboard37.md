---
title: "EBoard 37: Tree recursion and binary search trees"
number: 37
section: eboards
held: 2024-04-29
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff
* Questions
* Lab

Administrative stuff
--------------------

**Why is it so hard to show up to the first class of the day on time?**

* My glasses broke over the weekend. I'll likely have even more difficulty
  than normal identifying you.
* I will be working from home tomorrow. I'll do my best to respond to
  questions on email and Teams. All office hours will be on Teams.
* The CS picnic is coming up. Make sure to sign up.
* MP8 has now been returned. The redo is due at the end of week 14.
  (If you turn it in earlier, the graders might be able to get to it.)
* Congrats to Men's Tennis on a successful weekend.

### The wonders of English

We considered my favorite "stupid valid English sentence" in my other
class on Friday. I thought I'd share it with you.

> Buffalo buffalo Buffalo buffalo buffalo buffalo Buffalo buffalo Buffalo buffalo buffalo.

Wasn't that amazing? You can read about it [on my 'blog](https://rebelsky.cs.grinnell.edu/musings/buffalo-2024-04-28).

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-30, noon, some PDR.
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-30, 7pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-05-02, 11am, JRC 101.
  _PBK Scholars' Convocation: Cathleen Kaveny on "Can We Be Civil? Prophetic Indictment and Call-Out Culture in American Public Life"._
* Thursday, 2024-04-25, 7pm, Science 3819.
  _Mentor Session_. Review for the fourth SoLA.

Cultural

* Most days, 2024-04-xx and 2024-05-xx, 11am-6pm, 
  Grinnell College Museum of Art.
  _BAX 2024_. Shouldn't it be BAE?
* Friday, 2024-05-03, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_.

Peer

* Saturday, 2024-05-04 (aka "Star Wars Day"), noon--3:00pm, Pioneer Park.
  _Baseball vs. Illinois_.
* Saturday, 2024-05-04 (aka "Star Wars Day"), 2:30--5:30pm, Pioneer Park.
  _Baseball vs. Illinois_.
* Saturday, 2024-05-05, 11:00am--2:00pm, Pioneer Park.
  _Baseball vs. Illinois_. (It takes a lot of games to play a whole state.)

Wellness

* Monday, 2024-04-29, 4:00--5:00pm, HSSC Atrium.
  _Therapy Dogs_.
* Sunday, 2024-05-05, 10:00am--6:00pm, Mac Field.
  _Bubble Soccer_. (It takes almost as long as cricket!)
* Friday, 2024-05-10, 5:00pm--??:??pm, Merrill Park West.
  _CS Picnic!_ Survey forthcoming.

Misc

* Monday, 2024-04-29, 4:00--5:00pm, HSSC A1231 (Kernel).
  _Quality Initiative Update: What We've Learned By Mapping the 
   Advising Ecosystem._
* Thursday, 2024-05-02, 4:15--5:30pm, Burling 1st.
  _Conversation with Kathryn Mohrman '67._
* Saturday, 2024-05-04 (aka "Star Wars Day"), 10:00am--11:00pm, Central Campus.
  _The Grinnellian._

### Other good things (no tokens)

Note: Softball seems to have moved their games. Or I was very confused
when I put this together. Please check the calendar.

* Saturday, 2024-05-04 (aka "Star Wars Day"), 1:00--3:00pm, Softball Complex.
  _Softball vs. Lawrence_.
* Saturday, 2024-05-04 (aka "Star Wars Day"), 3:00--5:00pm, Softball Complex.
  _Softball vs. Lawrence_.
* Sunday, 2024-05-05, 1:00--3:00pm, Softball Complex.
  _Softball vs. Illinois_. 
  (Because three games against the same team in one weekend is absurd.)

### Other questionable things (no tokens)

* Saturday, 2024-05-04 (aka "Star Wars Day"), noon--5:00pm, Cleveland Beach.
  _Alice in Wonderland_.

### Upcoming work

* Tuesday, 2024-04-30, **No reading**
* Wednesday, 2024-05-01, Today's [Lab on tree recursion](../labs/tree-recursion)
    * [_Submit tree recursion lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4423663)
    * Lab should be finished in class.
* Thursday, 2024-05-03, **No reading**
* Friday, 2024-05-03, 8:00am, Quizzes
    * New topic: Tree recursion
    * Old topic: Binary search (most likely tracing)
    * Old topic: Diagramming structures (last chance)
* Friday, 2024-05-03, 11:00pm, Pre-reflection for [SoLA 4](../las)
    * [_Submit pre-reflection on gradescope_](https://www.gradescope.com/courses/690100/assignments/4447415)
* Sunday, 2024-05-05, 11:00pm, [MP9](../mps/mp09)
    * [_Submit MP9 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4402651)
* Sunday, 2024-05-05, 11:00pm, Second redo of [MP5](../mps/mp05)
    * [_Submit MP5 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379432)
* Sunday, 2024-05-05, 11:00pm, Second redo of [MP6](../mps/mp06)
    * [_Submit MP6 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379449)
* Sunday, 2024-05-05, 11:00pm, First redo of [MP7](../mps/mp07)
    * [_Submit MP7 first redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379457)
* Sunday, 2024-05-05, 11:00pm, [Reading on Sorting](../readings/sorting)
    * _Reading response not yet available._
    * **Our final reading response.**
* Monday, 2024-05-06, 4:00pm, [SoLA 4](../las) distributed.
* Tuesday, 2024-05-07, 11:00pm, Post reflection on [MP9](../mps/mp09)
    * [_Submit MP9 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4392331)
* Wednesday, 2024-05-08, 8:00am, [Lab on Sorting](../labs/sorting)
    * _Lab not yet available._
    * Lab should be finished in class.
    * **Our final lab.**
* Wednesday, 2024-05-08, 8:30am, Presentations from [MP9](../mps/mp09)
    * _Nothing to submit._
    * Sam wll bring fresh fruit.
* Wednesday, 2024-05-8, 11:00pm, [SoLA 4](../las) due.
    * _Submit individual LAs on Gradescope_.
* Sunday, 2024-05-12, 11:00pm, Redo for [MP8](../mps/mp08)
    * [_Submit MP8 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379461)
* Monday, 2024-05-13, 4:00pmish, [SoLA 5](../las) released.
* Friday, 2024-05-17, 5:00pm, Ultimate Redo for everything
    * [MPs 1--8](../mps)
    * [SoLA 5](../las)

Questions
---------

### Administrative

Will you ever tell us our tokens?

> Probably not. You can assume you have enough.

### MP9

Could you teach us how to do blends?

> I'll send out something tomorrow.

### BSTs

Can you go over the examples from the reading?

> Sure.

### Misc

Can we start lab now?

> Sure.

Lab
---

### Random tree shapes

Sam's analysis for how many random trees of size 5 there are.

* **Size 0**: We can only have **one** tree of size 0.
* **Size 1**: We can only have **one** tree of size 1.
* **Size 2**: We can have **two** trees of size 2: The one in which the
  left subtree is nonempty and the one in which the right subtree is
  nonempty.
* **Size 3**: Things start to get complicated here. We could have two
  values on the left (2 versions), we could have two values on the right
  (2 versions), or we could have one value on each side (1 version).
  That gives us **five** trees of size 3.
* **Size 4**: Things get even more complicated here. We could have three
  values on the left (5 versions) and zero on the right (1 version). We could 
  have two values on the left (2 versions) and one on the right (1 version).
  We could have one value on the left (1 version) and two on the right
  (2 versions). And we could have zero values on the left (1 version) and
  three values on the right (5 versions). 5 + 2 + 2 + 5 = **fourteen**
  different trees of size 4.
* **Size 5**: Things are complicated enough that I'm switching to a bulleted
  list.
    * Four on the left (14 versions), zero on the right (1 version): 14 versions.
    * Three on the left (5 versions), one on the right (1 version): 5 versions
    * Two on the left (2 versions), two on the right (2 versions): 4 versions
    * One on the left (1 version), three on the right (5 versions): 5 versions
    * Zero on the left (1 version), four on the right (14 versions): 14 versions
    * If I count right, that gives us **forty-two** different trees of size 5.
    * Life, the universe, and everything!

### Searching trees

What procedures did we see to search trees?

> `bst-find`

> `binary-tree-contains?`
