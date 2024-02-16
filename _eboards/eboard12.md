---
title: "EBoard 12: Pause for breath"
number: 12
section: eboards
held: 2024-02-16
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [10 min]
* A problem [10 min]
* Some notes on Wednesday's lab [10 min]
* Questions
* Lab
* Turn in lab [5 min]

Administrative stuff
--------------------

* MP3 has been updated. More updates are likely coming (mostly to the
  rubric).
* MP2 grades have been released. Remember! It's a learning process; it's
  okay if you didn't get an M or an E. (Please strive to avoid I's.)
* I think I've fixed the autograder for the MP1 redo. Sorry about that.
* For redos: Make sure to submit a `CHANGES.rkt` file when your redo is
  ready for grading.

### Token activities

Academic/Scholarly

* Tuesday, 2024-02-20, noon--1:00pm, Some PDR.
  _CS Table_.
* Tuesday, 2024-02-20, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-02-22, 4:00pm, Room TBD.
  _CS Extra: Declaring a CS Major._
* Thursday, 2024-02-22, 7:00pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-02-16, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._
* Sunday, 2024-02-18, 7:00--9:00pm, Harris Cinema.
  _The Moth Storytelling Slam_.

Peer

* Friday through Sunday, 2024-02-16 through 2024-02-18. Osgood Pool.
  _Midwest Swimming and Diving Conference Championships_.
    * 30 minutes counts.
    * Up to two separate sessions.
* Sunday, 2024-02-18, Simpson College Baseball Diamond.
  _Baseball_.
* Slumber party tonight.

Wellness

* Tuesday, 2024-02-20, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-20, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-20, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

* Saturday, 2024-02-17, 1:00--3:00pm, Darby.
  _Men's Basketball vs. Monmouth_.
* Saturday, 2024-02-17, 2:00--5:00pm, Field House.
  _Women's Tennis vs. Ottwawa_.
* Saturday, 2024-02-17, 3:00--5:00pm, Darby.
  _Women's Basketball vs. Monmouth_.

### Upcoming work

* Friday, 2024-02-16, 11:00pm: [SoLA 1 post-reflection](https://www.gradescope.com/courses/690100/assignments/3974516)
    * Try to do it earlier.
* Friday, 2024-02-16, 11:00pm: [MP3 pre-reflection](https://www.gradescope.com/courses/690100/assignments/4087963)
* Sunday, 2024-02-18, 11:00pm: Readings
    * [List basics](../readings/list-basics)
    * [Transforming lists](../readings/transforming-lists)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4112277)
* Sunday, 2024-02-18, 11:00pm, Redo of [MP1](../mps/mp1)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4034420/)
* Monday, 2024-02-19, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-21, 11:00pm: [MP3](../mps/mp3)
* Sunday, 2024-02-25, 11:00pm, [MP2](../mps/mp2) Redo
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4113572/)

### Friday PSA

* You are awesome!
* People care about you.
* Please take care of yourselves, especially for those who care about you.
* Be moderate in what you consume.
* CONSENT IS ESSENTIAL.

A problem 
----------

_Yay! A TPS activity._

* Option one: "The vomit in the dorm lounge" option. Everyone pays a fine.
  (In this case, the fine is zero on the SoLA.)
* Option two: Try to identify them and talk to them individually.
* Option three: Set clearer expectations.
    * DO NOT TALK ABOUT SOLAS WHILE THE SOLAS ARE LIVE!!!!!!!!
    * READ THE DAMN THING YOU ARE SIGNING!!!!
* Option four: No more take-home SoLAs.
* Option five: Treat everyone as criminals by taking over their webcams.
  I refuse to violate your privacy. I'd prefer not to treat you as criminals.
* Option six: Ask people to explain answers.
* Option seven: Randomized questions (great idea, lots of work for 
  Sam)
* Observation: Those who clearly didn't vomit in the lounge because they
  were playing baseball at Simpson don't have to pay the fine.
* Observation: The only person you are cheating is yourself. (Which isn't
  true: You are undermining Sam's trust in students and inclnation to
  a nice system.)

Some notes on Wednesday's lab
-----------------------------

_Yay! Potentially some more TPS activities._

```
(define median-of-three
  (lambda (x y z)
    (cond 
      [(or (<= x y z) (<= z y x))
       y]
      [(or (<= y x z) (<= z x y))
       x]
      [(or (<= x z y) (<= y z x))
       z]
      [else
       "AGH! Math failed."])))
```

"I want to take the three numbers and remove the largest and remove
the smallest."

```
(define median-of-three
  (lambda (x y z)
    (- (+ x y z)
       (min x y z)
       (max x y z))))
```

REMINDER TO SELF: Talk about talking about how you did
------------------------------------------------------

* People take different amounts of time. 
* Don't brag. 
* Don't ask.
* You can ask "How did you do this problem?"

Questions
---------

### Administrative

### MP3

When will the full MP3 be ready?

> 5pm today. Maybe earlier.

Can we start the preflection for MP3?

> Yes.

### Conditionals

### Misc

Why don't I have any questions?

> Perhaps you are an imposter from Carleton. Grinnellians ask good questions.

How should I format my code?

> Avoid really long lines.

> Skim through [this document](https://rebelsky.cs.grinnell.edu/Courses/CSC151/2024Sp/handouts/style-guide)

Lab
---

If you finish early, please work on the extra problems at the end.
