---
title: "EBoard 35: Searching and program efficiency"
number: 35
section: eboards
held: 2023-11-20
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided the technology has not broken again.

_Approximate overview_

* Administrivia
* Some notes on the readings
* Questions
* Lab

Administrivia
-------------

* Quizzes returned.
* On Wednesday, plan to sit with your project team.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-23, Noon, Day PDR: _CS Table: Cell Phone Addiction_
* Tuesday, 2023-11-23, 7pm, 3821: _Mentor session: Data abstraction,
  helper/tail recursion, more!_

Cultural

Peer

Wellness

* Be Thankful.
* We need more wellness activities!

Misc

* Please fill out the peer mentor evaluation form.

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Tuesday: Late MP8 pre-assessment
* Wednesday: Quizzes
* Sunday: Reading

### Wednesday quiz topics

_Available starting at 7:30 a.m.  Collected at 8:45 a.m._

* Data abstraction (new)
* Higher-order programming (repeat)
* Randomness (repeat)
* Diagramming structures (repeat)
* Tracing (repeat)

Some notes on the readings
--------------------------

### Check 1: Categorizing algorithms

For each function, explain whether it is a constant time or linear
time algorithm.   
                   
* `cdr`
* `cddr`
* `list-ref`
* `vector-ref`
* `map`
* `range`

_Reminder: "Constant time" does not depend on the size of the input;
"linear" scales directly with the size of the input (or, as we sometimes
phrase it, with the input)._

_TPS_

* `cdr` - constant: No matter what, it's just following the next arrow.
* `cddr` - constant: Just follow the next arrow twice.
* `list-ref` - it's a trick; it depends on which parameter.
    * linear in `n` (the position), because we have to do `n` calls
      to `cdr`.
    * Somewhat independent of the size of the list.
    * If it's linear in one of the parameters, we generally say it's
      linear.
* `vector-ref` - constant: That's the nature of vectors, but we
  don't quite know why.  Element n is at $$s + nx$$ where $$s$$
  is the start of the vector and $$x$$ is the width of the cell.
  We can do this in constant time.
    * All of the vectors and lists we build start somewhere in
      memory.
* `map` - linear: we have to process every element of the list, so
  if there are more elements, we have more processing
* `range` - linear: as n gets larger, the list gets larger
    * `(range n)` builds the list `(list 0 1 2 3 ... (- n 1))`

### Questions

Are all recursive procedures linear?

> No, but (almost) none are constant time.

> They could be linear, (logarithmic), quadratic, exponential

Do we also worry about how much space procedures use?

> We could, but not at the moment.

### Check 2: Binary search

_Note: These are modified slightly from the self-check._

_Yay!  More TPS_

z. What does binary search do?

> Lets you look for values in a vector.  The vector is sorted from least
to greatest by "key" (the thing we look for in the middle).

> Splits the vector in half if it doesn't find something at the midpoint.

a. Explain the role of the *`less-equal?`* in `binary-search`.

> We'll use to compare the two keys to figure out which half we're
  looking in.  We compare the key that we're looking for to the
  key of the middle element.

b. In `binary-search`, how do we know if two keys are equal?

> x and y are equal if x is less than or equal to y and y is less
  than or equal to x.

> In Scheme, `(and (less-equal? x y) (less-equal? y x))`.

c. Explain the role of `midpoint`, `middle-element`, `middle-key`,
which are bound in the `let*` of `binary-search`.

> `midpoint` is the index of the middle element.  We use that to
  find the middle element.  We compute it mathematically.

> We use `middle-element` to find the `middle-key`.

> `middle-key` is what we compare to the sought key.

