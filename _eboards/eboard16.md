---
title: "EBoard 16: Unit testing"
number: 16
section: eboards
held: 2024-02-26
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [10 min]
* Questions [25 min]
* Lab [40 min or so]
* Turn in lab [5 min]

Administrative stuff
--------------------

* It appears that I've been forgetting to publish grades on Gradescope.
  I'm working on getting that caught up.
    * For pre-reflections and readings that I had not responded to in a
      timely fashion, I often just gave you credit.
* Please make sure that the autograder can run on your submissions!
    * For MP3, it was often because you referred to "kitten.jpg" but
      did not include it.
* The range of times reported for MP3 worries me (from 3 to 20). We hope
  that MPs will normally take you 4--5 hours. (Unfortunately, there's a
  range of how long people take. In the real world, successful professional
  programmers can have a factor of ten difference in productivity.)
    * Shoot for M as a starting point! (Skip the E steps.)
    * Ask questions early.

### Token activities

Academic/Scholarly

* Tuesday, 2024-04-27, noon, Some PDR.
  _CS Table_.
* Tuesday, 2024-04-27, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-02-29, 11:00-noon, JRC 101.
  _Scholars' Convocation: Peter Michael Osera Grinnell Talk_
* Thursday, 2024-02-29, 7:00pm, Science 3819.
  _Mentor Session_. 

Cultural

Peer

* Saturday, 2024-03-02, 2pm, in Sebring Lewis. 
  _Orchestra_, Bartok. Vegetables. More!
* Sunday, 2024-03-03, 1--3pm, in JRC 225. 
  _Fiber Arts Club._

Wellness

* Tuesday, 2024-02-27, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-27, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-27, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

### Upcoming work

* Tuesday, 2024-02-27, 11:00pm: Reading responses
    * [List composition and decomposition](../readings/list-composition)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4155337)
* Wednesday, 2024-02-28, 8:30am: Submit today's lab writeup.
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4155334)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-28, 11:00pm: [MP4](../mps/mp4)
    * _Gradescope forthcoming_.
    * Reminder: Read the rubric and try to avoid incompletes.
    * Make sure your code works.
* Friday, 2024-03-01, 8:00am (or 8:30), Quiz!
    * New topic: Lists
    * Old topic: Tracing
* Friday, 2024-03-01, 11:00pm, MP4 post-reflection
    * [_Submit post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4136286)
* Friday, 2024-03-01, 11:00mp, SoLA 2 pre-reflection
    * [_Submit pre-reflection on Gradescope_](...)
* Sunday, 2024-03-10, 11:00pm, [MP3](../mps/mp3) Redo
    * _Gradescope forthcoming_.

Some notes from your instructors
--------------------------------

Lots of techniques. It's okay that you're struggling to figure out which.

Don't bang your head against the wall for too long. Stop. Let your
subconscious work on things. Ask questions.

Important to think about what type of thing you want. (Is this asking for a
procedure, a string, a list?)

Decompose!

You're pretty and good. You can do this.

Questions
---------

### Friday's Lab

How should we write "add 5 to all"?

> `(map (cut (+ 5 <>)) lst)`

> `(map (o increment increment increment increment increment) lst)`

> `(map + (make-list (length lst) 5) lst)`

> `(map (lambda (x) (+ 5 x)) lst)`

> `(define add5 (lambda (x) (+ 5 x))) (map add5 lst)`

> `(map increment (map increment (map increment (map increment (map increment lst)))))`

### Administrative

### MP4

### Lists

Could you explain how this expression works (and what it does)?

```
(map (o (cut (- <> (char->integer #\0)))
        char->integer)
     '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))
```

> We have a procedure that converts a character to an integer and then
  subtracts something from that number.

> It subtracts the collating sequence number for 0.

> Reminder: We want to skip over code (and equations). However, the most
  important information is often there.

> That holds for hard words, too.

How does `reduce` differ from `apply`?

