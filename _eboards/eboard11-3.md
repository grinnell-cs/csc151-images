---
title: "EBoard 11: Pair programming (Section 3)"
number: 11
section: eboards
held: 2025-02-17
link: false
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

We are back to the standard start-of-class procedure.

_Approximate optimistic overview_

* Administrative stuff [10 min]
* Some notes on tracing [10 min]
* Questions and answers [5 min]
* An exercise [20 min]
* Reflections on the readings and broader issues [20 min]
* Lab and turn in [15 min]

Administrative stuff
--------------------

### Introductory notes

* Happy Junior Visit Day! I don't know if we'll have any visitors.
* I have last Friday's quizzes mostly graded, but not yet uploaded to 
  Gradescope.  Expect to see them tonight.
* Thank you for making it to class on such a cold day!
* Because I care about you, I brought you (discounted) Valentine's day
  candy.

### Upcoming activities

Scholarly

* Tuesday, 18 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: The Attention Age_
    * Sean Illing. The Real Stakes of the War For Your Attention. Vox – The Gray Area. February 1, 2025. <https://www.vox.com/the-gray-area/397131/the-gray-area-chris-hayes-attention-economy> (also available as a podcast)
    * Yair Rosenberg. The Worst Page on the Internet. The Atlantic. January 27, 2025. <https://www.theatlantic.com/ideas/archive/2025/01/internet-browser-game-website/681461/?gift=irxCS5988mld06tNBmnuK3HS_YPx_iIBSFA9sGb9vjQ&utm_source=copy-link&utm_medium=social&utm_campaign=share>
    * You may want to spend a few minutes with the game mentioned in the second article. You can find the game at <https://neal.fun/stimulation-clicker/>.
* Thursday, 20 February 2025, 11:00 a.m.--noon, JRC 101.
  _Scholars’ Convocation: Steven Geofrey.  What Information Worlds Reveal about Climate Change Awareness, Advocacy, and Hope_

Artistic

Multicultural

* Friday, 21 February 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: ???_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 18 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 18 February 2025, 5:00--6:00 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Tuesday, 18 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 18 February 2025, 7:15--8:15 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.

Misc

* Tuesday, 18 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session (Quiz prep for Documentation Quiz; Review Tracing)_ 
* Sunday, 23 February 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

* Monday, 17 February 2025, 8:00--10:00 p.m., Bob's Underground.
  _Open Mic Night_.

### Upcoming work

* Monday, 17 February 2025
    * [SoLA 1](../las) released at 4:00 p.m.
    * Late submission of [MP3](../mps/mp03)
        * [Submit MP3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5758831)
* Tuesday, 18 February 2025
    * [Submit late reflection for MP3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732265)
    * [Submit today's lab on Gradescope](https://www.gradescope.com/courses/948769/assignments/5799347)
    * Readings:
        * [Boolean values and predicate procedures](../readings/booleans)
        * [Conditional evaluation](../readings/conditionals)
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5799369)
* Wednesday, 19 February 2025
    * Quiz: Documentation
    * Makeup quiz: Tracing
* Thursday, 20 February 2025
    * Submit Wednesday's lab on Gradescope
    * Readings:
        * [List basics](../readings/list-basics)
        * [Transforming lists](../readings/transforming-lists)
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5799376)
    * [SoLA 1](../las)
        * [Decomposition](https://www.gradescope.com/courses/948769/assignments/5798661)
        * [Procedures](https://www.gradescope.com/courses/948769/assignments/5798726)
        * [Primitive types](https://www.gradescope.com/courses/948769/assignments/5798727)
        * [Lambda-free anonymnous procedures](https://www.gradescope.com/courses/948769/assignments/5798741)
        * [Collaboration](https://www.gradescope.com/courses/948769/assignments/5798697)
* Friday, 21 February 2025
    * MP4 released
    * [Submit post-reflection for SoLA 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5780118)
* Sunday, 23 February 2025
    * [Submit first redo for MP2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5783168)
    * Submit Friday's lab on Gradescope
    * Readings: Processing Lists
        * [The "big three" list operations](../readings/list-big-three)
        * [Transforming lists](../readings/list-transform)
        * Submit reading responses on Gradescope

Notes on the tracing quiz
-------------------------

### Please read the notes on your quiz, even if you got credit.

### Do things one step at a time.

NO: 
```
    (+ (* 2 3) (* 4 5))
--> (+ 6 20)
```

YES:
```
    (+ (* 2 3) (* 4 5))
--> (+ 6 (* 4 5))
--> (+ 6 20)
```

### Expand all procedures, even ones in which you think you know the result

NO:
```
    (+ 5 (square 9))
--> (+ 5 81)
```

YES:
```
    (+ 5 (square 9))
--> (+ 5 (* 9 9))
--> (+ 5 81)
```

### Finish evaluating each expression before moving on to the next

NO: 
```
    (+ (square (* 2 3)) (square (* 4 5)))
--> (+ (square 6) (square (* 4 5)))
--> (+ (square 6) (square 20))
```

YES: 
```
    (+ (square (* 2 3)) (square (* 4 5)))
--> (+ (square 6) (square (* 4 5)))
--> (+ (* 6 6) (square (* 4 5)))
--> (+ 36 (square (* 4 5)))
--> (+ 36 (square 20))
```

### Evaluate expressions left-to-right (and inside-out)

NO
```
    (+ (square (* 2 3)) (square (* 4 5)))
--> (+ (square (* 2 3)) (square 20)
```

YES
```
    (+ (square (* 2 3)) (square (* 4 5)))`
--> (+ (square 6) (square (* 4 5)))
```

### Remember how subtraction works

NO
```
    (+ (- 10 4) (- 2 9))
--> (+ -6 (- 2 9))
--> (+ -6 7)
```

YES
```
    (+ (- 10 4) (- 2 9))
--> (+ 6 (- 2 9))
--> (+ 6 -7)
```

### Don't parenthesize numbers

NO
```
    (+ 6 (- 2 9))
--> (+ 6 (-7))
```

YES
```
    (+ 6 (- 2 9))
--> (+ 6 -7)
```

Note: Your goal is to keep the expression as valid Scheme the whole way.

### Keep the whole context at all times

NO
```
    (+ (square (+ 2 3)) (square (+ 3 4)))
--> (square (+ 2 3))
--> (square 5)
--> (* 5 5)
--> 25
--> (+ 25 (square (+ 3 4)))
```

YES
```
    (+ (square (+ 2 3)) (square (+ 3 4)))
--> (+ (square 5) (square (+ 3 4)))
--> (+ (* 5 5) (square (+ 3 4)))
--> (+ 25 (square (+ 3 4)))
```

Questions
---------

### Administrative

### SoLAs

Is "Procedural Abstraction" just a long name for "Procedures"?

> Yes.

Do we have to know conditionals?

> Not for this SoLA. I'll fix the page soon.

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

TPS: 

* 1 min: Think to yourself for a minute. What did you hear? What would
  you like to talk about? What made you optimistic? What surprised you?
  What worried you?
* 3 min: Talk to your partner about it
* n min: Full class consideration

What do we want to talk about?

Reflecting on the readings (TPS)
--------------------------------

_What are the key points from the readings?_ (TPS)

### Pair Programming

### Couch Potatoes and Hitchhikers

### Diverse teams

Lab
---
