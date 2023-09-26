---
title: "EBoard 15: Lists, continued"
number: 15
section: eboards
held: 2023-09-25
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* Our context: Delegation

Administrivia
-------------

* Quizzes returned.
* SoLA problems (6 of 'em) should appear at 10:00 a.m.  Let me know if
  you don't see them.
* If you have parents visiting for family weekend, you are welcome to
  bring them to class on Friday.  (Let me know in advance in case I have
  to find chairs.)
    * No, I won't make them take the quiz.
* Today is a talk day, to help us conceptualize recursion.

### Upcoming Token activities

Academic

* CS Extras, Thursday, 4:15 pm, Science 3821

Cultural

* Pieta Brown, Saturday night

Peer

* Football vs. Lawrence, Saturday, 1pm

Wellness

Misc

### Other good things

### Upcoming work

* Thursday night: SoLA 1 due
* There is no reading for Friday; focus your time on the SoLA and the quiz.
* Quiz Friday!

### Friday's quiz

Primary topic: Lists + "the big three" (filter, map, reduce)

I will also have another round of tracing.

**Sample lists problem**

_Manipulate lists with fundamental higher-order list functions._

Write a procedure, `(acronym string-of-words)`, that takes as input
a string of words separated by spaces and produces as output an
acronym that consists of the first letter of each word.

```racket
> (acronym "International Business Machines")
"IBM"
> (acronym "Grinnell's Underground Magazine")
"GUM"
> (acronym "Sam's Assorted Musings and Rants")
"SAMaR"
```

You may rely on this following helper function.

```
;;; (first-char str) -> character
;;;   str: A non-empty string
;;; Extracts the first character of a string
(define first-char
  (lambda (str)
    (string-ref str 0)))
```

```
> (first-char "hello")
#\h
> (first-char "International")
#\I
```

Questions
---------

### On administrative stuff

### On stuff from the last lab

Can we talk about the relationship between `cut` and `reduce`?

### In preparation for the SoLAs

### In preparation for Friday's quiz

Lab
---

Person closest to the board is A.  Person furthest from board is B.
