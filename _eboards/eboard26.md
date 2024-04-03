---
title: "EBoard 26: Pairs and pair structures"
number: 26
section: eboards
held: 2024-04-03
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [10 min]
* Questions [10 min]
* Lab [55 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Reminder: Grinnellians have returned from around the world. 
    * **Consider masking.**
* How was Monday's substitute?
* Friday is the last day to withdraw from classes. Please chat with me
  if you are questioning whether or not you will pass the course.
    * Thursday's office hours are all booked. I should also be
      available from 8:30--9:00 a.m., from 12:15--1:00 p.m., and
      from 3:30--4:00 p.m. (Email me to set up a time.)
* As you preregister for next semester, please consider taking CSC-161.
* Our graders are still working on MP5 and the various redos.
* Note: The primary goal of today's topic is to help you better understand
  what's going on "behind the scenes" when you work with lists and other
  structures that you build with `cons`.

### Token opportunities

Academic/Scholarly

* Thursday, 2024-04-04, 11:00am, JRC 101.
  _Scholars' Convocation: Motherblame-stigma, Epistemic Injustice, and the Government’s Failure to Care_ (w Tammy Nyden in Philosophy).
* Thursday, 2024-04-04, 7:00pm, Science 3819.
  _Mentor Session_ (review for quiz, review for SoLA).
* Thursday, 2024-04-04, 8pm, JRC 101.
  _Book talk: Austin Frerick '12 on Barons: Money, Power, and the Corruption of America’s Food Industry_

Cultural

* Thursday, 2024-04-04, 4pm, Grinnell College Museum of Art.
  _Writers@Grinnell presents Sam Naikhara '19_.
* Friday, 2024-04-05, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._
* Saturday, 2024-04-06, 1--4pm, Cleveland Beach (in front of Cleveland
  residence hall on South Campus). 
  _Holi_.
  Beware, your clothes will get stained.

Peer

Wellness

* Tuesday, 2024-04-09, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-09, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-09, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

* Wednesday, 2024-04-03, 11:45am, JCC Lower-Level Conf. Room.
  _CLS Lunch and Learn with Sam Naikhara '19_.
* Wednesday, 2024-04-03, 4pm, Science 3821.
  _CS Extras: Study abroad at AIT Budapest_. Pizza and Hungarian Candy!
  (Probably fruit, too.)

### Other good things (no tokens)

### Upcoming work

* Thursday, 2024-04-04, 11:00pm, [MP6](../mps/mp06)
    * [_Submit MP6 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217671/)
    * The graders will likely be nicer than the autograders on the spiral
      squares problems.
* Thursday, 2024-04-04, 11:00pm, [Vectors reading](../readings/vectors)
    * [_Submit reading reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4312955)
* Friday, 2024-04-05, 8:30am, [Lab writeup](../labs/pairs)
    * [_Submit today's lab on Gradescope_](...)
    * Preferred: Finish it during class
* Friday, 2024-04-05, Between 8:00 and 8:30am, Quiz
    * Topic: Pairs and pair structures. We'll give you an expression.
      You'll draw a picture.
    * Makeup for tracing available
* Friday, 2024-04-05, 11:00pm, [MP6](../mps/mp06) post-reflection
    * [_Submit MP6 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217839)
* Friday, 2024-04-05, 11:00pm, [SoLA 3](../las) pre-reflection
    * [_Submit SoLA 3 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248181)
* Sunday, 2024-04-07, 11:00pm, [MP4](../mps/mp04) Redo
    * [_Submit MP4 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217681)
* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
* Wednesday, 2024-04-10, 11:00pm, [SoLA 3](../las/) due
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)

Notes on resolving programming problems
---------------------------------------

### Check your types

In helping students, Maddy and I have observed that one of the most
important sets of qustions you should be asking yourself are "What
type does _this procedure_ take as input?" and "What type does
_this procedure_ return?"

That applies for both procedures you use and procedures you write.

For example, some of you were returning `null` when you should have
been returning a number (e.g., in `tally-wins`).

### Runaway recursion

If you encounter runaway recursion,

(a) Make sure that you are simplifying an appropriate parameter.

(b) Make sure that the recursion happens after you ensure that you
haven't reached the base case.

(c) Reread your base-case test.

Questions
---------

### Administrative

### Pairs

Can we go over the double dagger problems?

> Sure!

I was unsure about how to combine `cadr` and `caddr` together in one command
as it gave me an unbound identifier error.

> There's a limit to how many `a`'s and `d`'s you can have in the `caddadar`
  procedures.

> You can use composition. `(o cadr caddr)` is the same as `(cadaddr)`.

Is there a way to implement a generalized version of car/cdr so that
when you get to the really complex structures, you can still type it in
shorthand (e.g., `caadddadaddr` or something)? Or do you just have to get
used to writing it differently when you get past a certain point?

> You can write a recursive two-parameter procedure that takes the 
  "addadada" as one parameter (probably a string) and the pair 
  structure as another.

> Stay tuned. Sam will think about it during lab.

> Here we go.

```
;;; (c_r str) -> procedure?
;;;   str : string? (consisting of only #\a and #\r)
;;; Build the procedure corresponding to c<str>r.
;;;
;;; For example, `(c_r "adddddd")` gives the equivalent of
;;; `caddddddr` (if it were defined).
(define c_r
  (let ([letter->fun (lambda (ch) (if (char=? ch #\a) car cdr))])
    (lambda (str)
      (apply o (map letter->fun (string->list str))))))

(define caddddddr (c_r "adddddd"))
```

```
> (caddddddr (string->list "abcdefghijkl"))
#\g
```

Can you show an example of composing `car` and `cdr`.

> Let's write something that grabs element six of a list (using 0 as the
  first element).

