---
title: "EBoard 13: Lists"
number: 13
section: eboards
held: 2024-02-19
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [10 min]
* Some notes from SoLA 1 [10 min]
* Some notes from MP2 [10 min]
* Questions [10 min]
* Lab [35 min or less]
* Turn in lab [5 min]

Administrative stuff
--------------------

* I've put in an Academic Alert for anyone who has below 4/7 on the
  LAs right now. AAs are primarily intended to help us keep track of
  people who might be struggling a bit. Academic Advising might reach
  out to you.
    * Feel free to reach out to me or to Academic Advising if you
      feel like you're struggling and I didn't send in an AA.
* Prof. Perlmutter and I are still discussing what to do about the
  SoLA 1 issues. Stay tuned. I've released the graded SoLAs for
  the time being so that you can see how you've done. However, if the
  "dorm lounge" policy goes into effect, those will change.
* I'll be working with Prof. Perlmutter and the mentors to discuss what
  to do for those of you who are still struggling with tracing.
* I'm still waiting for a replacement hearing aid. Expect me to continue
  to exhibit difficulty hearing. (It's worse today because my other hearing
  aid didn't charge. I may ask those up front to help out.)
* I think I've responded to all of today's readings, the MP3 pre-assessments,
  and the SoLA post-assessments.
* I've been teaching section 2 while Prof. Perlmutter is ill, so you'll
  see extra eboards.

### Token activities

Academic/Scholarly

* Tuesday, 2024-02-20, noon--1:00pm, Some PDR.
  _CS Table_.
* Tuesday, 2024-02-20, 4:15-5:30pm, HSSC A1231 (the Kernel).
  _The Meskwaki and the Amana Colonies_.
* Tuesday, 2024-02-20, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-02-22, 11:00-noon, JRC 101.
  _Scholars' Convocation: Luis Fabiano De Assis on Human Trafficking._
* Thursday, 2024-02-22, 4:00pm, Room TBD.
  _CS Extra: Declaring a CS Major._
* Thursday, 2024-02-22, 7:00pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-02-23, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._
* Friday, 2024-02-23, 7:00--9:00pm, Sebring-Lewis.
  _Squatters on Red Earth_.

Peer

Wellness

* Tuesday, 2024-02-20, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-20, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-20, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

* Monday, 2024-02-20, 9-11pm, Bob's Underground. 
  _Bob's undergound open mic night 9-11pm_

### Upcoming work

* Tuesday, 2024-02-20, 11:00pm: Reading responses
    * [_Submit on Gradescope_](...)
* Wednesday, 2024-02-21, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-21, 11:00pm: [MP3](../mps/mp3)
    * [_Submit on Gradescope_](...)
* Sunday, 2024-02-25, 11:00pm, [MP2](../mps/mp2) Redo
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4113572/)

Some notes from SoLA 1
----------------------

* Many of you spent the full hour on cut and compose. I generally suggest
  that you stop after the fifeen minutes unless you are making good progress.
  There's a difference between productive struggle and wasteful struggle.
* Good news! We should be through all of the round 2 topics by the
  Wednesday before SoLA 2.
* I'll remind you closer to SoLA 2, but doing practice problems (including
  some you write) is often the best way to prepare for a SoLA.

### Cut and compose

This problem gave the most difficulty. So we're going to talk through
a similar problem.

First, let's review what the two procedures do.

* `cut` builds a procedure by "cutting out" parts of an expression. You
  can also think about it as filling in some, but not all, parameters
  to a procedure.
* `compose` (`o`) sequences unary procedures, creating a new procedure
  that applies them right to left.

Let's consider an example.

```
(define rgb-fun-one
  (lambda (color)
    (rgb-subtract (rgb 255 255 255)
                  (rgb-darker
                   (rgb-darker
                    (rgb-subtract (rgb 255 255 255)
                                  (rgb-lighter color)))))))
```

TPS: Describe in English what's happening.

* First we make the color lighter
* Then we subtract it (the result of the prior command) from white
* Then we make it darker
* Then we make it darker again
* Then we subtract it from white
* And then we're done

We can rewrite that to ...

```
(define subtract-from-white
  (lambda (color)
    (rgb-subtract (rgb 255 255 255) color)))

(define rgb-fun-one
  (o subtract-from-white rgb-darker rgb-darker subtract-from-white rgb-lighter))
```

