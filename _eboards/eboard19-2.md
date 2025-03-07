---
title: "EBoard 19: Local Bindings (Section 2)"
number: 19
section: eboards
held: 2025-03-07
link: false
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff
* Q&A
* Lab

Administrative stuff
--------------------

### Introductory notes

* Have a great break!
* Just in case it's not clear, I would much prefer that you all get an S on
  each LA the first time through. Writing "S" (and, perhaps, a small comment)
  takes much less effort than correct errors and then grading another LA.
    * But it's fine if you don't get them right the first time; it's simply
      a sign that you still have some misconceptions.
* Thanks for all the suggestions on handling SoLAs and struggling students. 
  I'll let you know some of the changes after break.
* I'm hoping to have all your grades to you by the end of the first week of
  break.

### Upcoming activities

_These are all after break._

Scholarly

Artistic

Multicultural

* Friday, 28 March 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: ???_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 26 March 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 26 March 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Friday, 28 March 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 28 March 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 29 March 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)

Misc

* Sunday, 9 March 2025, 7:30--8:30 p.m., Science 3819. 
  **NO Mentor Session**
* Sunday, 23 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session (I think)_
* Tuesday, 25 March 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Friday, 7 March 2025
    * [Submit post-reflection on MP5](https://www.gradescope.com/courses/948769/assignments/5842795)
* Sunday, 9 March 2025
    * [Late submission of MP5](https://www.gradescope.com/courses/948769/assignments/5886696).
* Sunday, 23 March 2025
    * [Submit lab writeup from class 19](https://www.gradescope.com/courses/948769/assignments/5891749/)
    * [Submit pre-reflection for SoLA 2](https://www.gradescope.com/courses/948769/assignments/5902194)
    * Readings for class 20
        * Review [recursion basics](../readings/recursion-basics).
        * Nothing to submit.
* Monday, 24 March 2025
    * [SoLA 2](../las/) released.
        * Old topics: Decomposition, Procedural abstraction, Primitive types,
          Collaboration, Lambda-free anonymous procedures (cut and compose).
        * Semi-old topics: Conditionals, documentation, lists
        * New topics: Testing, program style, ethical considerations
* Wednesday, 26 March 2025
    * Quiz: Local bindings
    * Makeup quiz: Tracing
    * _Remember that you can bring a sheet of notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_
* Thursday, 27 March 2025
    * [SoLA 2](../las/) due.
* Sunday, 30 March 2025
    * MP redos due
        * [Submit second redo of MP 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902141)
        * [Submit second redo of MP 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902142)
        * [Submit second redo of MP 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902145)
        * [Submit redo of MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902148)
        * [Submit redo of MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902152)

### Friday PSA

Questions
---------

### Administrative

I seem to have missed a fair number of labs. Can I make them up over break?

> My usual policy is "No". But the world is chaotic, so I'm being a bit
  more open. _You may make up missed labs over break._ Teams Message or
  Email me when you've finished each one and I'll open up a late submission
  on Gradescope.

I seem to have missed a fair number of reading responses. Can I make them
up over break?

> See the previous answer.

I seem to have missed a fair number of post-reflections. Can I make them 
up over break?

> See the previous answer (or perhaps the previous previous answer).

I seem to have missed a fair number of pre-reflections. Can I make them
up over break?

> No.

Will you post more redos for over break?

> Yes. Second redos for MPs 1, 2, and 3 are due the Sunday after break.

> First redos for MPs 4 and 5 are also due that Sunday.

If I make up a lab, can I stop after ??? minutes and submit whatever I've
completed.

> Yes. ??? minutes is 60 minutes.

My quiz is missing. What's up with that?

> I'll look during lab.

When will we know how many tokens we've used and earned?

> You should know. But I'll be counting during the first week of break.

### Reading (Local bindings)

What is the benefit to using `let` to define a local helper procedure
as opposed to defining it outside the main procedure?

> The helper procedure may want to use the parameters to the enclosing
  procedure. This way, we don't have to pass all of those parameters to
  the helper.

> E.g.,

```
(define rectangle
  (lambda (left top width height rcolor bg iwidth iheight)
    (let ([helper (lambda (x y)
                    (cond
                      [(some-test x y width height)
                       rcolor]
                      [...]
                      [else
                       bg]))])
      (image-compute helper iwidth iheight))))
```

> We can worry less about name overlaps. For example, instead of 
  `stack-and-sequence-helper`, we could just use `helper`.

Why bother naming our helper procedures instead of using anonymous procedures?

> Perhaps it avoids repetition. Perhaps it clarifies our code.

It says that a `let` expression may have multiple bodies. If the `let`
expression only takes the value of the last body, then why would a
programmer use multiple bodies in a `let` expression?

> There are some procedures we call for their "side effects"; they change
  the state of the system. We haven't encountered any such procedures yet,
  but we will.

Can we please go over check 3, ratios revisited?

> Certainly.

```
;;; (v2c-ratio str) -> rational?
;;;   str : string
;;; Determine the ratio of vowels to consonants in str
(define v2c-ratio
  (lambda (str)
    (/ (tally vowel? (string->list str))
       (tally consonant? (string->list str)))))
```

### Scheme

### Other

Lab
---
