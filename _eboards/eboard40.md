---
title: "EBoard 40: Sorting out sorting"
number: 40
section: eboards
held: 2024-05-06
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff
* Questions
* Lab

Administrative stuff
--------------------

* Please make sure to show up to class on Wednesday. Don't abandon your
  partners!
* I will be leaving class at 9:30am this morning. Maddy is in charge.
* I am probably holding office hours from home tomorrow.
* Plan about five minutes for your talk and about five minutes for questions.
    * I expect you to ask good questions. Be prepared.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-05-07, noon, some PDR.
  _CS Table: CS humor_
* Thursday, 2024-05-09, 7pm, Science 3819.
  _Mentor Session_. Final mentor session! (Or we might have one more
  review session for SoLA 5.)

Cultural

* Most days, 2024-04-xx and 2024-05-xx, 11am-6pm, 
  Grinnell College Museum of Art.
  _BAX 2024_. Shouldn't it be BAE?
* Friday, 2024-05-10, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_. 

Peer

* Tuesday, 2024-05-07, Percussion Ensemble
* Wednesday, 2024-05-08, Harp Recital

Wellness

* Friday, 2024-05-10, 5:00pm--??:??pm, Merrill Park West.
  _CS Picnic!_ 

Misc

* Tuesday, 2024-05-07, 7:00--8:30pm, HSSC S1325.
  _Tommy Hexter '21 Town Hall_.

### Other good things (no tokens)

### Other questionable things (no tokens)

### Upcoming work

* Monday, 2024-05-06, 4:00pm, [SoLA 4](../las) distributed.
* Tuesday, 2024-05-07, 11:00pm, Post reflection on [MP9](../mps/mp09)
    * [_Submit MP9 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4392331)
* Wednesday, 2024-05-08, 8:00am, [Lab on Sorting](../labs/sorting)
    * [Stay tuned]
    * Lab should be finished in class.
    * **Our final lab.**
* Wednesday, 2024-05-08, 8:30am, Presentations from [MP9](../mps/mp09)
    * _Nothing new to submit._
    * Sam will bring fresh fruit.
* Wednesday, 2024-05-08, 11:00pm, [SoLA 4](../las) due.
    * _Submit individual LAs on Gradescope_.
* Friday, 2024-05-10, 11:00pm, Post-reflection for [SoLA 4](../las) due.
    * [_Submit post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4447419)
* Sunday, 2024-05-12, 11:00pm, Redo for [MP8](../mps/mp08)
    * [_Submit MP8 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4379461)
* Monday, 2024-05-13, 4:00pmish, [SoLA 5](../las) released.
* Friday, 2024-05-17, 5:00pm, Ultimate Redo for everything
    * [MPs 1--8](../mps)
    * [SoLA 5](../las)

Questions
---------

### Administrative

What happens on Friday?

> * PSA
> * We review the semester and what we've learned.
> * I ask you some questions.
> * You fill out end-of-course evaluations.
> * We have some final post EOCE conversations.

Will we fail if we don't show up on Friday?

> Possibly. Some of you have required sporting events. The rest of you ...
  I'd suggest attending, just to be sure.

### Redos

Can I have an extra few days on the MP7 redo?

> Yes, individually. But then it may not be graded in time for you to
  try again.

Will we get graded mini-projects back during finals week?

> I certainly hope so. I expect that I'll be grading nonstop during
  finals week.

### MP9

In what order are we doing presentations?

> 1. Team Lemonade

> 2. ARTT

> 3. Bella and the Bulldogs (or Bulla and the Belldogs)

> 4. SCY

> 5. Weekend Warriors

> 6. Group 3

### Misc

Lab
---

### Exercise 2

Another way to look at insertion sort (without the tail-recursive helper).

```
(define integer-insertion-sort
  (lambda (lst)
    (if (null? lst)
        null
        (insert-integer (integer-insertion-sort (cdr lst))
                        (car lst)))))
```

### Exercise 4

```
(define insertion-sort-experiment
  (lambda (ints)
    (counter-reset-all! COUNT)
    (let ([result (insertion-sort-integers ints)]) ; CHANGED
      (display-counter COUNT)
      result)))
```
