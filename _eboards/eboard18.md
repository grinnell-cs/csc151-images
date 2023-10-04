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

### Upcoming Token activities

Academic

Cultural

Peer

* Play this weekend.  _Everybody_.  Thursday, Friday, and Saturday
  at 7:30 p.m. in Flanagan.  Sunday at 2:00 also in Flanagan.  Get
  tickets at the box office starting at noon on Thursday.  (Maybe
  before.)  The box office is in Bucksbaum, near the courtyard.

Wellness

Misc

* Grinnell homecoming parade, Thursday, downtown 5:30 p.m.

### Other good things

### Upcoming work

* LATE: MP4 pre-assessment due
* Thursday night: Readings due
* Friday morning: Lab writeup due (but turn it in today)
* Friday: Quiz!  You get to vote on the topic.
    * Anonymous procedures with `cut` and `compose` (`o`).
    * List recursion.

Sample problems
---------------

About SoLA 1
------------

* I've generally included comments when you don't get credit, but may not
  have added comments when you do get credit.  (I hope that makes sense.)
* I should be sending out summaries of how you are doing on LAs by next
  Monday.  (Hopefully sooner, depending on how things go.)

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

