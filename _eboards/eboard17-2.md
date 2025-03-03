---
title: "EBoard 17: Software development (Section 2)"
number: 17
section: eboards
held: 2025-03-03
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff
* MP5
* Q&A
* Two difficult conversations
* Testing Lab

Administrative stuff
--------------------

### Introductory notes

* Happy March!
* Happy Week Seven!
* Ramadan Mubarak.
* I realize many of you are feeling (and being) attacked by our governments,
  including both federal and state. Please remember that there are still
  many people who care deeply about you (including me).
* Sorry that I was gone for so long. The conference was a success. But I'm
  exhuasted.
* To make matters worse, my email is acting up.
* But I brought you Octocat stickers!

Less positive things

* Mid-semester reports are due today. Some of you will be hearing from 
  Academic Advising. You may also see Academic Alerts.
* I'm also turning in Academic Alerts for those of you who did not turn
  in MP4.
* My substitutes were surprised to see that so many of you didn't feel
  compelled to be here on time.

### Upcoming activities

Scholarly

* Tuesday, 4 March 2025, 7:00--9:00 p.m., Harris Concert Hall.
  _Ray Young Bear: From Red Earth Drive: Creating Meskwaki Poetry and 
   Songs through Animism and a Series of Otherworldly Events_
* Thursday, 6 March 2025, 11:00 a.m.--Noon, JRC 101.
  _Scholars' Convocation: Lisa Mueller:
   Most Protests Fail. It Doesn’t Have to Be That Way_

Artistic

Multicultural

* Friday, 28 March 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: ???_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 5 March 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 5 March 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 5 March 2025, 5:00--6:00 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Tuesday, 5 March 2025, 7:15--8:15 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Friday, 28 March 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 28 March 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 29 March 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)

Misc

* Tuesday, 4 March 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_
* Sunday, 9 March 2025, 7:30--8:30 p.m., Science 3819. 
  **NO Mentor Session**
* Sunday, 23 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session (I think)_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Tuesday, 4 March 2025
    * [Submit today's lab on Gradescope](https://www.gradescope.com/courses/948769/assignments/5878751)
    * Readings for Wednesday
        * [Recursion basics](../readings/recursion-basics)
        * [Submit reading response on Gradescope](https://www.gradescope.com/courses/948769/assignments/5878749)
* Wednesday, 5 March 2025
    * Quiz: Lists (and the big three)
    * Makeup quiz: Tracing
    * Makeup quiz: Conditionals
    * Makeup quiz: Cut and compose
    * _Remember that you can bring a sheet of notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_

MP5
---

* Goal: Make abstract art by combining variants of images (simple shapes).
* Primary objective: Practice with lists (and nested lists) and the procedures
  that manipulate lists, particularly `map` and `apply` or `reduce`.
* Basic idea: We can think of many basic shapes as having three
  primary attributes: width, height, and color.
    * We can transform those attributes to make variants.
    * We can ignore the shape type and think of them as parameters to
      another function.
* Part one: Make lists of variants of the key attributes.
* Part two: Turn lists of shapes into lists of other shapes.
* Part three: Combine those lists of shapes.
* Part four: Freestyle.

```
;;; (shape-params shape) -> list?
;;;   shape : basic-image?
;;; Create a list of the width, height, and color of the image.
(define shape-params
  (lambda (img)
    (list (image-width img) (image-height img) (image-color img))))

;;; (something img) -> image?
;;;   img : image?
;;; Create a solid isosceles triangle with the width, height, and
;;; color of the original image.
(define something 
  (o (cut (apply solid-isosceles-triangle <>)) 
     shape-params))
```

Questions
---------

### Administrative

### Scheme

### Readings

### MP5

What do the variants for part four look like?

* Section 1 takes a shape and makes a list of variant shapes (e.g.,
  changing size or color).
* Section 2 takes a list (or list of lists) of shapes and turns them
  all into the same shape. 
* Section 3 takes a list (or list of lists) of shapes and alternately
  puts them beside (centered) or above (centered) each other. You should
  choose something else.

Do we have to verify that the parameters are correct?

> Nope. You can let it crash.

Will we have to use conditionals to decide whether we have a list or not?

> Yes.

Can we copy our shapes from the polygons project?

> Yes.

### Other

Difficult issues
----------------

_I realize that many other issues will interfere with your ability to
discuss these issues deeply. Nonetheless, I'd like to consider them a
bit, particularly since our second SoLA is immediately after spring break._

### Issue 1: Take-home exams

_You already have the background for this one._

Quick closed-eye survey: What kind of exams would you prefer?

* In-class, no computer (like quizzes).  [0]
* In-class, with computer. [4]
* Take-home (like SoLA 1). [Most]

TPS: How should I address issues of inappropriate collaboration and
potential ChatGPT/Generative AI use?

* I am not allowed to (a) talk to the students about the issue or (b)
  do followup testing; I have to submit it as a CAS case for suspected
  violations of academic integrity.
* Some people will cheat no matter what you do, so do what's best for the
  class and report suspicions.
* If it looks like ChatGPT, try ChatGPT to see if you get something similar.
* Cross our fingers that this conversation will remind people not to 
  take shortcuts.

### Issue 2: Struggling students

_Background: A higher percentage of students are struggling in CSC-151
than I've ever seen. And, believe it or not, I've cut back on the work
in the MPs. But there are also students who are doing fine, including
students who haven't programmed before. What should I/we do?_

Quick survey: Course pace

* Too fast [4]
* About right [16]
* Too slow [0]

What can we do?

* Check on whether people go to mentor sessions and encourage them to do
  so (or see if other hours would work better).
* Check in with people who are struggling about what their issues are.
  [Already]
* Sam should talk less so that there's more time to work on lab.
    * More time to work alone.
* Think about how to make mini-projects feel less huge.
* Sometimes we spin our wheels on labs (and MPs): Encourage people to ask
  questions.
* Send out answers to labs (or comments on labs).

Lab
---

There is no starter code for today's lab.
