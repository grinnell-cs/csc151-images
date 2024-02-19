---
title: "EBoard 13: Lists"
number: 13
section: eboards
held: 2024-02-19
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [10 min]
* Some notes from MP2 [10 min]
* Questions [10 min]
* Lab [45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* I've put in an Academic Alert for anyone who has below 4/7 on the
  LAs right now. AAs are primarily intended to help us keep track of
  people who might be struggling a bit. Academic Advising might reach
  out to you.
    * Feel free to reach out to me or to Academic Advising if you
      feel like you're struggling and I didn't send in an AA.
* Prof. Perlmutter and I are still discussing what to do about the
  SoLA 1 issues. Stay tuned. I've released the graded SoLAs for
  the time being so that you can see how you've done. However, if the
  "dorm lounge" policy goes into effect, those will change.
* I'll be working with Prof. Perlmutter and the mentors to discuss what
  to do for those of you who are still struggling with tracing.
* I'm still waiting for a replacement hearing aid. Expect me to continue
  to exhibit difficulty hearing.

### Token activities

Academic/Scholarly

* Tuesday, 2024-02-20, noon--1:00pm, Some PDR.
  _CS Table_.
* Tuesday, 2024-02-20, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-02-22, 4:00pm, Room TBD.
  _CS Extra: Declaring a CS Major._
* Thursday, 2024-02-22, 7:00pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-02-23, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._

Peer

Wellness

* Tuesday, 2024-02-20, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-20, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-20, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

### Upcoming work

* Monday, 2024-02-19, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class today.
* Tuesday, 2024-02-21, 11:00pm: Reading responses
    * [_Submit on Gradescope_](...)
* Wednesday, 2024-02-21, 11:00pm: [MP3](../mps/mp3)
    * [_Submit on Gradescope_](...)
* Sunday, 2024-02-25, 11:00pm, [MP2](../mps/mp2) Redo
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4113572/)

Some notes from SoLA 1
----------------------

* Many of you spent the full hour on cut and compose. I generally suggest
  that you stop after the fifeen minutes unless you are making good progress.
  There's a difference between productive struggle and wasteful struggle.
* Good news! We should be through all of the round 2 topics by the 
  Wednesday before SoLA 2.
* I'll remind you closer to SoLA 2, but doing practice problems (including
  some you write) is often the best way to prepare for a SoLA.

Some notes from MP2
-------------------

* I was surprised to see so many blank acknowledgements sections.
    * If you get help from the evening tutors, acknowledge them.
    * If you talk to someone about the mini-project, acknowledge them.
    * If you get help from SamR outside of class, acknowledge me.
* Please use YYYY-MM-DD format for dates. They are unambiguous.
    * 02/11/2024 could be February 11 or November 2.
    * (Sorry, I don't have a good strategy for being more inclusive
      to those who use other calendar systems.)
* Please read the instructions and examples. We had some students submit
  multiple files.
* Please don't include expressions in the middle of your definitions
  pane.  When you're trying out your procedures, you should do so
  in the interactions pane.

### Avoiding incompletes

A hint: You are much better off writing a trivial procedure, like
the following, than submitting nothing for part of the assignment.

```
(define solid-octagon
  (lambda (side-length color)
    (solid-square side-length color)))
```

This will probably pass the one-star tests, helping ensure that you
get an R (which doesn't require a token for the first resubmit) than
an I (which does).

### Making your code less repetitious

Many of you wrote something like the following for `solid-pentagon`.

```
(define solid-pentagon
  (lambda (side-length color)
    (solid-polygon (list (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 2/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 2/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 4/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 4/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 6/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 6/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 8/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 8/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 10/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 10/5 pi)))))
                   color)))
```

Isn't the repetitious? What could you do to make it less so?

_TPS_
                     
Questions
---------

### Administrative

### MP3

Lab
---
