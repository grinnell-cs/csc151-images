---
title: "EBoard 32: Higher-order programming"
number: 32
section: eboards
held: 2023-11-13
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Notes from MP6 post-assessments
* Questions
* Lab 

Administrivia
-------------

* Warning!  Friday the 13th falls on a Monday this month.
* I've made a few changes to MP7
    * Color/typeface changes are no longer required for an E.
    * Instead, you are required to be case-independent for an E.
    * There's a long Q&A section that we'll go over when we hit Q&A.
    * There are a few more notes about things that may help.
* I am disappointed that seven of you did not do the pre-assesssment
  for MP7.  The pre-assessments are intended to help you.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-14, Noon, Day PDR: _CS Table: Cell Phone Addiction_.
* Tuesday, 2023-11-14, 7pm, ???: _Mentor session_.
* Wednesday, 2023-11-15, 4pm, HSSC Kernel: _Madison Van Oort ’08 speaks
  Frictions in the Future of Work_.
* Thursday, 2023-11-16, 11-noon, JRC 101: _Convocation: Richard Robinson
  on Nanoparticles 101._
* Thursday, 2023-11-16, 4:15pm, HSSC Kernel:  _CS Poster Session_.

Cultural

Peer

* Wednesday, 2023-11-15, 7-9pm, Darby: _Women's Basketball vs. Central_.
* Friday, 2023-11-17, 7-9pm, Darby: _Women's Basketball vs. Coe._
* Saturday, 2023-11-18, 1pm, Osgood: _Swimming vs Augustana._
* Sunday, 2023-11-19, 2pm, Darby: _Women's Basketball vs Waldorf._

Wellness

* We need more wellness activities!

Misc

* Monday, 2023-11-13, 4-5:30pm, HSSC N1112: _Politics of AI Info Session_.

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Monday: Late MP6 post-assessment
* Tuesday: Reading!
* Thursday: MP7
* Thursday: Read the project assignment (which Sam still has to write).
* Friday: MP7 post-assessment, quizzes
* Sunday: MP8 pre-assessment
* Sunday; Reading!

### Friday quiz topics

* Higher-order programming (new)
* Tracing (very old)
* Diagramming structures (old)

Comments from MP6 post-assessmentss
-----------------------------------

Due to nearly every procedure referencing numerous others, it was difficult to trace where errors occurred when calling the final top level procedure.

> Write tests!  

> Ask Sam!

I couldn't find time to meet with Sam.

> Email and Teams Messages work (or usually work).

> Evening tutors might be able to help.

> Classmates might be able to help.

It was frustrating that I thought I was done and then learned that there were issues I hadn't thought about when I got results from the autograder.

> Don't forget that you can run the autograder at any point and see the kinds of things I'm looking for.  (You only see the input, but that plus the text should give you some ideas.)

I would have liked more class time on bitmaps.

> Sorry.  Sometimes the learning has to happen in the mini-projects.

I couldn't figure out how to do X.

> Did you ask anyone?

I would have benefited from reading through the prompts to begin thinking about the problems, even before actually starting.

> That's one of the reasons I give you a pre-assessment.

Questions
---------

### MP7

_Many questions and their answers can be found at the end of MP7._

### Administrative

Have you figured out what you're doing about missing metacognitive reflections?

> The policy has always been "You are permitted to miss up to six
  labs, readings, and metacognitive reflections."  I think that remains
  reasonable.

> I have added a policy that if your LAs and MPs indicate a passing
  grade, then missing tokens, labs, readings, or metacognitive
  reflections cannot drop you below a C.  I also think that seems
  reasonable.

### Ethics

Why did you give us this reading?

> Because I'm not doing my job as a CS instructor unless I get you
  to think about the implications of computing.  (I need to do more 
  of it.)

### Data abstraction

How would you solve the first self check?

> Write a procedure, (name->string name), that takes a name and converts it to the appropriate string. name->string should work no matter what representation we use, even if we use a representation we have not yet covered.

> Conceptual answer: Build a list of the five components.  Filter out the
  non-strings.  Join them with a space between them.

```
(define name->string
  (lambda (name)
    (reduce (cut (string-append <> " " <>))
            (filter string?
                    (list (name-prefix name)
                          (name-given name)
                          (name-middle name)
                          (name-family name)
                          (name-suffix name))))))
```

### Higher-order programming

What's wrong with this solution to the self check?

```
;;; (filter pred? lst) -> lst
;;;    pred? : predicate? (applicable to elements of lst)
;;;    lst : list? (with elements applicable to pred?)
;;; Returns a new list of only elements of lst for which pred? is not false.
(define filter2
  (lambda (pred? lst)
    (if (pred? (car lst))
        (cons (car lst) (filter pred? (cdr lst)))
        (cons null (filter pred? (cdr lst))))))
```

> _That sounds like a TPS activity to me!_

Is the point of this to understand how these important procedures like map and filter came about (showing the underlying mechanisms now that we have more knowledge)?

> Yes, that's one of the key points.  Most of the procedures we use, we
  can write.

> Another point is that we can pass functions as parameters.  (We've done
  that many times.)

> A third point is that we can return procedures from procedures.

How would you solve the self check?

```
(define filter
  (lambda (pred? lst)
    (cond
      [(null? lst)
       null]
      [(pred? (car lst))
       (cons (car lst) (filter pred? (cdr lst)))]
      [else
       (filter (pred? (cdr lst)))])))
```

What's the difference between `left-section` and `right-section`?

> `(define fun1 (left-section - 3))`

> `(define fun2 (right-section - 3))`

> _TPS_

What does `(andmap fun lst)` do?

> It behaves like `(and (fun v1) (fun v2) ... (fun vn))`.

### Other

Lab
---