d. Describe why and how the *`upper-bound`* of helper `search-portion`
changes when the key we're looking for is less than the middle key.
(If it doesn't change, explain why not.)

> Recurse, using `midpoint` as the new `upper-bound`.

e. Describe why and how the *`lower-bound`* of helper `search-portion`
changes when the key we're looking for is greater than the middle key.
(If it doesn't change, explain why not.)

> Recurse, using `(+ 1 midpoint)` as the new `lower-bound`.

> We heard both `midpoint` and `(+ 1 midpoint)` as options.  Which
  do you think and why?

> `(+ 1 midpoint)` because we know that the sought key can't be
  at `midpoint`.

f. Why do we add one to `midpoint` when we change `lower-bound`, but
not subtract one from `midpoint` when we change `upper-bound`?

> The upper-bound is *exclusive* (that is, we don't look at it)

> Binary search is subtle.

g. If we double the length of the vector, what is the worst case effect
on the number of recursive calls in `binary-search`?

> Only one more recursive call.  If the length was n, and it took k
  steps to do n things, we can go from 2n to n in one step, so it will
  take k+1 recursive calls.

> Let's do some examples.

> Suppose we have 100 values.

> 100 -> 50 -> 25 -> 12 -> 6 -> 3 -> 1 -> 0 (7 recursive calls)

> 200 -> 100 (8 recursive calls)

> 400 -> 200 (9 recursive calls)

> 400*400 = 160000 -> ??? (? recursive calls) (estimate 81) (Sam estimates
  between 17 and 19) (students calculate and find ...)

> Sam's analysis 400*400 -> 200*400 -> 100*400 -> ... 1*400 (9 recursive calls)

> 400->1 (9 recursive calls) (9 + 9 is 18; maybe 17, maybe 19)

> We can do large numbers of values in very few steps.

> If you are mathy person, this is $$log_2(n)$$.

### Some questions

What is `kernel`?

> When we're using recursive helper procedures, we often call those the
  "kernel".

> I think we covered those in the reading/lab on tail recursion (when
  I (in-)conveniently wasn't here).

What is `struct`?

> A quick way to build data structures instead of vectors, lists, or
  hashes. We didn't cover them this semester.  Sorry for forgetting 
  to remove that from the reading.

> `(struct name (field1 field2 field3))` automatically builds the
  following procedures

> * `(name f1 f2 f3)` which builds a new structure

> * `(name? val)` predicate

> * `(name-field1 name)` procedure.

> * `(name-field2 name)` procedure.

> * `(name-field3 name)` procedure.

> For example, `(struct student (first last major))` gives me the
  procedures `student`, `student?`, `student-first`, `student-last`,
  `student-major`.

> Isn't that nicer than using vectors/lists/hashes.

> We didn't have time to cover them this semester.

What is `match`?

> Damn!

> We're not covering `match`.

How can we confirm the evaluation time of a procedure, like the ones in the self-checks?

> We can do a careful analysis of how they work.

> We can run them on large inputs and time it.  You may recall that we
  did this while exploring `list-ref` vs. `vector-ref`.

> If we write them ourselves, we can add a counter.

Questions
---------

### Administrative

### Reading

What will Wednesday's quiz look like?

> See the sample.

> Most likely going to be something like "Here's a kind of data we want
  to store.  What procedures will be useful?  How would you implement
  `(make-thing ....)` using vectors?  How would you implement `(thing-y thing)`
  using vectors?

Why didn't it work when I copied the code?

> Because Sam left old cruft around. But it's gone.

> Sam will not make gaslighting jokes.

### Higher-order programming

How do I write a procedure that returns "a procedure that takes a
parameter, `x`, and ...."?

> "a procedure that takes a parameter, `x` and ..." can be written
  `(lambda (x) ...)`.

> So we normally write something like 

        (define proc
          (lambda (stuff)
            (lambda (x)
              ...)))

> For example, "Write a procedure, `square-maker`, that takes a size as 
  a parameter and returns a procedure that builds colored squares
  of the given size.  The returned procedure should take a color
  as a parameter."

        (define square-maker
          (lambda (size)
            (lambda (color)
              (square size "solid" color))))

```
> (square-maker 10)
#<procedure>
> (define small-square (square-maker 10))
> small-square
#<procedure>
> (small-square "blue")
. ; a small blue square
> (small-square "yellow")
. ; a small yellow square
> (small-square (rgb 100 200 10))
. ; a small greenish square
```

> In this case, we could also use `cut`.

        (define square-maker 
          (lambda (size)
            (cut (square size "solid" <>))))

> However, we can't use `cut` if we need to use the parameter more
  than once, or if it appears more deeply in the body.

Lab
---
