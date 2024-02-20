---
title: "EBoard 13: Lists (Section 2)"
number: 13
section: eboards
held: 2024-02-19
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff 
* Some notes from SoLA 1 
* Some notes from MP2 
* Questions 

Administrative stuff
--------------------

* Prof. Perlmutter and I are still discussing what to do about the
  SoLA 1 issues. 
* I'll be working with Prof. Perlmutter and the mentors to discuss what
  to do for those of you who are still struggling with tracing.
* I'm still waiting for a replacement hearing aid. Expect me to continue
  to exhibit difficulty hearing.

### Reminders of good things

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

* No readings for Tuesday
* No lab writeup for Wednesday
* Wednesday, 2024-02-21, 11:00pm: [MP3](../mps/mp3)
    * [_Submit on Gradescope_](...)

Some notes from SoLA 1
----------------------

* Many of my students spent the full hour on cut and compose. I
  assume that you did the same. I generally suggest that you stop
  after the fifeen minutes unless you are making good progress.
  There's a difference between productive struggle and wasteful
  struggle.
* Good news! We should be through all of the round 2 topics by the
  Wednesday before SoLA 2.
* I'll remind you closer to SoLA 2, but doing practice problems
  (including some you write) is often the best way to prepare for a SoLA.

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
* Then we subtract that color from white
* Then we make it darker
* Then we make it darker again
* Then we Then we subtract it from white

Decomposition suggests we should think about building that "subtract from white"

```
(define subtract-from-white
  (lambda (color)
    (rgb-subtract (rgb 255 255 255) color)))

(define rgb-fun-two
  (o subtract-from-white 
     rgb-darker 
     rgb-darker 
     subtract-from-white 
     rgb-lighter))
```

Where's the lambda? Where's the parameter?

Every composition has an implicit parameter.  `(o fun1 fun2 fun3)` is 
"a function that takes one value, applies `fun3` to it, applies `fun2` 
to the result, and applies `fun1` to that result.

How do you know what type is appropriate as the input?

> It's whatever is appropriate for the last function in the composition.

> The documentation tells us.

```
;;; (rgb-fun-two color) -> rgb?
;;;   color : rgb?
;;; Do something fun to `color`. 
```

Detour: How does `subtract-from-white` work? Where are the calls to 
`rgb-red`, `rgb-green`, and `rgb-blue`?

> They are hidden in the implementation of `rgb-subtract`. `rgb-subtract`
  extracts components from each color, then subtracts the corresponding
  components from each other, and then combines them into an rgb color.

```
(define rgb-subtract
  (lambda (c1 c2)
    (rgb (- (rgb-red c1) (rgb-red c2))
         (- (rgb-green c1) (rgb-green c2))
         (- (rgb-blue c1) (rgb-blue c2))
         (rgb-alpha c1))))
```

What is `rgb-alpha`?

> The alpha component is the "opacity" of a color when you overlay things.
  255 is "completely opaque", 0 is "completely transparent".

> Demo on laptop

```
> (overlay (solid-circle 200 (rgb 255 0 0 255))
           (solid-square 200 (rgb 0 0 0 255)))
.
> (overlay (solid-circle 200 (rgb 255 0 0 192))
           (solid-square 200 (rgb 0 0 0 255)))
.
> (overlay (solid-circle 200 (rgb 255 0 0 128))
           (solid-square 200 (rgb 0 0 0 255)))
.
> (overlay (solid-circle 200 (rgb 255 0 0 64))
           (solid-square 200 (rgb 0 0 0 255)))
```

Where's the parameter to `rgb-fun-two`?

We can write `subtract-from-white` using `cut`.

```
(define subtract-from-white
  (lambda (color)
    (rgb-subtract (rgb 255 255 255) color)))

(define subtract-from-white
  (cut (rgb-subtract (rgb 255 255 255) <>)))
```

And then plug that into rgb-fun-two

```
(define rgb-fun-three
  (o (cut (rgb-subtract (rgb 255 255 255) <>))
     rgb-darker 
     rgb-darker 
     (cut (rgb-subtract (rgb 255 255 255) <>))
     rgb-lighter))
```

Why do functional programmers prefer this to the original one, even
though we've lost the helpful `lambda (color)`?

> It's more concise.

> Fewer parentheses. We love parentheses, but in moderation.

