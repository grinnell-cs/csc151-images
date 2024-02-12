---
title: "EBoard 10: Cut and Compose and more"
number: 10
section: eboards
held: 2024-02-12
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [20 min]
* Lab [55 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* As we discovered last Wednesday, when you write something like
  `(define kitten (image-load "kitten.jpg"))` in your *definitions
  pane*, the autograder will crash. That's because it's going to try
  to load "kitten.pg".
    * Option 1: Don't load it in your definitions pane; just do it
      in your interactions pane.
    * Option 2: Upload any loaded files along with your .rkt file.
      In this case, you need to make sure that you just use the
      short name for the file, and not a full path.
* When you miss class, you are responsible for making up lab. You should  
  plan to spend *at least 60 minutes* on the lab.
* One of my hearing aids broke, so I may be even more unsure of what
  you say than normal.
* I've commented on your SoLA 1 pre-reflections.
* Since you'd been asking about quizzes on Gradescope, I'll do my
  best to demonstrate how you look at a quiz.

### Token activities

Scholarly

* Tuesday, 2024-02-13, noon--1:00pm, Some PDR.
  _CS Table: Functional programming_.
* Thursday, 2024-02-15, 11:00--noon, JRC 101.
  _Scholars' Convocation: Gaile Pohlhaus on “An Epistemology of 
   the Oppressed: Resisting and Flourishing under Epistemic Oppression”_

Cultural

* Thursday, 2024-02-15, 7:00--9:00pm, Sebring-Lewis.
  _Jazz Concert w/Carol Welsman_.
* Friday, 2024-02-16, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._
* Sunday, 2024-02-18, 7:00--9:00pm, Harris Cinema.
  _The Moth Storytelling Slam_.

Peer

* Friday through Sunday, 2024-02-16 through 2024-02-18. Osgood Pool.
  _Midwest Swimming and Diving Conference Championships_.
    * 30 minutes counts.
    * Up to two separate sessions.

Wellness

* Monday, 2024-02-12, 4:00--5:00pm, HSSC Atrium.
  _Therapy dogs._
* Tuesday, 2024-02-13, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-13, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-13, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

* Monday, 2024-02-12, 4:30--5:30pm, JRC 101.
  _Talking about disability policy with Daniel Van Sant, Director
   of disability policy at the Harkin Institute._

### Other good things (no tokens)

* Saturday, 2024-02-17, 1:00--3:00pm, Darby.
  _Men's Basketball vs. Monmouth_.
* Saturday, 2024-02-17, 2:00--5:00pm, Field House.
  _Women's Tennis vs. Ottwawa_.
* Saturday, 2024-02-17, 3:00--5:00pm, Darby.
  _Women's Basketball vs. Monmouth_.

### Upcoming work

* Today, 2024-02-12, 4:00pm, SoLA 1 released
    * Decomposition (Quiz week 1.)
    * Procedural abstraction.
    * Primitive types. (Quiz week 2.)
    * Collaboration. (Friday's topic.)
    * Lambda-free anonymous procedures. (Today's topic.)
    * No question on tracing. That will only be a paper quiz.
* Tuesday, 2024-02-13, 11:00pm: Submit reading responses.
    * [Boolean values and predicate procedures](../readings/booleans)
    * [Conditional evaluation in Scheme](../readings/conditionals)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087927/)
* Monday, 2024-02-14, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-14, 11:00pm, SoLA 1 due
* Friday, 2024-02-16, 8:30am (or as early as 8:00am): Quizzes.
    * New: Conditionals
    * Old: Tracing
    * _You may bring one page of hand-written notes._
* Friday, 2024-02-16, 11:00pm: [SoLA 1 post-reflection](https://www.gradescope.com/courses/690100/assignments/3974516)
    * Try to do it earlier.
* Friday, 2024-02-16, 11:00pm: [MP3 pre-reflection](https://www.gradescope.com/courses/690100/assignments/4087963)

### Notes on the SoLA

* You don't have to memorize procedures. This is a semi-open-book exam.
* Don't worry if you don't get everything on this SoLA. Historical evidence
  suggests that you will find most of the questions easier on the next
  SoLA.

Questions
---------

### Administrative

### Readings (Pair Programming)

### Readings (Cut and Compose)

Can you further explain how the computer understands/executes the `cut`
procedure?

> First of all, `cut` isn't strictly a procedure. It's a "keyword" (at
  least as I describe it). Instead of evaluating its parameter, which
  is the norm for procedures, it transforms its parameter into a procedure.

> Basically, it creates a parameter for each diamond/hole at the top
  level of the expression.

Can `cut` or `section` be used such that one parameter is used twice?

> Neither `cut` nor `section` lets you duplicate a parameter. Hence, they 
  have somewhat limited use. They are still useful in a large range of
  situations.

For check one, I tried to make this work:

    (define sub3 (sub1 (sub1 (cut (sub1 <>)))))

But it gave me an error saying the second sub1 wasn't receiving a
number for an input but `(cut (sub1 <>))` does output a number. Why
doesn't that code work?

> TPS.

What's the difference between `(cut (rgb-darker <>))` and `rgb-darker`?

> 

I discovered that I can't put a diamond in a nested expression, such
as `(cut (+ 2 (* 3 <>)))`. Why not?

> Option 1:

> Option 2:

I couldn't find any colors for which `(o rgb-darker rgb-lighter)` gave
a different color. Are there any?

> Yes.

Could you go over `rgb-purpler` and `rgb-much-darker`?

> Sure.

Can you show how to load an image in DrRacket? I'm getting errors.

> Sure.

### Misc

Lab
---
