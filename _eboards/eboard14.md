---
title: "EBoard 14: Lists"
number: 14
section: eboards
held: 2024-02-21
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [10 min]
* Questions [10 min]
* Lab [55 min or less]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Yay! I have both hearing aids. My hearing has now returned to 
  mediocre instead of awful.
* Prof. Perlmutter and I are still discussing what to do about the
  SoLA 1 issues. Stay tuned. I've released the graded SoLAs for
  the time being so that you can see how you've done. However, if the
  "dorm lounge" policy goes into effect, those will change.
    * Since the parties have not come forward, I'll just remind them
      that the "I won't report you to the committee on academic
      standing" policy doesn't hold when I identify you.
* MP4 should be released tomorrow night.
* Reminders:
    * If I don't respond on Teams within 12 hours (weekdays), feel free
      to DM me again.
    * If I don't respond to email within 24 hours (weekdays), feel free
      to email me again.
* Otter is fun!

### Token activities

Academic/Scholarly

* Thursday, 2024-02-22, 11:00-noon, JRC 101.
  _Scholars' Convocation: Luis Fabiano De Assis on Human Trafficking._
* Thursday, 2024-02-22, 4:00pm, Science 2022.
  _CS Extra: Declaring a CS Major._
* Thursday, 2024-02-22, 7:00pm, Science 3819.
  _Mentor Session_. (lists, map, apply, and things similarly fun)
* Tuesday, 2024-04-27, 7:00pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-02-23, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._
* Friday, 2024-02-23, 7:00--9:00pm, Sebring-Lewis.
  _Squatters on Red Earth_.

Peer

* Saturday night Casino night in Harris

Wellness

* Tuesday, 2024-02-27, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-27, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-27, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

### Upcoming work

* Wednesday, 2024-02-21, 11:00pm: [MP3](../mps/mp3)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4134156)
    * Reminder: Read the rubric and try to avoid incompletes.
* Thursday, 2024-02-22, 11:00pm: Reading responses
    * ["The big three"](../readings/list-big-three)
    * [More list procedures](../readings/list-more)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4122111)
* Friday, 2024-02-23, 8:00am: Quizzes!
    * Tracing (please try to talk to me if you haven't been getting this)
    * Cut and compose (bonus quiz because many of you struggled)
    * Program style (Handouts -> Style)
    * _You may bring one page of notes_.
* Friday, 2024-02-23, 8:30am: Submit today's lab writeup.
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class today.
* Friday, 2024-02-23, 11:00pm: Submit the MP3 post-reflection
    * [_Submit MP3 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087964)
* Friday, 2024-02-23, 11:00pm: Submit the MP4 pre-reflection
    * [_Submit MP4 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4136298/)
* Sunday, 2024-02-25, 11:00pm, [MP2](../mps/mp2) Redo
    * [_Submit MP2 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4113572/)

Questions
---------

### Administrative

Will Sam update tokens so that we can enter more?

> Sure. It's on my agenda for tonight. (Really this time.)

### MP2

Can you give us a diagram for outlined right triangles?

> Sure. I'll add it to my agenda for tonight. (Really this time.)

### MP3

### Lists

When do we use `apply`?

> When we have a procedure that expects a bunch of parameters and we've
  somehow managed to put all of those parameters into a list.

> Most frequently, when we have a procedure that expects "as many parameters
  as you give it" and a list. We might apply `+`, `string-append`, 
  `beside`, `above`.

> In the next reading, you'll learn a similar procedure, `reduce`, that
  works with pairs of elements.

### Random

Why are pears so important?

> They are an awesome fruit.

Why are pairs so important?

> We use them to build lists. They were part of LiSP, the ancestor
  of Racket. They've been shown to be powerful. We'll explore them
  in a few weeks.

Lab
---

### Observations

There are three versions of `range`.

* One parameter: `(range n)` -> `'(0 1 2 ... n-1)`
* Two parameters: `(range m n)` -> `'(m m+1 m+2 ... n-1)`
* Three parameters: `(range m n i)` -> `'(m m+i m+2i ...)`

Why so many experiments with `range`?

* To remind you that when you're exploring a new procedure, you should
  try lots of different kinds of inputs.
* To suggest the different kinds of inputs you might give to `range`.

### Help

Procedures that work with strings and make lists

* `(string->lst str)`
* `(string-split str)`

The `test` procedures return nothing if the test succeeds and issue
an error message if they fail.

```
(define char->digit
  (lambda (char)
    5))

(test-equal? "five" (char->digit 5) 5)
(test-equal? "six" (char->digit 6) 6)
```

```
--------------------
six
. FAILURE
name:       check-equal?
location:   3-unsaved-editor:10:0
actual:     5
expected:   6
--------------------
```

What's the "three-parameter map"?

> You've seen it already: `(map - (range 3) (list 2 1 2))`

> It builds a new list by applying the procedure to the corresponding 
  elements of the two lists.
