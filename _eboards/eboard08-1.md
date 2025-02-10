---
title: "EBoard 08: Numbers (Section 1)"
number: 8
section: eboards
held: 2025-02-10
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

We are back to the standard start-of-class procedure.

_Approximate optimistic overview_

* Administrative stuff [10 min]
* About Wednesday's quiz [10 min]
* Questions [5 min]
* Lab [50 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

### Introductory notes

* Don't forget that you can raise your hands during lab and either the mentor
  or I will wander over and try to help.
* Please do not use your electronic devices for anything other than classwork
  or a _quick_ check of your email/texts. Anything else may lead to us
  defenestrating your device.
* My weekend fell apart a bit, so I'm a bit behind on everything. In
  particular, I haven't looked at your pre-reflections or reading
  responses. Apologies!

### Upcoming activities

Scholarly

* Thursday, 13 February 2025, 11:00 a.m.--Noon, JRC 101.
  _Grinnell Lecture: Darrius Hills on "The Achievement of Identity: Soul Work, Salvation, and Black Manhood in the Religious Imagination of James Baldwin"_.
* Tuesday, 18 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: ???_

Artistic

* Tuesday, 11 February 2025, 4:00--5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Chen, Kluber, and Tavares_.
* Friday, 14 February 2025, 5:00--6:30 p.m. (talk at 6:00), 926 Broad St (Stewart Arts Building).
  _Opening Reception for Artist Salon: Works by Grinnell College Art Majors_

Multicultural

* Friday, 14 February 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room)
  _Middle of Everywhere: ???_
* Saturday, 15 February 2025, ?:00-?:00 p.m., Harris Gym.
  _Lunar New Year_

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Friday, 14 February 2025, 4:00--?. Field (of Dreams) House.
  _Darren Young Classic_.
* Saturday, 15 February 2025, 10:00--?. Field House.
  _Darren Young Classic, Continued_.
  
Wellness

* Tuesday, 11 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 11 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* No particular date. Cyberspace.
  _Fill out the survey at <https://www.surveymonkey.com/r/GrinnellParksandRec>._
* Tuesday, 11 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_.
* Sunday, 16 February 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session: Quiz and SoLA prep_.
* Tuesday, 18 February 2025. 6:00--7:00 p.m., HSSC A1231.
  _Make a Portfolio Website_.
    * Please register at <https://grinnell.joinhandshake.com/edu/events/1679688>
* Tuesday, 18 February 2025, 7:00--8:00 p.m.
  _No Mentor Session!_ (so no token)

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Tuesday, 2025-02-10
    * [Submit lab writeup for today's lab](https://www.gradescope.com/courses/948769/assignments/5760010)
    * Readings for Wednesdays's class.
        * [Characters and strings](../readings/strings)
        * [Symbolic values](../readings/symbols)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732140)
* Wednesday, 2025-02-11
    * Quiz: Tracing
    * Makeup quiz: Decomposition
* Thursday, 2025-02-12
    * Readings for Friday's class.
        * [How Pair Programming Really Works (Wray)](../files/PairProgramming.pdf)
        * [Coping with Hitchhikers and Couch Potatoes on Teams 
          (from B. Oakley et. al (2004).  
          Turning Student Groups into Effective Teams.  
          _Journal of Student-Centered Learning_ 2 (1).)](../files/OakleyHitchhikers2004.pdf)
        * [Diverse Teams Feel Less Comfortable -- and That's Why They Perform Better](..files/DiverseTeams2016.pdf)
    * [Submit readings on Gradescope]
    * [Mini-project 3 due](../mps/mp03)
    * [Submit mini-project 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5758831)

About Wednesday's Quiz
----------------------

I will ask you to trace an expression that includes function calls. I expect
you to trace _one step at a time_. Here's an example.

Consider the following definitions.

```
(define x 10)
(define y 11)
(define f (lambda (x y) (* (+ x 2) (+ y 3))))
```

Trace the steps in evaluating `(f (+ x y) (- x y))`. We'll do this together.
One person does the next step, the next person says whether or not it looks
good to them. And again, and again, and again.

```
    (f (+ x y) (- x y)))
--> (f (+ 10 y) (- 10 y))
--> (f (+ 10 11) (- 10 11))
--> (f 21 (- 10 11))
--> (f 21 -1)
--> (* (+ 21 2) (+ -1 3))
--> (* 23 (+ -1 3))
--> (* 23 2)
--> 46
```

* You can substitute all instances of one variable in one step.
* You should substitute all the arguments for the parameters in expanding
  a procedure call.
* If you have something like `(* 2 3 4)`, you do it all at once.
* We won't be using `map`, but if we were, you should do the full
  "apply the function to each argument" at once.
  `(map sqr (list 1 2 3 4))` -> `(list (sqr 1) (sqr 2) (sqr 3) (sqr 4))`.
* What is `(/ 2 3 4)`? I'm pretty sure it's the same as `(/ (/ 2 3) 4)`
  or `1/6`. Similarly, `(- 2 3 4)` is `(- (- 2 3) 4)`. All of these are
  left-associative.

Q&A
---

### Administrative

How many tokens does it cost to make up a missed mini-project?

> The token policy page says that it costs one. Note, however, that the
  "first redo" will be your only opportunity to earn an E, even though it's
  effectively your first submission.

### Readings

### MP3

Lab
---

* Don't forget to make a copy of the code!
* If you finish early, please do the extras.
* If you all make good progress on this lab, Sam will have some questions.

### The behavior of `round`.

`round` rounds with the normal rules of "round to the nearest number". .5 rounds up, below .5 rounds down?

`(round 5/2)` -> `3`. Nope, it's `2`.

`(round 7/2)` -> `3`. Nope, it's `4`.

What's going on here? Answer: Good statistics. When it's exactly halfway, 
you round towards the nearest even number.

Reminder: Experiment to understand!

Also: Computer scientists make some strange design decisions. (There are
often design decisions behind weird behaviors.)

### The behavior of `max`.

If any of the values are inexact, the result is inexact, even if the
largest seems to be exact.

If all of the values are exact, the result is exact.

Why? If some of the numbers are inexact, it doesn't make sense to get
an exact number; you can't get an exact number from an exact data set.

Sam's example: Which is larger? 2^100 + 2 or 2.0^100 + 7.

### Numerators and denominators of inexact numbers

You will see very strange numerators and denominators for inexact numbers.

1.2