Where's the parameter to `rgb-fun-one`?

> It's implicit. The `o` says "this is a function that applies `rgb-lighter` to
  its parameter, the subtract-from-white to the result, then rgb-darker to the
  result, then rgb-darker to the new result, then subtract-from white.

Can we verify that it's a procedure and that it works similarly?

```
> rgb-fun-one
#<procedure:...pkgs/csc151/hop.rkt:170:4>
> (rgb-fun-one (rgb 255 0 0))
.
```

Can we compose a procedure that needs multiple parameters?

> Nope. You can't compose it, at least not given how we've written compose.

> For now, we only compose one-parameter (unary) procedures.

Let's revisit `subtract-from-white`.

```
(define subtract-from-white
  (lambda (color)
    (rgb-subtract (rgb 255 255 255) color)))
``

This is a candidate for `cut`. Rewrite subtract-from-white using `cut`.

```
(define subtract-from-white
  (cut (rgb-subtract (rgb 255 255 255) <>)))
```

Once we have that, we can just shove the `cut` into our composition.

```
(define rgb-fun-one
  (o (cut (rgb-subtract (rgb 255 255 255) <>))
     rgb-darker 
     rgb-darker 
     (cut (rgb-subtract (rgb 255 255 255) <>))
     rgb-lighter))
```

Do we really need `subtract-from-white`? 

> No. That was just to get us moving forward in thinking about the problem.
  (Aka decomosition.)

Here's another example.

``
(define munge-shape
  (lambda (shape)
    (rotate
     (beside (solid-square 10 "black")
             (recolor (rotate (scale shape 2)
                              45)
                      "red"))
     -45)))
```

What steps are there?

* Scale the shape by 2 `(cut (scale <> 2))`
* Rotate by 45 `(cut (rotate <> 45))`
* Recolor to red `(cut (recolor <> "red"))`
* Put a solid black square next to it `(cut (beside (solid-square 10 "black") <>))`
* Rotate by -45 `(cut (rotate <> -45))`

How do we turn those into Racket?

* See above.

```
(define munge-shape
  (o (cut (rotate <> -45))
     (cut (beside (solid-square 10 "black") <>))
     (cut (recolor <> "red"))
     (cut (rotate <> 45))
     (cut (scale <> 2))))
```

* This new one is a bit shorter.
* Once we've figured out how to read cut and compose, the second seems
  a bit easier to read.

Other notes

* We often need to use `cut` on multiple procedures when we employ this
  approach.

How do we document the cut and composed procedures given that they
don't have explicit parameters?

> We pretend they have parameters.

```
;;; (munge-shape shape) -> image?
;;;   shape : image?
;;; Create a larger version of the shape with a diamond attached
;;; to its upper-left-hand-corner.
```

```
;;; (subtract-from-white color) -> rgb?
;;;   color : rgb?
;;; Subtract `color` from `white`, computing the pseudo-complement
;;; of the color.
```

Some notes from MP2
-------------------

* I was surprised to see so many blank acknowledgements sections.
    * If you get help from the evening tutors, acknowledge them.
    * If you talk to someone about the mini-project, acknowledge them.
    * If you get help from SamR outside of class, acknowledge me.
* Please use YYYY-MM-DD format for dates. They are unambiguous.
    * 02/11/2024 could be February 11 or November 2.
    * (Sorry, I don't have a good strategy for being more inclusive
      to those who use other calendar systems.)
    * The computer also does a better job sorting those.
* Please read the instructions and examples. We had some students submit
  multiple files.
* Please don't include expressions in the middle of your definitions
  pane.  When you're trying out your procedures, you should do so
  in the interactions pane.

### Avoiding incompletes

A hint: You are much better off writing a trivial procedure, like
the following, than submitting nothing for part of the assignment.

```
(define solid-octagon
  (lambda (side-length color)
    (solid-square side-length color)))
```

