---
title: "EBoard 28: Vectors, continued"
number: 28
section: eboards
held: 2024-04-08
link: true
---
# {{ page.title }}

**Please sit with your partner from the previous class.**

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [5 min]
* Notes from Friday's quiz [5 min]
* Notes from last class [15 min]
* Questions [5 min]
* Labs [40 min]
* Turn in labs [5 min]

Administrative stuff
--------------------

* As you preregister for next semester, please consider taking CSC-161.
  (You might also consider MAT/CSC-208, but space is currently limited.)
* Since our graders don't have a new MP to grade, if you get redos in
  early, they might get them graded more quickly.
* Enjoy the SoLA eek lips!

### Token opportunities

Academic/Scholarly

* Monday, 2024-04-08, 4:15--5:30 pm, HSSC A2231 (Auditorium).
  _Just Talk: A Trans-Related Conversation on Legislation and the Law_.
* Tuesday, 2024-04-09, noon, some PDR
  _CS Table (topic TBD)_.
* Thursday, 2024-04-09, 7pm, the normal place
  _Mentor Session: Diagramming structures_.
* Thursday, 2024-04-11, 4pm, HSSC 1231 (the Kernel).
  _CS Poster Session_.
* Thursday, 2024-04-11, 7pm, the normal place
  _Mentor Session_.

Cultural

* Thursday, 2024-04-11, 4:15-5:30pm, HSSC S1325
  _Writers@Grinnell_.
* Thursday, 2024-04-11, 8:00-9:30pm, JRC 101
  _Writers@Grinnell_.
* Friday, 2024-04-12, 4:00-5:00pm, HSSC N1170
  _Middle of Everywhere_.

Peer

Wellness

* Tuesday, 2024-04-09, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-09, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-09, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.
* Friday, 2024-04-12, 3:00--5:00pm, JRC Courtyard
  _Get Nostalgic_.

Misc

