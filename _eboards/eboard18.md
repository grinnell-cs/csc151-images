---
title: "EBoard 18: Recursion practice"
number: 18
section: eboards
held: 2023-10-04
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* About SoLA 1
* Questions
* Lab

Administrivia
-------------

* New places.
* Last Friday's lab is cancelled.  It's worth looking at, but you
  should not turn anything in.
* MP4 is now due a week from Thursday.
* The MP2 redo is now posted.  
    * It is due October 12th.
    * Please include a `changes.rkt` file that includes a list
      of the changes you've made in response to the grading comments.

### Upcoming Token activities

Academic

Cultural

Peer

* Play this weekend.  _Everybody_.  Thursday, Friday, and Saturday
  at 7:30 p.m. in Flanagan.  Sunday at 2:00 also in Flanagan.  Get
  tickets at the box office starting at noon on Thursday.  (Maybe
  before.)  The box office is in Bucksbaum, near the courtyard.
* Volleyball vs. Lawrence Saturday at 1pm (Senior Day).

Wellness

Misc

* Grinnell homecoming parade, Thursday, downtown 5:30 p.m.

### Other good things

### Upcoming work

* LATE: MP4 pre-assessment due
* Thursday night: Readings due
* Friday morning: Lab writeup due (but turn it in today)
* Friday: Quiz!  
    * Tracing (for the few of you who still need it).
    * Lists and the big three (see our discussion below).
    * Documentation (see our discussion below).
    * One new one (you can vote).
        * Anonymous procedures with `cut` and `compose` (`o`).
        * List recursion.

Sample problems
---------------

### List recursion

_Design and write recursive functions over lists._

Write a *recursive* procedure, `(increasing-length? words)`, that takes
a list of strings as input and ensures that every string is at least as
long as the previous string. If so, it returns true.  If not, it returns
false.

Here's a partial test suite.

```drracket
(check-equal? (increasing-length '())
              #t
              "No strings: They are in increasing length")
(check-equal? (increasing-length? '("hello"))
              #t
              "A singleton")
(check-equal? (increasing-length? '("a" "b" "cd" "efg" "hij" "klmn"))
              #t
              "Some duplicate-length words")
(check-equal? (increasing-length? '("a" "bb" "ccc" "dddd" "eee"))
              #f
              "Okay until the end.")
```

### Use higher-order procedures

_Use `cut` and composition to simpllify computation._

Consider the following procedures

```drracket
;;; (vowel? char) -> boolean
;;;   char : char?
;;; Determine if char is a vowel.
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))

;;; (count-vowels str) -> integer?
;;;   str : string?
;;; Count the number of vowels in str
(define count-vowels
  (lambda (str)
    (tally vowel? (string->list str))))

;;; (select-special-words words) -> list-of string?
;;;   words : list-of string?
;;; Selects all the special words in words using the ALTV criterion.
(define select-special-words
  (lambda (words)
    (filter (o (cut (> <> 2)) count-vowels) words)))
```

a. What kinds of words does `select-special-words` select?

b. Explain how `(o (cut (> <> 2)) count-vowels)` works as a
predicate for such words.

c. Rewrite `vowel?` using `cut` and composition but no `lambda`.

## Use higher-order procedures (extra)

_This is a particularly evil problem.  You are unlikely to get one
this hard._

Consider the following procedure.

```drracket
(define silly
  (lambda (lst)
    (map (lambda (x) (sqr (+ 1 x)))
         (filter odd? lst))))
```

Rewrite the procedure using `o` and `cut` so that it has *no* lambdas.

Notes:

* Use `o` when you want to sequence actions. (Do *this* to the parameter,
  then *this* to the result, then *this* to the next result, and so on and
  so forth.)
* Use `cut` when you want to fill in one or more parameters to a procedure, 
  thereby creating a new procedure.
* This is a case in which the lambda-free version is likely much harder to
  read.

### Voting!

_We can start with a bit of debate

* `cut` and compose
* recursion

About the quiz on the big three
-------------------------------

* The "normal" process:

About SoLA 1
------------

* I've generally included comments when you don't get credit, but may not
  have added comments when you do get credit.  (I hope that makes sense.)
* I should be sending out summaries of how you are doing on LAs by next
  Monday.  (Hopefully sooner, depending on how things go with the software.)

### Documentation

Documentation may have been the hardest one.  I expect precision
in your documentation, particularly with regards to the type restrictions
on inputs.

#### The question

Consider the following procedure that makes a simple "party person" in which we can choose the size and color of various aspects.

```
(define party-person
  (lambda (size hat tie)
    (above (triangle (* size 2) "solid" hat)
           (circle (* size 2) "outline" 'black)
           (beside (rotate 90 (triangle (* size 1/2) "solid" tie))
                   (rotate -90 (triangle (* size 1/2) "solid" tie)))
           (rectangle size (* size 4) "solid" "black"))))
```

Here's the result of a call to `(party-person 10 "teal" "salmon")`.

[Image elided].

a. Document `party-person` using the standard format.

#### An incorrect answer

_What's wrong with the following answer?_ (TPS)

```
; (party-person size hat tie) -> image?
; size : number?
; hat : color?
; tie : color?
; Create a simple stick figure wearing a hat and tie, where
; the size gives a scaling factor from some basic figure.  The
; hat is colored `hat` and the tie is colored `tie`.  The
; figure is about 10.5*size tall and 4*size wide.
```

*
*
*

#### A better answer

_How would you fix it?_

```
; (party-person size hat tie) -> image?
; size : number?
; hat : color?
; tie : color?
; Create a simple stick figure wearing a hat and tie, where
; the size gives a scaling factor from some basic figure.  The
; hat is colored `hat` and the tie is colored `tie`.  The
; figure is about 10.5*size tall and 4*size wide.
```

### Academic honesty, again

_I'm sick of having to talk about this._

#### Re-dos

Note: I'll have a quiz on documentation available on Friday.

Questions
---------

### Administrative

How do I pay tokens to turn something in late?

> You will be charged automatically.

How do I tell how I'm doing on tokens?

> Sam plans to update those this coming weekend.

When will you post the MP2 redo?

> It should now be posted.  Sorry for the delay.

### MP4


Lab
---

