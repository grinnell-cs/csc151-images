---
title: "EBoard 32: Higher-order procedures"
number: 32
section: eboards
held: 2024-04-17
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [10 min]
* About MP8 [5 min]
* About reading responses [10 min]
* Questions [5 min]
* Lab [45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Happy 2^5 class!
* Passing along a great idea from a student: When taking a SoLA, make
  sure to have DrRacket open with the code related to the topic.
* Make sure to update your `csc151` library for the next mini-project.
* Don't forget tomorrow's Scholars' Convocation!
* Please fill in the mentor/tutor evaluation! (See email.)
* Grade reports coming tonight!
* I think I've caught up on all the Teams questions (except one
  on MP5). Let me know if you have any outstanding.
* Don't forget good start-of-lab habits. (Names, work habits, etc.)

### Token opportunities

Academic/Scholarly

* Wednesday, 2024-04-17, 4:15--5:30pm, Burling 1st.
  _Book Talk by Sharon Quinsaat_.
* **Thursday, 2024-04-18, 11am, JRC 101**.
  **_Ruha Benjamin on "Viral Justice: How We Grow the World We Want"_**
* Thursday, 2024-04-18, 4pm, JRC 2nd Floor Lobby.
  _CS Poster Session, Part 2._
* Thursday, 2024-04-18, 4:15--6:00pm, JRC 101.
  _McKibben Lecture: Athenian Heroes: Re-reading the West Pediment of the Parthenon_.
* Thursday, 2024-04-18, 7pm, Science 3819
  _Mentor Session_.
* Tuesday, 2024-04-23, noon, some PDR.
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-23, 7pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-04-19, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_. (Perhaps Ghana)
* Saturday, 2024-04-20, 2:00--5:00pm, Quad Dining Room.
  _Japanese Spring Festival_.

Peer

* Wednesday, 2024-04-17, 5:00--6:00pm, HSSC A1231 (Kernel).
  _GrinTECH Project Expo_.  
* Saturday, 2024-04-20, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit._
* Saturday, 2024-04-20, 1:00--4:00pm, Park Street to the Bear.
  _Carnivale_. 
* Saturday, 2024-04-20, 2:30--5:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited._
* Saturday, 2024-04-20, 7:00--9:00pm, Herrick.
  _Michael Londra and the Grinnell Symphony Orchestra_.
* Sunday, 2024-04-21, 10:00am--1:00pm, Tennis Courts.
  _Men's Tennis vs. Coe._
* Sunday, 2024-04-21, noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited. The Sequel!_
* Sunday, 2024-04-21, 2:00--4:00pm, Sebring Lewis Hall.
  _Grinnell Singers with a King Singer (Simon Carrington)._

Wellness

Misc

* Saturday, 2024-04-20, 10:00am--1:00pm, Track and Field Complex.
  _Dick Young Classic_.
* Saturday, 2024-04-20, 8:00am--5:00pm, JRC 209.
  _Mental Health First Aid Training_. Let me know how many tokens you
  consider appropriate for a full-day event.
* Saturday, 2024-04-20, 11:00am--6:00pm, Mac Field.
  _DAG Field Day_. Why is DAG all caps? (Duels and Games.)

### Other good things (no tokens)

* Wednesday, 2024-04-17, 3:00--5:00pm, Softball Complex.
  _Softball vs. Knox_.
* Saturday, 2024-04-20, 1:00--3:00pm, .
  _Softball vs. Ripon._
* Saturday, 2024-04-20, 3:00--5:00pm, .
  _Softball vs. Ripon, revisited._

NO! You do not get tokens for Wonderland Harris.

### Upcoming work

* Wednesday, 2024-04-17, 11:00pm, [MP7](../mps/mp07)
    * [_Submit MP7 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4348423)
    * Autograder is ready!
* Thursday, 2024-04-18, 11:00pm, [Reading on tail recursion](../readings/tail-recursion)
    * [_Submit reading on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371691)
* Friday, 2024-04-19, 8:00am, Quizzes
    * Data abstraction (new).
    * Diagramming structures.
    * Tracing.
* Friday, 2024-04-19, 11:00pm, Post-reflection on [MP7](../mps/mp07)
    * [_Submit MP7 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330330)
* Friday, 2024-04-19, 11:00pm, Pre-reflection for [MP8](../mps/mp08)
    * [_Submit MP8 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371687)
* Sunday, 2024-04-21, 11:00pm, Redo for [MP6](../mps/mp06)
    * [_Submit MP6 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4348422)
* Wednesday, 2024-04-24, 11:00pm, [MP8](../mps/mp08)
    * [_Submit MP8 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371686)
    * Autograder not yet completely functional.
* Sunday, 2024-04-28, 11:00pm, Second Redo for [MP4](../mps/mp04)
    * [_Submit MP4 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4367977)

Mini-Project 8: Word clouds 
----------------------------

Your last individual mini-project! (Next up is a multi-week group mini-project.)

