---
title: "EBoard 08: Numbers (Section 2)"
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
* I'm running out of my time allocation on Otter.ai, so I won't be using 
  it to record sections 2 or 3.

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
  _Middle of Everywhere: Japan and Bento Boxes_
* Saturday, 15 February 2025, ?:00-?:00 p.m., Harris Gym.
  _Lunar New Year_

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

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

* Friday, 14 February 2025, 4:00--?. Field (of Dreams) House.
  _Darren Young Classic_.
* Saturday, 15 February 2025, 10:00--?. Field House.
  _Darren Young Classic, Continued_.
  
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
* Friday, 2025-01-14
    * [Submit post-reflection for MP3](...)
* Sunday, 2025-01-16
    * [Submit reading reflection](...)
        * [Boolean values](../readings/booleans)
        * [Conditional expressions](../readings/conditionals)
    * [Submit lab writeup from Friday's class](...)
    * [Submit pre-reflection for MP1](...)
* Monday, 2025-01-17, 4:00 p.m.
    * SoLA 1 released.

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
--> (f (+ 10 y) (- 10 y)))
--> (f (+ 10 11) (- 10 11)))
--> (f 21 -1)
--> (* (+ 21 2) (+ -1 3)))) 
--> (* 23 (+ -1 3))))
--> (* 23 2)
--> 46
```

* For procedure calls, do all the substitutions at once.
    * `(proc arg1 arg2 arg3)` is a procedure call.
    * For procedure calls, once all of the arguments are evaluated,
      we substitute the arguments for the parameters in the body of
      the procedure and then continue.
* For variable substitutions, please do one variable at a time.
* Do only one expression at a time.

Q&A
---

### Administrative

How many tokens does it cost to make up a missed mini-project?

> The token policy page says that it costs one. Note, however, that the
  "first redo" will be your only opportunity to earn an E, even though it's
  effectively your first submission.

### Readings

### MP3

In documenting procedures that work with colors, should I use something
specific, like `rgb?`, or should I use `color?`.

> You should use whichever is correct. If your procedure only works with
  RGB colors, you should use `rgb?`. If it works with any color, use 
  `color?`.

Lab
---

* Don't forget to make a copy of the code!
* If you finish early, please do the extras.
* If you finish the extras early, you can think about MP3.
* If you all make good progress on this lab, Sam will have some questions.

### Rounding

`round` rounds the number to the closest integer.

`(round 5/2)` -> 2 (5), 3 (more), other [Answer: 2]

`(round 7/2)` -> (about 3 1/2) -> 3, 4, other [Answer: 4]

If the number is equidistant from two integers, it rounds to the closest
_even_ integer. Why?

Statisticians will tell you that data sets often have .5s, and many people
decide in analyzing the data to round it to integers. If you always round
up, you bias your data high, if you always round down, you bias your data
low.

Note: The designs we see may be weird, but they are often intentional.

### Finding the maximum

If any of the numbers in `(max ....)` are inexact, the result is inexact.

If all of the numbers in `(max ....)` are exact, the result is exact.

Inexact numbers are imprecise, so we have to accept that if any of our
numbers are inexact, we can't be quite sure of the result.

Because of the nature of inexact numbers, we can't distinguish between

`(max (+ 4 (expt 2 100)) (+ 7 (expt 2.0 100)))`

and 

`(max (+ 7 (expt 2 100)) (+ 4 (expt 2.0 100)))`

Inexact means "We're approximating!"

NEVER USE INEXACT NUMBERS FOR CURRENCY!

### Treating real numbers as rationals
