---
title: "EBoard 38: Sorting"
number: 38
section: eboards
held: 2024-05-01
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff
* Questions
* Background: What is computer science?
* Background: Algorithmic growth
* The problem of sorting
* Algorithm design time
* Turning design into code (if time)

Administrative stuff
--------------------

### Token opportunities

Academic/Scholarly

* Thursday, 2024-05-02, 11am, JRC 101.
  _PBK Scholars' Convocation: Cathleen Kaveny on "Can We Be Civil? Prophetic Indictment and Call-Out Culture in American Public Life"._
* Thursday, 2024-04-25, 7pm, Science 3819.
  _Mentor Session_. Review for the fourth SoLA.
* Tuesday, 2024-05-07, noon, some PDR.
  _CS Table (topic TBD)_.
* Thursday, 2024-05-09, 7pm, Science 3819.
  _Mentor Session_. Final mentor session! (Or we might have one more
  review session for SoLA 5.)

Cultural

* Most days, 2024-04-xx and 2024-05-xx, 11am-6pm, 
  Grinnell College Museum of Art.
  _BAX 2024_. Shouldn't it be BAE?
* Friday, 2024-05-03, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_.

Peer

* Thursday, 2024-05-02 6:00pm, Probably Roberts (or downtown if no rain).
  _Peter and the Starcatchers_.
* Friday, 2024-05-03 2:00pm, Probably downtown (or in Roberts if rain)
  _Peter and the Starcatchers_.
* Saturday , 2024-05-04 2:00pm, Probably downtown (or Roberts if rain).
  _Peter and the Starwarscatchers_.
* Saturday, 2024-05-04 (aka "Chamber Ensemble Day"), 11am, Sebring Lewis.
  _Chamber Ensemble vs. the music of um._
* Saturday, 2024-05-04 (aka "Star Wars Day"), 10:00am--11:00pm, Central Campus.
  _The Grinnellian._ Your peer sings at 2:45pm.
* Saturday, 2024-05-04 (aka "Star Wars Day"), noon--3:00pm, Pioneer Park.
  _Baseball vs. Illinois_.
* Saturday, 2024-05-04 (aka "Star Wars Day"), 2:30--5:30pm, Pioneer Park.
  _Baseball vs. Illinois_.
* Saturday, 2024-05-05, 11:00am--2:00pm, Pioneer Park.
  _Baseball vs. Illinois_. (It takes a lot of games to play a whole state.)

Wellness

* Sunday, 2024-05-05, 10:00am--6:00pm, Mac Field.
  _Bubble Soccer_. (It takes almost as long as cricket!)
* Friday, 2024-05-10, 5:00pm--??:??pm, Merrill Park West.
  _CS Picnic!_ 

Misc

* Thursday, 2024-05-02, 4:15--5:30pm, Burling 1st.
  _Conversation with Kathryn Mohrman '67._

### Other good things (no tokens)

Note: Softball seems to have moved their games. Or I was very confused
when I put this together. Please check the calendar.

* Saturday, 2024-05-04 (aka "Star Wars Day"), 1:00--3:00pm, Softball Complex.
  _Softball vs. Lawrence_.
* Saturday, 2024-05-04 (aka "Star Wars Day"), 3:00--5:00pm, Softball Complex.
  _Softball vs. Lawrence_.
* Sunday, 2024-05-05, 1:00--3:00pm, Softball Complex.
  _Softball vs. Illinois_. 
  (Because three games against the same team in one weekend is absurd.)

### Other questionable things (no tokens)

* Saturday, 2024-05-04 (aka "Star Wars Day"), noon--5:00pm, Cleveland Beach.
  _Alice in Wonderland_.

### Upcoming work

* Thursday, 2024-05-03, **No reading**
* Friday, 2024-05-03, 8:00am, Quizzes
    * New topic: Tree recursion
    * Old topic: Binary search (most likely tracing)
    * Old topic: Diagramming structures (last chance)
    * **Our last set of quizzes**
* Friday, 2024-05-03, 11:00pm, Pre-reflection for [SoLA 4](../las)
    * [_Submit pre-reflection on gradescope_](https://www.gradescope.com/courses/690100/assignments/4447415)
* Sunday, 2024-05-05, 11:00pm, [MP9](../mps/mp09)
    * [_Submit MP9 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4402651)
* Sunday, 2024-05-05, 11:00pm, Second redo of [MP5](../mps/mp05)
    * [_Submit MP5 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379432)
* Sunday, 2024-05-05, 11:00pm, Second redo of [MP6](../mps/mp06)
    * [_Submit MP6 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379449)
* Sunday, 2024-05-05, 11:00pm, First redo of [MP7](../mps/mp07)
    * [_Submit MP7 first redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379457)
* Sunday, 2024-05-05, 11:00pm, [Reading on Sorting](../readings/sorting)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4436865)
    * **Our final reading response.**
* Monday, 2024-05-06, 4:00pm, [SoLA 4](../las) distributed.
* Tuesday, 2024-05-07, 11:00pm, Post reflection on [MP9](../mps/mp09)
    * [_Submit MP9 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4392331)
* Wednesday, 2024-05-08, 8:00am, [Lab on Sorting](../labs/sorting)
    * _Lab not yet available._
    * Lab should be finished in class.
    * **Our final lab.**
* Wednesday, 2024-05-08, 8:30am, Presentations from [MP9](../mps/mp09)
    * _Nothing to submit._
    * Sam wll bring fresh fruit.