Build word clouds.

### Questions

Will using bold or italic or colors or anything other than the default 
font count for anything?

> Nope. But you might want to use it for your own aesthetics.

Reading responses on `filter`
-----------------------------

Most of you got this, or got something close. There are comments on Gradescope.

I will not go over the answer in class. Your first task on the lab is to
go over it with your partner. If you can't figure it out together, check
with Maddy or me.

Some of you seem overly enamored of the `pos` parameter from vectors and 
have forgotten the techniques of list recursion. **Please avoid recursive
procedures that repeatedly use `list-ref`.** It's expensive. (So if you
wrote `filter` using a position, rewrite without it.)

### Why Sam objects (Looking ahead to next week)

Let's consider the list-recursive version first. At each recursive step, 
we throw away one element using `cdr`. So for a list of 20 elements, we've
called `cdr` approximately 20 times. For a list of 40 elements, we've called
`cdr` approximately 40 times.

In contrast, consider the version with `(list-ref lst pos)`, where `pos`
grows from 0 to the index of the last element in the list.

A call to `(list-ref lst n)` requires `n` calls to `cdr`.

```
(define list-ref
  (lambda (lst n)
    (if (zero? n)
        (car lst)
        (list-ref (cdr lst) (- n 1)))))
```

Hence, if our procedure uses `(list-ref lst 0)` then `(list-ref lst
1)`, then `(list-ref lst 2)`, then `(list-ref lst 3)`, ... we'll end
up with 0 + 1 + 2 + 3 + ... + 19 = 190 calls to `cdr` for a list of 20
elements. That's almost ten times as many as in the basic list recursion
version.

What if we have 40 elements? 0 + 1 + 2 + ... + 39 = 780 calls. Almost 20
tiimes as many as the basic version! Ouch!

Note: Unlike `(list-ref lst n)`, which requires that we call `cdr` `n`
times, `(vector-ref vec n)` can find the element in "constant time"
(independent of `n`).

### Questions

Can we just drop an element as we go?

> Yes. But then you don't need the position. You're always looking at
  the first element.

If we have to use `list-ref`, will it be expensive if we call `list-ref`
in every recursive call and don't change the list?

> Yes. Try to avoid using `list-ref` (or `(drop lst pos)`) (or `length`)
  (or anything similar).

How do we avoid `length`?

> To make sure it has exactly one element.

```
(define one-element
  (lambda (lst)
    (and (pair? lst)
         (null? (cdr lst)))))

(define two-elements
  (lambda (lst)
    (and (pair? lst)
         (pair? (cdr lst))
         (null? (cddr lst)))))

(define two-elements
  (lambda (lst)
    (and (pair? lst)
         (one-elment (cdr lst)))))

(define three-elements
  (lambda (lst)
    (and (pair? lst)
         (pair? (cdr lst))
         (pair? (cddr lst))
         (null? (cdddr lst)))))

(define three-elements
  (lambda (lst)
    (and (pair? lst)
         (two-elements (cdr lst)))))

(define four-elements
  (lambda (lst)
    (and (pair? lst)
         (three-elements (cdr lst)))))
```

Questions
---------

### Administrative

Will we get grade reports soon?

> Sam intends to send them to most of you tonight.

Are we permitted to use a page of notes on quizzes?

> Of course.

Can we bring one page of notes for each quiz?

> I suppose so.

Looking ahead to mini-project 9: How will the groups be chosen?

> You'll see next Wednesday. You have agency.

### SoLA 7

Should the neighboring pixels be a vector or a list or ...?

> A list.

### Higher-order programming

### Misc

Lab!
----

### `reduce-right`

Your base case should be the singleton list, in which case you return the
one value in the list.

```
    (reduce-right + '(1 2 3 4 5))
--> (+ 1 (+ 2 (+ 3 (+ 4 5))))
--> (+ 1 (+ 2 (+ 3 9)))
--> (+ 1 (+ 2 12))
--> (+ 1 14)
--> 15

    (reduce-right - '(1 2 3 4 5))
--> (- 1 (- 2 (- 3 (- 4 5))))
--> (- 1 (- 2 (- 3 -1)))
--> (- 1 (- 2 4))
--> (- 1 -2)
--> -3

    (reduce-right / '(1 2 3 4 5 6))
--> (/ 1 (/ 2 (/ 3 (/ 4 (/ 5 6)))))
--> (/ 1 (/ 2 (/ 3 (/ 4 5/6))))
--> (/ 1 (/ 2 (/ 3 24/5)))
--> (/ 1 (/ 2 15/24))
--> (/ 1 (/ 2 5/8))
--> (/ 1 16/5)
--> 5/16
```

### `index-of-matching!`

When you are writing `index-of-matching`, you will almost certainly need a
helper in which you keep track of the position with respect to the original
list.

**However**, you should _not_ use `list-ref`. Rather, `cdr` through the
list as you go. The position represents how many times you've called `cdr`.

