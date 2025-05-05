---
title: "EBoard 38: Sorting (Section 1)"
number: 38
section: eboards
held: 2025-05-05
link: false
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

* Happy Penultinmate Week! (At least for students.)
* Congratulations to our baseballers who made it to the playoffs!
  (Also tennisers, trackers and fielders, ping-pongers, and others I've missed.)
* Please plan to attend class Wednesday for project presentations.
* Please plan to attend class Friday for wrapup activities.
    * If you are unable to make it to class on Friday (e.g., because your
      team is traveling), please plan to come early on Wednesday (Section 1)
      or stay late on Wednesday (Sections 2 and 3).
* This is my last week of bookable office hours. I'll be available
  by appointment during finals week.
* If you took the most recent diagramming structures quiz, you should have
  received an email message from Gradescope at about 9pm on May 1 entitled 
  _[CSC-151] The "last" diagraming structures quiz_. You should read
  that email message.

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
    * [SoLA 4](../la) released at 4p!
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

I've missed way too many reading responses, labs, and/or metacognitive
reflections.  Can you just waive the penalty for missing those
things?

> Each of these is important to your learning in its own way.

> Reading responses ensure that you're ready for the lab. At least they
  are supposed to.

> Metacognitive reflections help you develop as a learner.

> Labs help you learn the material. They may even be the primary way
  in which you learn the material.

Background: What is computer science?
-------------------------------------

_TPS_

Typical running times
---------------------

* **Constant time**: Independent of the size of the input
* **Logarithmic**: Goes up by a constant amount each time you double
  the size of the input.
* **Linear**: Doubles each time you double the size of the input.
* **Quadratic**: Quadruples every time you double the size of the input.
* **Exponential**: Approximately doubles every time you add another element.

The problem of sorting
----------------------

Designing sorting algorithms
----------------------------

_TPS: Design a sorting algorithm that we will enact._

Inputs: A list or vector of values + a way to compare any two values

Output: The same group of values, now in order. (for lists, we'll output
a new list; for vectors, we'll change them in place)

Implementing sorting algorithms
-------------------------------

_TPS: Document_

```
;;; (sort ???) -> ???
```
