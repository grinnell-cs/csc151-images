---
title: "EBoard 17: More recursion"
number: 17
section: eboards
held: 2023-10-02
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* About MP4.
* Questions
* Lab

Administrivia
-------------

* Happy October!
* Maintain the same location and partner as last class.
* I've made some changes to the schedule.  Gradescope changes will
  follow soon thereafter.
* Plan to finish Friday's lab.  If you finish that early, feel
  free to talk through MP4 with your partner.
* Extra mentor session sheets at the back of the room.
* Apologies that I am behind on answering emails and messages; I spent
  approximately 24 hours this weekend on work related to a conference
  I'm co-chairing.

### Upcoming Token activities

Academic

* CS Table, Tuesday, Noon, Reports from Tapia and GHC.

Cultural

Peer

* Play this weekend.  _Everybody_.  Thursday, Friday, and Saturday
  at 7:30 p.m. in Flanagan.  Sunday at 2:00 also in Flanagan.  Get
  tickets at the box office starting at noon on Thursday.  (Maybe
  before.)  The box office is in Bucksbaum, near the courtyard.
    * Things you should know about Hallie Flanagan.  A Grinnell alum.
      Friends with Harry Hopkins.
    * Harry Hopkins is also a Grinnell alum.  He was Franklin Roosevelt's
      right-hand-man.  
    * Franklin Roosevelt was NOT a Grinnell alum.  However, he was 
      President of the United States in the early-mid twentieth century.
    * Hopkins was the architect of the New Deal.  Pay Americans who
      are out of work to work at things they are good at.  That includes
      paying artists to do art.
    * Because Grinnell's president had emphasized the arts, both Flanagan
      (a theatre person) and Hopkins cared about the arts and wanted to
      include them in the New Deal.
    * So they built a New Deal Theatre program, which Flanagan designed.
    * Theatre people are all communists.  So the program quickly got
      eliminated.
    * And then lots of stuff with new theatre.

Wellness

Misc

* Grinnell homecoming parade, Thursday, downtown 5:30 p.m.

### Other good things

### Upcoming work

* Tonight: MP4 pre-assessment due
* Tuesday night: No reading due
* Wednesday morning: Lab writeup due (but turn it in today)
* Thursday night: Readings due
* Thursday night: MP4 due

MP4 Discussion
--------------

_We're doing this live, probably switching back and forth between
DrRacket and the eboard._

_And yes, I'll be asking you questions._

How does this work?

```
(define rotated-solid-rectangle
  (lambda (stuff)
    (apply (cut (rectangle <> <> "solid" <>))
           stuff)))
```

When we apply a procedure to stuff, we make each element of the list a
parameter to that procedure.  So the width will be the first parameter,
the height will be the second parameter, and the color will be the
third parameter (at least if that's how we put together the list).

The `cut` builds a procedure that needs three parameters.  Conveniently,
they are the width, height, and color.  And we can then apply it.

Whoops ... some updates.

```
(define thin-shape (list 40 90 (rgb 255 192 128)))

(define rotated-solid-rectangle
  (lambda (stuff)
    (rotate 45
            (apply (cut (rectangle <> <> "solid" <>))
                   stuff))))
```

```
(define thin-shape (list 40 90 (rgb 255 192 128)))
(define vary
  (lambda (stuff)
    (list stuff
          (list (list-ref stuff 0) (list-ref stuff 1) (darker-color (list-ref stuff 2))))))
```

What is `(vary thin-shape)`?

* A list of two elements
* Each of those is a `shape-params?` (a list of width height color)
* The second is similar to the first (same width and height) but a darker color)

[Work elided]

```
> (vary thin-shape)
(list
 (list 40 90 (color 255 192 128 255))
 (list 40 90 (color 223 160 96 255))
 (list 40 90 (color 192 128 255 255))
 (list 40 90 (color 128 255 192 255))
 (list 40 90 (color 160 96 223 255)))
> (map rotated-solid-rectangle (vary thin-shape))
(list . . . . .)
```

Suppose I write

```
(map vary (vary thin-shape))
```

What should I get (conceptually)?

* Each element of `(vary thin-shape)` gets processed by `vary`.
* `vary` makes a list of a few (five) shape descriptions.
* So we should a list of five lists of five shape descriptions.

