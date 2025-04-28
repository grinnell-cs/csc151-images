---
title: "EBoard 35: Tree recursion (Section 3)"
number: 35
section: eboards
held: 2025-04-28
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff 
* Notes on SoLA 3
* Questions! 
* Lab

Administrative stuff
--------------------

### Introductory notes

* I'll be guest teaching classes tomorrow, so office hours will only
  be 8:30--9:45.
* As always, if you'd like to meet to me outside of office hours, let 
  me know.
* I'm amused that both softball and baseball had an "extra-inning thriller".
* Congrats to Hannah Roth on improving on her 3000-meter Steeplechase
  record!

### Upcoming activities

Scholarly

* Tuesday, 29 April 2025, noon--1pm, White PDR.
  _CS Table: "Open Source" AI_
     * ["Open Source" AI isn't actually Open Source](https://www.nature.com/articles/d41586-025-00930-6)
     * Optional: [Open Source AI Protocol](https://opensource.org/ai/open-source-ai-definition)
     * Optional: [White paper](https://opensource.org/wp-content/uploads/2025/02/2025-OSI-DataGovernanceOSAI-final-v5.pdf)
     * Optional: [Critique by Ruha Benjamin](https://lareviewofbooks.org/article/the-new-artificial-intelligentsia/)
* Wednesday, 30 April 2025, 4:00 p.m., HSSC Multipurpose room.
  _Liz Lenz on "Antitidote to the Algorithm of Fear"_
* Thursday, 1 May 2025, 11:00 a.m.--noon, JRC 101.
  _Dr. Tammy Kernodle: My Song is My Weapon: Women, Social Movements,
  and the act of Freedom Singing_

Artistic

* Any day it's open. GCMoA.
  _BAX_
* Tuesday, 29 April 2025, 4:00--5:00 p.m., GCMoA.
  _BAX Gallery Talk_
* Tuesday, 29 April 2025, 7:00--8:00 p.m., Herrick.
  _Jazz Ensemble_
    * Note that the poster has the wrong date.
* Friday, 2 May 2025, 7:30--8:30 p.m., Flanagan.
  _Dance Ensemble/ACTivate: A Rebours_
* Saturday, 3 May 2025, 2:00--3:00 p.m., Flanagan.
  _Dance Ensemble/ACTivate: A Rebours_

Multicultural

* Friday, 2 May 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Brazil_
* Friday, 2 May 2025, 5:00 p.m., HSSC N 1164.
  _ISO Scrap Book_
* ???, ?? May 2025, 1:00--8:30 p.m., Cleveland Beach. (Estimates.)
  _Holi_

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Read articles by your fellow CSC-151 students and comment on them online.
  _This is the last week of S&B articles!_

Wellness

* When and where they usually occur.
  _Badminton Club_, _Brazilian Jiu-Jitsu, _HIIT Training_,
  _Nerf at Noyce_, _Yoga_.
* Tuesday, 29 April 2025, 5:00--6:00 p.m., HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 29 April 2025, 7:15--8:15 p.m., HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 29 April 2025, 7:00--8:30 p.m., Harris Concert Hall.
  _Queer Stompede_.
* Thursday, 1 May 2025. 4:30--6:30 p.m., Off Campus.
  _Forest Bathing._
    * Sign ups are required.

Misc

* Tuesday, 29 April 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session: Quizzes_
* Wednesday, 30 April 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education and Grinnell College face."
    * Also online.
    * This week: Title VI and Title IX
* Friday, 2 May 2025, 5:00 p.m., Merrill Park West.
  _CS Picnic_
* Sunday, 4 May 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session: SoLA 4_

### Other good things

_These do not earn tokens, but are worth your consideration._

* Wednesday, 30 April 2025, 1pm, Baseball field.
  _Baseball vs. Cornell_
* Saturday, 3 May 2025, Noon, Baseball field.
  _Baseball vs. Knox_ (senior day)
* Saturday, 3 May 2025, 2:30 p.m., Baseball field.
  _Baseball vs. Knox_ 
* Travel to watch the Tennis Team 
* Travel to watch the Track and Field Team

### Upcoming work

* Tuesday, 29 April 2025
    * [Submit today's lab on Gradescope]
    * No reading!
* Wednesday, 30 April 2025
    * _Our last quiz day!_
    * Quiz: Higher-order programming
    * Makeup quiz: Data abstraction
    * Makeup quiz: Diagramming structures (paper only)
    * _Don't forget that you can bring a page of hand-written notes for
      each quiz._
* Sunday, 4 May 2025
    * Submit first redo for MP7 on Gradescope
* Friday, 9 May 2025
    * [Submit post-reflection for MP9 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6127774)
* Friday, 16 May 2025
    * Submit final redo for MP1 on Gradescope
    * Submit final redo for MP2 on Gradescope
    * Submit final redo for MP3 on Gradescope
    * Submit final redo for MP4 on Gradescope
    * Submit final redo for MP5 on Gradescope

Some notes on SoLA 3
--------------------

### Comments from Sam

* I often include comments even if you get credit. Please check to see if
  you have comments.
* In some cases, I marked "needs minor fix". Please make those minor
  fixes ASAP.
* In some cases, I marked "please talk to me". Please set up an appointment
  ASAP.

### Disallowed code

* A few of you continue to use `(define (proc param1 ... paramn) body)` 
  rather than `(define proc (lambda (param 1 ... paramn) body))`. 
    * I will not give credit for the former.

### Style

* Please use square bracket where I use square brackets.
    * In `let` bindings (and `let*` and `letrec`)
    * In `cond` blocks.
* In `cond` blocks, generally put the guard and the consequent(s) on
  separate lines.
* Try to embrace the Zen of Booleans. (Avoid explicit `#t` and `#f`.)
    * I generally won't take off if you fail to embrace the ZoB.

### Tick marks

* Please do not nest tick marks; it doesn't work like you think it does.
  (One tick mark covers the whole list)
* On a similar note, please don't put expressions you expect to be evaluated
  in lists that you construct with tick marks. Those expresions are not
  evaluated.

Questions
---------

### Administrative

### Project

We made a fixed-size image. Can we just use `scale` to scale it?

> No. Please take the width and height as parameters.

The original image is a square. What should I do with different aspect
ratios?

> Option 1: Stretch it in the longer direction.

> Option 2: Make a smaller-by-smaller square and then pad on the sides.

> Option 3: Make a larger-by-larger square and then truncate it.

### Trees

What are some circumstances where "recursing on only half the tree" doesn't 
work?

> Finding the largest/smallest value in an unordered tree. Printing all of
  the elements in the tree. Converting the tree to a list or vector.

I really am struggling to trace the `bst-find` function, would you
mind explaining how to go about it?

```
;;; (bst-find bst str) -> boolean?
;;;   bst : treeof string?
;;;   str : string
;;; Look for a string in a binary search tree of strings.
;;; When we say that bst is a binary search tree, we mean it is a binary
;;;   tree with the property that the left subtree contains smaller values
;;;   the right subtree contains larger values, and the subtrees are both
;;;   binary search trees.
(define bst-find
  (lambda (bst str)
    (if (empty-tree? bst)
        #f
        (let ([root (bt/t bst)])
          (cond
            ; If we find the value at the root, we're done
            [(string-ci=? str root)
             #t]
            ; If the value is less than the root, we should look in the
            ; left subtree.  (And don't need the right subtree.)
            [(string-ci<? str root)
             (bst-find (bt/l bst) str)]
            ; Otherwise, the value is greater than the root.  We should
            ; look in the right subtree.  (And it can't be in the left
            ; subtree.)
            [else
             (bst-find (bt/r bst) str)])))))
```

> It's hard to trace `bst-find` using our traditional mechanisms
  because trees are generally bigger than the values we regularly
  trace. We'll look on the board.

Can we go over the reading questions?

> The lab goes over `binary-tree-largest`.

What are some common uses of binary search trees? They seem like a
helpful way of organizing datasets. Are they used in hash tables?

> Yes, they are used to implement dictionaries. (Hash tables use a
  different algorithm, one covered in 207.) "Self balancing binary trees"
  are probably used to implement immutable hashes in Racket.

Lab 
---

Size 0: One shape.

Size 1: One shape.

Size 2: Two shapes. (0 left and 1 right; 1 left and 0 right)

Size 3: Either 0 left and 2 right (2), 1 left and 1 right (1), or 2 left and 0 right (2). Total: Five different shapes.

Size 4: Either 0 left and 3 right (5), 1 left and 2 right (2), 2 left and 1 right (2), or 3 left and 0 right (5). Total: Fourteen different shapes.

Size 5: Either 0 left and 4 right (14), 1 left and 3 right (5), 2 left and 2 right (2x2 = 4), 3 left and 1 right (5), or 4 left and 0 right (14). Total: 42.

Size 6: Either 0 left and 5 right (42), 1 left and 4 right (14), 2 left and 3 right (2x5 = 10), 3 left and 2 right (10), 4 left and 1 right (14), 5 left and 0 right (42). Total: 132 (I think)
