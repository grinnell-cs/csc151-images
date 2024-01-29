---
title: "EBoard 05: Mental models"
number: 5
section: eboards
held: 2024-01-31
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff, including attendance [25 min]
* Lab [50 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

### Attendance

_Yes, we'll do that once in a while._

### Introductory Notes

### Upcoming activities

Scholarly

* Thursday, 2024-02-01, 11am, HSSC 2231 (Auditorium), 
  _Scholars' Convocation, Being a Pandemic Citizen._

Cultural

* Art gallery opening.

Peer

Wellness

Misc

### Other good things

### Upcoming work

* Wednesday, 2024-01-1, 11:00pm: [Mini-Project 1](../mps/mp01) due.
    * [Submit on Gradescope](https://www.gradescope.com/courses/690100/assignments/4014689/)
* Thursday, 2024-02-01, 11pm: Read things in preparation for the sixth day of 
  class and report on those things
    * [Computation via expressions](../readings/computation-via-expressions)
    * [More on mental models](../readings/mental-models)
    * Do the [Reading Response](https://www.gradescope.com/courses/690100/assignments/4007931/submissions)
* Friday, 2024-02-02, 8:30am: Submit today's lab writeup.
    * [Submit on Gradescope](...)

Notes on Monday's lab
---------------------

### Stopping with five minutes to go.

In general, I'll tell you to stop when there are five minutes left.

* Different people will have accomplished different amounts.
* I strongly encourage you to try to finish the lab on your own. At
  least one student from last semester said I should force you to
  finish the lab on your own. (We'll revisit why I don't.)
* It's okay if you don't pass all the tests. However, it's nice to
  have an idea why you haven't passed the test.
* You will generally get an "S" (1.0 or .9999) if you submit something.

### The joy of ctrl-up-arrow (or Esc-P)

There is a command history.

### Ways to define `snowperson` and `snowperson-revisited`

```
(define snowperson
  (lambda (size)
    (above (outlined-circle (* 2/5 size) "black" 1)
           (outlined-circle (* 3/5 size) "black" 1)
           (outlined-circle (* 5/5 size) "black" 1))))

(define snowperson-revisited
  (lambda (height)
    (above (outlined-circle (* 2/5 1/2 height) "black" 1)
           (outlined-circle (* 3/5 1/2 height) "black" 1)
           (outlined-circle (* 5/5 1/2 height) "black" 1))))
```

vs.

```
(define snowperson-revisited
  (lambda (height)
    (snowperson (* 1/2 height))))
```

vs.

```
(define snowball
  (lambda (diameter)
    (outlined-circle diameter "black" 1)))

(define snowperson
  (lambda (size)
    (above (snowball (* 2/5 size))
           (snowball (* 3/5 size))
           (snowball (* 5/5 size)))))
```

Questions
---------

Lab
---