How do we take a list of lists of shape descriptions and turn each 
shape description into a rotated-solid-rectangle?

Note: We can turn each shape description in a list of shape descriptions
into a rotated-solid-rectangle with `(map rotated-solid-rectangle stuff)`.

We have a list of lists of shape descriptions.  We want to process it, so
let's write it recursively.

* Base case test?
    * No elements in lo-lo-sd [sam chooses this]
    * One element in lo-lo-sd
* Base case value?
    * Return the empty list
* Simplify? cdr removes the first element
* Recusive call?
* What do we do with the result of the recursive call.

```
;;; (rsr-1 lo-lo-sd) -> list-of list-of image?
;;;   lo-lo-sd -> list-of list-of shape-params?
;;; Turn each shape-param into a rotated solid rectangle.
(define rsr-1
  (lambda (lo-lo-sd)
    (if BASE-CASE-TEST
        BASE-CASE
        (DO-SOMETHING (rsr-1 (SIMPLIFY lo-lo-sd))))))
```

```
;;; (rsr-1 lo-lo-sd) -> list-of list-of image?
;;;   lo-lo-sd : list-of list-of shape-params?
;;; Turn each shape-param into a rotated solid rectangle.
(define rsr-1
  (lambda (lo-lo-sd)
    (if (null? lo-lo-sd)
        null
        (DO-SOMETHING (rsr-1 (cdr lo-lo-sd))))))
```

Detour: Let's make it a little simpler

Our goal: We have a list of those weird `shape-params?` lists.  We
want to make it into a list of images.

We know that we convert ONE `shape-param?` value into a rotated-solid-rectangle
with `(rotated-solid-rectangle THING)`.

Other than `map`, how do we do that to each element of the list?

Answer: Recursion!

```
;;; (rsr-0 lo-sd) -> list-of image?
;;;   lo-sd : list-of shape-param?
;;; Convert each shape-param? in the list to a rotated solid rectangle
(define rsr-0
  (lambd (lo-sd)
    (if (null? lo-sd)
        null
        (DO-SOMETHING (rsr-0 (cdr lo-sd))))))
```

What should `DO-SOMETHING` be?

* Something with the `car`.

```
;;; (rsr-0 lo-sd) -> list-of image?
;;;   lo-sd : list-of shape-param?
;;; Convert each shape-param? in the list to a rotated solid rectangle
(define rsr-0
  (lambd (lo-sd)
    (if (null? lo-sd)
        null
        (cons (rotated-solid-rectangle (car lo-sd)) 
              (rsr-0 (cdr lo-sd))))))
```

You may not use `map`.

```
;;; (rsr-1 lo-lo-sd) -> list-of list-of image?
;;;   lo-lo-sd : list-of list-of shape-params?
;;; Turn each shape-param into a rotated solid rectangle.
(define rsr-1
  (lambda (lo-lo-sd)
    (if (null? lo-lo-sd)
        null
        (cons (rsr-0 (car lo-lo-sd))
              (rsr-1 (cdr lo-lo-sd))))))
```

* If I take the first element of `lo-lo-sd` (which I get with `car`,
  it is a list of shape descriptions.

What if I have a list of (either (a) shape description or (b) a list
of shape descriptions)?

```
(rsr-1 (list thin-shape
             (make-list 4 thin-shape)
             thin-shape))
```

It doesn't match the requirements in the documentation.  So we expect
it to fail.

And we are right.

So, we want to write a better procedure.

```
;;; (rsr-1-improved stuff) -> list-of (either image? or list-of image?)
;;;   stuff : list-of (either shape-params? or list-of shape-params?)
;;; Turn each shape-param into a rotated solid rectangle.
(define rsr-1-improved
  (lambda (stuff)
    (if (null? stuff)
        null
        (cons (if (shape-params? (car stuff))
                  (rotated-solid-rectangle (car stuff))
                  (rsr-0 (car stuff)))
              (rsr-1-improved (cdr stuff))))))
```

You may assume that `shape-params?` is defined.

Questions
---------

### Administrative

How do I pay tokens to turn something in late?

> You will be charged automatically.

How do I tell how I'm doing on tokens?

> Sam plans to update those this coming weekend.

### MP4

Are you going to record the video?

> Um ... no.  That's why we did the discussion.

Lab
---

Skipped.