* Monday, 2024-04-08, 1:00--3:00pm (approx), where appropriate.
  _Watch the eclipse (but don't stare at the sun)_.
    * Eclipse glasses being given away at Burling (we think) and
      by the Physics SEPC (we know).
* Saturday, 8:30--11:00pm, Harris.
  _Drag_.

### Other good things (no tokens)

### Upcoming work

* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
    * Phase 1
        * Decomposition
        * Basic types
        * Cut and compose
    * Phase 2
        * Conditionals
        * Program Style
        * Lists
        * Documentation
        * Testing
        * Ethical Considerations
    * Phase 3
        * List recursion (quizzed)
        * Local bindings (quizzed)
        * Numeric recursion
        * Vectors
        * Randomness
* Tuesday, 2024-04-09, 11:00pm, [Reading on dictionaries](../readings/hash-tables) due.
    * [_Submit reading response on dictionaries on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330317)
* Wednesday, 2024-04-08, 8:30am, [Lab writeup](../labs/vectors)
    * [_Submit Fridays's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323174)
    * Preferred: Finish it during class today.
* Wednesday, 2024-04-08, 8:30am, [Lab writeup](../labs/vectors-continued)
    * [_Submit todays's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330313)
    * Preferred: Finish it during class today.
* Wednesday, 2024-04-10, 8:30am, MP7 assigned
* Wednesday, 2024-04-10, 11:00pm, [SoLA 3](../las/) due
* Friday, 2024-04-12, 8:00am, Quizzes
    * Dictionaries (new, covered Wednesday)
    * Diagramming structures (old)
    * Tracing (old)
* Friday, 2024-04-12, 11:00pm, [SoLA 3](../las/) post-reflection
    * [_Submit SoLA 3 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248183)
* Friday, 2024-04-12, 11:00pm, MP7 pre-reflection due
    * [_Submit MP7 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330325)
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)
* Sunday, 2024-04-14, 11:00pm, [MP2](../mps/mp02) Second Redo
    * [_Submit MP2 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323413)
* Sunday, 2024-04-14, 11:00pm, [MP3](../mps/mp03) Second Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323418)
* Sunday, 2024-04-14, 11:00pm, [MP1](../mps/mp01) Third Redo
    * [_Submit MP1 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323410/)

Notes from quiz
---------------

### Why study diagrams?

We want you to diagram structures so that you have a good mental model.

* It helps you understand when/why things go wrong.
* It helps you understand the cost of things.
* It's pretty.
* It helps you understand lists better, since pairs implement lists.

### Reminders:

* A list with `n` elements has `n` pairs ("cons cells").
* A call to `cons` creates one pair ("cons cell").
* Each box in a pair can hold one thing (a null or an arrow).
* Arrows point to values (either another pair or a more basic value).

### Questions

Why do we only draw one pair for a cons?

> Because `cons` is designed to create only one pair.

How should we differentiate pairs ("cons cells") from lists?

> Lists are built from pairs. So, in some sense, they are very similar.

> A nonempty list is a sequence of pairs (following the arrows from the second 
  box) that ends in null.

> Pairs are the "behind the scenes" stuff that happens every time you
  create a list, even though you don't explicitly build the pairs.

> Lists can also be `null`. Pairs are always pairs.

When do we see dots?

> When we have the last pair in a sequence and its second element (the
  `cdr`) is neither null nor another pair. 

> I think of the dot as "damn, I was expecting a null here. I better tell
  the user that it's something else."

When does `cons` create that dot?

> When the second element (the `cdr`) is neither a pair nor null.

Why does it behave that way?

> Because the designers chose to make it behave that way.

What happens if we do `(cons 'a)`?

> `cons` expects two parameters. You'll get a "missing parameter" message.

Notes from last lab
-------------------

### Vectors

_It's TPS time!_

What are vectors?

> Similar to lists, except that (a) faster to find elements quickly and
  (b) you can change elements in a vector.

> For (b) To "change" a list, you must actually build a new list.

> For (a) To find the element `i` of a list, you must call `cdr` approximately
  `i` times. [Slow, varying]

> For (a) TO find element `i` of a vector, you must just do a mathematical
  computation. [Almost instantaneous, uniform]
  
Why do we use them instead of lists?

> For the reasons above: We have something we want to change. We care
  about accessing elements at various positions, rather than just 
  sequentially.

Why use lists when we have vectors?

> Because we can do cool things like `map` and `reduce` and `filter`.

> Mutation is dangerous. It's harder to verify code with mutable structures.

What does typical "extract data" recursion over a vector look like?

```
(define vector-sum
  (lambda (vec)
    ???))
```

> Recursion: We're going to recurse over positions in the vector, stopping
when appropriate. (Either last to first or first to last.)

> We almost always need a helper procedure that recurses over the position.

```
(define vector-sum
  (lambda (vec)
    (vector-sum/helper vec 0)))

(define vector-sum/helper
  (lambda (vec pos)
    (if (>= pos (vector-length vec))
        BASE-CASE
        (COMBINE (vector-ref vec pos)
                 (vector-sum/helper vec (+ pos 1))))))
```

```
;;; (vector-sum/helper vec pos) -> number?
;;;   vec : (vector-of number?)
;;;   pos : nonnegative-integer?
;;; Sum all of the values at positions ranging from `pos` to the 
;;; end of `vec`.
(define vector-sum/helper
  (lambda (vec pos)
    (if (>= pos (vector-length vec))
        0
        (+ (vector-ref vec pos)
           (vector-sum/helper vec (+ pos 1))))))
```

What does typical "change data" recursion over a vector look like?

```
;;; (my-vector-fill! vec val)
;;;   vec : vector?
;;;   val : any?
;;; Fill the vector with only `val`.
(define my-vector-fill!
  (lambda (vec val)
    ??? 
```

> We need a base case, which is .... (a) if the vector has the right form
  (which is hard to check).

> If the vector is empty, we're probably done. (We can't shrink vectors,
  so it will be difficult to get closer to that.)

> Once again, we should create a helper procedure that tracks the position.

