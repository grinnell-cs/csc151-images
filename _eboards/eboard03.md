---
title: "EBoard 03 (Section 1): Mental Models"
number: 3
section: eboards
held: 2023-08-30
link: true
---
# {{ page.title }}

_Reminders to Self_

* **Warning** This class is being recorded.
* Post link to Otter.ai.

_Getting started_ 

* Same seat as last class.
* On Friday, we'll return to our "normal" algorithm.

_Approximate overview_

* Administrative stuff [15 min]
* Second lab from last class (submit as "Lab Writeup from Class 2" on Gradescope) [n minutes]
* New lab, on paper (hand in on Friday). [(- 60 n) minutes]
* Debrief [5 minutes]

Administrivia
-------------

### Introductory notes

* Our class site is still under development.  Let me know if you find
  things missing, including images.
    * Those slash things on the syllabus usually indicate something
      that I plan to post.  If they show up for a reading, let me know.
* Normal office hours are in-person (unless you'd prefer to do them
  remotely).
* Apologies: I have some significant personal issues that may make me less
  available in person in the coming weeks.  I will do my best to be available 
  via email and Teams chat.
    * These issues have also put me behind.  Apologies for that, too.
* I have made two updates to the schedule:
    * We're not doing a quiz this Friday; I don't think we've covered enough.
    * I've moved the homework pre-assessment to Sunday night.
* I'm told that all the accounts are now set up.  Let me know if you have 
  difficulty logging in.
* Let me know if you don't seem to be on the class team (Microsoft Teams).
* Fill out the mentor session poll at <https://rg.by/pairj>

### HW 1

* _Warning_: Most of this is based on material we will cover Friday and Monday.
* I thought you'd benefit from seeing it early so that you can start thinking
  about it.

### Upcoming Token activities

Academic

* Convocation, Thursday, 11:00 a.m.  President Harris.

Cultural

* Drag Bingo, Saturday

Peer

* (No more volleyball scrimmages; let's limit ourselves to competitions.)
* Volleyball game on Friday at 5:00 against Bethany and Dominca.
* Football a week from Saturday, 1pm, against Rippon.

Wellness

### Upcoming work

* Two readings for Friday; Complete the reading assignment on Gradescope by 
  Thursday night.
* Lab writeup(s) due before class on Friday.
* Homework one released (probably not doable yet).
* Homework one pre-assessment due on Sunday night (these will usually be due
  on Friday nights; I like you to think about assignments early).

Questions on the readings
-------------------------

Does it matter if there are newlines or extra spaces in the middle of an
expression?

> Not really.  But don't put them in the middle of, say, a number.

For the reading check, what did you want for subexpressions?

> We'll stick with parenthesized things.

```
(above (rectangle 60 40 "solid" "red")
       (beside (rectangle 60 40 "solid" "blue")
               (rectangle 60 40 "solid" "black")))
```

> I'd list `(rectangle ... "red")`, `(rectangle ... "blue")`,
  `(rectangle ... "black")`, and `(beside ...)`.

> Arguably, 60, 40, "solid", and such are also subexpressions, but that's
  a lot to list.

Lab continued from Monday
-------------------------

New lab
-------

* Note: Our evaluation model is leftmost-innermost; you move through
  the arguments from left to right, doing each inner-to-outer (and also
  leftmost-innermost).

Debrief on lab from Monday: MathLAN
-----------------------------------

* **The origin of the short and long versions.**  My colleagues who
  first taught the course wrote the long versions (or at least
  the original versions of the long versions).  When I started
  teaching, I decided you might do better with short instructions.
  But it's a nice example of different ways of thinking about writing
  algorithms/instructions.

Debrief on lab from Monday: Scheme
----------------------------------

* I see that many of you have three screens (our main screen plus two
* It's generally a bad idea to skip ahead in the lab.
  laptops).  Please do your work on the MathLAN workstation and just
  use your laptop for bringing up the lab/reference materials.
    * If I see you running DrRacket on your laptop, I may attempt
      to defenestrate aforementioned laptop.

Debrief on new lab
------------------

Does the evaluation order really matter?

> You need to evaluate the parameters before you apply the procedure.
  ("innermost").

> But it turns out that it (generally) doesn't matter whether you
  evaluate them left-to-right, right-to-left, or some strange hybrid
  of the two.

> For convenience, we'll generally focus on left-to-right.

### Brain teasers

> What do you expect to get for `(+ 4*4 4*4)`?

> What do you expect to get for `(+ x -x)`

### Terminology

Yea, we need to work on it.

