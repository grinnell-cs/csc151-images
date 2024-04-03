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

Cultural

* Friday, 2024-04-05, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._
* Saturday, 2024-04-06, 1--4pm, Cleveland Beach (in front of Cleveland
  residence hall on South Campus). 
  _Holi_.
  Beware, your clothes will get stained.

Peer

Wellness

* Tuesday, 2024-04-09, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-09, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-09, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

### Upcoming work

* Friday, 2024-04-05, 11:00pm, [MP6](../mps/mp06) post-reflection
    * [_Submit MP6 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217839)
* Friday, 2024-04-05, 11:00pm, [SoLA 3](../las) pre-reflection
    * [_Submit SoLA 3 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248181)
* Sunday, 2024-04-07, 11:00pm, [MP4](../mps/mp04) Redo
    * [_Submit MP4 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217681)
* Sunday, 2024-04-07, 11:00pm, [New vectors reading](../readings/vectors)
    * [_Submit reading reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4312955)
* Monday, 2024-04-08, 8:30am, [Lab writeup](../labs/pairs)
    * [_Submit today's lab on Gradescope_](...)
    * Preferred: Finish it during class
* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
* Wednesday, 2024-04-10, 11:00pm, [SoLA 3](../las/) due
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)

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

Some notes on vectors
---------------------

Questions
---------

### Administrative

### Vectors

Lab
---