This will probably pass the one-star tests, helping ensure that you
get an R (which doesn't require a token for the first resubmit) than
an I (which does).

### Making your code less repetitious

Many of you wrote something like the following for `solid-pentagon`.

```
(define solid-pentagon
  (lambda (side-length color)
    (solid-polygon (list (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 2/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 2/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 4/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 4/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 6/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 6/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 8/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 8/5 pi))))
                         (pt (real-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 10/5 pi)))
                             (imag-part (make-polar (/ side-length (* 2 (sin (/ pi 5))))
                                                    (* 10/5 pi)))))
                   color)))
```

Isn't the repetitious? What could you do to make it less so?

* Write a procedure that converts an angle and a radius to a point.
* [If we knew `map`, we could use that.]
* Write a helper function for the x coordinate and the y coordinate.
* The radius is always the same, so we might want to find a way to
  avoid that recompuation.

```
(define solid-pentagon
  (lambda (side-length color)
    (alternate-solid-pentagon (/ side-length (* 2 (sin (/ pi 5)))) color)))

(define alternate-solid-pentagon
  (lambda (radius color)
    (solid-polygon (list (pt (real-part (make-polar radius
                                                    (* 2/5 pi)))
                             (imag-part (make-polar radius
                                                    (* 2/5 pi))))
                         (pt (real-part (make-polar radius
                                                    (* 4/5 pi)))
                             (imag-part (make-polar radius
                                                    (* 4/5 pi))))
                         (pt (real-part (make-polar radius
                                                    (* 6/5 pi)))
                             (imag-part (make-polar radius
                                                    (* 6/5 pi))))
                         (pt (real-part (make-polar radius
                                                    (* 8/5 pi)))
                             (imag-part (make-polar radius
                                                    (* 8/5 pi))))
                         (pt (real-part (make-polar radius
                                                    (* 10/5 pi)))
                             (imag-part (make-polar radius
                                                    (* 10/5 pi)))))
                   color)))
```

Some notes from your pre-reflections on MP3
-------------------------------------------

_What do you see as the key concepts that this assignment is asking you to learn or develop?_

Please think about big-picture issues and what we've been doing lately.

_Without looking at any resources (e.g., readings, labs, your notes), write down everything you know that might be useful for this assignment._

This should really be a brain dump. Write procedures. Write procedure names.

```
Here's an example of a procedure where I change a color.
(define rgb-invert
  (cut (rgb-subtract (rgb 255 255 255) <>)))
```

_What resources (e.g., individual procedures you've written, readings, labs) will be helpful as you work on this assignment?_

I'd like to see more notes on individual procedures. Now's the time to look some up.

```
In the class notes for class 13 <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2024Sp/eboards/eboard13>, we wrote a procedure that made colors "something". It looked like this.

```
(define rgb-fun-one
  (o (cut (rgb-subtract (rgb 255 255 255) <>))
     rgb-darker
     rgb-darker 
     (cut (rgb-subtract (rgb 255 255 255) <>))
     rgb-lighter))
```

_How long do you expect this assignment to take?_

Please express this in hours, not days or weeks.

Questions
---------

### Administrative

Will Sam update tokens so that we can enter more?

> Sure. It's on my agenda for tonight.

### MP2

Can you give us a diagram for outlined right triangles?

> Sure. I'll add it to my agenda for tonight.

### MP3

### Lists

Can you go over the darker circles problem?

> Sure.

```
;;; (thickly-outlined-circle color) -> image?
;;;   color : color?
;;; Make a thickly outlined circle of the specified color.
(define thickly-outlined-circle
  (lambda (color)
    (overlay (outlined-circle 20 "black" 5)
             (solid-circle 20 color))))

(define rainbow-color-names
  (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))
```

b. Using `apply` and `map`, make a picture of seven outlined circles in darker versions of the rainbow colors (computed by using two calls to `rgb-darker`).  Note that you'll need to convert the color names to RGB colors with `color-name->rgb` and then make them darker with two calls to `rgb-darker`.

What do we want to do to each color name?

* convert to an RGB
* then make it darker
* then make it darker
* then make it into a circle

It's an opportunity to compose. And map

```
(map (o thickly-outlined-circle rgb-darker rgb-darker color-name->rgb)
     rainbow-color-names)
```

```
> (apply beside (map (o thickly-outlined-circle rgb-darker rgb-darker color-name->rgb)
                     rainbow-color-names))
```

### More questions on lists and such

When do we use `apply`?

> When we have a procedure that expects a bunch of parameters and we've
  somehow managed to put all of those parameters into a list.

> Most frequently, when we have a procedure that expects "as many parameters
  as you give it" and a list. We might apply `+`, `string-append`, 
  `beside`, `above`.

Lab
---
