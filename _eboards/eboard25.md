---
title: "EBoard 25: Randomness"
number: 25
section: eboards
held: 2024-04-01
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). (Provided Otter.ai
is working today. It says I have a slow network connection.)

_Approximate overview_

* Administrative stuff [10 min]
* Notes on recent quizzes [10 min]
* Questions [10 min]
* Lab [45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Welcome back from break!
    * You've come back from around the world. Consider masking.
* Happy April Fool's day. I think the day and the topic match well.
* I chatted with some colleagues at a conference during break, and they
  suggested that one benefit to the ACM Code of Ethics is that if you
  are fired for trying to follow it (e.g., refusing to do something
  unethical), you are more likely to prevail in court, because US courts
  tend to pay attention to such codes.
* I brought back some conference swag from the 2024 SIGCSE Technical
  Symposium on Computer Science Education. You can each have one
  octocat sticker, one notebook, and one or both of the disability
  stickers.
* I distributed grade reports last night. If you are at under 60% of
  LAs, I'll be turning in an Academic Alert today. 
    * I have confidence that you'll catch up, but I think Academic
      Advising should know when people are struggling a bit.
* Iowa or LSU?

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-02, noon, Some PDR.
  _CS Table_.
* Tuesday, 2024-04-02, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-04-04, 11:00am, JRC 101.
  _Scholars' Convocation: Motherblame-stigma, Epistemic Injustice, and the Government’s Failure to Care_ (w Tammy Nyden in Philosophy).
* Thursday, 2024-04-04, 7:00pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-04-04, 8pm, JRC 101.
  _Book talk: Austin Frerick '12 on Barons: Money, Power, and the Corruption of America’s Food Industry_

Cultural

* Thursday, 2024-04-04, 4pm, Grinnell College Museum of Art.
  _Writers@Grinnell presents Sam Naikhara '19_.
* Friday, 2024-04-05, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._

Peer

* Tuesday, 2024-04-02, 1pm, Pioneer Park.
  _Baseball vs. Cornell_.
* Tuesday, 2024-04-02, 3:30pm, Pioneer Park.
  _Baseball vs. Cornell_.

Wellness

* Monday, 2024-04-01, 4pm, HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 2024-04-02, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-02, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-02, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

* Wednesday, 2024-04-03, 11:45am, JCC Lower-Level Conf. Room.
  _CLS Lunch and Learn with Sam Naikhara '19_.
* Wednesday, 2024-04-03, 4pm, Science 3821.
  _CS Extras: Study abroad at AIT Budapest_.

### Other good things (no tokens)

### Upcoming work

* Monday, 2024-04-01, 11:00pm, [MP6](../mps/mp06) pre-reflection
    * [_Submit MP6 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217838/)
* Tuesday, 2024-04-02, 11:00pm, [Pairs reading](../readings/pairs)
    * [_Submit reading reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248425/)
* Wednesday, 2024-04-03, 8:30am, [Lab writeup](../labs/...)
    * [_Submit today's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4301476)
    * Preferred: Finish it during class
* Thursday, 2024-04-04, 11:00pm, [MP6](../mps/mp06)
    * [_Submit MP6 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217671/)
* Friday, 2024-04-05, 8:30am, Quiz
    * Topic: Pairs and pair structures
    * Makeup for tracing available
* Friday, 2024-04-05, 11:00pm, [MP6](../mps/mp06) post-reflection
    * [_Submit MP6 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217839)
* Friday, 2024-04-05, 11:00pm, [SoLA 3](../las) pre-reflection
    * [_Submit SoLA 3 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248181)
* Sunday, 2024-04-07, 11:00pm, [MP4](../mps/mp04) Redo
    * [_Submit MP4 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217681)
* Monday, 2024-04-08, 4:00pm, [SoLA 3](../las/) distributed
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)

Notes on recent quizzes
-----------------------

Quiz 7 was taken directly from the list recursion lab. Remember to
review the labs as you study.

For quiz 8, many of you got partway there, but not all the way.
Your goal is *no* repeated code (or as little as possible). I was
a bit generous in grading because I know quizzes can be stressful
(and it was just before break).

I'll go over quiz 8, but not on the eboard. Take notes.

Note: We use local bindings for (at least) two reasons:

* They can make our code more efficient.
* They can make our code more readable.

Questions
---------

### Administrative

Have you finished tallying tokens?

> No.

### Local bindings

```
;;; (v2c-ratio str) -> rational?
;;;   str : string
;;; Determine the ratio of vowels to consonants in str
(define v2c-ratio
  (lambda (str)
    (/ (tally vowel? (string->list str))
       (tally consonant? (string->list str)))))
```

How would a helper procedure avoid redundant work?

```
(define v2c-ratio
  (lambda (str)
    (v2c-ratio/helper (string->list str))))

(define v2c-ratio/helper
  (lambda (chars)
    (/ (tally vowel? chars)
       (tally consonant? chars))))
```

### Randomness

How does Racket choose a "random" number?

> https://docs.racket-lang.org/reference/generic-numbers.html#%28def._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._random%29%29

> "The random number generator uses L’Ecuyer’s MRG32k3a algorithm
  [L'Ecuyer02] that has a state space of practically 192 bits."

> Pierre L’Ecuyer, Richard Simard, E. Jack Chen, and W. David Kelton,
  "An Object-Oriented Random-Number Package With Many Long Streams
  and Substreams," _Operations Research_, 50(6), 2002.
  <https://www.iro.umontreal.ca/~lecuyer/myftp/papers/streams00.pdf>

> I'll let you read the rest.

Why did random with no parameter give us a decimal number?

> The designers chose to make it behave that way. You will always
  get a number between 0 (inclusive) and 1 (exclusive) when you call
  `random` with no parameters.

Are there other procedures that take no parameters (at least some of the 
time)?

> We've seen that `(+)` returns 0 and `(*)` returns 1. We'll also
  start writing some of our own (primarily ones that end up using
  some form of `random`).

### MP6

_I observed that on the MP5 post-reflections, many people said that they
wished they had asked questions earlier. Can we try to generate a few
questions to help people who haven't started yet or who are just starting?_

What basic shapes are there other than triangles, squares, and rectangles?

> Hexagons? Circles? Ellipses? Pentagons? Stars? Something else you design?

How do we reach a base case in the first one? (The basic Sierpinski triangle.)

> We should subtract one from `n` until we reach zero.

```
(define st
  (lambda (side color n)
    (if (zero? n)
        (equilateral-triangle side color)
        ...)))
```

> We saw in the notes on the MP that we want to try to avoid repeated code,
  which shows a recursive call.

How do I avoid identical recursive calls?

> Let's start with the following.

```
(above (fractal-triangle (/ side 2) color (- n 1))
       (beside (fractal-triangle (/ side 2) color (- n 1))
               (fractal-triangle (/ side 2) color (- n 1))))
```

> I can rewrite that as

```
(let ([smaller-triangle (fractal-triangle (/ side 2) color (- n 1)))
  (above smaller-triangle
         (beside smaller-triangle
                 smaller-triangle)))
```

> Note that you have to do that *within* the `if`.

When we generalize procedures, can we define the previous procedures in terms of the generalized procedure?

> Sure.

> Most of you would benefit from writing the individual ones first to
  better understand the recursion.

Why do you recurse forever if you put the `let` in the wrong place?

```
(define fractal-triangle
  (lambda (side color n)
    (let ([smaller-triangle (fractal-triangle (/ side 2) color (- n 1))])
       (if (<= n 0)
           (solid-equilateral-triangle side color)
           (above smaller-triangle
                  (beside smaller-triangle
                          smaller-triangle))))))
```

> Suppose we call `(fractal-triangle 128 "blue" 1)`

> The `let` is evaluated first

```
    (fractal-triangle 128 "blue" 1)
--> (let ([smaller-triangle (fractal-triangle 64 "blue 0)]) ...)
--> (let ([smaller-triangle (let ([smaller-triangle (fractal-triangle 32 "blue" -1)]) ...)]) ...)
--> (let ([smaller-triangle (let ([smaller-triangle (let ([smaller-triangle (fractal-triangle 16 "blue" -2)]) ...)]) ...) ...)
```

### Miscellaneous

Can we talk more about `(ormap <procedure> <list>)`?

> Sure. As you may recall, `(or exp1 exp2 ... expn)` evaluates each
  expression in turn, stopping when it hits a truish value, which it
  then returns. If it runs out of values, it returns false.

> Similarly, `(ormap pred? (list v1 v2 ... vn))` applies `pred?` to
  each of `v1`, `v2`, ... in turn, stopping when it returns a truish
  value. If it reaches the end of the list, it returns false.

> For example, if we want to check if some element of a list is a number,
  we could use `(ormap number? lst)`.

```
> (ormap number? (list "a" "b" "c" 23 "d"))
#t
> (ormap number? (list "a" "b" "c" "d"))
#f
> (ormap exact? (list "a" "b" 23 "c" "d"))
. . exact?: contract violation
  expected: number?
  given: "a"
```

> There's also an `andmap`.

Why can't you apply `exact?` to a string? After all, you can apply `number?`.

> The designers chose to make it behave that way. 

> `number?` is intended to say "given any kind of type of input, decide
  if it's a number."

> `exact?` is intended to say "given any kind of number, decide if its
  an exact number."

> Similarly, `odd?` only works for integers.

> You can achieve what you want by writing your own function.

```
> (define exact-number?
    (lambda (x)
      (and (number? x) (exact? x))))
> (exact-number? "a")
#f
> (exact-number? 23)
#t
```

> I *think* `all-of` may also work.

```
> (define en? (all-of number? exact?))
> (en? "a")
#f
> (en? 23)
#t
```

Lab
---

The LA on randomness assumes that you've done exercises 1--5 and
understood the implications and how to address them.

Problem 5's theme songs are "Proud Mary" by Ike and Tina Turner and
"Rawhide" as performed by the Blues Brothers.

Yes, it's weird that we have to do `(lambda () ...)` for things like
`pair-a-dice`. But it means that we have a procedure (that may run
differently each time) rather than a named value (that always has the
same value).

Isn't `pair-a-dice` a great name for a procedure?

Grab a sticker (optional), grab a booklet (optional), have a nice
day! (also optional, but preferable)
