---
title: "EBoard 30: Data abstraction"
number: 30
section: eboards
held: 2024-04-12
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [5 min]
* Data Abstraction [10 min]
* Questions [5 min]
* Lab [40 min]
* Turn in lab (maybe) [5 min]

Administrative stuff
--------------------

* There is no reading for Monday. Monday will be a bit of a "catch up" day.
* Depending on how far we get on the lab, we may also finish the lab on
  Monday.
* Don't forget to submit the `CHANGES.rkt` file (summarizes your changes)
  when you want the graders to look at your redo.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-16, noon, some PDR
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-16, 7pm, Science 3819
  _Mentor Session_.
* **Thursday, 2024-04-18, 11am, JRC 101**.
  **_Ruha Benjamin on "Viral Justice: How We Grow the World We Want"_**
* Thursday, 2024-04-18, 4pm, ???.
  _CS Poster Session, Part 2._
* Thursday, 2024-04-18, 7pm, Science 3819
  _Mentor Session_.

Cultural

* Friday, 2024-04-12, 4:00-5:00pm, HSSC N1170
  _Middle of Everywhere_. (Bengali)
* Friday, 2024-04-12, 6:30-?:??pm, JRC 209.
  _Shabbas Dinner_.
* Saturday, 2024-04-13, 1:00--5:00pm, Cleveland Beach.
  _Holi!_ Wear white clothes (that you don't mind getting stained).
  Color dyes. Water pistols, Photo booth.
* Saturday, 2024-04-13, 7:00-9:00pm, Main Hall.
  _Nepali New Year_.
* Saturday, 2024-04-13, 3:00--5:00pm, JRC 101.
  _Vietnamese Desert_.

Peer

_Sam probably screwed this up. Check the calendar or pioneers.grinnell.edu._

* Saturday, 2024-04-13, 9:00--noon, Tennis Courts.
  _Men's Tennis vs. Cornell (College)._
* Sunday, 2024-04-14, 2:00--5:00pm, Tennis Courts.
  _Men's Tennis vs. Cornell (College)._
* Sunday, 2024-04-14, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Knox._
* Saturday, 2024-04-20, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit._
* Saturday, 2024-04-20, 2:30--5:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited._
* Sunday, 2024-04-21, 10:00am--1:00pm, Tennis Courts.
  _Men's Tennis vs. Coe._
* Sunday, 2024-04-21, noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited. The Sequel!_
* Sunday, 2024-04-21, 2pm--4:00pm, Sebring Lewis Hall.
  _Grinnell Singers with a King Singer._

Wellness

* Friday, 2024-04-12, 3:00--5:00pm, JRC Courtyard
  _Get Nostalgic_.
* Tuesday, 2024-04-16, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-16, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-16, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

* Saturday, 2024-04-20, 1:00--3:00pm, .
  _Softball vs. Ripon._
* Saturday, 2024-04-20, 3:00--5:00pm, .
  _Softball vs. Ripon, revisited._

### Upcoming work

* Friday, 2024-04-12, 11:00pm, [SoLA 3](../las/) post-reflection
    * [_Submit SoLA 3 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248183)
* Friday, 2024-04-12, 11:00pm, MP7 pre-reflection due
    * [_Submit MP7 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330325)
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)
* Sunday, 2024-04-14, 11:00pm, [MP2](../mps/mp02) Second Redo
    * [_Submit MP2 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323413)
* Sunday, 2024-04-14, 11:00pm, [MP3](../mps/mp03) Second Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323418)
* Sunday, 2024-04-14, 11:00pm, [MP1](../mps/mp01) Third Redo
    * [_Submit MP1 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323410/)
