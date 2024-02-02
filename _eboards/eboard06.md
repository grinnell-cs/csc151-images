---
title: "EBoard 06: Numbers"
number: 6
section: eboards
held: 2024-02-02
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [15 min]
* Q&A [15 min]
* Lab [30 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Is 7pm or 8pm better for Thursday mentor sessions?
    * 7pm Many
    * 8pm Fewer
    * Undecicded Similar to 8pm

### Welcome to new class members!

* We met one new class member on Wednesday.
* We have two new class members to meet today.

TPS: _What should they know about the class?_

* More than you could ever hope to catch up on. Drop now. (That was
  a joke.)
* There's a start-of-class process. Grab a card. Figure out which
  computer it is. Drop the card in the bucket. Navigate to the computer.
  If you are first, log in. When both partners arrive, introduce
  yourselves and chat about important things like your work habits
  and skills.
    * Exception 1: Sometimes we do two-day labs. In those cases, plan
      to return to the same place.
    * Exception 2: On Fridays, you should also grab a quiz.
    * Exception 3: Sam sometimes puts others instructions on the whiteboard,
      so look up and read the whiteboard when you enter class.
* Sam is incredibly cruel and will eat away at your self confidence by
  insulting your answers.
* Until everyone learns your name, say your name when you ask or answer
  a question, even if Sam has just called on you by name.

### Token activities

Scholarly

Cultural

Peer

* Friday, 2024-02-02, 8pm, Harris Concert Hall:
  _Weekend Murder Mystery_. There's food. You get to solve puzzles.
  The winner(s) will get prizes.
* Saturday, 2024-02-03, 1pm?, Natatorium:
  _Swim meet_.

Wellness

Misc

* InfoSec security survey (coming via email)

### Other good things

### Upcoming work

* Friday, 2024-02-02, 11pm: [Mini-project 1 post-refelection](https://www.gradescope.com/courses/690100/assignments/3974516) due.
* Friday, 2024-02-02, 11:00pm: [Mini-project 2 pre-reflection](https://www.gradescope.com/courses/690100/assignments/4030975) due.
* _No readings for Monday!_ (Please don't try to do Wednesday's readings ahead.)
* Monday, 2024-02-05, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](...)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-07, 11:00pm: [Mini-Project 2](../mps/mp02) due.
    * Gradescope forthcoming.

### Friday PSA

* Moderation is essential.
* Please decide what is right for you.
* Take care of yourselves.
* Consent is essential.

Questions
---------

### Administrative

### Reading

What's with this `'solid` in the symbols reading?

> It's something we used in the old image libary. Sam forgot to edit
  the reading.

Why do we learn symbols?

> Mostly so that you learn why we write things like `'symbol`.  We
  may return to them later in the semester.

Can you compare symbols?

> You can compare them to each other for equality, but they are not
  ordered.

> No symbol equals any number.

What's the difference between a symbol and a string?

> Symbols are "atomic"; you cannot decompose a symbol into component
  parts.

> Strings are "compound"; you can decompse a string into smaller strings,
  extract letters, etc.

> You can also compare strings according to a "natural" ordering.
  For example, "apple" should be before "zebra" in the ordering
  most of us use.

Can you give an example of when you'd use symbols instead of strings?

> Not at the moment. Stay tuned.

### MP2

I can't find equilateral triangles. Should I use `2htdp/image`?

> NO.

> Perhaps your 151 library is out of date. Update it.

I can't find `solid-right-triangle`.

> That's intentional. You're writing it!

Lab
---

All of today's problems are "think and try" rather than "write a
procedure". Hence, the autograder will only check that the file
exists.

What do you expect to get for `(* (sqrt 2) (sqrt 2))`?

> 2

Do you get 2?

> No

What's the difference?

> Um `(- 2 (* sqrt 2) (sqrt 2))`.

> Which is something like `4.001212e-16`. I don't know what that means.

It means 4.001212 * 10 to the -16, or `.000000000000004001212`.

### Inexact numbers

Some fun things to try

```
> (define x (expt 2 100))
> (define ex (exact->inexact x))
> x
> ex
> (+ x 1)
> (+ ex 1)
> (- (+ x 1) 1)
> (- (+ ex 1) 1)
```

