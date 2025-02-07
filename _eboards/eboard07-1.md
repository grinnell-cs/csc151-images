---
title: "EBoard 07: Cut and compose (Section 1)"
number: 7
section: eboards
held: 2025-02-07
link: true
---
# {{ page.title }}

_Today's start-of-class procedure_

Plan to sit with your partner from last class (in the same place).

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff [10 min]
* Some academic integrity issues [5 min]
* About Wednesday's quiz [5 min]
* About reducing redundancy [5 min]
* About MP3 [15 min]
* Questions [5 min]
* Lab [30 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

### Introductory notes

* Sam forgot his hearing aids today. Expect him to have even more trouble
  than normal.
* Please try to avoid putting images and colors in the definitions pane.
  When you do so, your Racket file ends up saving in a strange format that
  doesn't work with Gradescope. Yay computers!
* I'd also recommend that you do without `image-load` and `image-save` in
  the definitions pane.

### Upcoming activities

Scholarly

* Thursday, 13 February 2025, 11:00 a.m.--Noon, JRC 101.
  _Grinnell Lecture: Darrius Hills on "The Achievement of Identity: Soul Work, Salvation, and Black Manhood in the Religious Imagination of James Baldwin"_.
* Tuesday, 18 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: ???_

Artistic

* Friday, 7 February 2025, 3:00--5:00 p.m., Burling Digital Studio.
  _Make a Fidget Workshop_.
    * Fill out form at <https://grinnell.co1.qualtrics.com/jfe/form/SV_1MRN686rnUjKrt4>.
* Tuesday, 11 February 2025, 4:00--5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Chen, Kluber, and Tavares_.
* Friday, 14 February 2025, 5:00--6:30 p.m. (talk at 6:00), 926 Broad St (Stewart Arts Building).
  _Opening Reception for Artist Salon: Works by Grinnell College Art Majors_

Multicultural

* Friday, 7 February 2025, 4:00-5:00 p.m., HSSC N1170 (Global Living Room)
  _Middle of Everywhere: How to Order a Coffee in Singapore_.

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Saturday, 2025-02-08, 1:00--3:00 p.m., Natatorium.
  _Swimming Last Chance Meet_

Wellness

* Friday, 7 February 2025, 5:30--8:00 p.m., Downtown Grinnell.
  _The Sweet Stroll_.
* Tuesday, 11 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 11 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* No particular date. Cyberspace.
  _Fill out the survey at <https://www.surveymonkey.com/r/GrinnellParksandRec>._
* Sunday, 9 February 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_.
* Tuesday, 11 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_.
* Tuesday, 18 February 2025. 6:00--7:00 p.m., HSSC A1231.
  _Make a Portfolio Website_.
    * Please register at <https://grinnell.joinhandshake.com/edu/events/1679688>

### Other good things

_These do not earn tokens, but are worth your consideration._

* Saturday, 2025-02-08, 1:00--3:00 p.m., Darby.
  _Women's Basketball vs. Lake Forest_
* Saturday, 2025-02-08, 3:00--5:00 p.m., Darby.
  _Men's Basketball vs. Lake Forest_

### Upcoming work

* Friday, 2025-02-07 (today)
    * Mini-project 3 distributed
    * [Submit post-reflection for mini-project 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5719211)
* Sunday, 2025-02-09
    * [Submit lab writeup from today's class on Gradescope](https://www.gradescope.com/courses/948769/assignments/5748541)
    * Readings for Monday's class.
        * [Data types](../readings/types)
        * [Expressions and types](../readings/exprs-and-types)
        * [Numeric values](../readings/numbers)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732137)
    * [Submit pre-reflection for mini-project 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732264)
* Tuesday, 2025-02-10
    * Readings for Monday's class.
        * [Characters and strings](../readings/strings)
        * [Symbolic values](../readings/symbols)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732140)

### Friday PSA

* You are awesome.
* People care about you.
* Please, try to keep yourself awesome.
* Moderation!
* Plan in advance! Remember that everyone has different limits.
* Consent is essential, but not sufficient.

### Academic Integrity

