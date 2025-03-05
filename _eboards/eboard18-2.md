---
title: "EBoard 18: Recursion (Section 2)"
number: 18
section: eboards
held: 2025-03-05
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff
* Q&A
* Recursion basics
* Examples!
* Converting to Scheme
* Quiz

Administrative stuff
--------------------

### Introductory notes

* I've now had a conversation with a few people about being more efficient.
  The first step is something like "Ask for help when something
  doesn't work; move on to another problem if help is not immediately
  available."
    * Remember the Zone of Proximal Development
* When you ask me for help, it helps if you send me code (e.g., your whole
  Racket file). It may seem that way sometimes, but I'm not psychic.
* If you are leaving early for Spring Break, please drop me a note. Otherwise,
  I expect you to be in class on Friday.
* There's no lab today. We'll have a combination of lecture and discussion.

### Upcoming activities

Scholarly

* Thursday, 6 March 2025, 11:00 a.m.--Noon, JRC 101.
  _Scholars' Convocation: Lisa Mueller:
   Most Protests Fail. It Doesn’t Have to Be That Way_

Artistic

Multicultural

* Friday, 28 March 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: ???_ 

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 26 March 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 26 March 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Friday, 28 March 2025, 6:00 p.m.--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 28 March 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 29 March 2025, 4:00 p.m.--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)

Misc

* Sunday, 9 March 2025, 7:30--8:30 p.m., Science 3819. 
  **NO Mentor Session**
* Sunday, 23 March 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session (I think)_
* Tuesday, 25 March 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Thursday, 6 March 2025
    * [Mini-Project 5](../mps/mp05) due.
        * [Submit MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5886696)
    * Readings for class 19
        * [Local bindings](../readings/local-bindings)
        * [Submit reading response on Gradescope](https://www.gradescope.com/courses/948769/assignments/5891752)
* Friday, 7 March 2025
    * [Submit post-reflection on MP5](https://www.gradescope.com/courses/948769/assignments/5842795)
* Sunday, 9 March 2025
    * Late submission of MP5.
* Sunday, 23 March 2025
    * [Submit lab writeup from class 19](https://www.gradescope.com/courses/948769/assignments/5891749/)
    * [Submit pre-reflection for SoLA 2]()
* Monday, 24 March 2025
    * [SoLA 2](../las/) released.
* Wednesday, 26 March 2025
    * Quiz: New topic!
    * Makeup quiz: Tracing
    * _Remember that you can bring a sheet of notes for each quiz._
    * _Remember that you can start as early as 8:00 a.m. (section 1) or
      stay until noon (section 2) or 4:30 p.m. (section 3)_

Questions
---------

_We're skipping recursion questions for now._

### Administrative

When can I make up the Documentation LA?

> On SoLA 2. (or SoLA 3, 4, 5)

Suppose I don't do well on the lists LA. When can I make that up?

> On SoLA 2. (or SoLA 3, 4, 5)

### MP5

I'm struggling with how to get part 2 to work. Any hints?

> You'll need to use some of the same ideas as in part 1. In particular,
  you'll find it helpful to write a helper procedure that checks whether
  its parameter is a shape or not and does different things based on
  that test.

Tell me more about the doubly-nested lists.

> The elements of doubly-nested lists are either (a) basic shapes or 
  (b) singly-nested lists of basic shapes.

> The elmeents of singly-nested lists are either (a) basic shapes or 
  (b) lists of basic shapes.

```
(list (solid-square 30 "blue") 
      (list (solid-square 30 "green")) 
      (list (solid-circle 100 "orange") 
            (list solid-square 10 "yellow")))
```

### Scheme

What's the difference between a substring function that takes a inclusive 0-based index as start and an exclusivee 0-based index as end  parameters, and a substring function that takes a inclusive 1-based index for start and an inclusive 1-based index for end parameters?

> In Scheme, we almost always use 0-based indexing. So you shouldn't worry
  about 1-based indesing.

> In Scheme, we almost always use "lower-bound inclusive; upper-bound 
  exclusive".

> `(substring "Hello" 1 3)` -> `"He"`

> Let's talk.

### Other

Recursion basics
----------------

Recursion is a technique for writing algorithms that need to do repeated
work.

One key idea is similar to that of decomposition.

* In decomposition, we break large problems into smaller problems and then
  solve those smaller problems.
* In recursion, we break large INPUTs into smaller inputs and then solve
  the problem with the smaller INPUTs.
    * We use the exact same procedure to solve the problem with the smaller
      input.
    * To write our procedure, we assume we've already written a version of
      our procedure that only works for smaller inputs.
* We also try to identify situations that are so simple that we can solve
  them directly. (We call these base cases.)

Examples!
---------

### Count the cards in a stack

```
if there are no cards in the stack
  return 0
otherwise
  remove a card
  ask your assistant to count the cards in the modified stack
  add 1 to what your assistant says and return that number
```

We've figured out how `length` works!

### Count the number of cards that end with a one

```
if there are no cards in the stacka
  return 0
otherwise
  remove a card
  ask your assistant to count the number of cards that end with a one in the rest
  if your card ends with zero
    return the count from your assistant
  if your card ends with a one
    add one to the count from your assistant
```

We've just implemented `tally`

### Select the cards that end with zero

```
if there are no cards the stack
  return the empty stack
otherwise
  keep one card
  ask your assistant to find the cards that end with zero in the rest
  if your card ends with zero
    add your card to the stack you got from your assistant and pass it on
      to the next person
  otherwise
    return the stack that you got from your assistant
```

We've just implemented `filter`.

Converting to Scheme
--------------------

* Determine if a list is empty
* Add 1 (for length and tally)
* Add an element to a list (for filter)

```
(define my-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (my-length (cdr lst))))))
```

It works! Yay!

What if we forgot the cdr? It runs forever! (Well, until the computer crashes.)

```
;;; (tally-odds ints) -> integer?
;;;   ints : (list-of exact-integer?)
;;; Count the number of odd numbers in the list.
(define tally-odds
  (lambda (lst)
    (if (null? lst)
        0
        (if (odd? (car lst))
            (+ 1 (tally-odds (cdr lst)))
            (tally-odds (cdr lst))))))
```

A slightly better answer


```
;;; (tally-odds ints) -> integer?
;;;   ints : (list-of exact-integer?)
;;; Count the number of odd numbers in the list.
(define tally-odds
  (lambda (lst)
    (cond
      [(null? lst)
       0]
      [(odd? (car lst))
       (+ 1 (tally-odds (cdr lst)))]
      [else
       (tally-odds (cdr lst))])))
```

```
(define select-even
  (lambda (lst)
    (if (null? lst)
        null
        (if (even? (car lst))
            (cons (car lst) 
                  (select-even (cdr lst)))
            (select-even (cdr lst))))))
```