```
;;; (my-vector-fill! vec val)
;;;   vec : vector?
;;;   val : any?
;;; Fill the vector with only `val`.
(define my-vector-fill!
  (lambda (vec val)
    (my-vector-fill!/helper vec val 0)))

;;; (my-vector-fill!/helper vec val pos)
;;;   vec : vector?
;;;   val : any?
;;;   pos : (all-of nonnegative-integer? (at-most (vector-length vec)))
;;; Fill the slots in positions `pos` through the end of `vec` with
;;; `val`.
(define my-vector-fill!/helper
  (lambda (vec val pos)
    BASE-CASE-TEST
    BASE-CASE
    RECURSIVE-CASE))
```

```
(define my-vector-fill!/helper
  (lambda (vec val pos)
    (cond
      [(>= pos (vector-length vec))
       vec]
      [else
       (vector-set! vec pos val)
       (my-vector-fill!/helper vec val (+ pos 1))])))
```

Why did we use `cond` instead of `if`?

> Because we wanted *two* things in the consequent, not just one.

Can we return "nothing" (void) if we reach the base case?

```
(define my-vector-fill!/helper
  (lambda (vec val pos)
    (cond
      [(< pos (vector-length vec))
       (vector-set! vec pos val)
       (my-vector-fill!/helper vec val (+ pos 1))])))
```

Note: `when` is designed specifically for this situation.

```
(define my-vector-fill!/helper
  (lambda (vec val pos)
    (when (pos (vector-length vec))
       (vector-set! vec pos val)
       (my-vector-fill!/helper vec val (+ pos 1)))))
```

### `palette?`

How should we write `(palette? val)`? 

```
;;; (palette? val) -> boolean?
;;;   val : any?
;;; Determine if `val` is a nonempty vector of RGB colors.
```

Getting started. We decompose a bit.

```
(define palette?
  (lambda (val)
    (and (vector? val)
         (> (vector-length val) 0)
         (all-rgb? val))))
```

```
;;; (all-rgb? vec) -> boolean?
;;;   vec : (all-of vector? nonempty?)
;;; Determine if `vec` contains only RGB colors.
```

The "obvious" solution: Vector recursion.

```
(define all-rgb?
  (lambda (vec)
    (all-rgb?/helper vec 0)))

(define all-rgb?/helper
  (lambda (vec pos)
    (if (>= pos (vector-length vec))
        #t
        (if (rgb? (vector-ref vec pos))
            (all-rgb?/helper vec (+ pos 1))
            #f))))
```

A common solution: Convert it to a list and use our list knowledge.

```
(define all-rgb?
  (lambda (vec)
    (andmap rgb? (vector->list vec))))
```

A surprising solution: Think about type predicates.

```
(define all-rgb?
  (vector-of rgb?))
```

Rethinking `palette?`

```
(define palette?
  ???)
```

Questions
---------

### Administrative

Can I miss class next Monday so that I am able to celebrate Eid in Chicago
over the weekend.

> Sure. Just drop me a note.

### Vectors


Labs
----

You have two labs to do. Finish Friday's lab (more or less) and do
today's lab (more or less).

Friday's lab: At this point, you should do only exercises 4 and 5.

### Friday, Exercise 4

```
Write a procedure, (palette-darker! palette), that, given a vector
of integer-encoded RGB colors, makes each color in the palette
slightly darker (i.e., using rgb-darker).
```

In looking for patterns, consider `number-vector-scale!` (rather than
`number-vector-divide!`) or our model of changing vectors from above.

### Friday, Exercise 5

```
;;; (palette-brightest palette) -> rgb?
;;;   palette : (all-of (vector-of rgb?) nonempty?)
;;; Find the brightest color in `palette`. If multiple colors have
;;; the same brightness (and it's the largest brightness), can return
;;; any of them.
```

### Wrapping up

Friday's lab: `; SAM SAID WE ONLY NEEDED TO DO 1, 4, and 5!`

or

Friday's lab: `; SAM SAID WE COULD STOP HERE`

Monday's lab: `; SAM SAID WE COULD STOP HERE!`

or

Monday's lab: `; SAM SAID WE SHOULD GET CREDIT EVEN THOUGH WE DIDN'T HAVE TIME TO START THIS LAB`

