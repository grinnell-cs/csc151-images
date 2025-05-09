---
title: "EBoard 38: Sorting (Section 3)"
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
* Please plan to attend class Wednesday for project presentations.
    * There will be fruit.
    * Five tokens charged if you miss class without a good excuse.
* Please plan to attend class Friday for wrapup activities.
    * If you are unable to make it to class on Friday (e.g., because your
      team is traveling), please plan to come early on Wednesday (Section 1)
      or stay late on Wednesday (Sections 2 and 3).
    * Five tokens charged if you miss class without a good excuse.
* This is my last week of bookable office hours. I'll be available
  by appointment during finals week.
* If you took the most recent diagramming structures quiz, you should have
  received an email message from Gradescope at about 9pm on May 1 entitled 
  _[CSC-151] The "last" diagraming structures quiz_. You should read
  that email message. Let me know if you didn't receive it.

### Upcoming activities

Scholarly

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
* Thursday, 8 May 2025, 7:30 p.m., Roberts.
  _Gamelan Pawisik_ (tickets Wednesday and Thursday 12-5; also at door)

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
    * _Other topics from Phase Four (**2**): Running time, Searching
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

> If you are unable to make it to class on Friday (e.g., because your
  team is traveling), please plan to come early on Wednesday (Section 1)
  or stay late on Wednesday (Sections 2 and 3).

Does only one team member submit the MP9?

> Yes, only one member should submit MP9.

Are there benefits for having earned extra tokens?

> If your grade is between two grades, I'll probably choose the higher.

Will you have the token charges soon?

> Yes.

Background: What is computer science?
-------------------------------------

_TPS_

The study of algorithms and implementation of procedures; also data
structures.

Algorithms: Sets of instructions to accomplish tasks.

Data structures: Ways to structure (organize) data. Trees. Vectors.
Lists. Strings (organize characters). Hashes/dictionaries.

In order to write algorithms, we must have problems that need algorithms.
Where do they come from?

People have some kinds of problems that are amenable to solution by algorithms.

Often, we also look for common problems and develop solutions to these common
problems that we expect to see in many instances.

One such problem: Searching. Given a bunch of information, find a
particular entry. Hash tables (magic). `list-ref` and `vector-ref` to
extract data if we know its position.  We can use binary search if we
have an ordered vector of values. We can use linear search.

Binary search is fast, but it requires that we have an ordered vector.

Hence, we have another general algorithm we might to write: Given a
collection (list or vector) of values and a way to compare two values,
put those values in order. (From least to greatest or vice versa.) We
call that "sorting".

Typical running times
---------------------

* **Constant time**: Independent of the size of the input
* **Logarithmic**: Goes up by a constant amount each time you double
  the size of the input. (Binary Search)
* **Linear**: Doubles each time you double the size of the input.
* **Quadratic**: Quadruples every time you double the size of the input.
* **Exponential**: Approximately doubles every time you add another element.

The problem of sorting
----------------------

Designing sorting algorithms
----------------------------

Inputs: A list or vector of values + a way to compare any two values
`(sort lst less-equal?)` or `(sort! vec less-equal?)`.

Output: The same group of values, now in order. (for lists, we'll output
a new list; for vectors, we'll change them in place)

_TPS: Design a sorting algorithm_

* You can express the algorithm in English; Lilli will do her best to
  understand what you mean.

### Algorithm 1: Oskate sort

* Find the smallest value in the list.
* Remove it from the list.
* Move to the front.
* Recurse on the rest.

Running time of this.

* Find the smallest in n: n steps
* Find the smallest in the remaining n-1 elements: n-1
* Find the smallest in the remaining n-2 elements: n-2
* ...
* Find the smallest in the remaining 3 elements: 3
* Find the smallest in the remaining 2 elements: 2
* Find the smallest in the remaining 1 element: 1

Oskate sort on 10 elements: 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 steps.
That equals: 55

Okate sort on 20 elements: 20 + 19 + ... + 3 + 2 + 1: 210 steps

This seems to suggest that O'skate sort is quadratic.

Detour: There is a formula for 1 + 2 + 3 + .... + n.

* Find the smallest value in the list.
* Remove it from the list.
* Move to the front.
* Recurse on the rest.

```
(define smallest
  (lambda (lst less-equal?)
    (reduce (lambda (a b) (if (less-equal? a b) a b))
            lst)))

(define selection-sort
  (lambda (lst less-equal?)
    (if (null? lst)
        null
        (let ([s (smallest lst less-equal?)])
          (cons s
                (selection-sort (remove s lst) less-equal?))))))
```

Implementing sorting algorithms
-------------------------------

_TPS: Document_

```
;;; (sort ???) -> ???
```
