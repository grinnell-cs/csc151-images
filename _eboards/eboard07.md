---
title: "EBoard 07: Strings"
number: 7
section: eboards
held: 2024-02-05
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

Pre-class instructions: **Please grab a whiteboard.**

_Approximate overview_

* Administrative stuff [10 min]
* Notes on tracing [5 min]
* Notes on MP2 [15 min]
* Other Q&A [10 min]
* Lab [35 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* I'm worried that I get email from some of you at 1am/2am. I'll remind
  you that good sleep will help you function better and that there's
  a negative cycle with too little sleep.
    * Too little sleep means you take more time to do your work.
    * Taking more time to do your work means that you have less time
      to sleep.
    * If a few extra days on a mini-project will help you catch up
      on sleep, just let me know.
* Friday's quiz should be available on Gradescope.
* Technology hates me today. I can't log in to the instructor workstation,
  so I'm working from my laptop instead.
    * Joyfully, my hearing aids are acting up, too.
    * Cool! Technology hates you, too.

### Token activities

Scholarly

* Tuesday, 2024-02-06, Noon in JRC 224A. 
  _CS Table: Web browsers, privacy, and advertising._
* Thursday, 2024-02-08, 11am in JRC 101.
  _Scholars' Convocation: A Life Worth Archiving – Excerpts from a Memoir._

Cultural

Peer

* I forget. Do we have any womens tennis players? Mens tennis players?
  Track and fielders?
* Roller skating this Friday in Harris center.

Wellness

* Tuesday, 2024-02-06, noon, BRAC P103 (Multipurpose Dance Studio).
  _HIIT & Strength Fitness Class_.
* Tuesday, 2024-02-06, 12:15, Bucksbaum 131 (the museum).
  _Yoga in the museum_.

Misc

* InfoSec security survey (coming via email)

### More on CS Table

At the next CS Table we will discuss web browsers, privacy, and advertising. Our discussion will go beyond Google and the Chrome browser, but our two readings focus on recent changes Google has been pushing in Chrome.

Victor Wong. How Privacy Sandbox raises the bar for ads privacy. Privacy Sandbox (Google). August 15, 2023. <https://privacysandbox.com/news/how-privacy-sandbox-raises-the-bar-for-ads-privacy>

Bennett Cyphers. Don't Play in Google's Privacy Sandbox. Electronic Frontier Foundation. August 30, 2019. <https://www.eff.org/deeplinks/2019/08/dont-play-googles-privacy-sandbox-1>

Please feel free to explore beyond these readings, and come with questions if you're not sure about some of the details. Printed readings will be available outside Noyce 3827 on Monday afternoon.

Join us in JRC 224A at noon on Tuesdays to participate. Students who do not have a meal plan may sign in at the entrance to the dining hall to charge their meals to the department; students who charge meals to the department are expected to participate in CS Table discussion. All students, faculty, and staff are welcome to attend.


### Other good things

* Wednesday, 7:30-9:00 p.m., Women's Basketball

### Upcoming work

* Tuesday, 2024-02-06, 11:00pm: Submit reading responses.
    * [_Submit on Gradescope_](...)
* Wednesday, 2024-02-07, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](...)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-07, 11:00pm: [Mini-Project 2](../mps/mp02) due.
    * Gradescope forthcoming.

Notes on Tracing
----------------

_A few common comments from the tracing quiz. Let me know if any of
these don't make sense._

* Only do one step at a time, at least until you've mastered tracing.
  Trying to do more than one step at once often leads to errors.
* Similarly: Don't skip steps.
* Try to keep your trace in valid Scheme. The goal is as much to
  understand the computation as to get "the right answer".
    * When you use valid Scheme, you can also check the answer at 
      each step to see if your trace seems accurate.
    * Don't parenthesize individual values. (It's okay in math; it's
      not okay in Scheme.)
* We normally finish evaluating each expression before moving on to
  the next one.
* For procedure calls: Substitute into the body of the procedure and
  then put the new expression in its place.

Thinking about MP2
------------------

What is this `description` parameter for `image-subtract` (or other procedures)?

> Userful Meaning

> Description gives a string used to describe the image. It's there
  to support visually impaired users (or people who are bad at
  understanding drawings).

> It's almost always optional.

Should we generate descriptions for the shapes and such we're making?

> I was planning to put that in the requirements for E.

> But you don't have to shoot for E on every assignment or on the first
  submission.

Agh! I'm trying to do outlined triangles and all I get is the bottom
part of the bigger triangle. What's going on?

