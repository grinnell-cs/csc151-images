---
title: "EBoard 12: Pause for breath (Section 2)"
number: 12
section: eboards
held: 2024-02-16
link: true
---
# {{ page.title }}

PLEASE RETURN TO YOUR PLACE FROM LAST CLASS SO THAT YOU CAN FINISH
THE LAB!

_Approximate overview_

* Administrative stuff [10 min]
* A problem [10 min]
* Some notes on Wednesday's lab [10 min]
* Questions
* Lab
* Turn in lab [5 min]
* Quiz [15 min]

Administrative stuff
--------------------

* Oh not! You're stuck with Sam again!
* MP3 has been updated. A few more updates are likely coming (mostly 
  to the rubric).
    * See link to starter code on Teams.
* For redos: Make sure to submit a `CHANGES.rkt` file when your redo is
  ready for grading.

### Upcoming activities

Academic

* Tuesday, 2024-02-20, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-02-22, 4:00pm, Room TBD.
  _CS Extra: Declaring a CS Major._
* Thursday, 2024-02-22, 7:00pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-02-16, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._
* Sunday, 2024-02-18, 7:00--9:00pm, Harris Cinema.
  _The Moth Storytelling Slam_.

Athletics

* Friday through Sunday, 2024-02-16 through 2024-02-18. Osgood Pool.
  _Midwest Swimming and Diving Conference Championships_.
* Saturday, 2024-02-17, 1:00--3:00pm, Darby.
  _Men's Basketball vs. Monmouth_.
* Saturday, 2024-02-17, 2:00--5:00pm, Field House.
  _Women's Tennis vs. Ottwawa_.
* Saturday, 2024-02-17, 3:00--5:00pm, Darby.
  _Women's Basketball vs. Monmouth_.

Wellness

* Tuesday, 2024-02-20, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-20, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-20, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

### Upcoming work

* Friday, 2024-02-16, 11:00pm: [SoLA 1 post-reflection]
* Friday, 2024-02-16, 11:00pm: [MP3 pre-reflection]
* Sunday, 2024-02-18, 11:00pm: Readings
    * [List basics](../readings/list-basics)
    * [Transforming lists](../readings/transforming-lists)
    * [_Submit on Gradescope_]
* Sunday, 2024-02-18, 11:00pm, Redo of [MP1](../mps/mp1)
    * [_Submit on Gradescope_]
* Monday, 2024-02-19, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_]
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-21, 11:00pm: [MP3](../mps/mp3)

### Friday PSA

* You are (probably) awesome.
* People care about you.
* Please take care of yourselves.
* Moderation
* Remember that you need not drink or smoke or ... to be a good Grinnellian.
* Be who you are; don't succumb to (imagined) peer pressume.
* CONSENT IS ESSENTIAL

A problem 
----------

This should be like vomit in the dorm lounge. Everyone gets charged unless
the people who vomited own up to it.

Some notes on Wednesday's lab
-----------------------------

_Yay! Potentially some more TPS activities._

```
(define median-of-three
  (lambda (x y z)
    (cond 
      [(or (<= x y z) (<= z y x))
       y]
      [(or (<= y x z) (<= z x y))
       x]
      [(or (<= x z y) (<= y z x))
       z]
      [else
       "AGH! Math failed."])))
```

"I want to take the three numbers and remove the largest and remove
the smallest."

```
(define median-of-three
  (lambda (x y z)
    (- (+ x y z)
       (max x y z)
       (min x y z))))
```

* Put 'em in a list and use some magic mechanism for removing elements
  from lists.
* If x is not the min and not the max, it must be the median.
* Reminder: There are many ways to think about solving particular problems.

Talk about talking about how you did
------------------------------------

* Talking about how you did on an assignment (in terms of grade or time
  spent) is unlikely to have positive value.
* Conversations about "How did you solve this problem?" are good.
* REMINDER: DO NOT TALK ABOUT THE SOLA WHILE THE SOLA IS LIVE!

Questions
---------

### Administrative

What are today's quizzes?

> There is a conditionals quiz. It assumes you've done the four or so
  parts of exercise 1 on the conditionals lab and understood them. It
  does not assume you've done the rest.

> There is a tracing quiz.

> You can do both.

> Students without accommodations taking both should try to finish by
  4:05 pm.

> Students with accommodations taking both should try to finish by 4:20 pm
  (assuming you have a 150% accommodation).
  All students can take this choice, whether or not they have an
  accommodation.

> Students who need a quiet space can move into Prof. Perlmutter's lab.
  All students can take this choice, whether or not they have an
  accommodation, provided they are quiet.

What happens if no one admits responsibility?

> Prof. Perlmutter and Prof. Rebelsky will be discussing that issue.

### MP3

For part 1d, what do you mean about 8bit images?

> Eight equally distributed values for the red compoennt.

> Eight equally distributed values for the green component.

> Four equally distributed values for the blue component.  E.g.,
  0, 85, 170, 255

### Conditionals

### Misc

Is everything that goes wrong with the class probably Sam's fault?

> Yes.

Lab
---

If you finish early, please work on the extra problems at the end.

If you don't finish the lab, please submit what you have and then try to
complete it on your own or with a partner.

```
; PROF PERLMUTTER'S PROXY SAID WE COULD STOP HERE
```

The autograder does not seem to be working correctly. Stay tuned while
we figure out why. (Just submit it with the non-working autograder.)
(Sam hates computers.)
