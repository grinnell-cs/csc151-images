---
title: "EBoard 08: RGB Colors"
number: 8
section: eboards
held: 2023-09-11
link: true
---
# {{ page.title }}

_Reminders to Self_

* **Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* A few notes on Quiz 1
* Questions
* Lab

Administrivia
-------------

### Introductory notes

* Covid and other illnesses remains issues.  Consider masking.  Clean
  your keyboards.
* Today's lab is new this semester.  Don't worry if you don't get too
  far in it.
    * I'll be spending the first few minutes of lab trying to get
      the autograder working.
* Our mentors graciously provided extra copies of their helpful
  handouts.

### Upcoming Token activities

Academic

* Tuesday 12 Sept 2023, Noon, CS Table (readings at ends of the hallway)
* Thursday 14 Sept 2023, 6pm, "Microsfot Campus Visit" (HSSC Kernel/A1231)

Cultural

* Thursday 14 Sept 2023, 8pm, Writers @ Grinnell w/Claire Forrest '13

Peer

* Tuesday 12 Sept 2023, 7pm, Volleyball vs. Wartburg

Wellness

Misc

* Friday 15 Sept 2023, Noon, Whale Room, Lunch with Young Alums in Tech

### Other Good Things

### Upcoming work

* Monday Night: MP2 pre-assessment.
* Tuesday night: Reading responses
* Wednesday morning: Today's lab writeup due
* Thursday Night: MP2 due.
* Friday: Quiz
* Friday Night: MP2 post-assessment

### Quiz notes

```
(define square
 (lambda (x)
   (* x x)))

(define f
 (lambda (x)
   (square (+ x 1)))

(define g
 (lambda (x)
   (+ (square x) 1)))

(define p
 (lambda (x y)
   (- (f x) (g y))))

(define a 3)

(define b 2)
```

There should be an "S" (for "Satisfactory") or "Redo" on your quizzes.
There are also somoe comments.

I found myself writing the following things multiple time.  Please watch
these issues.  (None of these, by themselves, were enough to move you
from Satisfactory to Redo.)

* We normally evaluate parameters left to right.
* We normally do only one substitution of a variable at a time.
* We normally evaluate only one expression at a time.
* We normally finish evaluating one parameter before moving on to the
  subexpressions of the next.

More major issues.  These usually lead to Redos.

* Please do not skip steps.  This comment usually came with people 
  doing something like turning `(square 5)` into 25 rather than 
  first into `(* 5 5)`, or turning `(p -4 5)` into something other than
  `(- (f -4) (g 5))`.
* Please do not put parentheses around numbers.  Parentheses indicate
  expressions to be evaluated.
* Please include the full context.  This comment usually happens when
  someone goes from `(- (f -4) (g 5))` to `(square (+ -4 1))` without
  the surrounding context.

Note that my concern is less that you got "the right answer" at the
end than that you can show how we get there.  If you're skipping steps
and writing invalid Scheme, you haven't shown that you'll be able to
handle more complex evaluation.

Here's the full derivation as I'd hoped to see it.  (I don't plan
to go through it, but you can look for it on the eboard.)

```
    (p (- 8 (* a 4)) (+ (* b b) 1))
--> (p (- 8 (* 3 4)) (+ (* b b) 1))
--> (p (- 8 12) (+ (* b b) 1))
--> (p -4 (+ (* b b) 1))
--> (p -4 (+ (* 2 b) 1))
--> (p -4 (+ (* 2 2) 1))
--> (p -4 (+ 4 1))
--> (p -4 5)
--> (- (f -4) (g 5))
--> (- (square (+ -4 1)) (g 5))
--> (- (square -3) (g 5))
--> (- 9 (g 5))
--> (- 9 (+ (square 5) 1))
--> (- 9 (+ (* 5 5) 1))
--> (- 9 (+ 25 1))
--> (- 9 26)
--> -17
```

Questions
---------

`(rgb ...)` isn't working for me.

> Did you update our csc151 library?

> Did you remember `(require csc151)`.

What should I see for `(rgb ...)`?

> You should see "color info".  Something like `(color 255 0 128 255)`.

Why can't I use `(color-red "darksalmon")` to get the red component
of the color `"darksalmon"`?

> `color-red` expects an RGB (or RGBA) color value, not a string.
  You need to convert the string (color name) to an RGB color
  using `color-name->rgb`.

Lab
---