> With fewer parentheses, it may be easier to modify/edit/fix.

> It may even be a bit more readable.

Here's another example.

```
(define munge-shape
  (lambda (shape)
    (rotate
     (beside (solid-square 10 "black")
             (recolor 
              (rotate
               (scale shape 2)
               45)
              "red"))
     -45)))
```

How should we write this with cut and compose?

Hint: Think about the steps, then write out the individual steps with
cut, then combine them with compose.

* First we scale by 2. `(cut (scale <> 2))`
* Then we rotate by 45. `(cut (rotate <> 45))`
    * Unforunately, we can't do `(rotate (cut (scale <> 2)) 45))`
* Then we recolor to red, `(cut (recolor <> "red"))`
* Then we put it beside a solid black square, 
  `(cut (beside (solid-square 10 "black") <>))`
* Then we rotate by -45 `(cut (rotate <> -45))`

```
(define new-munge-shape
  (o (cut (rotate <> -45))
     (cut (beside (solid-square 10 "black") <>))
     (cut (recolor <> "red"))
     (cut (rotate <> 45))
     (cut (scale <> 2))))
```

Would we ever write a compose inside of a cut?

> Sure.

> Here's a bad example.

```
> (define rgbfun->namefun (cut (o rgb->color-name <> color-name->rgb)))
> (define color-name-darker (rgbfun->namefun rgb-darker))
> (color-name-darker "blue")
"blue"
> (color-name-darker "white")
"whitesmoke"
> (color-name-darker "yellow")
"yellow"
> (define color-name-darker (rgbfun->namefun (o rgb-darker rgb-darker)))
> (color-name-darker "white")
"gainsboro"
> (color-name-darker "yellow")
"gold"
> (color-name-darker "gold")
"orange"
```

Some notes from MP2
-------------------

* I was surprised to see so many blank acknowledgements sections.
    * If you get help from the evening tutors, acknowledge them.
    * If you talk to someone about the mini-project, acknowledge them.
    * If you get help from Prof. Perlmutter outside of class, acknowledge me.
* Please use YYYY-MM-DD format for dates. They are unambiguous.
    * 02/11/2024 could be February 11 or November 2.
    * (Sorry, I don't have a good strategy for being more inclusive
      to those who use other calendar systems.)
    * It also helps when you want the computer to sort multiple
      versions of a file.
* Please read the instructions and examples. We had some students submit
  multiple files.
* Please don't include expressions in the middle of your definitions
  pane.  When you're trying out your procedures, you should do so
  in the interactions pane. (Comment them out.)

### Avoiding incompletes

A hint: You are much better off writing a trivial procedure, like
the following, than submitting nothing for part of the assignment.

```
; I know this isn't write
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

* You could write procedures like `pentagon-point-one`, `pentagon-point-two`,
  etc.
* You could use techniques that we have not yet learned, like `let`
  or `map`.
* Maybe we could compose procedures together.

Some notes from your pre-reflections on MP3
-------------------------------------------

_What do you see as the key concepts that this assignment is asking you to learn or develop?_

Please think about big-picture issues and what we've been doing lately.

_Without looking at any resources (e.g., readings, labs, your notes), write down everything you know that might be useful for this assignment._

This should really be a brain dump. Write procedures. Write procedure names.

_What resources (e.g., individual procedures you've written, readings, labs) will be helpful as you work on this assignment?_

I'd like to see more notes on individual procedures. Now's the time to look some up.

_How long do you expect this assignment to take?_

Please express this in hours, not days or weeks.

Questions
---------

### Administrative

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

(define rainbow-colors
  (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))

```

b. Using `apply` and `map`, make a picture of seven outlined circles in darker versions of the rainbow colors (computed by using two calls to `rgb-darker`).  Note that you'll need to convert the color names to RGB colors with `color-name->rgb` and then make them darker with two calls to `rgb-darker`.

If you can't apply darker to a color name, you have to make the name into an RGB. Then you can make those darker. And then darker again. And then make those colors into outlined circles.

```
> (map (o thickly-outlined-circle rgb-darker rgb-darker color-name->rgb)
       rainbow-colors)
'(. . . . . . .)
> (apply beside (map (o thickly-outlined-circle rgb-darker rgb-darker color-name->rgb)
       rainbow-colors))
.
```