Example one: A student comment from mini-project 2. 

> _For the pentagon, I did get a little bit of help from the programming 
  assitant chatgpt, I was having trouble with knowing how to incorporate
  `real-part`, `imag-part`, and tying it all together._

* Thanks for citing.
* However, **Do not use AI programming assistants!**
* Ask a human being. Don't ask the computer.
    * Please cite.
* Reminder
    * Mentor sessions are class specific and often focus on forthcoming quiz and
      past material.
    * Evening tutor sessions provide individual help on homework and such.

Example two: Some code from mini-project 2

```
(build-list sides (lambda (i) (make-point side-length (general-radius sides) (general-theta sides) (+ 2 i))))))
```

* Hmmmm ... I haven't taught you `build-list`. So the student found it on the
  Interweb. (Hopefully not with ChatGPT.) 
* Let's see where (of course, they cited it).
* Nope.
* **In general, I'd prefer that you not go far beyond what we've learned 
    in class.**
* **If you do, plese cite!**

Example three: Strange file uploaded

* Make sure to check the autograder!

About Wednesday's Quizzes
-------------------------

There are many goals and processes for decomposition. Not only are we
breaking a big problem into smaller parts, we are also trying to avoid
repeating ourselves.

In many cases, I saw that you did some decomposition well, but left some
repeated code. My initial inclination was to mark all of those as "Redo".
After some reflection, I decided that talking about it in class would suffice.
If there's more than one case of repetition, you have a redo. If there's
only one, you have an S.

On to the problem itself ...

About reducing redundancy
-------------------------

_Sam, how do I reduce redundancy in my `compute-pentagon-point` procedure?_

```
(define compute-pentagon-point
  (lambda (radius num)
    (pt (real-part (make-polar radius (* 2/5 num pi)))
        (imag-part (make-polar radius (* 2/5 num pi))))))
```

* First of all, great job on using the radius, rather than the side length,
  so that you don't have to duplicate the conversion of side length to
  radius!
* Second, TPS!

Possibility one

```
(define part-of-compute-pentagon-point
  (lambda (radius num)
    (make-polar radius (* 2/5 num pi))))
(define compute-pentagon-point
  (lambda (radius num)
    (pt (real-part (part-of-compute-pentagon-point radius num))
        (imag-part (part-of-compute-pentagon-point radius num)))))
```

Possibility two

```
(define polar->point
  (lambda (polar)
    (pt (real-part polar)
        (imag-part polar))))
(define compute-pentagon-point
  (lambda (radius num)
    (polar->point (make-polar-radius (* 2/5 num pi))))) 
```

Key ideas here: 

* If you have a bigger procedure with repetition, think about defining a 
  separate procedure for the different parts.
* Reduce complexity by writing procedures that produce other types of
  values.
* If you have a value that you are computing multiple times, create another
  procedure and pass that value to the next procedure.
* Eventually, we'll learn how to name things within a procedure.

About Mini-Project Three
------------------------

Fun with transformations.

Q&A
---

### Administrative

Do I have to tell you when I'm spending a token to turn something in late?

> No.

I got an I on MP1. Will you charge me tokens for redoing MP1?

> No.

I got an I on MP2. Will you charge me tokens for redoing MP2?

> Yes. Tokens are my way of encouraging you to make sure you make an
  appropriate start on mini-projects.

When do we make up quizzes?

> Option 1: During the next quiz day, there will (usually) be make-ups
  for past quizzes. (They aren't identical.)

> Option 2: On the SoLA (take-home exams).

Can you tell us more about take-home exams?

> Yes, when I distribute them. But not today.

Is it okay that I learned things from the Racket Web site and cited them?

> Yes.

When redoing a mini-project do I have to start over?

> Generally, no. Just fix the parts that we tell you need fixing.

### Readings

Lab
---

Same partners, new submission

Q: How did you expect us to write `rgb-less-red`?

A: I was expecting `(o rgb-pseudo-complement rgb-redder rgb-pseudo-complement)`,
but `(o rgb-greener rgb-bluer)` seems to work, too.
