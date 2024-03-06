---
title: "EBoard 20: Recursion lab"
number: 20
section: eboards
held: 2024-03-06
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [10 min]
* Finishing up the sorting exercise [10 min]
* About MP5 [10 min]
* Questions [5 min]
* Lab [40 min]
* Turn in Lab [5 min]

Administrative stuff
--------------------

* Advance warning: We "spring ahead" on Sunday morning.
* Mid-semester reports were due last night. While I have confidence that
  every one of you can earn an A this semester, I needed to turn in a few
  reports for people who seem to be having particular struggles. Please
  make an appointment to chat with me.

### Token opportunities

Academic/Scholarly

* Thursday, 2024-03-07, 11:00 a.m.,JRC 101.
  _Scholars' Convocation: An American Genocide: The United States and 
   the California Indian Catastrophe, 1846-1873_
* Thursday, 2024-03-07, 7:00pm, Science 3819.
  _Mentor Session_ (on recursion). 
* Tuesday, 2024-03-12, noon, Some PDR.
  _CS Table_.
* Tuesday, 2024-03-12, 7:00pm, Science 3819.
  _Mentor Session_ (on the topic of the prior mentor session)

Cultural

* Thursday, 2024-03-07, JRC 101, 8:00-9:30 pm.
  _Writers@Grinnell: Carl Phillips_
* Thursday--Saturday, 2024-03-07 to 2024-03-09, 7:30 p.m.
  _Songs of the Scarlet and Wayback_ (play).
* Friday, 2024-03-08, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._
* Saturday, 2024-03-09, Harris Cinema, ??:??
  _Met Opera: Verdi's La Forza del Destino_.
* Saturday, 2024-03-09, 2:00 pm, Sebring-Lewis.
  _ZAWA!_ (Flute concert).

Peer

* Saturday, 2024-03-09, Field House.
  _Men's Tennis vs. Central._
* Sunday, 2024-03-10, 1--3pm, in JRC 225. 
  _Fiber Arts Club._ Community. Arts. Music in the background. What could
  be better.

Wellness

* Wednesday, 2024-03-06, 4pm, JRC 101.
  _Intimacy Stages_.
* Friday, 2024-03-08, noon, JRC 101.
  _Wellness Bingo_.
* Tuesday, 2024-03-12, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-03-12, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-03-12, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

### Upcoming work

* Wednesday, 2024-03-06, 11:00pm, SoLA 2 due.
    * I'm too lazy to link all of the SoLA 2 problems.
* Thursday, 2024-03-07, 11:00 pm, More readings
    * [Thinking recursively](recursion-magic.html)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4200909/)
* Friday, 2024-03-08, 8:30am, [Lab writeup](../labs/recursion-basics)
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4200915/)
* Friday, 2024-03-08, 11:00pm, Post-reflection for SoLA 2
    * [_Submit SoLA 2 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4166817)
* Friday, 2024-03-08, 11:00pm, Pre-reflection for MP5
    * [_Submit MP5 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4200919/)
* Sunday, 2024-03-10, 11:00pm, [MP3](../mps/mp3) Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4168533/)
    * Make sure to include the `CHANGES.rkt` file.
* Sunday, 2024-03-10, 11:00pm, [MP1](../mps/mp1) Second redo
    * [_Submit MP1 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4168529/)
    * Make sure to include the `CHANGES.rkt` file.

About MP5
---------

Wrapping up the sorting example
-------------------------------

```
;;; (insert-number num sorted-nums) -> (list-of integer?)
;;;   num : integer?
;;;   sorted-nums : (all-of list-of-integer? sorted?)
;;; Insert `num` into the correct place in `sorted-nums`
;;;
;;; Notes: Look at each element in turn. If you're bigger, skip over
;;; it. If you're smaller, insert it there. If there are no elements,
;;; inserting it means "create a new list".
(define insert-number
  (lambda (num sorted-nums)
    (cond
      [(null? sorted-nums)
       (list num)]
      [(<= num (car sorted-nums))
       (cons num sorted-nums)]
      [else
       (cons (car sorted-nums)
             (insert-number num (cdr sorted-nums)))])))
```

TPS: In your own words, explain what `insert-number` is doing.

```
;;; (sort-nums nums) -> (all-of (list-of integer?)  sorted?)
;;;   nums : (list-of integer?)
;;; Sort `nums` in increasing order.
(define sort-nums
  (lambda (nums)
    (if (null? nums)
        null
        (insert-number (car nums)
                       (sort-nums (cdr nums))))))
```

TPS: In your own words, explain what `sort-nums` is doing.

Questions
---------

### Administrative

### Recursion

Lab
---
