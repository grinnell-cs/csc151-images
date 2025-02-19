---
title: "EBoard 13: Lists (Section 1)"
number: 13
section: eboards
held: 2025-02-19
link: false
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

We are back to the standard start-of-class procedure.

_Approximate optimistic overview_

* Administrative stuff [10 min]
* Some notes from the last lab [10 min]
* Questions and answers [10 min]
* Lab [45 min]
* Turn in Lab [5 min]

Administrative stuff
--------------------

### Introductory notes

* I am out of Otter.ai minutes, so there is no Otter transcription/summary
  for today's class. Sorry!

### Upcoming activities

Scholarly

* Thursday, 20 February 2025, 11:00 a.m.--noon, JRC 101.
  _Scholars’ Convocation: Steven Geofrey.  What Information Worlds Reveal about Climate Change Awareness, Advocacy, and Hope_
* Tuesday, 25 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: TBD_ 

Artistic

* Friday, 21 February 2025, 7:00 p.m., The Wall (I think).
  _The Neverland Players_
    * Tickets in the Bucksbaum Box Office.
* Saturday, 22 February 2025, 2:00 p.m., The Wall (I think).
  _The Neverland Players_
* Saturday, 22 February 2025, 7:00 p.m., The Wall (I think).
  _The Neverland Players_
* Sunday, 23 February 2025, 2:00 p.m., The Wall (I think).
  _The Neverland Players_

Multicultural

* Friday, 21 February 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Beyond the War: Ukraine on the Cultural Front_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Thursday night--Sunday night, The Natatorium.
  _Swimming Conference Meet_.

Wellness

* Friday, 21 February 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Tuesday, 25 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 25 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* Sunday, 23 February 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 25 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Wednesday, 19 February 2025
    * Quiz: Documentation
    * Makeup quiz: Tracing
* Thursday, 20 February 2025
    * [Submit Wednesday's lab on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815249)
    * Readings:
        * [List basics](../readings/list-basics)
        * [Transforming lists](../readings/transforming-lists)
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5799376)
    * [SoLA 1](../las)
        * [Decomposition](https://www.gradescope.com/courses/948769/assignments/5798661)
        * [Procedures](https://www.gradescope.com/courses/948769/assignments/5798726)
        * [Primitive types](https://www.gradescope.com/courses/948769/assignments/5798727)
        * [Lambda-free anonymous procedures](https://www.gradescope.com/courses/948769/assignments/5798741)
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
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815253)
    * [Submit pre-reflection for MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815256)

Notes from conditionals lab
---------------------------

### `is-even?`

```
(define is-even?
  (lambda (val)
    (if (= 0 (remainder val 2))
        #t
        #f)))
```

### Vocabulary: `zero?`

```
(define is-even?
  (lambda (val)
    (= 0 (remainder val 2))))
```

### Reminder: Cut and compose

```
```

### Min of three

```
(define min-of-three
  (lambda (x y z)
    (cond
      [(or (<= x y z) (<= z y x))
       y]
      [(or (<= y x z) (<= z x y))
       x]
      [(or (<= x z y) (<= y z x))
       z])))
```

```
(define min-of-three
  (lambda (x y z)
    (cond
      [(or (<= x y z) (<= z y x))
       y]
      [(or (<= y x z) (<= z x y))
       x]
      [(or (<= x z y) (<= y z x))
       z]
      [else
       #f])))
```

Q&A
---

