---
title: "EBoard 29: Hash tables"
number: 29
section: eboards
held: 2023-11-06
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Questions
* Lab

Administrivia
-------------

* Please don't ask administrative questions in the reading questions
  responses.  Ask me in class or TM me.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-07, Noon, Day PDE: _CS Table: Trusting Trust_.
* Tuesday, 2023-11-07, 7pm, TBD: _Mentor Session: Randomness, hash 
  tables, and exam problems_.
* Thursday, 2023-11-09, 11am, JRC 101: _Convocation: Grinnell is the Best 
  Fire-trucking College in the World .. and YOU are Ruining It.  Come Find 
  Out Why (also Fighting the World’s Fight in a World Gone Mad: A Conversation 
  about Philosophy Politics and Economics in the Modern Age)._ 
  (David White '90).
* Thursday, 2023-11-09, Noon, HSSC 1231 (or Webex).  _Care in the Academy_
  with Cate Denial.
  Lunch served (I think; there may be a signup).
* Thursday, 2023-11-09, 4:15pm, Noyce 3821.  _CS Extras: ???_.

Cultural

* Wednesday, 2023-11-08, 6-8pm, Bucksbaum 102.  _The Voice as Instrument: 
  Vocal Exploration and Improvisation_ with Christine Duncan.

Peer

* Saturday, 2023-11-11. _Drag._ Cheer the performers and the pretty lights.

Wellness

Misc

* Wednesday, 2023-11-08, 7-8pm, HSSC Kernel (A1231).  _First-Gen Celebration Day
  Keynote._
* Wednesday, 2023-11-08, 7-8pm, JRC 209, _The Politics of AI spring break tour
  information session._

### Other good things (no tokens)

### Upcoming work

* Tuesday night: Reading on data abstraction.
* Thursday: MP6
* Thursday: Reading on ethics.  (The questions are a bit different.)
* Friday: MP6 post-assessment, quizzes

About SoLA 2
------------

* If you are missing LAs before a SoLA, you should really attempt them
  on the SoLA (if only to see what they look like).
* You have DrRacket available.  You should check your code.
* Many of you said that `(filter pred? lst)` returns a list of the
  values for which `pred?` returns true.  What if it returns neither
  true nor false?  `filter` actually keeps all of the values for which
  `pred?` returns a "trueish" value (trueish = "not false")

Questions
---------

### SoLA 2

"The style LA killed a little bit of my soul."

> Now you know how our graders feel.

> I'll give a style quiz this Friday (sorry ???).

Can we go over _this LA_?

> You can attend the mentor session.  You might also be able to ask the 
  evening tutors.  You can TM me or set up an appointment.

### MP6

I'm a bit worried about the recursion in `blur`.  
(_Taken from the pre-assessment._)

> `bitmap->vector` gives some ideas on how you can write a procedure that
  recurses in two dimensions.

> I would recommend that you write a lot of helper procedures.  Decomposition
  is your friend.  For example,

> * something that grabs all the pixels around a location
> * something that grabs a pixel from the vector based on the column and row
> * something that sets a pixel in the vector based on the column and row

> Of course, blur is optional (only needed for E).

Can you explain again how we convert a bitmap into a vector?

> A bitmap is a width-by-height grid of colors.

> We can think of each cell as having an "address" given as (col,row)

> We can turn the two-dimensional grid into a one-dimensional vector
  by "putting the rows side by side" ("row-major order")

> We can look at the indices of all of the cells in the vector in the
  "normal" way (0,1,2,3, .. 4) or in terms of the col/row pairs
  0/0, 1/0, 2/0, 3/0, 4/0, 0/1, 1/1, 2/1, ...

> There's a forumla to convert the col/row pairs into indices:
  `(+ col (* row width))`.  E.g., in a 5x6 image, 3/2 gets converted
  to location 12.

### Administrative

I had an extension on an MP and emailed you the MP.  How do I email you
the post-assessment?

> You can find the questions in the [handouts section](https://rebelsky.cs.grinnell.edu/Courses/CSC151/2023Fa/handouts/prepost).

Can I use tokens to turn in pre- and post-assessments really late?

> That violates the point of pre- and post-assessments.  Particularly
  for pre-assessments, it's important for you to do them before the
  assignment.

> I may be a bit more lenient on assessments than I'd planned.

What will Friday's quiz be on?

> * Randomness.
> * Makeup on diagramming data.
> * Makeup on style.
> * Makeup on tracing (if you ask me).

Wouldn't Sam like to write more quizzes?

> Not really.  Typically, missed topics are made up on SoLAs.

My family is coming to visit and I may have to miss class on Nov 10 
and/or Nov 13.

> "There's more to life than computer science."

> Make sure to let me know.

> Make up the work on your own.  Check the eboard and talk to peers.

> You do not get a different time to take the quiz.  You'll have to 
  make it up on a subsequent Friday (or SoLA).

If you miss class, do you have to make up the full lab?

> Make sure to tell Sam that you missed class.  "I'm sorry; I couldn't
  make class today."

> Do as much of the lab as you can do in 60 minutes.

### Other

Can you really send email from the command line?

> Yup.  I think.

Lab
---

Things we've learned ...

* Procedures that end with a bang (`!`) tend to modify their parameters.
* Procedures that end with a bang (`!`) often return nothing.
* Hash procedures that don't end with a bang create new hash tables,
  but leave their parameters unmodified.

Sam notes that the mutable/immutable dichotomy is one programmers and
computer scientists spend a lot of time thinking about.  It's often
easier to work with mutable data structures, but it's easier to analyze
programs that only use immutable data structures.
