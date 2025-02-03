---
title: "EBoard 05: Mental models (Section 1)"
number: 5
section: eboards
held: 2025-02-03
link: true
---
# {{ page.title }}

_Today's start-of-class procedure_

* Take one of the business cards from **OUTSIDE** the jar.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* If you are first, log in, but do not start the lab.
* When a second person arrives, introduce yourselves.

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Lots of administrative stuff [10 min]
* MP2 [15 min]
* Questions [10 min]
* Lab [45 min]

Administrative stuff
--------------------

### Introductory notes

* Most of you are completing the readings in about an hour or a little
  less. A few are taking 1.5 hours. Nine took two or more hours. Folks in
  that last group should probably talk to me about how we can make readings
  more efficient. I'd also encourage you to talk to academic advising.
* Wednesday's quiz is on decomposing things.
* There will also be a makeup quiz on procedures.
* Sam will be here at 8:00 a.m. for those who want to start early.
* Don't forget that you can bring a page of hand-written notes to the quiz!

### Upcoming activities

Scholarly

* Tuesday, 2025-02-04, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: Video Games_
* Thursday, 2025-02-13, 11:00 a.m.--Noon, JRC 101.
  _Grinnell Lecture: Darrius Hills on "The Achievement of Identity: Soul Work, Salvation, and Black Manhood in the Religious Imagination of James Baldwin"_.

Artistic

* Tuesday, 2025-02-04, 4:00-5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Kaufman, Strangfeld, and Yurkevicz_.
* Tuesday, 2025-02-11, 4:00-5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Chen, Kluber, and Tavares.

Multicultural

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Wednesday, 2025-02-05, 4:00--6:00 p.m., Harris.
  _Org Fair!_
    * Try to find Sarah Zoomba-ing around.

Wellness

* Tuesday, 2025-02-04, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 2025-02-04, 4:30--6:30 p.m., BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 2025-02-04, 5:00--6:00 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Tuesday, 2025-02-04, 7:15--8:15 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Friday, 2025-02-07, 5:30--8:00 p.m., Downtown Grinnell.
  _The Sweet Stroll_.

Misc

* Tuesday, 4 Febraury 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_.
* Thursday, 6 February 2025, 4:15--5:00 p.m., Herrick.
  _Installation Ceremony for Endowed Professorships_.
* Tuesday, 18 February 2025. 6:00--7:00 p.m., HSSC A1231.
  _Make a Portfolio Website_.
    * Please register at ????

### Other good things

_These do not earn tokens, but are worth your consideration._

### Upcoming work

* Tuesday, 2025-02-04
    * Readings for Wednesday's class.
        * [Anonymous procedures](../readings/anonymous-procedures)
        * [Transforming RGB](../readings/transforming-rgb)
        * [Transforming images](../readings/transforming-images)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5717112)
* Wednesday, 2025-02-05
    * Turn in today's lab if you didn't do so today.
    * Quiz! (decomposition)
    * Makeup quiz! (procedures)
* Thursday, 2025-02-06
    * [Mini-project 2](../mps/mp02) due
    * [Submit mini-project 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5717086)
    * Readings
    * Reading response
    * Etc.
* Friday, 2025-02-07
    * Mini-project 3 distributed
    * [Post reflection on MP2] due

A note from last class
----------------------

I saw many of you doing something like this.

```
(define ccc
  (lambda (c1 c2 c3)
    (overlay (solid-circle 20 c1)
             (solid-circle 40 c2)
             (solid-circle 60 c3))))
(define red-blue-mix
  (overlay (solid-circle 20 (rgb 255 0 0))
           (solid-circle 40 (rgb 255 0 255))
           (solid-circle 60 (rgb 0 0 255))))
```

Why might I object to that definition of `red-blue-mix`? (TPS)

> Now that you've defined `ccc`, it's much more concise to use
  `(ccc (rgb 255 0 0) (rgb 255 0 255) (rgb 0 0 255))`.

