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
* I went through most of the reading responses and MP7 pre-assessments
  that I received by 8pm last night.
* I am disappointed that seven of you did not do the pre-assesssment
  for MP7.  The pre-assessments are intended to help you.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-14, Noon, Day PDR: _CS Table: Cell Phone Addiction_.
* Tuesday, 2023-11-14, 7pm, 3821: _Mentor session_.
    * Data abstraction
    * Higher-order procedures
    * MP7
    * Other questions you bring
* Wednesday, 2023-11-15, 4pm, HSSC Kernel: _Madison Van Oort ’08 speaks
  on Frictions in the Future of Work_.
* Thursday, 2023-11-16, 11-noon, JRC 101: _Convocation: Richard Robinson
  on Nanoparticles 101._
* Thursday, 2023-11-16, 4:15pm, HSSC Kernel:  _CS Poster Session_.

Cultural

* Friday and Saturday, downtown Grinnell: _Jingle Bell Holiday_ (we
  should promote the celebration of the Christian holidays before
  Thanksgiving).

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
* Tuesday: Late MP7 pre-assessment
* Tuesday: Readings!
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

Due to nearly every procedure referencing numerous others, it was
difficult to trace where errors occurred when calling the final top
level procedure.

> Write tests!  

> Ask Sam!

I couldn't find time to meet with Sam.

> Email and Teams Messages work (or usually work).  If Sam doesn't
  respond promptly, please ask again.

> Evening tutors might be able to help.

> Classmates might be able to help.

It was frustrating that I thought I was done and then learned that there
were issues I hadn't thought about when I got results from the autograder.

> Don't forget that you can run the autograder at any point and see the
  kinds of things I'm looking for.  (You only see the input, but that plus
  the text should give you some ideas.)

I would have liked more class time on bitmaps.

> Sorry.  Sometimes the learning has to happen in the mini-projects.

I couldn't figure out how to do X.

> Did you ask anyone?

I would have benefited from reading through the prompts to begin thinking
about the problems, even before actually starting.

> That's one of the reasons I give you a pre-assessment.

Questions
---------

### MP7

_Many questions and their answers can be found at the end of MP7._

How do we rotate a word?

> The things we create with text/font are images, so we can just use
  the image procedures (`rotate`).

Can I sort a list of abstract data types according to any component?

> Yes.

```
; word-info: A collection of the word, its frequency (0..100 scale), its type
(define word-info vector)

(define word-info-word (cut (vector-ref <> 0)))
(define word-info-frequency (cut (vector-ref <> 1)))
(define word-info-type (cut (vector-ref <> 2)))

(define sample
  (list (word-info "hello" 3 "greeting")
        (word-info "hi" 10 "greeting")
        (word-info "CSC151" 1 "proper noun")
        (word-info "Sam" 3 "improper noun")
        (word-info "throws" 10 "transitive verb")
        (word-info "cans" 3 "proper noun (plural)")))
```

```
> (map word-info-type sample)
'("greeting"
  "greeting"
  "proper noun"
  "improper noun"
  "transitive verb"
  "proper noun (plural)")
> (sort sample (lambda (wi1 wi2) (string-ci<=? (word-info-word wi1) (word-info-word wi2))))
'(#("cans" 3 "proper noun (plural)")
  #("CSC151" 1 "proper noun")
  #("hello" 3 "greeting")
  #("hi" 10 "greeting")
  #("Sam" 3 "improper noun")
  #("throws" 10 "transitive verb"))
> (sort sample (lambda (wi1 wi2) (string-ci<=? (word-info-type wi1) (word-info-type wi2))))
'(#("hi" 10 "greeting")
  #("hello" 3 "greeting")
  #("Sam" 3 "improper noun")
  #("CSC151" 1 "proper noun")
  #("cans" 3 "proper noun (plural)")
  #("throws" 10 "transitive verb"))
> (sort sample (lambda (wi1 wi2) (<= (word-info-frequency wi1) (word-info-frequency wi2))))
'(#("CSC151" 1 "proper noun")
  #("cans" 3 "proper noun (plural)")
  #("Sam" 3 "improper noun")
  #("hello" 3 "greeting")
  #("throws" 10 "transitive verb")
  #("hi" 10 "greeting"))
> (sort sample (lambda (wi1 wi2) (>= (word-info-frequency wi1) (word-info-frequency wi2))))
'(#("throws" 10 "transitive verb")
  #("hi" 10 "greeting")
  #("cans" 3 "proper noun (plural)")
  #("Sam" 3 "improper noun")
  #("hello" 3 "greeting")
  #("CSC151" 1 "proper noun"))
```

Do we need to include the type of speech?

> No.  It was just part of the example.

### Administrative

Have you figured out what you're doing about missing metacognitive reflections?

> The policy has always been "You are permitted to miss up to six total
  labs, readings, and metacognitive reflections."  I think that remains
  reasonable.

> I have added a policy that if your LAs and MPs indicate a passing
  grade, then missing tokens, labs, readings, or metacognitive
  reflections cannot drop you below a C.  I also think that seems
  reasonable.

> If you don't think that's reasonable, please meet with me.

### Ethics

Why did you give us this reading?

> Because I'm not doing my job as a CS instructor unless I get you
  to think about the implications of computing.  (I need to do more 
  of it.)

### Data abstraction

How would you solve the first self check?

> Write a procedure, `(name->string name)`, that takes a name and converts it to the appropriate string. `name->string` should work no matter what representation we use, even if we use a representation we have not yet covered.

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
(define filter
  (lambda (pred? lst)
    (if (pred? (car lst))
        (cons (car lst) (filter pred? (cdr lst)))
        (cons null (filter pred? (cdr lst))))))
```

> _That sounds like a TPS activity to me!_

> There is no base case.  This will run until it crashes.

> You don't really want to cons null onto the front of the list, since
  it will add "null" to the list (rather than not changing the list).

Is the point of this to understand how these important procedures like
`map` and `filter` came about (showing the underlying mechanisms now that
we have more knowledge)?

> Yes, that's one of the key points.  We can write most of the procedures 
  we use. 

> Another point is that we can pass functions as parameters.  (We've done
  that many times.)  You can also write procedures that accept procedures
  as parameters.

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

> `(define fun1 (left-section - 3))` (aka `(cut (- 3 <>))`)

> `(define fun2 (right-section - 3))` (aka `(cut (- <> 3))`)

> `(left-section - 3)` uses the `3` as the first parameter, which
  means that `fun1` subtracts something from 3.

> `(right-section - 3)` uses the `3` as the second parameter, which
  means that `fun2` subtracts 3 from something.

Why would we write `left-section` and `right-section` given that
`section` and `cut` exist?

> `section` and `cut` don't exist in all versions of Scheme.  They
  also require some tools that we aren't learning in 151.

> In contrast, you have the knowledge and skills to write and understand
  both `left-section` and `right-section` (or `l-s` and `r-s`, as many of
  us perfer to write them).

What does `(andmap fun lst)` do?

> It behaves like `(and (fun v1) (fun v2) ... (fun vn))`.

What's this `match` thing?

> Something we're not covering.  Ignore it when you see it.

### Other

Was the 45 minutes of discussion useful?

> Yes.  Particularly because we got a hint on the HW.  (Sam's impression
  of student responses.)

Lab
---

Yay!  It's lab time.  You won't get the whole thing done (sorry), but

"Sam, Ellie, Ella, and Michael said I can stop here!"
