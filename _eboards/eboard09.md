---
title: "EBoard 09: Boolean values and predicate procedures" 
number: 9
section: eboards
held: 2023-09-13
link: true
---
# {{ page.title }}

* **Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* A few notes on Quiz 1
* Debrief on lab.
* Questions
* Lab

Administrivia
-------------

### Introductory notes

* Today's lab is about half new. 
    * There may be bugs.  (Of course, there may also be bugs in old
      labs.)
    * I'll need to spend the first bit of lab updating the autograder.
      (Ran out of time yesterday.)
* Beware!  Friday the 13th falls on a Wednesday this month!

### Upcoming Token activities

Academic

* Thursday, 14 Sept 2023, 4:15 pm, CS Extras: "????" (Science 3820)
* Thursday, 14 Sept 2023, 6pm, "Microsoft Campus Visit" (HSSC Kernel/A1231)
* Sunday, 17 Sept 2023, 1pm, Mentor Session (Here)

Cultural

* Thursday 14 Sept 2023, 8pm, Writers @ Grinnell w/Claire Forrest '13

Peer

* Major Fair, Today 4pm, near the sundial

Wellness

Misc

* Friday 15 Sept 2023, Noon, Whale Room, Lunch with Young Alums in Tech

### Other Good Things

### Upcoming work

* Thursday Night: MP2 due.
* Thursday Night: Reading responses due
* Friday morning: Today's lab due (but we'll get it turned in today)
* Friday: Quiz (primitive types)
* Friday Night: MP2 post-assessment (or do that with MP2)

Sample primitive types questions
--------------------------------

_Express basic computations over primitive values and their associated standard library functions._

As you may know, some children enjoy using a language called "Pig Latin" (or Igpay Atlinlay).  The normal rules for Pig Latin are as follows:

* If the word starts with a consonant, move the consonant and any subsequent consonants to the end of the word and add "ay" to the end.
* If the word starts with a vowel, add "yay" to the end of the string.

We're going to do a simpler version of Pig Latin.  For any word, we'll strip the first letter from the beginning of the word, add the letter to the end, and add "ay".

```racket
> (simplified-pig-latin "pig")
"igpay"
> (simplified-pig-latin "slurp")
"lurpsay" ; It's "uprslay" in traditional Pig Latin
> (simplified-pig-latin "append")
"ppendaay" ; It's "appendyay" in traditional Pig Latin
```

Write the `simplified-pig-latin` procedure.

_Express basic computations over primitive values and their associated standard library functions._

As you've learned by now, the Unicode collating sequence assigns different numbers to the letters of the alphabet than humans do.  We think #\a is the first letter of the alphabet; Racket calls it number 97.

Write a procedure, `(nth-capital-letter n)` that takes an integer between 1 and 26 as a parameter and returns the corresponding capital letter in English.  (`#\A` is 1, `#\B` is 2, and so on and so forth.)

You may not write a huge conditional; you should write this procedure using the appropriate computation.

You should not use magic numbers; don't rely on a particular collating sequence.  (You may, however, assume that the letters appear in sequence in the collating sequence.)

```racket
> (nth-capital-letter 1)
#\A
> (nth-capital-letter 5)
#\E
> (nth-capital-letter 11)
#\K
```

NOTE: You can bring a sheet of hand-written notes or a stack of flashcards.

Debrief on last class
---------------------

(TPS) What did you take away from the last lab?

* We practiced pair programming.  Like all Grinnellians, we're awesome, 
  so we did it particularly well.  It was a good experience.
* A better understanding of RGB colors, although combining them stlil
  doesn't completely make sense.
* We can tweak colors in interesting ways.
* We got practice writing procedures.

Questions
---------

_I've taken questions from your reading responses, but you should always
feel free to add your own._

### On Boolean values and conditional expressions

Why does `(or #f 0)` evaluate to 0?

> Although our tracer doesn't show it (yet), `or` evaluates its arguments
  by evaluating each in turn.  When it hits the first non-false value,
  it returns that value.  If it runs out of values, it returns false.

Why does `(or 11 9)` evaluate to 11?

> See the prior answer.  `11` is "trueish" (that is, not false), so
  it returns it.

Why does `(and #t 5)` evaluate to 5?

> Although our tracer doesn't show it (yet), `and` evaluates its arguments
  by evaluating each in turn.  When it hits the first false, it returns
  false.  If the last value is not false, it returns that value.

### On RGB colors

### On the forthcoming quiz

I won't remember all of the procedures.  Can I bring a sheet of notes
or a stack of flashcards?

> You may bring a sheet of hand-written notes or a stack of flashcards.

When can I take the quiz on Friday?

> Both quizzes should be available at 8 a.m.

### On the mini-project

What file names would you like for the mini-project?

> I think they are in the description.  Perhaps not.

Why isn't there a place to submit the mini-project on Gradescope?

> Forthcoming.

Where is the grading rubric?

> Tonight.

### Miscellaneous

What's this `list` procedure?

> `list` takes a bunch of expressions as parameters and puts them into
  a structure we call a "list" (surrounded by parentheses).  Right now,
  all we know how to do with lists is (a) make them (with `list`) and
  (b) find out how many values there are with `length`.

> I think we were just trying to show you that undefined values make
  your life difficult.

Where do you find the garbage (strike that, useful comments) that
Sam types every day?

> Go to the course Web site.

> Go to the schedule.

> Click on the subject of a class.

> Cross your fingers.

> If that doesn't work, let Sam know.

### On administrative stuff

Lab
---

A is closest to the board.  A drives first.  For today's lab,

* A: 1,4,5
* B: 2,3,6

Sam is frantically updating Gradescope.  (Done.)

Note: for `median-of-three`, don't use `min` and `max`, just compare
`x`, `y`, and `z` to each other.

`(<= x y z)` is a shorthand for `(and (<= x y) (<= y z))`

`(or (<= x y z) (<= z y x))` indicates that y is the median of `x`, `y`, `z`.

We will continue this lab next class!