* Wednesday, 2024-05-8, 11:00pm, [SoLA 4](../las) due.
    * _Submit individual LAs on Gradescope_.
* Sunday, 2024-05-12, 11:00pm, Redo for [MP8](../mps/mp08)
    * [_Submit MP8 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379461)
* Monday, 2024-05-13, 4:00pmish, [SoLA 5](../las) released.
* Friday, 2024-05-17, 5:00pm, Ultimate Redo for everything
    * [MPs 1--8](../mps)
    * [SoLA 5](../las)

Questions
---------

### Administrative

Will you ever tell us our tokens?

> Probably not. You can assume you have enough.

Can I bring a sheet of hand-written notes for each quiz?

> Yes. But you can only refer to one set of notes for each quiz.

Can I type my quiz notes on the computer?

> No.

Can I photocopy a page of the magic notebook?

> No. That destroys the magic.

### Redos

If I have a really small thing that will get me from M to E, can I talk
about it with Sam rather than submitting a redo?

> Sure. Set up an appointment.

Is the MP8 redo autograder broken?

> I don't know. Teams message me and I'll check. If I don't respond
  within twelve hours, feel free to teams message me again.

### MP9

### Misc

A reminder: Computer science
----------------------------

Computer science is having the computer do things. [No]

Computer science is kind of like writing directions. The PB&J was
an example.

Computer science is the study of algorithms (directions) and data
structures (ways to organize information).

Computer scientists often start with specific problems and then generalize
(or look for classes of problems to solve).

Today's class of problem: Sorting. Given a collection of comparable elements,
put them in order (from smallest to largest or from largest to smallest).

E.g., 

* Put all the books in a library in order by first author name.
* Put all the teams in a league in order by their records.

Computer scientists don't just study algorithms, they also analyze them:

* Correctness (does it terminate, can we ensure that it always gives
  the right answer)
* Efficiency (how fast will it be on different sizes/types of inputs;
  how much "memory" or other computer resources will it use)
* Social impact.

Algorithmic growth
------------------

Useful to think about what happens when you double the size of the
input.

* Constant time: It stays the same when you double the input.
* Logarithmic: It goes up by one (or some constant) when you double the
  input.
* Linear: Doubles when you double the input.
* Quadratic: Quadruples when you double the input. 1 -> 4 -> 16 -> 256 -> 65K or so.

The problem of sorting
----------------------

Today's class of problem: Sorting. Given a collection of comparable elements,
put them in order (from smallest to largest or from largest to smallest).

* We can sort elements in a list or vector.

Algorithm design time
---------------------

_TPS: Design a sorting algorithm that we will enact._

Inputs: A list or vector of values + a way to compare any two values

Output: The same group of values, now in order. (for lists, we'll output
a new list; for vectors, we'll change them in place)

### Designs

* Lists (make a new list) or arrays (sort in place) or either
* Divide in half or something else

### Algorithm zero:

* Shuffle the elements
* Check if they are sorted
* If so, stop
* If not, try again

### Algorithm one: Insertion sort

* Compare the first two elements. 
   * If they are in the right order, put them in a new list as is.
   * If not, create a new list, flipping the two elements
* Compare the third element to the largest. Either put at the end
  or find the right place in the list and put it there.
* Similar for the next one.

Key idea: Repeatedly insert elements into "the right place" in a new list.

### Algorithm two: Bubble sort

Sorting in vectors.

* Swap neighboring elements if they are out of order.
* Determine if they are in order.
* If not, go back and try again.

Analysis of termination and correctness: In each round, things get closer 
to where they belong. Eventually they have to end up where they belong.

* President Obama: "I think the bubble sort would be the wrong way to go."
* Class Mentor: Bubble is canonically slow.

### Algorithm three: Quicksort

A recursive list sorting algorithm.  Requires finding average of the
elements. 

* Find the average. (median would be better)
* Split the list into halves based on the average.
* Sort each list

A variant was designed by C.A.R. "Tony" Hoare who clearly liked marketing,
because he called it Quicksort. It appears that picking a random element
is almost as good as using the median.

### Algorithm four: Merge sort

* If there is only one element, it's sorted.
* If there are two elements, sort the obvious way
* Otherwise
   * Split in half. 
   * Sort each half. 
   * Put them back together.

Turning algorithms into code
----------------------------

_TPS: Document_

```
;;; (sort lst less-than?) -> list?
;;;   lst : list? (homogeneous)
;;;   less-than? : binary predicate?
;;; Sort the elements in `lst` to create a new list in which
;;; each element is `less-than?` the next element.
;;;
;;; Note: `less-than?` must be applicable to any two elements in the list.
;;;
;;; Note: `less-than?` must be transitive. If `(less-than? a b)` and
;;; `(less-than? b c)`, we can conclude that `(less-than? a c)`.
;;;
;;; Note: If `less-than` is strict (no equality), the list should
;;; not have duplicate elements.
```

```
;;; (sort! vec less-than?) -> void?
;;;   vec : vector? 
;;;   less-than? : binary predicate?
;;; Rearrange the elements in `vec` so that each element is
;;; `less-than?` the next element.
;;;
;;; Note: `less-than?` must be applicable to any two elements in the list.
;;;
;;; Note: `less-than?` must be transitive. If `(less-than? a b)` and
;;; `(less-than? b c)`, we can conclude that `(less-than? a c)`.
```

_TPS: Implement_

```
(define sort 
  (lambda (___ ___)
    ___))
```
