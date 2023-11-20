---
title: "EBoard 35: Searching and program efficiecy"
number: 35
section: eboards
held: 2023-11-20
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided the technology has not broken again.

_Approximate overview_

* Administrivia
* Some notes on the readings
* Questions
* Lab

Administrivia
-------------

* Quizzes returned.
* On Wednesday, plan to sit with your project team.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-23, Noon, Day PDR: _CS Table: Cell Phone Addiction_

Cultural

Peer

Wellness

* We need more wellness activities!

Misc

* Please fill out the peer mentor evaluation form.

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Tuesday: Late MP8 pre-assessment
* Wednesday: Quizzes
* Sunday: Reading

### Wednesday quiz topics

_Available starting at 7:30 a.m.  Collected at 8:45 a.m._

* Data abstraction (new)
* Higher-order programming (repeat)
* Randomness (repeat)
* Diagramming structures (repeat)
* Tracing (repeat)

Some notes on the readings
--------------------------

### Check 1: Categorizing algorithms

For each function, explain whether it is a constant time or linear
time algorithm.   
                   
* `cdr`
* `cddr`
* `list-ref`
* `vector-ref`
* `map`
* `range`

_Reminder: "Constant time" does not depend on the size of the input;
"linear" scales directly with the size of the input (or, as we sometimes
phrase it, with the input)._

_TPS_

* `cdr`
* `cddr`
* `list-ref`
* `vector-ref`
* `map`
* `range`

### Check 2: Binary search

_Note: These are modified slightly from the self-check._

_Yay!  More TPS_

a. Explain the role of the *`less-equal?`* in `binary-search`.

b. In `binary-search`, how do we know if two values are equal?

c. Explain the role of `midpoint`, `middle-element`, `middle-key`,
which are bound in the `let*` of `binary-search`.

d. Describe why and how the *`upper-bound`* of helper `search-portion`
changes when the key we're looking for is less than the middle key.
(If it doesn't change, explain why not.)

e. Describe why and how the *`lower-bound`* of helper `search-portion`
changes when the key we're looking for is greater than the middle key.
(If it doesn't change, explain why not.)

f. Why do we add one to `midpoint` when we change `lower-bound`, but
not subtract one from `midpoint` when we change `upper-bound`?

g. If we double the length of the vector, what is the worst case effect
on the number of recursive calls in `binary-search`?

### Some questions

What is `kernel`?

> When we're using recursive helper procedures, we often call those the
  "kernel".

> I think we covered those in the reading/lab on tail recursion (when
  I (in-)conveniently wasn't here).

What is `struct`?

> A quick way to build data structures instead of vectors, lists, or
  hashes. We didn't cover them this semester.  Sorry for forgetting 
  to remove that from the reading.

What is `match`?

> Damn!

> We're not covering `match`.

How can we confirm the evaluation time of a procedure, like the ones in the self-checks?

> We can do a careful analysis of how they work.

> We can run them on large inputs and time it.  You may recall that we
  did this while exploring `list-ref` vs. `vector-ref`.

> If we write them ourselves, we can add a counter.

Questions
---------

### Administrative

### Higher-order programming

How do I write a procedure that returns "a procedure that takes a
parameter, `x`, and ...."?

> "a procedure that takes a parameter, `x` and ..." can be written
  `(lambda (x) ...)`.

> So we normally write something like 

        (define proc
          (lambda (stuff)
            (lambda (x)
              ...)))

> For example, "Write a procedure, `square-maker`, that takes a size as 
  a parameter and returns a procedure that builds colored squares
  of the given size.  The returned procedure should take a color
  as a parameter."

        (define square-maker
          (lambda (size)
            (lambda (color)
              (square size "solid" color))))

> In this case, we could also use `cut`.

        (define square-maker 
          (lambda (size)
            (cut (square size "solid" <>))))

> However, we can't use `cut` if we need to use the parameter more
  than once, or if it appears more deeply in the body.

Lab
---
