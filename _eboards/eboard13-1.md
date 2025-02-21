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
* Questions and answers [5 min]
* About MP4 [10 min]
* Lab [40 min]
* Turn in Lab [5 min]

Administrative stuff
--------------------

### Introductory notes

* Warning! It's Friday the 13th (class).
* Today is our start of three days of exploring lists in Racket.
* I am out of Otter.ai minutes, so there is no Otter transcription/summary
  for today's class. Sorry!
* I will be out of town Tuesday through Friday next week, attending the
  annual ACM Technical Symposium in Computer Science Education. 
    * I'll check Teams Messages from time to time.
    * You will have subs on Wednesday and Friday.
* Many people struggled on the Documentation Quiz/LA. The mentors will go
  over it on Sunday/Tuesday. 
* Many people struggled on MP3. I count 18 I's and 5 missing assignments.
    * Please read the guidance for R and try to start by shooting for
      R. (It's easier on some MPs than others.)
    * Please reach out for help!
    * Please use the evening tutors.
    * No charge for redoing the I's on MPp3.
* I have posted a redo for MP3.
* I spent all my free time yesterday writing the new MP, so I was not able
  to review the reading responses. Sorry. I hope you can figure out the lab
  without them.

### Upcoming activities

Scholarly

* Tuesday, 25 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: TBD_ 
* Thursday, 27 February 2025, 11:00 a.m.--Noon, JRC 101.
  _Scholars' Convocation: Emily Wilson: Retranslating the Classics_

Artistic

* Friday, 21 February 2025, 7:00 p.m., The Wall
  _The Neverland Players_
* Saturday, 22 February 2025, 2:00 p.m., The Wall
  _The Neverland Players_
* Saturday, 22 February 2025, 7:00 p.m., The Wall
  _The Neverland Players_
* Sunday, 23 February 2025, 2:00 p.m., The Wall
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

* Friday, 21 February 2025
    * [MP4](../mps/mp04) released
    * [Submit post-reflection for SoLA 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5780118)
* Sunday, 23 February 2025
    * [Submit first redo for MP2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5783168)
    * Submit Friday's lab on Gradescope
    * Readings: Processing Lists
        * [The "big three" list operations](../readings/list-big-three)
        * [Transforming lists](../readings/list-transform)
        * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815253)
    * [Submit pre-reflection for MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5815256)
* Tuesday, 25 February 2025
* Wednesday, 26 February 2025
    * Quiz: Conditionals
    * Makeup quiz: Tracing
    * Makeup quiz: Documentation
* Sunday, 2 March 2025
    * [Submit redo of MP3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5820169)

Mini-Project 4
--------------

Brand new! Please keep me posted on confusing or long parts.

Summary: Like mini-project 3, but with conditionals.

Also: 

* Fewer problems: Six primary procedures, two "go from color to image" 
  procedures, and one freestyle.
* Less math. (There is a circle problem; ask me if you have trouble
  understanding the circle formula.)

Notes from conditionals lab
---------------------------

### No-parameter versions

What is `(and)`? Why?

What is `(or)`? Why?

### `is-even?`

Here's how many people defined `is-even?`.

```
(define is-even?
  (lambda (val)
    (if (= 0 (remainder val 2))
        #t
        #f)))
```

But the `#t` and `#f` are icky. Let's think about a better way.

If `val` is even, what do we get from `(= 0 (remainder val 2))`?

If `val` is odd, what do we get from `(= 0 (remainder val 2))`?


### Vocabulary: `zero?`

```
(define is-even?
  (lambda (val)
    (= 0 (remainder val 2))))
```

### Reminder: Cut and compose

```
```

### `is-even-integer?`

```
(define is-even-integer?
  (lambda (val)
    (and (integer? val) (zero? (remainder val 2)))))
```

Can we do better?

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

Hmmm ... shouldn't we have a default?

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

Or, better yet, 

```
(define min-of-three
  (lambda (x y z)
    (cond
      [(or (<= x y z) (<= z y x))
       y]
      [(or (<= y x z) (<= z x y))
       x]
      [else
       z])))
```

If we didn't have `if` or `cond`, we could write

```
(define min-of-three
  (lambda (x y z)
    (or (and (or (<= x y z) (<= z y x))
             y)
        (and (or (<= y x z) (<= z x y))
             x)
        z)))
```

No, I don't want you to take this last approach.


Q&A
---

### Administrative

Do we have a final for this class?

> We have an optional SoLA 5, which gives you one last chance to make up
  any missing LAs (except for the paper-only LAs). It will be online, so
  you can take it anywhere with Interweb access.

Will I have another chance to make up the tracing LA?

> Yes. We will have an in-class tracing quiz each week until one of 
  the following situations happen: (a) everyone has passed or (b) we
  reach the end of the semester.

Are there any other in-class-only LAs?

> Yes. There's one on diagramming structures in phase 3.

### Lists

### Other

Lab
---
