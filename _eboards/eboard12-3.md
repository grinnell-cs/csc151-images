---
title: "EBoard 12: Conditionals (Section 3)"
number: 12
section: eboards
held: 2025-02-19
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

We are back to the standard start-of-class procedure.

_Approximate optimistic overview_

* Administrative stuff [10 min]
* Questions and answers [20 min]
* Lab [30 min] (ends at 3:30)
* Turn in Lab [5 min]
* Quiz [15 min]

Administrative stuff
--------------------

### Introductory notes

* I am out of Otter.ai minutes, so there is no Otter transcription/summary
  for any classes today.
* In case you hadn't figured it out yet, you have an hour to complete an
  LA from the time that you start the LA, even if you close your computer
  or log out of Gradescope.
* Remember that you can take both/all quizzes. And you can stay until
  thirty minutes after the end of class to complete them.

### Upcoming activities

Scholarly

* Thursday, 20 February 2025, 11:00 a.m.--noon, JRC 101.
  _Scholars’ Convocation: Steven Geofrey.  What Information Worlds Reveal about Climate Change Awareness, Advocacy, and Hope_
* Tuesday, 25 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: TBD_ 

Artistic

* Friday, 21 February 2025, 7:00 p.m., The Wall (I think).
  _The Neverland Players_
    * Tickets in the Bucksbaum Box Office.
* Saturday, 22 February 2025, 2:00 p.m., The Wall (I think).
  _The Neverland Players_
* Saturday, 22 February 2025, 7:00 p.m., The Wall (I think).
  _The Neverland Players_
* Sunday, 23 February 2025, 2:00 p.m., The Wall (I think).
  _The Neverland Players_

Multicultural

* Friday, 21 February 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Beyond the War: Ukraine on the Cultural Front_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Friday, 21 February 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_. Shoot your mentor.
* Tuesday, 25 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 25 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* Sunday, 23 February 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 25 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

* Thursday night--Sunday night, The Natatorium.
  _Swimming Conference Meet_.

### Upcoming work

* Wednesday, 19 February 2025
    * Quiz: Documentation
    * Makeup quiz: Tracing
* Thursday, 20 February 2025
    * [Submit Wednesday's lab on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815249)
    * Readings:
        * [List basics](../readings/list-basics)
        * [Transforming lists](../readings/transforming-lists)
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5799376)
    * [SoLA 1](../las)
        * [Decomposition](https://www.gradescope.com/courses/948769/assignments/5798661)
        * [Procedures](https://www.gradescope.com/courses/948769/assignments/5798726)
        * [Primitive types](https://www.gradescope.com/courses/948769/assignments/5798727)
        * [Lambda-free anonymous procedures](https://www.gradescope.com/courses/948769/assignments/5798741)
        * [Collaboration](https://www.gradescope.com/courses/948769/assignments/5798697)
* Friday, 21 February 2025
    * MP4 released
    * [Submit post-reflection for SoLA 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5780118)
* Sunday, 23 February 2025
    * [Submit first redo for MP2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5783168)
    * Submit Friday's lab on Gradescope
    * Readings: Processing Lists
        * [The "big three" list operations](../readings/list-big-three)
        * [Transforming lists](../readings/list-transform)
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815253)
    * [Submit pre-reflection for MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815256)

Q&A
---

### Administrative

When will we get grades on today's quizzes?

> Sam hopes to have those done tonight.

What should we submit for redos?

> The updated `.rkt` file.

> Any images required by the assignment.

> A text (preferably) or PDF file name `CHANGES.txt` (or `CHANGES.pdf`)
  that summarizes what problems you had the first time and what changes
  you've made. It can also be `CHANGES.rkt`.

I accidentally opened an LA early because I didn't understand the
timing. Can you help me?

> Yes, I can reset them if you DM me.

### Booleans and conditionals

Why does the equality predicate `=` not also count as a comparator?

> Comparators are supposed to tell you whether one thing comes before 
  another. `=` does not.

Could you go over the `not` procedure and its uses?

> `(not expression)` -> Gives the "opposite" result of the expression.

```racket
;;; (anything-but-string? val) -> boolean?
;;;   val : any?
;;; Returns false if `val` is a string and true otherwise.
(define anything-but-string?
  (lambda (val)
    (not (string? val))))
```

I read and reread the truish breakdown and was still confused. What
are examples of statements that would result in a truish output?
What would produce not false, but then not be true?

> `(not #f)` is always true, `#t`.

> However, there are values that are neither `#f` nor `#t`. For example,
  `"hello"` or the result of `(+ 2 3)`. We consider those "truish". If
  we use them as the test/guard in a conditional, instead of an error,
  we'll see them treated as if they were true.

What do we need to understand when making the distinction between
keywords and procedures?

> You should understand that the order of evaluation is different
  (and, preferably, what that order is).

> Normal (e.g., `(+ exp1 exp2 exp3)`, `exp1` is `(* 3 4)`): Evaluate
  each expression from left to right and then add them. (In general,
  evaluate from left to right and then apply the procedure.)

> Lambda (i.e., `(lambda (params) exp)`): When we apply one of these,
  we substitute the arguments for the corresponding parameters in the
  expression and then evaluate the updated expression. What about
  just the lambda? It builds a procedure, but does NOT evaluate the expression
  until later. (It also doesn't evaluate the params.)

> If (i.e., `(if test consequent alternate)`): Evaluate the `test`. If
  it's true, evaluate the consequent and return its value. If the test
  evaluated to false, evaluate the alternate and return its value.

> And (i.e., `(and exp1 exp2 exp3)`): Evaluates the expressions one by
  one. If any of them are false, immediately returns false and does not
  evaluate the remaining expressions. If none of them are false (it has
  evaluated all of them), return the value of the last expression.
  `(and (string? s1) (string? s2) (string-append s1 s2))`.

> Or (ie.., `(or exp1 exp2 exp3)`): Evaluates the expressions one at a
  time. If any of them are truish, returns that value. If all of them
  are false, returns false.

Lab
---

A hint for `median-of-three`

```
(cond
  [(<= x y z)
   ?]
  [(<= y z x)
   ?
  ...
  ])
```