> We'd like to use `caddddddr`

```
> (car letters)
'a
> (cadr letters)
'b
> (caddddddr letters)
. . caddddddr: undefined;
 cannot reference an identifier before its definition
> (define caddddddr (o car cdr cdr cdr cdr cdr cdr))
> (caddddddr letters)
```

### Randomness

### MP6

How should we get started on the most general `carpet` procedure?

```
;;; (carpet pattern size color-x color-y n) -> image?
;;;   pattern ; string? (length 9, composed only of x, X, y, and Y)
;;;   size : positive real?
;;;   color-x : color?
;;;   color-y : color?
;;;   n : non-negative integer.
;;; Create a `size`-by-`size` image of a fractal carpet with `n` levels
;;; of recursion, using `color-x` as the "primary" color and `color-y`
;;; as the "secondary" color.
;;;
;;; The pattern is given by the letters in pattern, where `X` means
;;; "recurse" keeping colors as they are", `Y` means "recurse swapping
;;; the two colors", `x` means "square in `color-x`" and `y` means
;;; "square in `color-y`".
;;;
;;; The positions of the letters correspond to the parts of the pattern
;;;
;;;      0 1 2
;;;      3 4 5
;;;      6 7 8
```

* We'll need to pull letters out of the string.
    * We can do that with `string-ref`.
* We are going to do the same thing for each position: Is it `#\x`, `#\X`,
  `#\y`, or `#\Y`? That seems to be a case for a helper procedure.
* We know how to combine the results of those using `above` and `beside`.
* Since we are likely to recompute each of those, I'd use a `let` binding

```
(define carpet
  (lambda (...)
    (if (base-case-test)
        (solid-square ???)
        (let ([x (solid-square ...)]
              [X (carpet ...)]
              [y (solid-square ...)]
              [Y (carpet ...)])
          (above (beside (helper (string-ref pattern 0) x X y Y)
                         (helper (string-ref pattern 1) x X y Y)
                         (helper (string-ref pattern 2) x X y Y))
                 ...)))))
```

```
;;; (helper ch x X y Y) -> image?
;;;   ch : char?
;;;   x : img?
;;;   X : img?
;;;   y : img?
;;;   Y : img?
;;; Pick one of the four images based on the value of `ch`.
(define helper
  (lambda (ch)
    (cond
      [(equal? ch #\x)
       x]
      ... // X, y, Y
      [else
       (error "Invalid character! Only x's and y's permitted.")])))
```

Lab
---

Some tips:

* Lists: A list of `n` items has `n` pairs (cons cells) in it.
    * `(list 'a 'b 'c)` -> 
* Nulls: Implicit in lists. You can't have both a null and an arrow
  in the same cell.
* Boxes: Only one arrow per box.
