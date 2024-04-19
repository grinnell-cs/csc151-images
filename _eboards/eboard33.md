---
title: "EBoard 33: Tail recursion"
number: 33
section: eboards
held: 2024-04-19
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [5--10 min]
* Questions [5--10 min]
* Lab [40--45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Welcome to any prospective students attending today!

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-23, noon, some PDR.
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-23, 7pm, Science 3819.
  _Mentor Session_.
* Tuesday, 2024-04-25, 7pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-04-19, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_. (Perhaps Ghana)
* Saturday, 2024-04-20, 2:00--5:00pm, Quad Dining Room.
  _Japanese Spring Festival_.

Peer

* Saturday, 2024-04-20, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit._
* Saturday, 2024-04-20, 1:00--4:00pm, Park Street to the Bear.
  _Carnivale_ (or _Carnival_)
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

* Saturday, 2024-04-20, 1:00--3:00pm, .
  _Softball vs. Ripon._
* Saturday, 2024-04-20, 3:00--5:00pm, .
  _Softball vs. Ripon, revisited._

### Upcoming work

* Friday, 2024-04-19, 11:00pm, Post-reflection on [MP7](../mps/mp07)
    * [_Submit MP7 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330330)
* Friday, 2024-04-19, 11:00pm, Pre-reflection for [MP8](../mps/mp08)
    * [_Submit MP8 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371687)
    * Note: One additional question this time.
* Sunday, 2024-04-21, 11:00pm, Redo for [MP6](../mps/mp06)
    * [_Submit MP6 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4348422)
* Sunday, 2024-04-21, 11:00pm, Readings on [complexity analysis](../readings/complexity-analysis) and [binary search](../readings/searching)
    * [_Submit readings on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4382543)
* Monday, 2024-04-22, 8:30am, [Lab on tail recursion](../labs/tail-recursion)
    * [_Submit lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4382544)
    * Please try to submit by the end of class.
* Wednesday, 2024-04-24, 11:00pm, [MP8](../mps/mp08)
    * [_Submit MP8 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371686)
    * Autograder not yet completely functional.
* Sunday, 2024-04-28, 11:00pm, Second Redo for [MP4](../mps/mp04)
    * [_Submit MP4 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4367977)
* Sunday, 2024-05-05, 11:00pm, Nth Redo for a few things
* Sunday, 2024-05-12, 11:00pm, Nth Redo for a few things
* Friday, 2024-05-17, 5:00pm, Ultimate Redo for everything

### Friday PSA

* It's Friday.
* There are many great things to do this weekend!
* Most can easily be enjoyed without altering yourself.
* Be good about Alice.
* Please take care of yourselves.
* Please take care of others.
* Consent is essential.

Questions
---------

### Administrative

Do we have to be in a group for Project 9?

> No. The amount of work expected on the final project is proportional (more
  or less) to the number of people in the group.

> We'll talk more about that on Wednesda.

### MP 8

### SoLA 4

### Tail recursion

Where does the term "kernel" come from? 

> My colleague, John Stone, seems to have coined it as part of a broader
  Iowan "husk and kernel" programming strategy. The husk protects the
  kernel. The kernel is where the real value happens.

Is there a situation where you could have multiple accumulator variables?

> Certainly. The split procedure that you worked on in the last lab
  is one such example.

What is `letrec`?

> `letrec` is just like `let`, but is necessary when you define
  recursive procedures.

> As you may recall, `(let ([name exp]) ...)`, evaluates `exp` and
  then binds it to `name`. For a recursive procedure, `exp` will
  include `name`. But `name` may not be bound yet. `letrec` does
  something a bit more complicated to accommodate this situation.

> Sam's stupid demo.

```
(define fun
  (lambda (x)
    "happy happy joy joy"))

(define hssc
  (lambda (x)
    (let ([fun (lambda (x)
                 (if (zero? x)
                     "done"
                     (string-append "something " (fun (- x 1)))))])
      (fun x))))

(define husk
  (lambda (x)
    (letrec ([fun (lambda (x)
                    (if (zero? x)
                      "done"
                      (string-append "something " (fun (- x 1)))))])
      (fun x))))
```

> [Sam told an amazing shaggy dog story leading up to "unbounded fun.]

When using a tail-recursive kernel with an extra `so-far` parameter,
can you make decisions on how you change `so-far` at each step?

> Certainly. You can do whatever you want within the recursive call
  (as long as you avoid infinite recursion).

### Misc

Lab!
----

### Exercise 3

Which of the following do you prefer (for the original)?

```
(define tally-symbols
  (lambda (lst)
    (if (null? lst)
        0
        (if (symbol? (car lst))
            (+ 1 (tally-symbols (cdr lst)))
            (tally-symbols (cdr lst))))))
```

or

```
(define tally-symbols
  (lambda (lst)
    (cond
      [(null? lst)
       0]
      [(symbol? (car lst))
       (+ 1 (tally-symbols (cdr lst)))]
      [else
       (tally-symbols (cdr lst))])))
```


