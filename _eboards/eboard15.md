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
* A note on last Friday's quiz
* Questions
* Algorithms, revisited
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

* Convocation, "A Cure for the Epidemic of Loneliness?", Thursday, 11am, 
  HSSC Kernel.
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
* Quiz Friday!  Lists (with the big three)

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

Quiz from last Friday
---------------------

* Many people got "S" but still go lots of red on their quizzes.  Let
  me know if the red doesn't make sense (after we discuss it).
* Note that the quiz was quite similar to a lab problem; you'll find
  that that happens from time to time.
* I permit (minor) syntax errors on Friday quizzes; I will not permit
  them on the SoLA, since you can check in DrRacket.

_TPS: What's wrong with (or could be improved about) this solution?_

You should be able to be able to find at least six different issues.
(Invalid Scheme, won't meet specifications, bad style, unnecessary code ...)

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           ("black")]
          ((and (> (simple-brightness c) 20) 
                (< (simple-brightness c) 40)) ("dark-gray"))
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           ("medium-gray"))
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           ("light-gray"))
          ((> (simple-brightness c) 80)
           ("white")))))
```

First revision

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           ("black")]
          ((and (> (simple-brightness c) 20) 
                (< (simple-brightness c) 40)) ("dark-gray"))
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           ("medium-gray"))
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           ("light-gray"))
          ((> (simple-brightness c) 80)
           ("white")))))
```

Second revision

Questions
---------

### In preparation for the SoLAs

Do I have one hour total for the SoLA?

> No.  You have one hour for each LA you do.

Do I have to do all the LAs at the same time?

> No.  You can take a break?



### On administrative stuff

### On stuff from the last lab

Can we talk about the relationship between `cut` and `reduce`?

### In preparation for Friday's quiz

Algorithms, revisited
---------------------

It's time to return to something we covered early in the semester.

Six key components:

* _Basic/built-in types, their values, and operations on those values._
  The things the computer already "knows" how to do.
* _Subroutines (procedures, etc.)_
  Named and parameterized (sub)algorithms.
* _Conditionals._
  Ways to make choices.
* _Repetition._
  Ways to repeat an action.
* _Naming._
  Assigning names to values (or parameters).
* _Sequencing._
  Controlling the order in which things are done.

_TPS: What do we know about each of these in Scheme?_

### Built-in types (+ values, operations)

### Subroutines (procedures)

### Conditionals

### Repetition

### Naming

### Sequencing

Recursion
---------

* We know that solve a complex problem, we should decompose the problem 
  into smaller problems.
* Recursion says "To solve a complex problem, solve a smaller version 
  _of the same problem_, and then use that to solve the bigger problem."
* To write a recursive procedure, we need to
    * Determine how to "simplify" an input (for lists, it's usually
      to remove the first value)
    * Determine how to use the solution to the smaller problem to 
      solve the bigger problem
    * Identify when the problem is simple enough we can solve it directly.

The weird part of recursion is that we are solving the "smaller" problem with exactly the same solution as the smaller problem; we have to assume we’ve written something we haven’t written yet.

_The magic recursion fairy makes it work._

Examples
--------

We're going to rephrase recursion in terms of "delegation".  When given
a large problem, an executive will normally delegate most of the problem
to an assistant.  We'll assume that their assistant will do the same.
