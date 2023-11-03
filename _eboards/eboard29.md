---
title: "EBoard 28: Randomness"
number: 28
section: eboards
held: 2023-11-03
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Quizzes
* Administrivia
* Questions
* Lab

Quizzes
-------

* Congratulations on finishing the SoLA! (or whatever you chose to do of
  the SoLA)
* Ending early today!

Administrivia
-------------

* Remember!  The clock stays at 2am for one hour on Sunday morning!
* As usual, I'll need to spend the first few minutes of lab getting
  the autograder running.

### Upcoming Token activities

Academic

* CS Table Tuesday: ???
* Mentor session Tuesday
* Convocation Thursday 11am JRC 101: David White '90: Grinnell is the Best 
  F\*\*cking College in the World .. and YOU are Ruining It.  Come Find Out Why.
* Care in the Academy, Thursday, Noon, HSSC 1231
* CS Extras Thursday: ???

Cultural

Peer

* Swimming vs. Iowa Central CC, Friday, November 3, at 6pm.
* Football vs. UofC, Saturday, November 4, at noon
* Drag, Saturday November 11th.  Cheer the performers and the pretty lights.

Wellness

Misc

### Other good things (no tokens)

### Upcoming work

* Tonight: SoLA 2 post-assessment
* Sunday: Various MP redos (posted to Gradescope)
* Sunday night: Reading on hash tables and dictionaries
* Sunday: MP 6 pre-assessment
* Thursday: MP6

### Friday PSA

* People care about you.  Take care of yourselves.
* Make decisions that are right for you; don't feel like you have to 
  meet others' expectations or presumed habits.
* Consent is essential.

MP6: Vectors and pixels
-----------------------

The color 128,32,8 gives the value 8 after running our formula.  8 is
h (I think).  We want to modify the color so that it gives the value
3 (c).  What new/similar color will work?  We need to subtract 5.
(123, 32, 8) will work.  (122, 33, 8) would also work, but it's even
further from our original color.  We could also use (125,31,7)

Let's check

```
> (remainder (+ 125 31 7) 32)
3
```

I could also add 27, (137, 41, 17)

```
> (remainder (+ 137 41 17) 32)
3
```

Questions
---------

### SoLA 2

"The style LA killed a little bit of my soul."

> Now you know how our graders feel.

> I'll give a style quiz this Friday (sorry ???).

### Registration

Did 2nd years get priority for CSC-161?

> Yes, but we may need to update again to clarify that it's all prospective
  CS majors.  If you are a second-year student already have another
  declared major, and intend to add a CS major, please drop a note to
  registrar@grinnell.edu to that effect.

### Randomness

### Administrative

### Other

Lab
---

Why does `roll-a-die` have a lambda with an empty parameter list?

```
(define roll-a-die
  (lambda ()
    (random 1 7)))
```

Because we want a *procedure*, something that does new work each time.
Otherwise, we'd be defining a value that is unchangeable (at least for
one run of the program).

```
(define random-die
  (random 1 7))
```

What are Sam's favorite things about this lab?

> `pair-a-dice` is a wonderfully horrible pun.

> "Rolling Rolling Rolling" brings to mind (a) Tina Turner (or John
  Fogerty) singing "Proud Mary" and (b) John Belushi singing "Rawhide"
  in "The Blues Brothers".

> The behavior of random procedures requires some subtlety in understanding.
