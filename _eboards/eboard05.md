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

* My goal is always to do these in fifteen minutes or less. 
  I rarely succeed.

### Attendance

_Yes, we'll do that once in a while._

### Upcoming activities

Scholarly

* Thursday, 2024-02-01, 11am, HSSC 2231 (Auditorium), 
  _Scholars' Convocation, Being a Pandemic Citizen._
* Thursday, 2024-02-01, 4:00pm, Science 3821:
  _CS Extras: Summer research_.

Cultural

Peer

Wellness

Misc

* Friday, 2024-02-02, 8pm, Harris Concert Hall:
  _Weekend Murder Mystery_.

### Other good things

### Upcoming work

* Wednesday, 2024-01-1, 11:00pm: [Mini-Project 1](../mps/mp01) due.
    * [Submit on Gradescope](https://www.gradescope.com/courses/690100/assignments/4014689/)
* Thursday, 2024-02-01, 11pm: Read things in preparation for the sixth day of 
  class and report on those things
    * [_Submit the _reading response on Gradescope_](...)
* Friday, 2024-02-02, Class time: Quiz
    * New quiz: Tracing
    * Quiz redo: Decomposition
    * You can arrive as early as 7:45 a.m. if you'd like to take both quizzes.
* Friday, 2024-02-02, 8:30am: Submit today's lab writeup.
    * [Submit on Gradescope](...)
    * Preferred: Submit before the end of class today.

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

* There is a command history.
* You can get to prior commands Ctrl-UpArrow 
    * That doesn't work on the Mac, because Ctrl-UpArrow already has
      a meaning.
* You can also get prior commands with Esc-P.

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

vs.

```
???
```

Questions
---------

### Administrative

Do you mind if we point out the plethora of mistakes on your Web pages?
I've found typos, broken links, bad HTML and more.

> Let me know. I would prefer to correct them. Perhaps you'll even
  earn a token.

### Reading

Lab
---
