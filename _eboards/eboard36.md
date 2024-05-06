---
title: "EBoard 36: Trees (mostly binary)"
number: 36
section: eboards
held: 2024-04-26
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Quiz
* Administrative stuff
* Curves
* Questions
* Lab

Administrative stuff
--------------------

* Apologies if today is a bit disjoint; I spent about three hours on
  advising between last night and this morning and another hour on
  an academic honesty case for this course.
* On that second note: Please don't cheat. Talk to me instead.
* On that first note: It appears that the Registration system screwed
  up massively for CS. Stay tuned.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-30, noon, some PDR.
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-30, 7pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-04-25, 7pm, Science 3819.
  _Mentor Session_. Review for the fourth SoLA. (Note: Need substitute.)

Cultural

* Most days, 2024-04-xx, 11am-6pm, Grinnell College Museum of Art.
  _BAX 2024_.
* Friday, 2024-04-26, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_ (Notsure).

Peer

* Saturday, 2024-04-27, 12:00--4:00pm, Kington Plaza.
  _Spring Fest_.
* Saturday, 2024-04-27, 6:30--??:??, Harris.
  _Cultural Evening_.
* Thursday, 2024-05-02, 6:00--??:??, Central Park.
  _Peter and the Starcatchers_. Really awesome.
* Saturday, 2024-05-04, 2:00--??:??, Central Park.
  _Peter and the Starcatchers_. Wicked neat.
* Saturday, 2024-05-05, 2:00--??:??, Central Park.
  _Peter and the Starcatchers_. Wicked awesome.

Wellness

Misc

* Friday, 2024-04-26, 8:30--11:00pm, Harris Concert Hall.
  _Drag_.
* Saturday, 2024-04-27, 6:00--11:30pm, Gardner.
  _Mary B. James_.

### Other good things (no tokens)

### Upcoming work

* Friday, 2024-04-26, 11:00pm, Post reflection for [MP8](../mps/mp08)
    * [_Submit MP8 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371689)
* Friday, 2024-04-26, 11:00pm, Pre reflection for [MP9](../mps/mp09)
    * [_Submit MP9 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4392328)
* Sunday, 2024-04-28, 11:00pm, Reading response on [tree recursion](../readings/tree-recursion) and binary search trees](../readings/binary-search-trees)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4415259)
* Sunday, 2024-04-28, 11:00pm, Second Redo for [MP4](../mps/mp04)
    * [_Submit MP4 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4367977)
* Monday, 2024-04-29, Today's [Lab on trees](../labs/binary-trees)
    * [_Submit binary trees lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4415261)
    * Turn it in today.
* Sunday, 2024-05-05, 11:00pm, [MP9](../mps/mp09)
    * [_Submit MP9 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4402651)
* Sunday, 2024-05-05, 11:00pm, Nth Redo for a few things
* Sunday, 2024-05-12, 11:00pm, Nth Redo for a few things
* Friday, 2024-05-17, 5:00pm, Ultimate Submission for everything

### Friday PSA

* Don't do things to excess, even looking at art.
* Please take care of yourselves. Please remain awesome.
* Consent is essential but insufficent.
* Be well. I care.

Curves
------

Syntax
```
(curve source source-angle source-pull 
       target target-angle target-pull
       color pen-size
       [optinal-description])
```

```
> (curve (pt 0 50) 0 1 (pt 100 50) 90 1 "blue" 5)
.
> (curve (pt 0 50) 0 1 (pt 100 50) 90 3 "blue" 5)
.
> (curve (pt 0 50) 0 5 (pt 100 50) 90 1 "blue" 5)
.
> (curve (pt 0 50) 90 1 (pt 100 50) 90 1 "blue" 5)
.
> (curve (pt 0 50) 90 1 (pt 100 50) 90 1 "red" 50)
.
> (curve (pt 0 50) -90 1 (pt 100 50) 90 1 "red" 5)
.
> (curve (pt 100 50) 90 1 (pt 0 50) -90 1 "red" 5)
.
> (overlay/align "left" "top"
                 (curve (pt 0 50) -90 1 (pt 100 50) 90 1 "red" 5)
                 (curve (pt 100 50) -90 1 (pt 200 50) 90 1 "red" 5))
.
> (describe-image (curve (pt 100 50) 90 1 (pt 0 50) -90 1 "red" 5))
"a curved line connecting (100,50) to (0,50)"
> (describe-image (curve (pt 100 50) 90 1 (pt 0 50) -90 1 "red" 5 "the most awesome curve ever created"))
"the most awesome curve ever created"
```

Questions
---------

### Administrative

### MP9

### Trees

### Misc

Lab
---