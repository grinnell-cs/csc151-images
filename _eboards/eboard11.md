---
title: "EBoard 11: Conditionals"
number: 11
section: eboards
held: 2024-02-14
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [20 min]
* Lab [60 min]

Administrative stuff
--------------------

* Happy Valentine's Day (or Ash Wednesday). I brought you a Valentine's
  day present: Stickers.
* As an experiment, I'm going to answer questions on conditionals on 
  Friday, rather than today.
* Friday is scheduled as a "pause for breath", a time for all of us
  to catch up a bit (including finishing today's lab).

### Token activities

Academic/Scholarly

* Thursday, 2024-02-15, 11:00--noon, JRC 101.
  _Scholars' Convocation: Gaile Pohlhaus on "An Epistemology of 
   the Oppressed: Resisting and Flourishing under Epistemic Oppression"._
* Thursday, 2024-02-15, 4:00pm, Science 3821.
  _CS Extras: Peter Michael Osera on The Missing Link Between Programming 
  and Proving_.
* Thursday, 2024-02-15, 7:00pm, Science 3819.
  _Mentor session_.  
    * Try to show up on time. 
* Tuesday, 2024-02-20, noon--1:00pm, Some PDR.
  _CS Table_.

Cultural

* Thursday, 2024-02-15, 7:00--9:00pm, Sebring-Lewis.
  _Jazz Concert w/Carol Welsman_.
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
* Friday, Main Quad, Slumber Party!

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

* Wednesday, 2024-02-14, 11:00pm, SoLA 1 due
* Friday, 2024-02-16, 8:30am (or as early as 8:00am): Quizzes.
    * New: Conditionals
    * Old: Tracing
    * _You may bring one page of hand-written notes._
* Thursday: No reading responses!
* Friday, 2024-02-16, 11:00pm: [SoLA 1 post-reflection](https://www.gradescope.com/courses/690100/assignments/3974516)
    * Try to do it earlier.
* Friday, 2024-02-16, 11:00pm: [MP3 pre-reflection](https://www.gradescope.com/courses/690100/assignments/4087963)
* Monday, 2024-02-19, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class Friday.
* Wednesday, 2024-02-21, 11:00pm: MP3

### Notes on MP3

Sam decided to rewrite it completely. Ran out of time. But getting close.

* A bunch of RGB transformations.
* A bunch of HSV transformations.
* A few more of your own.

Questions
---------

### Administrative

Do we need to submit the sample LA.

> No.

> Sam thinks he's funny, but he's not.

### Misc

Lab
---

### Exercise 1a

Please use `#t` for true and `#f` for false.

`(remainder dividend divisor)` tells you what's left over after you
divide `dividend` by `divisor`.

### Exercise 1b

What's wrong with this?

```
(define is-even?
  (lambda (n)
    (if (zero? (remainder n 2))
        #t
        #f)))

(define is-even-integer?
  (lambda (n)
    (if (and (integer? n) 
             (zero? (remainder n 2)))
        #t
        #f)))
```

Is it correct? It seems to be.

How would we make it better?

Since we've already defined an `is-even?` predicate, we should be using it.

```
(define is-even-integer?
  (lambda (n)
    (if (and (integer? n) 
             (is-even? n))
        #t
        #f)))
```

If `(and (integer? n) (is-even? n))` is `#t`, we return `#t`

If `(and (integer? n) (is-even? n))` is `#f`, we return `#f`

We're just returning the result of the test, so we can return the value
of the test, rather than putting it in an `if`.

```
(define is-even-integer?
  (lambda (n)
    (and (integer? n) 
         (is-even? n))))
```

Just like we don't normally write `(* 1 (+ 0 exp))`, if our test just
returns `#t` or `#f`, we normally don't write the `if` part.

---

Are the following employee ids?

* "12345/6"
* "12435.0"

Don't worry if they are not.

---

**For the quiz, I expect that you will have finished only exercise 1.**
