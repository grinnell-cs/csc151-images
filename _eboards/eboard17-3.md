---
title: "EBoard 17: Software development (Section 3)"
number: 17
section: eboards
held: 2025-03-03
link: false
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
* Basic idea: We can think of many basic shapes as having threee
  primary attributes: width, height, and color.
    * We can transform those attributes to make variants.
    * We can ignore the shape type and think of them as parameters to
      another function.
* Part one: Make lists of variants of the key attributes.
* Part two: Turn lists of objects into lists of other objects.
* Part three: Combine those lists of objects.
* Part four: Freestyle.

```
;;; (shape-params shape) -> list?
;;;   shape : basic-image?
;;; Create a list of the width, height, and color of the image.
(define shape-params
  (lambda (img)
    (list (image-width img) (image-height img) (image-color img))))

;;; (something img) -> solid-isosceles-triangle?
;;;   img : image?
;;; Create a solid isosceles triangle of the same width, height, and
;;; color as `img`.
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

### Other

Difficult issues
----------------

_I realize that many other issues will interfere with your ability to
discuss these issues deeply. Nonetheless, I'd like to consider them a
bit, particularly since our second SoLA is immediately after spring break._

### Issue 1: Take-home exams

_You already have the background for this one._

Quick closed-eye survey: What kind of exams would you prefer?

* In-class, no computer (like quizzes). 
* In-class, with computer. 
* Take-home (like SoLA 1).

TPS: How should I address issues of inappropriate collaboration and
potential ChatGPT/Generative AI use?

* Make sure to limit options to the code we use and report people who use
  other code.
* Accept that there are coincidences.
* Unfortunately, College policies do not allow "chat with students about it".
* Unfortunately, College policies do not allow "I think you used ChatGPT,
  you get a zero"
* In both cases, I need to report to CAS.
* Students need to understand that it's important to behave appropriately.
* Maybe "Explain the code you wrote."
* Maybe "Support your answers with relevant citations."
* Reduce incentive to cheat.

### Issue 2: Struggling students

_Background: A higher percentage of students are struggling in CSC-151
than I've ever seen. And, believe it or not, I've cut back on the work
in the MPs. But there are also students who are doing fine, including
students who haven't programmed before. What should I do?_

* The ability to redo means that some of us are de-prioritizing the first
  submission (we're planning on redos).
* Use spring break (as not a break).
* Finding the relevant readings is hard. (Think about a "guidance" page.)
* Thursday deadline for submissions is hard. (Move to Sunday?) (But
  lots of work is due on Sundays.) (Every time is hard.) Move late
  deadline to Sunday. A little overlap is okay.

Lab
---

There is no starter code for today's lab.
