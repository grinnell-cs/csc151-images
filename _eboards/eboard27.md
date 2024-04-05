---
title: "EBoard 27: Vectors"
number: 27
section: eboards
held: 2024-04-05
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [10 min]
* A note from last class [5 min]
* Questions [10 min]
* Lab [55 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Reminder: Grinnellians have returned from around the world. 
    * **Consider masking.**
* Today is the last day to withdraw from classes. Please chat with me
  if you are questioning whether or not you will pass the course.
* As you preregister for next semester, please consider taking CSC-161.

### Token opportunities

Academic/Scholarly

* Thursday, 2024-04-11, 4pm, HSSC 1231 (the Kernel).
  _CS Poster Session_.
* Thursday, 2024-04-11, 7pm, the normal place
  _Mentor Session_.

Cultural

* Friday, 2024-04-05, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._
* Saturday, 2024-04-06, 1--4pm, Cleveland Beach (in front of Cleveland
  residence hall on South Campus). 
  _Holi_.
  Beware, your clothes will get stained.
* Sunday, 2024-04-07, 1:00-4:30pm, Harris.
  _Purim Carnival_.
* Sunday, 2024-04-07, 2:00-3:30pm, Sebring-Lewis.
  _Eugene Gaub Recital_.
* Thursday, 2024-04-11, 4:15-5:30pm, HSSC S1325
  _Writers@Grinnell_.
* Thursday, 2024-04-11, 8:00-9:30pm, JRC 101
  _Writers@Grinnell_.
* Friday, 2024-04-12, 4:00-5:00pm, HSSC N1170
  _Middle of Everywhere_.

Peer

* Saturday, 2024-04-06, 9am--noon, Field House (?)
  _Men's Tennis vs. Illinois College_.
* Saturday, 2024-04-06, noon-3pm, Pioneer Park
  _Baseball vs. Lawrence_.
* Saturday, 2024-04-06, 2:30-5:30pm, Pioneer Park
  _Baseball vs. Lawrence, the sequel_.
* Saturday, 2024-04-06, 3pm--6pm, Field House (?)
  _Men's Tennis vs. Monmouth_.
* Sunday, 2024-04-07, 1:00-3:00pm, JRC 225
  _Fiber Arts Club_

Wellness

* Tuesday, 2024-04-09, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-09, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-09, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.
* Friday, 2024-04-12, 3:00--5:00pm, JRC Courtyard
  _Get Nostalgic_.

Misc

* Monday, 2024-04-08, 1:00--3:00pm (approx), where appropriate.
  _Watch the eclipse (but don't stare at the sun)_.

### Other good things (no tokens)

### Upcoming work

* Friday, 2024-04-05, 11:00pm, [MP6](../mps/mp06) post-reflection
    * [_Submit MP6 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217839)
* Friday, 2024-04-05, 11:00pm, [SoLA 3](../las) pre-reflection
    * [_Submit SoLA 3 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248181)
* Sunday, 2024-04-07, 11:00pm, [MP4](../mps/mp04) Redo
    * [_Submit MP4 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217681)
* Sunday, 2024-04-07, 11:00pm, No reding.
* Monday, 2024-04-08, 8:30am, [Lab writeup](../labs/vectors)
    * [_Submit today's lab on Gradescope_](...)
    * Preferred: Finish it during class today
* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
* Wednesday, 2024-04-10, 11:00pm, [SoLA 3](../las/) due
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)
* Sunday, 2024-04-14, 11:00pm, [MP1](../mps/mp01) Third Redo
    * [_Submit MP1 redo on Gradescope_]()
* Sunday, 2024-04-14, 11:00pm, [MP2](../mps/mp02) Second Redo
    * [_Submit MP2 redo on Gradescope_]()
* Sunday, 2024-04-14, 11:00pm, [MP3](../mps/mp03) Second Redo
    * [_Submit MP3 redo on Gradescope_]()

### Friday PSA

Notes from last lab
-------------------

### `listp?`

Here's what most of you wrote for `listp?`

```
(define listp?
  (lambda (thing)
    (cond
      [(null? thing)
       #t]
      [(pair? thing)
       (listp? (cdr thing))]
      [else
       #f])))
```

Here's what a more experienced Schemer might write.

```
(define listp?
  (lambda (thing?)
    (or (null? thing)
        (and (pair? thing) 
             (listp? (cdr thing))))))
```

### Building arbitrary `caaddaadddr` procedures

Idea: 

```
;;; (c_r str) -> procedure?
;;;   str : string? (consisting of only #\a and #\r)
;;; Build the procedure corresponding to c<str>r.
;;;
;;; For example, `(c_r "adddddd")` gives the equivalent of
;;; `caddddddr` (if it were defined).
(define c_r
  (let ([letter->fun (lambda (ch) (if (char=? ch #\a) car cdr))])
    (lambda (str)
      (apply o (map letter->fun (string->list str))))))

(define caddddddr (c_r "adddddd"))
```

Questions
---------

### Administrative

Can we get a third redo for MP 1?

> Sure.

Can we get second redos for MPs 2 and 3?

> Sure.

When will our graders catch up?

> Soon.

### Vectors

Lab
---