Notes and questions on MP2 and beyond
-------------------------------------

How does the `describe-image` procedure work?

> When you make an image (using almost any image-making procedure), you can specify a description of the image. `describe-image` then grabs that description. If you don't provide a description, it does the best job it can. (We'll do an example in class.)

```racket

> (solid-isosceles-triangle 50 20 "blue")
.
> (describe-image (solid-isosceles-triangle 50 20 "blue"))
"a solid blue 50-by-20 isosceles triangle"
> (describe-image (above (solid-isosceles-triangle 50 20 "red")
                         (solid-square 40 "brown")))
"a center-aligned stack of images (a solid red 50-by-20 isosceles triangle above a solid brown square with side length 40)"
> (above (solid-isosceles-triangle 50 20 "red")
                         (solid-square 40 "brown"))
.
> (define house (above (solid-isosceles-triangle 50 20 "red")
                       (solid-square 40 "brown")
                       "a mediocre image of a house"))
> house
.
> (describe-image house)
"a mediocre image of a house"
> (define triangle (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100))))
. . solid-polygon: arity mismatch;
 the expected number of arguments does not match the given number
  given: 1
> (define triangle (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red"))
> triangle
.
> (describe-image triangle)
"a solid red polygon built from the points (list (pt 0 0) (pt 25 75) (pt 0 100))"
```

Can you provide more clarification on this part of the assignment: "You should use `outlined-polygon` for this part of the assignment. Note that `outlined-polygon` only works correctly if you create the points in clockwise order. Otherwise, the outline goes on the "inside" rather than the "outside"."

> I'll try drawing pictures in class

```racket
> (define triangle (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red"
                                  "the best red triangle you've ever encountered"))
> triangle
.
> (describe-image triangle)
"the best red triangle you've ever encountered"
> (define triangle (solid-polygon (list (pt 0 0) (pt 0 100) (pt 25 75)) "red"
                                  "the best red triangle you've ever encountered"))
> triangle
.
> (describe-image triangle)
"the best red triangle you've ever encountered"
> (define triangle (outlined-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red" 20
                                     "the best red triangle you've ever encountered, now outlined"))
> triangle
.
> (describe-image triangle)
"the best red triangle you've ever encountered, now outlined"
> (define triangle (outlined-polygon (list (pt 0 0)  (pt 0 100) (pt 25 75)) "red" 20
                                     "the best red triangle you've ever encountered, now outlined"))
> (describe-image triangle)
"the best red triangle you've ever encountered, now outlined"
> triangle
.
```

What is meant by "Code has been reformatted with Ctrl-I before submitting."

> If you hit Ctrl-I, the code is re-indented for readability. You're now at the stage where you should be striving for moderately well organized code..

What does the "arity mismatch" error message mean and how can we fix the error?

> It usually means that you've provided the wrong number of arguments in calling a procedure. You fix it by providing the correct number of arguments. You may have to look at the documentation to figure out what arguments you are missing.

```
> (outlined-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)))
. . outlined-polygon: arity mismatch;
 the expected number of arguments does not match the given number
  given: 1
> (outlined-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red")
. . outlined-polygon: arity mismatch;
 the expected number of arguments does not match the given number
  given: 2
> (outlined-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red" 10)
.
> (outlined-polygon (list (pt 0 0) (pt 25 75) (pt 0 100) "red" 10))
. . outlined-polygon: arity mismatch;
 the expected number of arguments does not match the given number
  given: 1
```

Will you please discribe DrRacket's understanding of the coordinate system? A visual representation would be useful.

> I'll draw one in class.

I still don't quite understand what the program does when it shifts the image. "As the documentation for solid-polygon suggests, no matter what coordinates you use for the vertices, the polygon gets shifted so that the leftmost point is at the left edge of the image and the topmost point is at the top edge of the image. You can likely use this feature to your advantage. For example, if you’re making a somewhat symmetrical image, you can use (0,0) as the center."

