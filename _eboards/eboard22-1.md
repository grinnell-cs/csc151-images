---
title: "EBoard 22: Numeric recursion (Section 1)"
number: 22
section: eboards
held: 2025-03-28
link: false
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff (way too much)
* Notes on recent labs
* Q&A
* Lab

Administrative stuff
--------------------

### Introductory notes

### Upcoming activities

Scholarly

* Thursday, 3 April 2025, 11am--noon, JRC 101.
  _Scholars’ Convocation: LeAnne Howe
  "A Choctaw In King Abdullah’s Court"_
    * Also important, but not directly relevant to this class.

Artistic

Multicultural

* Friday, 28 March 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Why you should visit Nepal_ 
* Friday, 28 March 2025, 5:30 .m., HSSC N2116.
  _A Latine-based dinner and conversation with Dr. Gabriella Soto_.
    * Dinner provided.

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Friday, 28 March 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 28 March 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 29 March 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Tuesday, 1 April 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 1 April 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* Sunday, 30 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_
* Tuesday, 1 April 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_
* Wednesday, 2 April 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education – and Grinnell College are facing."

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Thursday, 27 March 2025
    * [SoLA 2](../las/) due.
        * Old topics: Decomposition, Procedural abstraction, Primitive types,
          Collaboration, Lambda-free anonymous procedures (cut and compose).
        * Semi-new topics: Conditionals, documentation, lists
        * New topics: Testing, program style, ethical considerations
    * Readings:
       * [Numeric recursion](../readings/numeric-recursion)
* Friday, 28 March 2025
    * Mini-Project 6 assigned
* Sunday, 30 March 2025
    * Submit Pre-reflection for MP6 due
    * MP redos due
        * [Submit second redo of MP 1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902141)
        * [Submit second redo of MP 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902142)
        * [Submit second redo of MP 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902145)
        * [Submit redo of MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902148)
        * [Submit redo of MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5902152)
* Wednesday, 2 April 2025 
    * Quiz: List recursion 
    * Makeup quiz: Local bindings (`let` and `let*`)
    * Makeup quiz: Tracing
    * _Remember that you can bring a sheet of hand-written notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_

Short notes on recent labs
--------------------------

### From Monday's lab: Why trace?

* We have you study tracing, in part, so that you can start figuring out
  what these more complex procedures do.
* Once you have mastered tracing, you can skip steps. Until then, you
  shouldn't.

### From Monday's lab: What do the procedures do? (TPS)

### From Wednesday's lab: How you're supposed to approach problems

* _Document first_. Documentation ensures, at minimum, that you've
  thought about input and output types.
* _Tests next_. (Or write tests.)  Your tests ensure that you've
  thought about a few cases. You're going to "test" (experiment
  with your code) in any case, so why not spend the extra 30 seconds
  to write down your expectations?
* _Implement last_. This may seem strange. Nonetheless, we're best off 
  waiting to implement until we've considered the issues above.

### From Wednesday's lab: Testing (TPS)

Tests for ...

Tests for `my-product`?

### From Wednesday's lab: Alphabetically first (TPS)

At least four versions. We're going to explore them a bit. But first,
some documentation and tests.

```
;;; (alphabetically-first words) -> string?
;;;   words : list-of string?
;;; Find the alphabetically first string in `words`, using
;;; string-ci<=? for comparison.
```

What about our tests? (TPS)

```
```

Okay, on to our first version.

```
(define alphabetically-first-a
  (lambda (lst)
    (if (= 1 (len lst))
        (car lst)
        (if (string-ci<=? (car lst) (alphabetically-first-a (cdr lst)))
            (car lst)
            (alphabetically-first-a (cdr lst))))))
```

Hmmm ... Sam says that when we repeat code, we should use a `let` binding.
What's repeated here?

```
(define alphabetically-first-b
```

Hmmm ... Sam said something about how to check for one-element lists. How
do we update that code.

```
(define alphabetically-first-c
```

Does it make a difference? We'll start by defining a variety of values.

```
(define nums10 (map number->string (range 10)))
(define nums20 (map number->string (range 20)))
(define rev20 (reverse nums20))
(define nums22 (map number->string (range 22)))
(define rev22 (reverse nums22))
(define nums25 (map number->string (range 25)))
(define rev25 (reverse nums25))
(define nums30 (map number->string (range 30)))
(define rev30 (reverse nums30))
(define nums100 (map number->string (range 100)))
(define nums1000 (map number->string (range 1000)))
(define nums10000 (map number->string (range 10000)))
(define nums20000 (map number->string (range 20000)))
(define nums40000 (map number->string (range 40000)))
```

And some experiments with those. First we'll look at version a.

```
```

Let's compare version b.

```
```

And on to version c

```
```

Here's another approach.

```
(define alphabetically-first-d
  (lambda (lst)
    (if (= 1 (len lst))
        (car lst)
        (if (string-ci<=? (car lst) (cadr lst))
            (alphabetically-first-d (cons (car lst) (cddr lst)))
            (alphabetically-first-d (cdr lst))))))
```

And here's that same approach with a more sensible "does it have one item?"

```
(define alphabetically-first-e
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (if (string-ci<=? (car lst) (cadr lst))
            (alphabetically-first-e (cons (car lst) (cddr lst)))
            (alphabetically-first-e (cdr lst))))))
```

And yes, it makes a difference.

```
> (time (alphabetically-first-d nums10000))
???
> (time (alphabetically-first-d nums40000))
???
> (time (alphabetically-first-e nums40000))
???
```

Here's another approach.

```
(define alphabetically-first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))

(define alphabetically-first-f
  (lambda (words)
    (if (null? (cdr words))
        (car words)
        (alphabetically-first-of-two (car words)
                                     (alphabetically-first-f (cdr words))))))
```

And one other.

```
(define alphabetically-first-g
  (lambda (words)
    (afg-helper (car words) (cdr words))))

(define afg-helper
  (lambda (word remaining)
    (if (null? remaining)
        word
        (afg-helper (alphabetically-first-of-two word (car remaining))
                    (cdr remaining)))))
```

TPS: Which do you prefer (c, e, f, or g)? Why?

Questions
---------

### Administrative

### Numeric recursion

### Other

Lab
---

