---
title: "EBoard 35: Searching and program efficiecy"
number: 35
section: eboards
held: 2023-11-20
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

* Quizzes returned
* On Wednesday, plan to sit with your project team

### Upcoming Token activities

Academic

* Tuesday, 2023-11-23, Noon, Day PDR: _CS Table: Cell Phone Addiction_

Cultural

Peer

Wellness

* We need more wellness activities!

Misc

* Please fill out the peer mentor evaluation form.

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Tuesday: Late MP8 pre-assessment
* Wednesday: Quizzes
* Sunday: Reading

### Wednesday quiz topics

_Available starting at 7:30 a.m.  Collected at 8:45 a.m._

* Data abstraction (new)
* Higher-order programming (repeat)
* Randomness (repeat)
* Diagramming structures (repeat)
* Tracing (repeat)

Questions
---------

### Administrative

### Higher-order programming

How do I write a procedure that returns "a procedure that takes a
parameter, `x`, and ...."?

> "a procedure that takes a parameter, `x` and ..." can be written
  `(lambda (x) ...)`.

> So we normally write something like 

        (define proc
          (lambda (stuff)
            (lambda (x)
              ...)))

> For example, "Write a procedure, `square-maker`, that takes a size as 
  a parameter and returns a procedure that builds colored squares
  of the given size.  The returned procedure should take a color
  as a parameter."

        (define square-maker
          (lambda (size)
            (lambda (color)
              (square size "solid" color))))

> In this case, we could also use `cut`.

        (define square-maker 
          (lambda (size)
            (cut (square size "solid" <>))))

> However, we can't use `cut` if we need to use the parameter more
  than once, or if it appears more deeply in the body.

Lab
---
