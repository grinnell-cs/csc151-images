---
title: "EBoard 02 (Section 1): The Lab Equipment (aka MathLAN and DrRacket)"
number: 2
section: eboards
held: 2023-08-28
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Getting started_ (this will be our normal start-of-class sequence)

* Grab a card.  The card will have a computer name and a location.
* Remember the name and location.
* Drop the card back in the jar.
* Navigate to the computer.
* If you arrive first, start the lab.
* When both partners arrive, introduce yourselves.

For the future: I'm happy to reserve a (somewhat random) seat at
the front of the classroom for those who need a front seat as an
adjustment or accommodation.  Just let me know.

_Approximate overview_

* Administrative stuff; no attendance [10--15 min]
* Debrief on Monday's activity [5--10 min]
* Set up for MathLAN, partner one [10 min]
* Set up for MathLAN, partner two [5 min]
* Lab [45 min]

Administrivia
-------------

### Introductory notes

* I'm still Sam (or SamR).
* Our mentors are still Ellie and Ella (or vice versa).
* I tend to respond faster to Direct Messages (Chat) on Teams than email.
* We'll talk about Gradescope on Wednesday.  (Our mentors will remind me
  if I do not.)
* We will be using a different implementation of Scheme than the other
  sections of 151.
* I will do my best to post a link to the Otter.ai transcript on Teams,
  in the recordings channel.
* Our class site is still under development.  Let me know if you find
  things missing, including images.
* About five of you didn't respond to the reading.  Don't forget!
* Only answer the double-dagger self checks.

### Upcoming Token activities

Academic

* Convocation, Thursday, 11:00 a.m.  President Harris.

Cultural

Peer

* Volleyball scrimmage today at 5:15 in Darby
* Volleyball game on Friday at 5:00 against Bethany and Dominca.
* Football a week from Saturday, 1pm, against Rippon.

Wellness

### Upcoming work

* Intro survey and syllabus questions due tonight by 10:30 p.m.
* One reading for Wednesday; fill reading on Gradescope by Tuesday night.
* Lab writeup due before class on **Friday**.

Questions on the readings
-------------------------

Are we using VSCode w/Scamper or DrRacket?

> Whoops.  DrRacket.

Must there be exactly two arguments to an arithmetic operator?

> Nope.  You can have as many (or perhaps as few) as you want, at least
  for most operators.

> You can write `(+ 2 3 4 6)`

```
> (* 2 3 4 6)
144
> (* (+ 2 3 4) (+ 5 6))
99
> (+ 5)
5
> (+)
0
```

Please go over basic building blocks.

> You need to start somewhere in writing an algorithm.  That is, you
  need to be able to assume that the computer knows how to do some
  things (e.g., add).

> The data (I know what a number is) and operations (I know how to add)
  are the basic building blocks of most programming languages.

Why can't I do the computing with images part?

> You need a special library.  Sorry about that.  You should learn that
  today.

> When you hit problems like that, please DM me.

Do we read lab instructions prior to class?

> Please don't.

Which questions do we answer on Gradescope?

> Only the ones with the double daggers.

> But you should answer the other ones to yourself.

What is the assignment called on Gradescope?

> Reading assignments are usually called "Readings for class ##"

> Lab assignments are usually called "Lab for class ##"

> If you don't see it, I probably forgot to post it.  Chat me on Teams.
  Or email me.

> Note: No late penalties for the first reading.


Debrief on Prior Class
----------------------

We will do this as a _Think/Pair/Share_ (or just TPS) activity.

* Think for a minute to yourself.
* Discuss the idea with your partner.
* Share with the broader classroom.

**Getting students into card groups was somewhat chaotic.  I intentionally
don't provide an algorithm, and it sometimes shows.  What would be a better
algorithm for getting card groups together?**

* Divide into smaller groups (e.g., smaller numbers and larger number)
  and then divide again and again.
* Put one designated person with each card somewhere in the room and
  send everyone to meet that person.
* Scrap the cards altogether.  Give everyone a pair of numbers that
  specify their coordinate in the room.
* Put your fingers in the air, in the air.  Put your fingers in the

Lab 1: Setting up Linux
-----------------------

This lab appears in the Schedule.  Each person will do this separately, with
the other person helping.

In past years, some students have had to edit the launcher to use
`firefox` instead of `firefox-esr %u`.  I'm not sure why people end up
with different launchers.

I apologize to those of you who could not get started because of issues
with MathLAN.  Those should be resolved by the end of the day.

Lab 2: Learning Scheme
----------------------

* You'll do most of the second lab collaboratively.
* We'll be around to help.  At least I think we will.  Sam is panicking
  about various things right now.
* If you finish early, start the readings for the next class.
* If you didn't finish, that's okay.  DM (Chat) me on Teams to let me know.
* You will be turning in your answers to exercises 7--9.  At least we
  think you will.

Debrief (if time)
-----------------

_There usually isn't time, but I'm an optimist._

**The origin of the short and long versions.**  My colleagues who
first taught the course wrote the long versions (or at least
the original versions of the long versions).  When I started
teaching, I decided you might do better with short instructions.
But it's a nice example of different ways of thinking about writing
algorithms/instructions.

I see that many of you have three screens (our main screen plus two
laptops).  Please do your work on the MathLAN workstation and just
use your laptop for bringing up the lab/reference materials.

* If I see you running DrRacket on your laptop, I may attempt
  to defenestrate aforementioned laptop.

