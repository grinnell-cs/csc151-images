---
title: "EBoard 18: Recursion (Section 3)"
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

> On SoLA 2. (Or SoLAs 3, 4, 5)

Suppose I don't do well on the lists LA. When can I make that up?

> On SoLA 2. (Or SoLAs 3, 4, 5)

### MP5

I'm struggling with how to get part 2 to work. Any hints?

> You'll need to use some of the same ideas as in part 1. In particular,
  you'll find it helpful to write a helper procedure that checks whether
  its parameter is a shape or not and does different things based on
  that test.

### Scheme

### Other

Recursion basics
----------------

Recursion bears some similarity to decomposition.

* Decomposition: Take a bigger problem and break it up into smaller problems.
* Recursion: Take a big INPUT and make it smaller.
    * We assume that we've already solved the problem, but only for smaller
      input.
    * We write a solution that uses THE SAME PROCEDURE WE'RE ALREADY WRITING
      as a helper.
    * A magic recursion fairy makes the code work.
* We also identify a situation in which we can answer the problem directly
  (and then do so). We call this "the base case".

Examples!
---------

### To count the number of cards in a stack of cards

```
if the stack is empty
  return 0
otherwise
  remove one card
  ask your assistant to count the remaining cards
  add 1
```

This is the algorithm behind `length`.

### To count how many cards are odd

```
if the stack is empty
  return 0
otherwise
  remove one card
  ask your assistant to count the number of odd remaining cards
  if the card is odd
    add 1 to the number your assistant returned
  otherwise
    return the number your assistant returned
```

This is the algorithm behind: `tally`

### To get the cards that are odd

```
if the stack is empty
  return an empty stack
otherwise
  remove one card
  ask you assistant to grab the odd cards in the remaining stack
  if your card is odd
    add your card to the stack of odd cards you received and pass the
      updated stack along
  otherwise
    pass the odd cards along, skipping the even card.
```

This is the algorithm behind: `filter`

Converting to Scheme
--------------------

* How do I check if a list is empty?
* How do I add one to a number?
* How do I add an element to a list?
* How do I remove an element from a list?
* How do I check if the first element of a list is odd?

```
(define my-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (my-length (cdr lst))))))
```

Yay! We wrote it correctly on the first try.

```
(define count-odd
  (lambda (lst)
    (if (null? lst)
        0
        (if (odd? (car lst))
            (+ 1 (count-odd (cdr lst)))
            (+ 0 (count-odd (cdr lst)))))))
```

Yay! We wrote it correctly on the first try.

Except ... it can be improved.

```
(define count-odd
  (lambda (lst)
    (if (null? lst)
        0
        (if (odd? (car lst))
            (+ 1 (count-odd (cdr lst)))
            (count-odd (cdr lst))))))
```

Or ...

```
(define count-odd
  (lambda (lst)
    (cond
      [(null? lst)
        0]
      [(odd? (car lst))
       (+ 1 (count-odd (cdr lst)))]
      [else
       (count-odd (cdr lst))])))
```

```
(define select-odd
  (lambda (lst)
    (cond
      [(null? lst)
       null]
      [(odd? (car lst))
       (cons (car lst) (select-odd (cdr lst)))]
      [else 
       (select-odd (cdr lst))])))
```

With a fix to the base case (which needs to be the empty list rather than 0), 
we got this right, too.
