---
title: "EBoard 09: Pair programming"
number: 9
section: eboards
held: 2024-02-09
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [15 min]
* An exercise [~20 min]
* Reflections on the readings and broader issues [~20 min]
* Write and turn in lab [10 min]

Administrative stuff
--------------------

* We have class 9 on the 9th. Yay!
* There are many sick people on campus. Consider masking.
* Feel free to send me questions on Teams, even at night. If I'm available,
  I'll answer them quickly. If not, I'll try to answer them the next day.
* Warning! You will sometimes see the next class's eboard on our site.
* I'm glad that so many of you attended the mentor session last night.
  I'll remind you that mentor sessions are much like class in that we
  expect you to participate actively. Mentors won't lecture.
* If you are unable to visit class in person, it's fine to attempt to
  visit on Teams. (Please try to make it to class if you can.)
* Yes, some quizzes are quick.

### Token activities

Scholarly

* Tuesday, 2024-02-13, noon-1:00pm. Some PDR.
  _CS Table: Functional programming_.

Cultural

Peer

* Saturday, 2024-02-10, 8:00-11:00pm, Harris Multi-Purpose Disco Room.
  _Roller Skating_.

Wellness

Misc

* Monday, 2024-02-12, 4:30-5:30pm, JRC 101.
  _Talking about disability policy with Daniel Van Sant, Director
   of disability policy at the Harkin Institute._

### Other good things

### Upcoming work

* Friday, 2024-02-09, 11:00pm: Post-reflection for MP2
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4066759/)
* Friday, 2024-02-09, 11:00pm: Pre-reflection for SoLA 1
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/3974512/)
* Sunday, 2024-02-11, 11:00pm: Submit reading responses.
    * [Anonymous procedures](../readings/anonymous-procedures)
    * [Transforming RGB colors](../readings/transforming-rgb)
    * [Transforming images](../readings/transforming-images)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4079162/)
* Monday, 2024-02-12, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4079067/)
    * Preferred: Submit before the end of class today.
* Monday, 2024-02-12, 4:00pm: SoLA 1 released
* Wednesday, 2024-02-14, 11:00pm, SoLA 1 due

### About SoLAs

* They are like online mostly open book take-home exams.
* "Mostly open book": You may use your notes, the class Web site, the
  DrRacket Web site, DrRacket, yourself.
    * You may NOT use: General Web searches, other human beings, LLMs
      like ChatGPT, ...
* In general, we'll have an LA for each topic that some student hasn't
  yet completed (up to the ones for this phase).
    * DO NOT do the LAs for topics you've already completed.
* Each question is separate.
* You must complete each LA within an hour of starting that LA.  They
  should be a similar length to what you get on paper.

How many times can we resubmit?

> As many as you'd like within the time limit.

Is there an autograder to provide feedback

> Nope. But you may get examples to try.

Why am I seeing other LAs on gradescope?

> You'll get one for every Quiz, even if you didn't have to take it. Whee!
  Last semester, students got to see 178 different "assignments".

Do I have to make up a quiz if I get it on the SoLA?

> Nope. We just want to see you succeed in some form.

Will there be quizzes on decomposition and basic types next week?

> Nope. Unless it's a "paper only" LA (tracing), you'll have to make it
  up on the next LA.

What will we be turning in?

> You will copy and paste code into a text box. (Or type it in the text
  box.)

Do we need the `(require csc151)`?

> Nope. Focus on the relevant parts.

> You will not lose credit for including too much.

Do we have to document our procedures?

> You do not have to document your procedures at this point. Soon you
  will have to (particularly on the documentation LA).

### Friday PSA

* Roller skating while impaired is dangerous.
* If you choose to alter your body chemistry, please do so in moderation.
  (Perhaps identify someone in your group to check on people.)
* Consent is essential.
* Take care of yourselves, take care of others.

Questions
---------

### Misc

Why is Renfrow Hall so damn expensive?

> Pyramids!

### Administrative

I feel really bad about my grade on MP1.

> Don't worry. You will catch up. That's why we have redos.

> Sam writes surprisingly bad instructions. You need to learn to
  interpret them.

I hate the ambiguity of "It's great when the grader says it's great."

> We want you to learn to live with ambiguity.

I think my grade on MP1 is incorrect.

> Teams Message your concern to me and I'll take a look.

> You can also visit me in the office.

Can I visit your office hours even if I haven't booked them?

> Certainly. However, priority at any time goes to those who have booked
  those hours.

> If I'm talking to someone, you should let me know that you're here.
  (Sometimes a fifteen-minute slot goes long if no one has reserved
  the next slot. Those waiting get preference at that point.)

What if I can't make any of your office hours?

> Teams Message me to propose another time.

> You can find my general schedule [on my Web site](https://rebelsky.cs.grinnell.edu/schedule.html). I prefer that you request during Project Time, CSC-151-02 time (I don't always attend), or Class Prep time.

### Readings (Pair Programming)

_I will not take questions on the readings until the discussion._

Background
----------

* Today is our "talk about pair programming" day.
* In our experience, partnering works imperfectly.
    * Some students tend to dominate and are impatient with their partners.
    * Some students feel like they don't know enough and don't want to
      "hold their partner back".
* We use this day to help make partnering better.
* We will return to these issues throughout the semester.

An exercise
-----------

I love that you introduced yourselves.

TPS: 

* 1 min: Think to yourself for a minute. What did you hear? What would
  you like to talk about? What made you optimistic? What surprised you?
  What worried  you?
* 3 min: Talk to your patner about it
* n min: Full class consideration

What do we want to talk about?

* It's important to build these skills because you will continue to
  work with people in future classes.
* It's valuable to learn from different perspectives. You need to be
  willing to listen to those perspectives.
* Lots of the cards were about how things go badly. It's worrisome.
* Sometimes a partner is too aggressive about things and doesn't reflect
  enough on their partner's needs/perspective, which means they miss
  out.
* We don't always know what's going on with our partners.
    * Athletes have Saturday meets.
    * Other people have extracurriculars.
    * Some peoples' religions prevent them from working on Saturdays.
* We should separate the personal from the professional (class).
    * Allows you to focus.
    * Female-presenting people in CS are a minority. Do you feel
      called out for something like that?

Another exercise

Reflecting on the readings
--------------------------

Lab
---