> I'll try to go over that in class.

```
> (solid-polygon (list (pt 75 75) (pt 50 100) (pt 100 100)) "orange")
.
> (above (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "green")
         (solid-polygon (list (pt 75 75) (pt 50 100) (pt 100 100)) "orange"))
.
> (above (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "green")
         (hshift (solid-polygon (list (pt 75 75) (pt 50 100) (pt 100 100)) "orange") 50))
.
> (above/align "left" (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "green")
         (hshift (solid-polygon (list (pt 75 75) (pt 50 100) (pt 100 100)) "orange") 50))
.
> (above/align "left" (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "green")
         (hshift (solid-polygon (list (pt 75 75) (pt 50 100) (pt 100 100)) "orange") 50))
.
```

Can we make a pentagon "by hand" so that I understand all of the steps?

> Certainly.

```
; With an incorrect definition of radius
> (define radius (* 50 (sin (* 2/10 pi))))
> (define angle (* 2/5 pi))
> (make-polar radius angle)
9.081781600067012+27.95084971874737i
> (define pt1-x (real-part (make-polar radius angle)))
> pt1-x
9.081781600067012
> (define pt1-y (imaginary-part (make-polar radius angle)))
. . imaginary-part: undefined;
 cannot reference an identifier before its definition
> (define pt1-y (imag-part (make-polar radius angle)))
> (define pt2-x (real-part (make-polar radius (* 2 angle))))
> (define pt2-y (imag-part (make-polar radius (* 2 angle))))
> (define pt3-x (real-part (make-polar radius (* 3 angle))))
> (define pt3-y (imag-part (make-polar radius (* 3 angle))))
> (define pt4-x (real-part (make-polar radius (* 4 angle))))
> (define pt4-y (imag-part (make-polar radius (* 4 angle))))
> (solid-polygon (list (pt radius 0)
                       (pt pt1-x pt1-y)
                       (pt pt2-x pt2-y)
                       (pt pt3-x pt3-y)
                       (pt pt4-x pt4-y))
                 "purple")
.
> (beside (solid-square 100 "black")
          (solid-polygon (list (pt radius 0)
                               (pt pt1-x pt1-y)
                               (pt pt2-x pt2-y)
                               (pt pt3-x pt3-y)
                               (pt pt4-x pt4-y))
                         "purple"))
.
; Whoops!
```

```
; correct radius
> (define radius (/ 50 (sin (* 2/10 pi))))
> (define pt1-x (real-part (make-polar radius angle)))
> (define pt1-y (imag-part (make-polar radius angle)))
> (define pt2-x (real-part (make-polar radius (* 2 angle))))
> (define pt2-y (imag-part (make-polar radius (* 2 angle))))
> (define pt3-x (real-part (make-polar radius (* 3 angle))))
> (define pt3-y (imag-part (make-polar radius (* 3 angle))))
> (define pt4-x (real-part (make-polar radius (* 4 angle))))
> (define pt4-y (imag-part (make-polar radius (* 4 angle))))
> (beside (solid-square 100 "black")
          (solid-polygon (list (pt radius 0)
                               (pt pt1-x pt1-y)
                               (pt pt2-x pt2-y)
                               (pt pt3-x pt3-y)
                               (pt pt4-x pt4-y))
                         "purple"))
.
```

Q&A
---

### Administrative

### Racket/Scheme

What does "non-trivial" mean?

> "Trivial" means "as simple as possible". Non-trivial means "not trivial". 
  In Scheme, if it needs to be further evaluated, it's non-trivial.

In the example: `(add-3 (* 2 3) (+ 8 3) (/ 1 2))`, do we start with solving 
`(/ 1 2)` first? Or `(* 2 3)` first? Or all together?

> We usually go left to right on the subexpressions. 
  (The official Scheme standard says that we can do them in any order.)

## Lab

Today's lab is on paper! Grab a sheet of paper and a pen.