> It aligns at the left and top.

How do we deal with it?

> TPS.

> We can see what happens when we use a semi-transparent object.

> We can add space by putting a blank rectangle at the left.

Can't we just use points inside the blank rectangle?

> Yeah, you wish. (Forthcoming procedure.

Why are we using a rectangle rather than a triangle to shift?

> Because it's convenient. It's transparent, so it doesn't really matter
  what it is.

Is there something other than shifting that help.

> We could also use `place` and then `image-subtract`

> Sam appears to have broken place. It is not a good technology day.

> We could also use `overlay`.


Okay, how about if I want to get the diagonal right, too?

> Drawing + math!

> TPS

### Code

```
> (image-subtract (solid-right-triangle 100 100 "blue")
                  (solid-right-triangle 100 100 (rgb 0 0 0 127)))

.
> (image-subtract (solid-right-triangle 100 100 "blue")
                  (solid-right-triangle 90 90 (rgb 0 0 0 127)))

.
> (image-subtract (solid-right-triangle 110 110 "blue")
                  (beside (rectangle 0 10 (rgb 0 0 0 0))
                          (solid-right-triangle 90 90 (rgb 0 0 0 127))))
. . rectangle: arity mismatch;
 the expected number of arguments does not match the given number
  given: 3
> (image-subtract (solid-right-triangle 110 110 "blue")
                  (beside (solid-rectangle 0 10 (rgb 0 0 0 0))
                          (solid-right-triangle 90 90 (rgb 0 0 0 127))))
.
> (image-subtract (solid-right-triangle 110 110 "blue")
                  (beside (solid-rectangle 10 10 (rgb 0 0 0 0))
                          (solid-right-triangle 90 90 (rgb 0 0 0 127))))
.
> (image-subtract (solid-right-triangle 110 110 "blue")
                  (above (solid-rectangle 10 10 (rgb 0 0 0 0))
                         (beside (solid-rectangle 10 10 (rgb 0 0 0 0))
                                 (solid-right-triangle 90 90 (rgb 0 0 0 127)))))
.
> (solid-polygon (list (pt 10 10) (pt 100 100) (pt 10 100)) "blue")
.
> (solid-coordinate-polygon (list (pt 10 10) (pt 100 100) (pt 10 100)) "blue")
left: 10, top: 10, width: 100, height: 100
.
> (define shift
    (lambda (image hoff voff)
      (above (solid-rectangle 1 voff (rgb 0 0 0 0))
             (beside (solid-rectangle hoff 1 (rgb 0 0 0 0))
                     image))))
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (shift (solid-right-triangle 100 100 (rgb 0 0 255 128))
                         10 10))
.
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (shift (solid-right-triangle 100 100 (rgb 0 0 255 255))
                         10 10))
.
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (shift (solid-right-triangle 90 90 (rgb 0 0 255 255))
                         10 10))
.
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (place (solid-right-triangle 90 90 (rgb 0 0 255 255))
                         10 10
                         (solid-rectangle 120 120 (rgb 0 0 0 0))))
. . place: arity mismatch;
 the expected number of arguments does not match the given number
  given: 4
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (overlay (solid-right-triangle 90 90 (rgb 0 0 255 255))
                           (solid-rectangle 120 120 (rgb 0 0 0 0))))
.
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (overlay (solid-right-triangle 90 90 (rgb 0 0 255 255))
                           (solid-rectangle 110 110 (rgb 0 0 0 0))))
.
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (overlay (solid-right-triangle 90 90 (rgb 0 0 255 255))
                           (solid-rectangle 110 110 (rgb 0 0 0 0))))
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (place (solid-right-triangle 90 90 (rgb 0 0 255 255))
                         "left" 10
                         "top" 10
                         (solid-rectangle 120 120 (rgb 0 0 0 0))))
.
> (image-subtract (solid-right-triangle 120 120 "blue")
                  (place (solid-right-triangle 30 30 (rgb 0 0 255 255))
                         "left" 10
                         "top" 40
                         (solid-rectangle 120 120 (rgb 0 0 0 0))))
.
```

Questions
---------

### Administrative

### Reading (strings)

Lab
---

When you see `\"` within a string, it counts as *one* character. That's
because a `"`. (Otherwise, Racket can't tell the difference between an
ending quotation mark and a quotation mark within a string.)

Add the following before submitting

```
; SAM SAID WE CAN STOP HERE!
```

Please read the rest of the lab and ask questions.
