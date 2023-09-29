---
title: "EBoard 16: Recursion lab"
number: 16
section: eboards
held: 2023-09-29
link: true
---
# {{ page.title }}

_Quiz Protocol_

* Grab a quiz (or quizzes).
* Work until 8:45 a.m.
* Mentors will grab quizzes at 8:45 a.m.
* If you finish early, meditate, play with phone, etc.

**Warning** This class is being recorded.

_Approximate overview_

* Quiz
* Administrivia
* Notes from the graders 
* About MP4
* Questions
* Lab

Administrivia
-------------

* There's more talking than I'd like today, but that's sometimes
  how it goes.
* Welcome to all the visiting parents!
* Don't forget that we have evening tutors here most nights!
    * They can help with mini-projects.
    * They may be able to answer questions about LAs you missed.
    * They may be able to help when you can't upload a file to Gradescope.

### Upcoming Token activities

Academic

* Mentor session, Sunday, 1pm
* CS Table, Tuesday, Noon, Reports from Tapia and GHC.

Cultural

* Jazz Ensemble, Friday, 7:30 p.m. Sebring-Lewis
* Grinnell Symphony, Saturday, 2:00 p.m. Sebring-Lewis
* Pieta Brown, Saturday, 7:00 p.m. Central Campus

Peer

* Football vs. Lawrence, Saturday, 1pm

Wellness

Misc

* Grinnell homecoming parade, next Thursday, downtown 5:30 p.m.

### Other good things

* Neverland players

### Upcoming work

* Friday night: SoLA 1 post-assessment (but do it asap)
* Sunday night: Reading for Monday's class (more on recursion)
* Sunday night: MP4 pre-assessment due
* Monday morning: Lab writeup due (but turn it in todady)
* Thursday night: MP4 due

### Friday PSA

Notes from your graders
-----------------------

* Please make sure that your file uploads correctly.  If it doesn't,
  please get help asap.  This applies for labs as well as MPs.
* Please pay attention to the autograder.
* You are doing really good work.  Please ensure that Sam lets us give
  you good marks.  We often see something that's close to an E, but
  missing something at the R level.
    * Reminder to Sam to show an example.
* Work on simplifying repetitive code.  That should be easier once
  you learn `let` next Wednesday.  But the trick that Sam revisited
  last class will also help.

About MP4
---------

Another issue
-------------

Here's the conditionals problem from the quiz.  (I suppose it has now
effectively moved into the "sample problems" list, too.)

_Write a procedure, `(numeric-type num)`, that takes a number as
input and produces the most specific description of the number it
can: "exact" or "inexact" followed by "integer", "real", or "complex".
Do not use "rational"._

Here's a solution I got.

```
(define (numeric-type num)
  (define exactness (if (exact? num) "exact" "inexact"))
  (define type
    (cond
      [(integer? num) "integer"]
      [(real? num) "real"]
      (else "complex")))
  (string-append exactness " " type))
```

_TPS: Why might I be showing you this example?_

Questions
---------

### Testing

What distinguishes an "edge case" from a "normal case"?

> Usually, it's something on the boundary (edge) of what the input
  can look like.

> For lists, it is normally something like "Does this work correctly
  for the empty list?"  "Does this work correctly for a list with
  only one value?"  "Does this work correctly if a value of interest
  is at the start of the list?"  "Does this work correctly if a value
  of interest is at the end of the list?"

> Evidence suggests that these are often the places where procedures
  that seem to work break.

### On administrative stuff

### On stuff from the last lab

Recursion, revisited
--------------------

More _TPS_

Question one: What are the three things you should think about when
designing a recursive function?

Question two: How can you tell if a list has only one element (without
using `length`)?

Lab
---