> `reduce` takes a two-parameter procedure and repeatedly applies it to neighboring pairs.

> `apply` applies an n-parameter procedure "all at once".

> For operations that can take two paremeters or many, like `+` and `string-append`, they will behave the same.

For operations that require two parameters, and return a value of the same type, `reduce` is essentiial.

### Documentation

What issues should we pay attention to in documenting `substring`?

```
;;; (substring str start end) -> string?
;;;   str : string?
;;;   start : integer?, a 0-based index (<= 0 start (length str))
;;;   end : integer?, a 0-based index (<= 0 end (length str))
;;; Returns the substring of `str` denoted by the start index `start`
;;; (inclusive) and end index `end` (exclusive).
```

> Our goal is that the documentation provides enough information
  that a careful reader can determine the results for any inputs.

> For `substring`, the original documentation left some of the following
  unclear.

> Can I write `(substring "hello" 1 1)`? Yes.

> Add "If start equals end, returns the empty string".

> Can I write `(substring "hello 3 2)`?  No.

> Add "(<= start end)" or something similar.

> Can I write `(substring "hello" 1.0 3.0)`? No.

> Add `exact` somewhere in there.

> `start : (all-of exact-nonnegative-integer? (less-equal (length str)))`

> `end : (all-of exact-nonnegfative-integer? (greater-equal star) (less-equal (length str)))`

> `start : exact integer, 0 <= start <= (length str)`

> What about `(substring "hello" 5 5)`

### Testing

When do we write a test procedure?

> I'm going to write a new procedure. Let's think about some sample inputs
  and outputs.

> We should write tests as we prepare to write any new procedure
  (and when writing tests does not appear to be too onerous).

What is the difference between writing a test procedure and writing
a functional procedure?

> I'd say it's a "test expression" rather than a procedure. In one case,
  you're writing something that checks whether something else works
  (e.g., by providing sample input and output). In the other, you're
  writing the algorithm that converts the input to output.

> We do sometimes write a procedure that we use in testing. Sometimes,
  that's a less efficient but provably correct way of achieving the
  solution. Sometimes, that's something that helps us decompose the
  testing process.

Can we look at testing  `bound-grade`?

_Sketch a set of tests for the `bound-grade` procedure, which takes a real
number as input and outputs._

* _That number, if it is between 0 and 100, inclusive._
* _Zero, if it is less than 0._
* _100, if it is greater than 100._

_By "sketch", we mean "list the tests you'd write"._

> TPS! Let's see how many different tests we can come up with$a

```


(test-= "slightly more than 100"
        (bound-grade 101)
        100
        0)
(test-= "something in the range"
        (bound-grade 33)
        33
        0)
(test-= "something really large"
        (bound-grade 1232135231213212112132112321)
        100
        0)
(test-= "inexact non integer in range"
        (bound-grade 5.2)
        5.2
        0)
(test-= "negative numbe"
        (bound-grade -2)
        0
        0)
(test-= "especially negative number"
        (bound-grade -999999999)
        0
        0)
(test-= "negative inexact real"
        (bound-grade -909.12321)
        0
        0)
(test-= "rational in range"
        (bound-grade 90/4) ; Yay! Racket lets us write fractions
        90/4
        0)
(test-= "something slightly more than 100"
        (bound-grade (+ 100 1/99999999999999999999))
        100
        0)
(test-= "something slightly less than 100"
        (bound-grade (- 100 1/99999999999999999999))
        (- 100 1/99999999999999999999)
        0)
```

### Assorted

Lab
---

Sam's questions: 

* _Did you test `dedup-adjacent` with something other than numbers?_

Sam's favorite tests: 

* `(test-equal? (dedup-adjacent (make-list 100 "a")) (list "a"))`
* `(test-equal? (dedup-adjacent (list)) (list))`

Student observations:

* "equal" is ambiguous. Is `4` equal to `4.0`?

Triangles

* What do you expect for `(describe-triangle 10 5 5)`?