* Monday, 2024-04-15, 8:30am, [Lab writeup](../labs/data-abstraction)
    * [_Submit todays's lab on Gradescope_](???)
    * Preferred: Finish it during class today.

### Friday PSA

* Please be moderate in all that you do, even CS.
* Consent is essential.

Data abstraction
----------------

### Overview: What are key ideas in the reading?

* You can represent the same data in different ways (hash tables, vectors,
  lists, strings, ...).
* We should write procedures that are somewhat independent of the
  representation (as much as possible).
* However, we'll need to agree upon (or design) a basic set of procedures
  that correspond to what we want to do with data?
    * Create a name.
    * Extract title, given, family, suffix.
* We have to be careful about the assumptions we make. For example,
  not everyone has a family name.  Try to be inclusive.
    * You don't know.
* Unfortunate: We sometimes have to make compromises, those may be biasing
  against some people. At minimum, we should acknowledge that.

### Questions

How do we balance "not everyone has a last name" with "some people are too
lazy to enter their last name"?

> Names aren't great identifiers. They are repeated.

> We can set up systems that discourage people from leaving out data.

### Self-check 1: Printing names (‡)

Write a procedure, `(name->string name)`, that takes a name
and converts it to the appropriate string.  `name->string` should
work no matter what representation we use, even if we use a 
representation we have not yet covered.

```racket
> (name->string qe2)
"Queen Elizabeth II"
> (name->string clay) 
"Roy Clay Sr"
```

A solution and a thought process.

```
;;; (name->string name) -> string?
;;;   name : name?
;;; Convert a name to a string, no matter how names are implemented.
(define name->string
  (lambda (name)
    ...))
```

I have 
* `name-title` (which returns string or #f), 
* `name-given` (always returns a string), 
* `name-middle` (which returns a string or #f), 
* `name-family` (which returns a string or #f), and 
* `name-suffix` (which returns a string or #f)

```
(define name->string
  (lambda (name)
    (string-append
     (if (name-title name)
         (string-append (name-title name) " ")
         "")
     (name-given name)
     (if (name-middle name)
         (string-append " " (name-middle name))
         "")
     (if (name-family name)
         (string-append " " (name-family name))
         "")
     (if (name-suffix name)
         (string-append " " (name-suffix name))
         ""))))
```

I should probably clean up the code a bit.

```
(define name->string
  (let ([helper (lambda (str-or-false) 
                  (if str-or-false 
                      (string-append " " str-or-false)
                      ""))])
    (lambda (name)
      (string-append
       (if (name-title name)
           (string-append (name-title name) " ")
           "")
       (name-given name)
       (helper (name-middle name))
       (helper (name-family name))
       (helper (name-suffix name))))))
```

One alternate. Make a list! Look up documentation.

```
(define name>string
  (lambda (name)
    (string-join (filter string?
                         (list (name-title name)
                               (name-given name)
                               (name-middle name)
                               (name-family name)
                               (name-suffix name)))
                 " ")))
```

### Self-check 2: Yet another representation (‡)

Suppose we were planning to represent names as strings with the
components separated by vertical bars.  For example,
`"|Barack|Hussein|Obama|II"` or `"Queen|Elizabeth|||II"`.  Sketch
how you would write procedures like `name-given` and `name-family`
that extract the various parts of the name.  You might, for example,
use `string-split`.

A solution and a thought process.

```
(define name-prefix
  (lambda (name)
    (list-ref (string-split name "|") 0)))

(define name-given
  (lambda (name)
    (list-ref (string-split name "|") 1)))
```

Questions
---------

### Administrative

Are we permitted to use a page of notes on quizzes?

> Of course.

### Dictionaries / Maps / Hash Tables

In `(hash-ref hash key "")`, what does the "" do?

> If you give `hash-ref` three parameters, the last one is the "default",
  which is returned if the key is not in the hash.

### Registration

What does the "Do not click THIS button" do?

> Attempts to register you for classes (it's normally the register button),
  but all classes are marked as full, so it tells you to join the waiting
  lists and therefore makes you sad because the "Join Waiting List" feature
  does not yet work.

What are your opinions regarding our vendor?

> Ellucian SelfService (or whatever Ellucian we are using) is not 
  necessarily designed for schools like Grinnell nor registration 
  processes like we try to use. Perhaps it is unsurprising that it
  does not work properly all the time.

> I am frustrated that it yet again is adding stress to students'
  lives.

### MP7

Lab!
----

