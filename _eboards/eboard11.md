---
title: "EBoard 11: Software engineering (testing and documentation)"
number: 11
section: eboards
held: 2023-09-18
link: true
---
# {{ page.title }}

* **Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* A little bit about MP1
* Notes from the readings
* Questions
* Lab

Administrivia
-------------

### Introductory notes

* This week's quiz will be on conditionals.  
* Congrats to Volleyball on the [sweep of Rose-Hulman](https://pioneers.grinnell.edu/news/2023/9/16/womens-volleyball-blistering-hitting-performances-propels-gc-volleyball-team-to-sweep-of-rose-hulman.aspx)
* Congrats to Football for [their win at Beloit](https://pioneers.grinnell.edu/news/2023/9/16/football-explosive-2nd-half-propels-grinnell-football-team-to-come-from-behind-win-over-beloit.aspx)
* Mini-project 1 has been returned.  We'll chat about it a bit later.

### Upcoming Token activities

Academic

* Tuesday, 19 Sept 2023, Noon, Day PDR, "Should Plagiarism Detectors Be
  Able to Keep Your Essays?"
* Thursday, 21 Sept 2023, 4:15 pm, CS Extras: "Study Abroad in CS"
  (Science 3821)

Cultural

Peer

Wellness

Misc

### Other Good Things

### Upcoming work

* Tonight: MP3 pre-assessment due
* Tuesday night: Reading responses due.
* Wednesday morning: Today's lab due (but we'll get it turned in today)
* Thursday night: MP3 due

About MP1
---------

You will have a number like 2.75 for your mini-project.

* The number to the left of the decimal point indicates how
  you did overall.  
    * 0 is (I)ncomplete
    * 1 is (R)edo
    * 2 is (M)eets expectations
    * 3 is (E)xceptional
* The number to the right of the decimal point is what the
  autograder reported.  `.99` is "everything is correct".
  `.75` is "some tests failed"

The graders have left comments.  

* Some may be in your code.
* Some may be on the side.
* **Please read the commments.**
* You should also check the autograder issues if you did not
  get a full score from the autograder.
* You can talk to me (or DM/Email me) if you have questions.

You may resubmit your mini-project under the "MP1 Redo" assignment
on Gradescope for _zero_ tokens.  (In the future, those with I's will
need to spend tokens.)

Resubmissions are due on Thursday Sept. 28.

* In addition to the three files, please submit an extra 
  "README.rkt" file with a comment that indicates what you changed
  since the prior assignment.

```
#|
S. Tudent
CSC-151-01 2023Fa
MP1 Resubmit

The only thing I missed on the last assignment was ensuring that all of
my procedures took parameters.  I added those.
|#
```

Notes from the readings
-----------------------

### Documentation

```
;;; (substring str start end) -> string?
;;;   str : string?
;;;   start : exact-integer? (<= 0 start (string-length str))
;;;   end : exact-integer? (<= start end (string-length str))
;;; Extract the substring of `str` starting at index `start`
;;; (inclusive) and ending at index `end` (exclusive), using
;;; zero-based indexing.
```

* Some of you neglected to describe the relationship between `start`
  and `end`.
* Some of you neglected to indicated that `start` and `end` should
  be exact.

### Testing

I expected to see at least five tests.

* A number between 0 and 100 (not including 0 or 100), which should  
  stay the same.
* A number less than 0, which should become 0.
* A number greater than 100, which should become 100.
* 0, an "edge case".
* 100, the other "edge case".

More creative testers also explored ...

* Non-integers.
* Inexact numbers.

Please make sure to give your tests reasonable names.  "bound-grade" is
not a good name.  "number" is also not a good name.

Questions
---------

_Ask questions.  It's part of self gov.  If you have questions, others
likely do, too._

### On unit testing

What is this "epsilon" thing?

> When we're comparing inexact numbers, we acknowledge that values
  may be a bit off.  "epsilon" is how far we're willing to have 
  them off.

> `(test-= "NOTE" expression expected how-close)`

I got different answers from the `test-=` tests with `sqrt`.

> Let's try them.

> `(test-= "sqrt 2 squared, approximately" 2 (* (sqrt 2) (sqrt 2)) 0.00001)`

> `(test-= "sqrt 2 squared, exactly" 2 (* (sqrt 2) (sqrt 2)) 0)`

### On documentation

### On mini-project 1 grading (general, if possible)

### On mini-project 3

Are you ever going to fix hsv->rgb?

> I hope so.

> It will be available immediately after class.

What are "related colors"?

> You can decide.  You should document.

> Maybe five tints of the same shade.

> Maybe three colors 120 degrees apart with two tints of each.

> You could go for "what looks good together" (according to you, according
  to color theory)

> You could go for "what clashes horribly"

Will you give us a filename?

> Stay tuned.

### On administrative stuff

Lab
---

For palindrome, I'd make sure to test

* Both even and odd length palindromes.
* Edge case: Empty string.
* Capital and lowercase letters.
* Palindromes with spaces in them.  (What does it do?  What should it do?)
