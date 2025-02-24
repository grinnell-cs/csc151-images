---
title: "EBoard 14: Transforming lists (Section 1)"
number: 14
section: eboards
held: 2025-02-24
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

We are back to the standard start-of-class procedure.

_Approximate optimistic overview_

* Administrative stuff [10 min]
* On SoLA 1 [15 min]
* Questions and answers [10 min]
* Lab [40 min]
* Turn in Lab [5 min]

Administrative stuff
--------------------

### Introductory notes

* Yay! We have otter.ai recordings again, at least for today. Does anyone 
  use them?
* I will be out of town Tuesday through Friday this week, attending the
  annual ACM Technical Symposium in Computer Science Education. 
    * No office hours this week.
    * I'll check Teams Messages from time to time.
    * You will have subs on Wednesday and Friday.
* For reasons we will discuss, today's class is less ready than normal.
* I'm moving the cut and compose quiz to next week.
* I may swear in class today. Apologies in advance. At times, profanity
  seems necessary.

### Upcoming activities

Scholarly

* Tuesday, 25 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: Should academic achievements take precedence over 
   human integrity?_
    * <https://web.archive.org/web/20241216031440/https://var-integrity-report.github.io/>
    * <https://www.reuters.com/technology/artificial-intelligence/bytedance-seeks-11-mln-damages-intern-ai-breach-case-report-says-2024-11-28/>
* Thursday, 27 February 2025, 11:00 a.m.--Noon, JRC 101.
  _Scholars' Convocation: Emily Wilson: Retranslating the Classics_
* Tuesday, 4 March 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: TBD_ 
* Thursday, 6 March 2025, 11:00 a.m.--Noon, JRC 101.

Artistic

* Friday, 28 February 2025, 7:30--8:30 p.m., Roberts Theatre.
  _Day/Dream_.
    * Tickets available in the Bucksbaum Box Office, Thursday and Friday,
      noon--5:00 p.m.
    * Livestream at <https://tdps.sites.grinnell.edu>.
* Saturday, 1 March 2025, 2:00--3:00 p.m., Roberts Theatre.
  _Day/Dream_.
* Saturday, 1 March 2025, 7:30--8:30 p.m., Roberts Theatre.
  _Day/Dream_.
* Sunday, 2 March 2025, 2:00--3:00 p.m., Roberts Theatre.
  _Day/Dream_.

Multicultural

* Friday, 28 February 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: ???_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Saturday, 1 March 2025, 2:00 p.m., Sebring-Lewis.
  _Grinnell Orchestra presents Rimsky-Korsakov Symphony No. 1._

Wellness

* Tuesday, 25 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 25 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Thursday, 27 February 2025, ???.
  _Forest Bathing_.
* Friday, 28 February 2025, ?:?? p.m., ???
  _Badminton Club_ (Smash that bird!)
* Friday, 28 February 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.

Misc

* Tuesday, 25 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_
* Sunday, 2 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 4 March 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_
* Sunday, 9 March 2025, 7:30--8:30 p.m., Science 3819. 
  **NO Mentor Session**

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Tuesday, 25 February 2025
* Wednesday, 26 February 2025
    * Quiz: Conditionals
    * Makeup quiz: Tracing
    * Makeup quiz: Documentation
    * _Remember that you can bring a sheet of notes for each quiz._
* Thursday, 27 February 2025
* Friday, 28 February 2025
    * [MP5](../mps/mp05) released
    * [Submit post-reflection for MP4 on Gradescope]()
* Sunday, 2 March 2025
    * [Submit Friday's lab on Gradescope]()
    * [Submit redo of MP3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5820169)
    * Readings:
    * [Submit pre-reflection for MP5 on Gradescope]()
* Wednesday, 5 March 2025
    * Quiz: Lists
    * Makeup quiz: Tracing
    * Makeup quiz: Conditionals
    * Makeup quiz: Cut and compose
    * _Remember that you can bring a sheet of notes for each quiz._

On SoLA 1
---------

### Observations

Online

### Observation types

Type one: Pairs of students with (nearly) identical solutions
turned in within a minute or two of each other.

Type two: Code that does not match the style we use in our 
course, but almost precisely matches what you get back when you plug
our questions into ChatGPT.

Type three: Code that solves the problem using many different
procedures that we have not covered in class (e.g., solving the
Olympic Scoring problem using lists, `car`, `cdr`, and `sort`).

### Commentary

Class mentors: "Um, Sam, it looks like students are using ChatGPT
for the LAs. Or maybe some other LLM."

Sam: "The students indicated that they had not done so. They wouldn't
lie, would they?" (Sam tends to adopt a Pollyanna-esque attitude.)

A colleague: "It is...demoralizing when students take inappropriate
shortcuts on tasks that have been designed to remove, as much as
possible, the temptation to take inappropriate shortcuts."

A class mentor; "This is not good. The entire point of take home exams 
is being ruined."
 
### Reflection

I think in-class exams are stressful. Most students seem to agree. And
many students would like to be able to use DrRacket when solving problems.

Mastery grading is supposed to make all testing less stressful. If you
miss something, you get more chances. So it shouldn't be a big deal if
you miss something.

In-class exams that also include "make up" problems create administrative
issues. And perhaps more stress.

Hence, take-home exams with mastery grading should be the appropriate 
approach.

I used to say, "I'd rather do what's right for the vast majority of students
even though a few students might behave inappropriately." It's hard to say
that when "a few" seems to be a "many".

### Who cheating affects

**The person who cheats**.

**Their professor**.

**Their classmates (and other students)**.

**Their teammates** (if on a team).

### A pause

I'm wearing my Polyanna hat with respect to this exam. I will assume
that there are other factors at play. That is, all of these things
are coincidence. I will not make that assumption on future take-home
exams (if we have future take-home exams).

### Options

Here are a few:

* Switch to in-class exams without computers.
* Switch to in-class exams with computers.
* Maintain the status quo, but aggressively pursue the issues mentioned
  above.
* I can say IDGAFF (which isn't really true) and then plan to retire 
  (which sounds increasingly appealing) so that I don't have to deal 
  with this crap.
* ???

Do you have any other suggestions?

We will come back to this topic next Monday, after you've had a chance
to reflect on the issues. I also plan to post a survey.

Questions
---------

### Administrative

### Scheme

How can I learn about your expectations for Scheme style?

> From [SamR's Style Guide for Racket](../handouts/style-guide), 
  conveniently available from the Handouts menu.

### Readings

What's the difference between `map` and `apply`?

> `map` applies the procedure to each element separately.

> `apply` applies the procedure to all the elements _en masse_.

> `(map fun (list v1 v2 ... vn))` -> `(list (fun v1) (fun v2) ... (fun vn))`.

> `(apply fun (list v1 v2 ... vn))` -> `(fun v1 v2 ... vn)`.

> Perhpas Sam will do some examples.

### Other

Lab
---
