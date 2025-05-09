---
title: "EBoard 38: Sorting (Section 2)"
number: 38
section: eboards
held: 2025-05-05
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrivia
* Questions and answers
* Background: What is computer science?
* The problem of sorting
* Designing sorting algorithms
* Turning design into code (if time)

Administrative stuff
--------------------

### Introductory notes

* As you can tell, today is a talk day, not a lab day.
* Happy _Cinco de Mayo_!
* Happy Penultimate Week! (At least for students.)
* Congratulations to our baseballers who made it to the playoffs!
  (Also tennisers, trackers and fielders, ping-pongers, and others I've missed.)
* Please plan to attend class Wednesday for project presentations.
    * There will be fruit.
    * Five token charge to miss class without reasonable excuse.
* Please plan to attend class Friday for wrapup activities.
    * If you are unable to make it to class on Friday (e.g., because your
      team is traveling), please plan to come early on Wednesday (Section 1)
      or stay late on Wednesday (Sections 2 and 3).
    * Five token charge to miss class without reasonable excuse.
* This is my last week of bookable office hours. I'll be available
  by appointment during finals week.
* If you took the most recent diagramming structures quiz, you should have
  received an email message from Gradescope at about 9pm on May 1 entitled 
  _[CSC-151] The "last" diagraming structures quiz_. You should read
  that email message. Let me know if you didn't receive it.

### Upcoming activities

Scholarly

* Monday, 5 May 2025, noon. HSSC S1235.
  _Jean Salac: Emergent Gateways and Gaps in Responsible Computing Education_
* Tuesday, 6 May 2025, noon--1:00 p.m., White PDR (JRC 224C).
  _CS Table: Supply Chain Attacks_
     * Alex Birsan. Dependency Confusion: How I Hacked Into Apple, Microsoft and Dozens of Other Companies. Feb 9, 2021. <https://medium.com/@alex.birsan/dependency-confusion-4a5d60fec610>
     * Wikipedia. Supply Chain Attack. <https://en.wikipedia.org/wiki/Supply_chain_attack>
     * Dan Goodin. AI-generated code could be a disaster for the software supply chain. Here’s why. Apr 29, 2025. ArsTechnica. <https://arstechnica.com/security/2025/04/ai-generated-code-could-be-a-disaster-for-the-software-supply-chain-heres-why/>
* Thursday, 8 May 2025, 7:00--8:30 p.m., HSSC S3325.
  _Humanities Speaker: Dr. Dan Wildcat_

Artistic

* Any day it's open. GCMoA.
  _BAX_
* Thursday, 8 May 2025, 7:30--10:00 p.m., Sebring-Lewis.
  _Symphonic Band Concert_

Multicultural

* Monday, 5 May 2025, 4pm, Global Living Room.
  _Japanese Student Association Matcha Latte Event!_

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Read articles by your fellow CSC-151 students and comment on them online.
  _This is the last week of any S&B articles!_

Wellness

* When and where they usually occur.
  _Badminton Club_, _Brazilian Jiu-Jitsu, _HIIT Training_,
  _Nerf at Noyce_, _Yoga_.
* Thursday, 8 May 2025. 4:30--6:30 p.m., Off Campus.
  _Forest Bathing._
    * Sign ups are required.
* Tuesday, 13 May 2025, 5:00--6:00 p.m., HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 13 May 2025, 7:15--8:15 p.m., HSSC Atrium.
  _Therapy Dogs_.

Misc

* Wednesday, 7 May 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education and Grinnell College face."
    * Also online.
    * Surviving the summer.
* Sunday, 11 May 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session: SoLA 5_

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Monday, 5 May 2025
    * MP9 due tonight. Please do only one submission per group.
    * [SoLA 4](../la) released at 4pm!
    * _Topics from Phase One_ (**4**): Collaboration, Decomposition, 
      Lambda-free anonymous procedures (aka cut and compose), Primitive types
    * _Topics from Phase Two_ (**6**): Conditionals, Documentation, Ethical
      Considerations, Lists (and "the big three"), Program style, Testing
    * _Topics from Phase Three_ (**5**): List recursion, Local bindings,
      Numeric recursion, Vectors, Randomness
    * _Topics from Phase Four w/prior quizzes_ (**3**): Data abstraction,
      Dictionaries, Higher-order programming
    * _Topics from Phase Four already covered_ (**1**): Tree recursion
    * _Topics from Phase Four to be covered today_ (**2**): Running time,
      Searching
* Wednesday, 7 May 2025
    * Project presentations.
* Friday, 9 May 2025
    * End-of-course evaluations in class.
    * [Submit post-reflection for MP9 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6127774)
    * [Submit post-reflection for SoLA 4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6169339)
* Monday, 12 May 2025 (4pm)
    * SoLA 5 released
* Friday, 16 May 2025 (5pm)
    * [Submit final redo for MP1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6045577)
    * [Submit final redo for MP2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6045578)
    * [Submit final redo for MP3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6045579)
    * [Submit final redo for MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6189869)
    * [Submit final redo for MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6189870)
    * [Submit final redo for MP6 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6189871)
    * [Submit final redo for MP7 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6189872)
    * Submit SoLA 5 on Gradescope

Questions
---------

### Administrative

When will the MP redos be graded?

> Most are graded, but we're waiting on one grader.

> MP7 should be graded by Wednesday night.

I've missed way too many reading responses, labs, and/or metacognitive
reflections. Can you just waive the penalty for missing those things?

> Each of these is important to your learning in its own way.

> Reading responses ensure that you're ready for the lab. At least they
  are supposed to.

> Metacognitive reflections help you develop as a learner.

> Labs help you learn the material. They may even be the primary way
  in which you learn the material.

> I will, however, cap the grade decrease at one letter grade provided
  (a) you turn in the post-reflection for MP9, (b) you turn in the
  post-reflection for SoLA 4, (c) set up an appointment with academic
  advising to discuss strategies for getting regular work done on time,
  and (d) send me a message describing one or two strategies you've
  decided upon.

> Also: I will not be charging tokens for late reading responses, lab
  writeups, or metacognitive reflections.

I won't be in class on Friday. What should I do?

> If you may be unable to make it to class on Friday (e.g., because your
  team is traveling), please plan to come early on Wednesday (Section 1)
  or stay late on Wednesday (Sections 2 and 3).

Does only one team member submit the MP9?

> Yes, only one member should submit MP9.

Background: What is computer science?
-------------------------------------

_TPS_

The study of algorithms and (using math) (computers) data structures

Algorithms are: Instructions for processing data in order to generate
a result. (Sets of instructions for solving problems.)

Data structures: A way to organize information. Maybe images. 
Dictionaries/hashes let us organize information by keys. Trees
let us organize hierarchical information. BSTs organize information
for searching. Lists and vectors are two of the central mechanisms
for organizing info.

What problems do computer scientists solve? It depends. Many occur as
part of "everyday work".

We also look for generalizable/generalized problems.

Searching! (BSTs and binary search both provide fastish searching.)

To do binary search, you need the data organized in a particular way.
You need them in order from smallest to largest.

We use the term "sort" to mean "put in order from smallest to largest
or from largest to smallest".

Detour: Typical running times
---------------------

* **Constant time**: Independent of the size of the input. If you double
  the size of the input, you don't change the running time.
* **Logarithmic**: Goes up by a constant amount each time you double
  the size of the input. (e.g., binary search)
* **Linear**: Doubles each time you double the size of the input.
* **Quadratic**: Quadruples every time you double the size of the input.
* **Exponential**: Approximately doubles every time you add another element.

The problem of sorting
----------------------

Designing sorting algorithms
----------------------------

_TPS: Design a sorting algorithm_

Inputs: A list or vector of values + a way to compare any two values

Output: The same group of values, now in order. (for lists, we'll output
a new list; for vectors, we'll change them in place)

Describe how to sort a list or vector. (In English; assume good will on
the part of the enactor.)

`(my-sort lst less-equal?)` or `(my-sort! vec less-equal?)`.

### Algorithm 1: Bubble Sort

* Look at each pair of elements. If they are out of order, swap them.
  Do that through the entire list.
* If you didn't swap anything, you're done.
* Otherwise, go back and do it all again.

_TPS: What's the running time? Is it constant? Linear? Quadratic?
(Assume the worst case.)_

* It's not constant.
* Each "pass" requires looking at n elements.
* We may do n passes through the list.
* So we'll spend `n*n` (also known as n-squared) time doing this.

### Algorithm 2: Insertion sort

* Grab the first item. It's sorted.
* Grab the next item. Put it in the appropriate place in the sorted list.
* Grab the next item. Put it in the appropriate place in the sorted list.
* ...

_TPS: Write this in Scheme_

```
(define insertion-sort
  (lambda (lst less-equal?)
    (insertion-sort/helper lst null less-equal?)))

(define insertion-sort/helper
  (lambda (remaining so-far less-equal?)
     (if (null? remaining)
         so-far
         (insertion-sort/helper (cdr remaining)
                                (insert (car remaining) so-far less-equal?)
                                less-equal?))))

;;; (insert val lst less-equal?) -> list?
;;;   val : any?
;;;   lst : list? (sorted?)
;;;   less-equal? : binary predicate (applicable to val and elements of lst)
;;; Put val at the appropriate place in lst.
(define insert
  (lambda (val lst less-equal?)
    (cond
      [(null? lst)
       (list val)]
      [(less-equal? val (car lst))
       (cons val lst)]
      [else
       (cons (car lst)
             (insert val (cdr lst) less-equal?))])))
```

Or

```
(define insert
  (lambda (val lst less-equal?)
    (if (or (null? lst)
            (less-equal? val (car lst)))
        (cons val lst)
        (cons (car lst)
              (insert val (cdr lst) less-equal?)))))
```

First we insert one value into an empty list, then one value into a list
of one element, then one value into a list of two elements, ...

To sort ten elements, that's about 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
total steps. 55.

To sort twenty elements, that's 1 + 2 + 3 ... + 20, which is 210. We've
doubled the number of elements, and almost quadrupled the number of steps.

The magic formula for 1 + 2 + 3 + ... + `n`. $$n*(n+1)/2$$

Implementing sorting algorithms
-------------------------------

_TPS: Document_

```
;;; (sort ???) -> ???
```
