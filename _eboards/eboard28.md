---
title: "EBoard 28: Vectors, continued"
number: 28
section: eboards
held: 2024-04-08
link: true
---
# {{ page.title }}

**Please sit with your partner from the previous class.**

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [5 min]
* Notes from Friday's quiz [5 min]
* Notes from last class [15 min]
* Questions [5 min]
* Labs [40 min]
* Turn in labs [5 min]

Administrative stuff
--------------------

* As you preregister for next semester, please consider taking CSC-161.
  (You might also consider MAT/CSC-208, but space is currently limited.)
* Since our graders don't have a new MP to grade, if you get redos in
  early, they might get them graded more quickly.
  
### Token opportunities

Academic/Scholarly

* Monday, 2024-04-08, 4:15--5:30 pm, HSSC A2231 (Auditorium).
  _Just Talk: A Trans-Related Conversation on Legislation and the Law_.
* Tuesday, 2024-04-09, noon, some PDR
  _CS Table (topic TBD)_.
* Thursday, 2024-04-11, 4pm, HSSC 1231 (the Kernel).
  _CS Poster Session_.
* Thursday, 2024-04-11, 7pm, the normal place
  _Mentor Session_.

Cultural

* Thursday, 2024-04-11, 4:15-5:30pm, HSSC S1325
  _Writers@Grinnell_.
* Thursday, 2024-04-11, 8:00-9:30pm, JRC 101
  _Writers@Grinnell_.
* Friday, 2024-04-12, 4:00-5:00pm, HSSC N1170
  _Middle of Everywhere_.

Peer

Wellness

* Tuesday, 2024-04-09, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-09, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-09, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.
* Friday, 2024-04-12, 3:00--5:00pm, JRC Courtyard
  _Get Nostalgic_.

Misc

* Monday, 2024-04-08, 1:00--3:00pm (approx), where appropriate.
  _Watch the eclipse (but don't stare at the sun)_.
    * Eclipse glasses being given away at Burling (we think) and
      by the Physics SEPC (we know).
* Saturday, 8:30--11:00pm, Harris.
  _Drag_.

### Other good things (no tokens)

### Upcoming work

* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
    * Phase 1
        * Decomposition
        * Basic types
        * Cut and compose
    * Phase 2
        * Conditionals
        * Program Style
        * Lists
        * Documentation
        * Testing
        * Ethical Considerations
    * Phase 3
        * List recursion (quizzed)
        * Local bindings (quizzed)
        * Numeric recursion
        * Vectors
        * Randomness
* Tuesday, 2024-04-09, 11:00pm, [Reading on dictionaries](../readings/hash-tables) due.
    * [_Submit reading response on dictionaries on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330317)
* Wednesday, 2024-04-08, 8:30am, [Lab writeup](../labs/vectors)
    * [_Submit Fridays's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323174)
    * Preferred: Finish it during class today.
* Wednesday, 2024-04-08, 8:30am, [Lab writeup](../labs/vectors-continued)
    * [_Submit todays's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330313)
    * Preferred: Finish it during class today.
* Wednesday, 2024-04-10, 8:30am, MP7 assigned
* Wednesday, 2024-04-10, 11:00pm, [SoLA 3](../las/) due
* Friday, 2024-04-12, 8:00am, Quizzes
    * Dictionaries (new, covered Wednesday)
    * Diagramming structures (old)
    * Tracing (old)
* Friday, 2024-04-12, 11:00pm, [SoLA 3](../las/) post-reflection
    * [_Submit SoLA 3 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248183)
* Friday, 2024-04-12, 11:00pm, MP7 pre-reflection due
    * [_Submit MP7 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330325)
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)
* Sunday, 2024-04-14, 11:00pm, [MP2](../mps/mp02) Second Redo
    * [_Submit MP2 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323413)
* Sunday, 2024-04-14, 11:00pm, [MP3](../mps/mp03) Second Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323418)
* Sunday, 2024-04-14, 11:00pm, [MP1](../mps/mp01) Third Redo
    * [_Submit MP1 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323410/)

Notes from quiz
---------------

Reminders:

* A list with `n` elements has `n` pairs ("cons cells").
* A call to `cons` creates one pair ("cons cell").
* Each box in a pair can hold one thing (a null or an arrow).
* Arrows point to values (either another pair or a more basic value).

Notes from last lab
-------------------

### Vectors

_It's TPS time!_

What are vectors?

Why do we use them instead of lists?

Why use lists when we have vectors?

What does typical "extract data" recursion over a vector look like?

What does typical "change data" recursion over a vector look like?

### `palette?`

How should we write `(palette? val)`? 

```
;;; (palette? val) -> boolean?
;;;   val : any?
;;; Determine if `val` is a nonempty vector of RGB colors.
```

Getting started. We decompose a bit.

```
(define palette?
  (lambda (val)
    (and (vector? val)
         (> (vector-length val) 0)
         (all-rgb? val))))
```

```
;;; (all-rgb? vec) -> boolean?
;;;   vec : (all-of vector? nonempty?)
;;; Determine if `vec` contains only RGB colors.
```

The "obvious" solution: Vector recursion.

```
(define all-rgb?
  (lambda (vec)
    (all-rgb?/helper vec 0)))

(define all-rgb?/helper
  (lambda (vec pos)
    ???))
```

A common solution: Convert it to a list and use our list knowledge.

```
(define all-rgb?
  (lambda (vec)
    (??? (vector->list vec))))
```

A surprising solution: Think about type predicates.

```
(define all-rgb?
  ???)
```

Rethinking `palette?`

```
(define palette?
  ???)
```

Questions
---------

### Administrative

Can I miss class next Monday so that I am able to celebrate Eid in Chicago
over the weekend.

> Sure. Just drop me a note.

### Vectors


Lab
---

You have two labs to do. Finish Friday's lab (more or less) and do
today's lab (more or less).

Friday's lab: At this point, you should do only exercises 4 and 5.

