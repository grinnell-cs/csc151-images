---
title: "EBoard 11: Conditionals (Section 2)"
number: 11
section: eboards
held: 2024-02-14
link: true
---
# {{ page.title }}

_Approximate overview_

* Administrative stuff [30 min]
* Questions [5 min]
* Lab [45 min]

Administrative stuff
--------------------

* I'm Sam. I'm replacing Prof. Perlmutter for today.
* Happy Valentine's Day (or Ash Wednesday). I brought you a Valentine's
  day present: Stickers.
* Friday is scheduled as a "pause for breath", a time for all of us
  to catch up a bit (including finishing today's lab).

### Upcoming work

* Wednesday, 2024-02-14, 11:00pm, SoLA 1 due
* Friday, 2024-02-16, 3:35pm: Quizzes.
    * New: Conditionals
    * Old: Tracing
    * _You may bring one page of hand-written notes._
* Thursday: No reading responses!
* Friday, 2024-02-16, 11:00pm: SoLA 1 post-reflection
    * Try to do it earlier.
* Friday, 2024-02-16, 11:00pm: MP3 pre-reflection
* Monday, 2024-02-19, 2:30pm: Submit today's lab writeup.
    * Preferred: Submit before the end of class Friday.
    * Please try to finish on your own if we don't finish in class.
* Wednesday, 2024-02-21, 11:00pm: MP3

### Notes on MP3

Sam decided to rewrite it completely. Ran out of time. But getting close.

* A bunch of RGB-based transformations.
* A bunch of HSV-based transformations.
* A few more of your own.

### What Sam typed in DrRacket

Sorry. The HSV colors didn't paste. But you can re-run the code to see
what happens.

```
> (hsv 0 100 100)
.
> (hsv 120 100 100)
.
> (hsv 240 100 100)
.
> (hsv 60 100 100)
.
> (hsv 300 100 100)
.
> (hsv 270 100 100)
.
> (hsv 330 100 100)
.
> (hsv 0 100 100)
.
> (hsv 0 50 100)
.
> (rgb->string (hsv->rgb (hsv 0 50 100)))
"255/128/128"
> (hsv 0 0 100)
.
> (rgb->string (hsv->rgb (hsv 0 0 100)))
"255/255/255"
> (hsv 0 100 100)
.
> (hsv 0 100 50)
.
> (hsv 0 100 70)
.
> (rgb->string (hsv->rgb (hsv 0 100 70)))
"178/0/0"
```

Questions
---------

### Administrative

### Misc

Lab
---

### Exercise 1a

Please use `#t` for true and `#f` for false (no quotation marks).

`(remainder dividend divisor)` tells you what's left over after you
divide `dividend` by `divisor`. So `(remainder n 2)` tells you how
much is left over after dividing by 2 (either 0 or 1).

### Exercise 1b

What's wrong with the following for `is-even-integer?`

```
```

### Excercise 1c

What do you expect for each of the following?

```
> (number-not-integer? 3)
#f
> (number-not-integer? 3.5)
#t
> (number-not-integer? 3/4)
#t
> (number-not-integer? "three")
#f
```

# Exercise 1d

`(<= x y z)` is a shorthand for `(and (<= x y) (<= y z))`.

* If the test holds, `y` is the median.

Make sure to think about the following

```
> (median-of-three 1 2 3)

> (median-of-three 3 2 1)

> (median-of-three 3 3 2)

> (median-of-three 2 2 3)

```
