---
title: "EBoard 05: Mental models (Section 2)"
number: 5
section: eboards
held: 2025-02-03
link: true
---
# {{ page.title }}

_Today's start-of-class procedure_

* Take one of the business cards from outside the jar.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* If you are first, log in, but do not start the lab.
* When a second person arrives, introduce yourselves .

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

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
* In sections 2 & 3, we're going to switch to doing quizzes at the end
  of class, rather than the beginning. The "stop then start again" model
  didn't seem to work well.
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

Wellness

* Tuesday, 2025-02-04, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 2025-02-04, 4:30--6:30 p.m., BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 2025-02-04, 5:00--6:00 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Tuesday, 2025-02-04, 7:15--8:15 p.m., HSSC S1003 (Atrium).
  _Therapy Dogs_.
* Wednesday, 5 February 2025, 4:00--6:00 p.m., Harris.
  _Org Fair!_

Misc

* Tuesday, 4 FebrUary 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_.
* Thursday, 6 February 2025, 4:15--5:00 p.m., Herrick.
  _Installation Ceremony for Endowed Professorships_.
* Friday, 7 February 2025, 5:30--8:00 p.m., Downtown Grinnell.
  _The Sweet Stroll_.
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

; Instructions: Make three concentric circles with red, a mix of red and
; blue, and then blue.

(define red-blue-mix
  (overlay (solid-circle 20 (rgb 255 0 0))
           (solid-circle 40 (rgb 255 0 255))
           (solid-circle 60 (rgb 0 0 255))))
```

Why might I object to that definition of `red-blue-mix`? (TPS)

Given that we alreaday wrote `ccc`, we SHOULD write 

```
(define red-blue-mix (ccc (rgb 255 0 0) (rgb 255 0 255) (rgb 0 0 255)))
```

Notes and questions on MP2 and beyond
-------------------------------------

How does the `describe-image` procedure work?

> When you make an image (using almost any image-making procedure), you can specify a description of the image. `describe-image` then grabs that description. If you don't provide a description, it does the best job it can. (We'll do an example in class.)

```racket
> (define tri (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100))))
. . solid-polygon: arity mismatch;
 the expected number of arguments does not match the given number
  given: 1
> (define tri (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red"))
> tri
.
> (describe-image tri)
"a solid red polygon built from the points (list (pt 0 0) (pt 25 75) (pt 0 100))"
> (define tri (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red"
                             "the best red triangle ever"))
> tri
.
> (describe-image tri)
"the best red triangle ever"
> (define something (above (solid-isosceles-triangle 50 40 "red")
                           (solid-square 40 "brown")))
> (describe-image something)
"a center-aligned stack of images (a solid red 50-by-40 isosceles triangle above a solid brown square with side length 40)"
> something
.
> (define something (above (solid-isosceles-triangle 50 40 "red")
                           (solid-square 40 "brown")
                           "a simple picture of a house"))
> something
.
> (describe-image something)
"a simple picture of a house"
```

Can you provide more clarification on this part of the assignment: "You should use `outlined-polygon` for this part of the assignment. Note that `outlined-polygon` only works correctly if you create the points in clockwise order. Otherwise, the outline goes on the "inside" rather than the "outside"."

> I'll try drawing pictures in class

```drracket
> (define tri2 (outlined-polygon (list (pt 0 0) (pt 0 100) (pt 25 75))
                                 "red"
                                 20
                                 "the best triangle ever, now with a red outline"))
> (describe-image tri2)
"the best triangle ever, now with a red outline"
> tri2
.
> (define tri2 (outlined-polygon (list (pt 0 0) (pt 25 75) (pt 0 100))
                                 "red"
                                 20
                                 "the best triangle ever, now with a red outline"))
> (describe-image tri2)
"the best triangle ever, now with a red outline"
> tri2
.
```

What is meant by "Code has been reformatted with Ctrl-I before submitting."

> If you hit Ctrl-I, the code is re-indented for readability. You're now at the stage where you should be striving for moderately well organized code..

What does the "arity mismatch" error message mean and how can we fix the error?

> It usually means that you've provided the wrong number of arguments in calling a procedure. You fix it by providing the correct number of arguments. You may have to look at the documentation to figure out what arguments you are missing.

Will you please describe DrRacket's understanding of the cordinate system? A visual representation would be useful.

> I'll draw one in class.

I still don't quite understand what the program does when it shifts the image. "As the documentation for solid-polygon suggests, no matter what coordinates you use for the vertices, the polygon gets shifted so that the leftmost point is at the left edge of the image and the topmost point is at the top edge of the image. You can likely use this feature to your advantage. For example, if you’re making a somewhat symmetrical image, you can use (0,0) as the center."

> I'll try to go over that in class.

```drracket
> (above (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red")
         (solid-polygon (list (pt 50 0) (pt 75 75) (pt 50 100)) "blue"))
.
> (above (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red")
         (hshift (solid-polygon (list (pt 50 0) (pt 75 75) (pt 50 100)) "blue")
                 50))
.
> (above/align "left"
               (solid-polygon (list (pt 0 0) (pt 25 75) (pt 0 100)) "red")
               (hshift (solid-polygon (list (pt 50 0) (pt 75 75) (pt 50 100)) "blue")
                       50))
.
```

Can we make a pentagon "by hand" so that I understand all of the steps?

> Certainly.

```drracket
> (define theta (* 2/5 pi))
> (define radius (/ 50 (sin (* 1/5 pi))))
> (make-polar radius theta)
26.286555605956682+80.90169943749473i
> (define pt1x (real-part (make-polar radius theta)))
> (define pt1y (imag-part (make-polar radius theta)))
> pt1y
80.90169943749473
> (define pt2x (real-part (make-polar radius (* 2 theta))))
> (define pt2y (imag-part (make-polar radius (* 2 theta))))
> (define pt3 (pt (real-part (make-polar radius (* 2 theta)))
                  (imag-part (make-polar radius (* 2 theta)))))
> (define pt3 (pt (real-part (make-polar radius (* 3 theta)))
                  (imag-part (make-polar radius (* 3 theta)))))
> (define pt4 (pt (real-part (make-polar radius (* 4 theta)))
                  (imag-part (make-polar radius (* 4 theta)))))
> (define pentagon (solid-polygon (list (pt radius 0)
                                        (pt pt1x pt1y)
                                        (pt pt2x pt2y)
                                        pt3
                                        pt4)
                                  "brown"
                                  "a brown pentagon with side length 100"))

> pentagon
.
> (describe-image pentagon)
"a brown pentagon with side length 100"
> (beside (solid-square 100 "black")
          pentagon)
.
```

For part three, we have to make something creative. "What is particularly
creative?"

> Something that's not an immediate consequence of parts one and two.

> As the SCOTUS says, "I'll know it when I see it."

Q&A
---

### Administrative

### Racket/Scheme

What does "non-trivial" mean?

> "Trivial" means "as simple as possible". Non-trivial means "not trivial". 
  In Scheme, if it needs to be further evaluated, it's non-trivial.

> Alternately, for a typical expression, if there are parentheses around
  any part, that part is non-trivial. If there aren't parentheses, it's
  trivial. `3` is trivial. `"Hello"` is trivial. `(equal? 3 "hello")` is 
  non-trivial.

In the example: `(add-3 (* 2 3) (+ 8 3) (/ 1 2))`, do we start with solving 
`(/ 1 2)` first? Or `(* 2 3)` first? Or all together?

> We usually go left to right on the subexpressions. 
  (The official Scheme standard says that we can do them in any order.)

## Lab

Today's lab is on paper! Grab a sheet of paper and a pen.
