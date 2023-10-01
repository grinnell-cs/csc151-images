---
title: Naming values with local bindings
summary: |
  Algorithm designers regularly find it useful to *name* the
  values their algorithms process. We consider why and how to name new
  values that are only available within a procedure.
---

_This reading is now available for public consumption.  Sorry for the delay._

## Introduction

When writing programs and algorithms, it is useful to *name* values
we compute along the way. For example, in an algorithm that, given a
list of numbers, sorts that list of numbers, it may be useful to name
the sorted list along the way.  When we associate a name with a value,
we say that we *bind* that name to the value.

So far we've seen three ways in which names are bound to values in Scheme.

* The names of built-in procedures, such as `+` and `quotient`, are
  *predefined*.  There are also some predefined values, such as `pi`.
  When the Scheme interpreter starts up, these names are already bound to
  the procedures they denote.
* The programmer can introduce a new binding by means of a *definition*. A
  definition may introduce a new equivalent for an old name, or it may
  give a name to a newly computed value.
* When a programmer-defined procedure is called, the *parameters* of the
  procedure are bound to the values of the corresponding arguments in the
  procedure call. Unlike the other two kinds of bindings, parameter bindings
  are *local* -- they apply only within the body of the procedure. Scheme
  discards these bindings when it leaves the procedure and returns to the
  point at which the procedure was called.

As you develop more and longer procedures, you will find that there
are many times you want to create local names for values that are not
parameters. We will consider such names in this reading.

## Redundant work

You will find that there are many times when you are designing algorithms
that you end up telling the computer to do the same thing again and
again and again.  For example, here's a bit of code that determines
the ratio of vowels to consonants.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel?
  (lambda (ch)
    (or (char=? (char-downcase ch) #\a)
        (char=? (char-downcase ch) #\e)
        (char=? (char-downcase ch) #\i)
        (char=? (char-downcase ch) #\o)
        (char=? (char-downcase ch) #\u))))

;;; (consonant? ch) -> boolean?
;;;   ch : char
;;; Determine if ch is a consonant
(define consonant?
  (lambda (ch)
    (and (char-alphabetic? ch) (not (vowel? ch)))))

;;; (v2c-ratio str) -> rational?
;;;   str : string
;;; Determine the ratio of vowels to consonants in str
(define v2c-ratio
  (lambda (str)
    (/ (tally vowel? (string->list str))
       (tally consonant? (string->list str)))))
```

Let's see how well it works.

```drracket
> (v2c-ratio "Hello")
2/3
> (v2c-ratio "Aaargh!")
1
> (v2c-ratio "aeiouxy")
2 1/2
> (v2c-ratio "a")
. . /: division by zero
> ; Whoops!
```

'Eh.  It's good enough for now.

But there's a problem with the design.  We're repeating some work.

Please identify some points at which we repeat work.

We mean it.

That is, stop here and ask yourself, "Where does the code duplicate
work?"

Are you done?

Are you sick of these pauses?  If more students paused when we asked
questions, we wouldn't have to insert these kinds of notes.

Anyway, work is being repeated in at least three ways.

* First, we call `(char-downcase ch)` as many as five times.  It feels
  like we should be able to do it once.
* Second, we call `(string->list str)` twice.  It feels like we should
  be able to do it once.  This may even have a bigger effect than the
  five calls to `char-downcase` because building lists can be "expensive".
* Third, we ask if many letters are a vowel twice, once when counting
  the vowels and once when counting the consonants.

That last problem is going to be hard to deal with, particularly as we
try to keep our code readable.  So let's focus on the first two.  Can
we avoid calling `(char-downcase ch)` so many times?

_Yes, you can fill in the annoying delay now._

Here's one approach: We can decompose the task into two tasks.  We'll
write one procedure that determines if a character is a lowercase vowel.

```drracket
;;; (lower-case-vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a lowercase vowel.
(define lower-case-vowel?
  (lambda (ch)
    (or (char=? ch #\a)
        (char=? ch #\e)
        (char=? ch #\i)
        (char=? ch #\o)
        (char=? ch #\u))))
```

That seems straightforward enough, doesn't it?  Our `vowel?` procedure
can then call that other procedure using a letter converted to lowercase.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel?
  (lambda (ch)
    (lower-case-vowel? (char-downcase ch))))
```

About as easy to read as before.  A little more typing on our part.
And we've saved some computation.  In fact, this kind of decomposition
is a strategy programmers use fairly frequently: Rewrite procedures
that do a sequence of steps by using one procedure for each step.

In fact, now that we've phrased it as a sequence of steps, we can
take advantage of composition.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel? (o lower-case-vowel? char-downcase))
```

_Detour:_ Why are we repeating the documentation each time we show
you a new imlementation of the `vowel?` predicate?  Mostly to
remind you that there's a value to writing documentation, even
when our procedures are short and simple.

Will anyone ever use `lower-case-vowel?` by itself?  Possibly.
But if not, we should try something else.  Is there something
else?

## Racket's `let` Expressions

There is.  Racket provides `let` expressions as a way to bind
values to names.  A `let`-expression contains a *binding list* and
a *body*.  The body can be any expression, or any sequence of
expressions, to be evaluated with the help of the local name bindings.
The binding list takes the form of a parentheses enclosing zero or
more *binding expressions* of the form `(name value)`.

That precise definition may have been a bit confusing, so here's the
general form of a `let` expression

```drracket
(let ([name1 exp1]
      [name2 exp2]
      ...
      [namen expn])
  body1
  body2
  ...
  bodym)
```

As shorthand, we call each of the name-expression pairs of a
`let`-expression a *binder*.

When the Racket evaluator encounters a `let`-expression, it begins
by evaluating all of the expressions inside its binding specifications.
Then the names in the binding specifications are bound to those
values. Next, the expressions making up the body of the `let`-expression
are evaluated, in order. The value of the last expression in the
body becomes the value of the entire `let`-expression. Finally, the
local bindings of the names are cancelled. (Names that were unbound
before the `let`-expression become unbound again; names that had
different bindings before the `let`-expression resume those earlier
bindings.)

What do we mean by "bound"?  As you may recall, the Racket evaluator
maintains a table of names and corresponding values.  We call that
association a "binding".  When the evaluator encounters a name, it
looks up the binding in the table.

Here's one way to write `vowel?` with `let` and
without helpers.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel?
  (lambda (ch)
    (let ([lc (char-downcase ch)])
      (or (char=? lc #\a)
          (char=? lc #\e)
          (char=? lc #\i)
          (char=? lc #\o)
          (char=? lc #\u)))))
```

*Important!*  Note that even though binding lists and binding
specifications start with parentheses, they are *not* procedure
calls; their role in a `let`-expression simply to give names to
certain values while the body of the expression is being evaluated.
The outer parentheses in a binding list are structural -- they are
there to group the pieces of the binding list together.

As we've seen, using a `let`-expression often simplifies an expression
that contains two or more occurrences of the same subexpression.
The programmer can compute the value of the subexpression just once,
bind a name to it, and then use that name whenever the value is
needed again. Sometimes this speeds things up by avoiding such
redundancies as the recomputation of values. In other cases, there
is little difference in speed, but the code may be a little clearer.

## Comparing `let` and `define`

You may have missed it, but there are a few subtle and important
issues with the use of `let` rather than `define` to name values
and procedures. One difference has to do with the availability
(or scope) of the name. Values named by `define` are available
essentially *everywhere* in your program. In contrast, values named by
`let` are available only within the let expression. (In case you were
wondering, the term scope has nothing to do with the mouthwash.)

In addition, local variables (given by `let`) and global variables
(given by our standard use of `define`) affect previous uses of the
name differently (or at least appear to). When we do a new top-level
`define` (Racket only allows that in the interactions pane), we
permanently replace the old value associated with the name. That
value is no longer accessible. In contrast, when we use `let` to
override the value associated with a name, as soon as the `let`
binding is finished, the previous association is restored.

Finally, there's a benefit to using `let` instead of `define` according to
the principle of information hiding. Evidence suggests that programs
work better if the various pieces do not access values relevant primarily
to the internal workings of other pieces. If you use `define` for your
names, they are accessible (and therefore modifiable) everywhere. Hence,
you enforce this separation by policy or obscurity. In contrast, if
you use `let` to define your local names, these names are completely
inaccessible to other pieces of code. We return to this issue in our
discussion of the ordering of `let` and `lambda` below.

## Our mental model of computation and `let`

Now that we've discussed how `let` works at a high-level, let's consider how `let` behaves precisely within the context of our mental model of computation.
For example, consider the following expression:

~~~racket
(let ([x (+ 1 1)]
      [y (* 2 3)]
      [z (- 8 5)])
  (+ x y z))
~~~

We think about evaluating that in multiple stages.

1.  First, we evaluate the expression of each binding of the `let` to values.
2.  We then (a) substitute the resulting value for the binder's corresponding variable everywhere that variable occurs in the *body of the `let`* and (b) substitute the body of the `let` for the overall `let`-expression.
3.  Finally, we continue evaluating the substituted `let`-body as normal.

Let's see how this works in our example above.

First, we must evaluate each of the binding expressions in turn:

~~~racket
    (let ([x (+ 1 1)]
          [y (* 2 3)]
          [z (- 8 5)])
         (+ x y z))
--> (let ([x 2]
          [y (* 2 3)]
          [z (- 8 5)])
         (+ x y z))
--> (let ([x 2]
          [y 6]
          [z (- 8 5)])
         (+ x y z))
--> (let ([x 2]
          [y 6]
          [z 3])
         (+ x y z))
~~~

Now, we must substitute values-of-bound-variables in the body of the `let` and then substitute the `let`-body itself.
From the above expression, we will substitute `2` for `x`, `6` for `y`, and `3` for `z` everywhere in the expression `(+ x y z)`.
The resulting expression is what the entire `let` evaluates to.
From there, we evaluate the expression normally to arrive at a final result.

```racket
--> (let ([x 2]
          [y 6]
          [z 3])
         (+ x y z))
--> (+ 2 6 3)
--> 11
```

Note that we only substitute for the variable as it appears *in the body of the `let`*.
We do not substitute for the variable if it occurs outside of the body!
For example, if we nest a `let`-binding in larger computation:

```racket
(+ (let ([x 1]) (* x 5))
   (- x 1))
```

There are two occurrences of `x` here:

1.  `(* x 5)`: this is the body of the `let` so we will eventually substitute `1` for it.
2.  `(- x 1)`: this is the second argument to `+` and is *outside* the body of the `let`, so we do not substitute for it.
    Presumably, this `x` is bound by a different construct, *e.g.*, a `define`.

## Sequencing bindings with `let*`

Sometimes we may want to name a number of interrelated things. For
example, suppose we wanted to square the average of a list of numbers.
(It may not sound all that interesting, but it's something that people do
sometimes). Since computing the average involves summing values, we may
want to name three different things: the total (the sum of the values),
the count (the number of values), the mean (the average of the values). We
can nest one `let`-expression inside another to name both things.

```drracket
> (let ([total (reduce + values)]
        [count (length values)])
    (let ([mean (/ total count)])
      (* mean mean)))
```

One might be tempted to try to combine the binding lists for the nested
`let`-expressions, thus:

```drracket
; Combining the binding lists doesn't work!
> (let ([total (reduce + values)]
        [count (length values)]
        [mean (/ total count)])
    (* mean mean))
```

This approach won't work. (Try it and see!). It's important to
understand why not. The problem is as follows.  Within one binding list,
*all* of the expressions are evaluated before *any* of the names are
bound. Specifically, Scheme will try to evaluate both `(reduce + values)`
and `(/ total count)` before binding either of the names `total` and
`mean`; since `(/ total count)` can't be computed until `total` and
`count` have  value, an error occurs.

The takeaway message is thus: You have to think of the local bindings
coming into existence simultaneously rather than one at a time.

Because one often needs sequential rather than simultaneous binding,
Scheme provides a variant of the `let`-expression that rearranges the
order of events: If one writes `let*` rather than `let`, each binding
specification in the binding list is completely processed before the
next one is taken up:

```drracket
; Using let* instead of let works!
> (let* ([total (reduce + values)]
         [count (length values)]
         [mean (/ total count)])
    (* mean mean))
```

The star in the keyword `let*` has nothing to do with multiplication. Just
think of it as an oddly shaped letter. It means do things in sequence,
rather than all at once. While someone probably knows the reason to
use `*` for that meaning, the authors of this text do not.

## `let*` and our mental model

Our intuition is that `let` processes each of its bindings *independently and in parallel*.
In contrast, `let*` processes each of its bindings *sequentially* so that *later bindings can refer to earlier bindings*.
This is precisely how our corresponding mental model of `let*` works.
In contrast to `let`:

1.  First, we process the bindings in-order by:

    1.  Evaluating the expression of the binding `let*` to a value.
    2.  Substituting that value everywhere that binder occurs in *each successive binding* and *the body of the `let*`*.
    3.  Peel off the processed binding, reducing the number of binders by one.

2.  Once we are done processing all the binders, note that we should have substituted for all of variables bound by the `let*` (similarly to `let`).
    We then substitute the body of the `let` for the overall `let*`-expression.
3.  Finally, we continue evaluating the substituted `let`-body as normal.

Here is a simple `let*` expression and how it evaluates step-by-step in this model:

```racket
    (let* ([x 5]
           [y (* x 2)]
           [z (+ x y)])
      (+ x y z))
--> (let* ([y (* 5 2)]
           [z (+ 5 y)])
      (+ 5 y z))
--> (let* ([y 10]
           [z (+ 5 y)])
      (+ 5 y z))
--> (let* ([z (+ 5 10)])
      (+ 5 10 z))
--> (let* ([z (+ 15)])
      (+ 5 10 z))
--> (+ 5 10 15))
--> 30
```

## Positioning `let` relative to `lambda`

In the examples above, we've tended to do the naming within the body of
the procedure. That is, we write

```drracket
(define proc
  (lambda (params)
    (let (...)
      exp)))
```

However, Scheme also lets us choose an alternate ordering. We can instead
put the `let` before (outside of) the `lambda`.

```drracket
(define proc
  (let (...)
    (lambda (params)
      exp)))
```

Why would we ever choose to do so? Let us consider an example. Suppose
that we regularly need to convert years to seconds. (About a decade
ago, SamR said, "When you have sons between the ages of 5 and 12,
you'll understand.")  You might begin with

```drracket
(define years-to-seconds
  (lambda (years)
    (* years 365.24 24 60 60)))
```

This produce does correctly compute the desired result. However, it is a bit hard to read. For clarity, you might want to name some of the values.

```drracket
(define years-to-seconds
  (lambda (years)
    (let* ([days-per-year 365.24]
           [hours-per-day 24]
           [minutes-per-hour 60]
           [seconds-per-minute 60]
           [seconds-per-year (* days-per-year hours-per-day
                                minutes-per-hour seconds-per-minute)])
      (* years seconds-per-year))))
```

```drracket
> (years-to-seconds 10)
315567360.0
```

We have clarified the code, although we have also lengthened it a
bit. However, as we noted before, a second goal of naming is to avoid
recomputation of values. Unfortunately, even though the number of seconds
per year never changes, we compute it *every* time that someone calls
`years-to-seconds`. How can we avoid this recomputation? One strategy
is to move the bindings to `define` statements.

```drracket
(define days-per-year 365.24)
(define hours-per-day 24)
(define minutes-per-hour 60)
(define seconds-per-minute 60)
(define seconds-per-year 
  (* days-per-year hours-per-day minutes-per-hour seconds-per-minute))
(define years-to-seconds
  (lambda (years)
    (* years seconds-per-year)))
```

However, such a strategy is a bit dangerous. After all, there is nothing
to prevent someone else from changing the values here.

```drracket
(define days-per-year 360) ; Some strange calendar, perhaps in Indiana.
...
> (years-to-seconds 10)
311040000
```

What we'd like to do is to declare the values once, but keep them local
to `years-to-seconds`. The strategy is to move the `let` outside the
`lambda`.

```drracket
(define years-to-seconds
  (let* ([days-per-year 365.24]
         [hours-per-day 24]
         [minutes-per-hour 60]
         [seconds-per-minute 60]
         [seconds-per-year (* days-per-year hours-per-day
                              minutes-per-hour seconds-per-minute)])
    (lambda (years)
      (* years seconds-per-year))))
```

```drracket
> (years-to-seconds 10)
315567360.0
```

As you will see in the lab, it is possible to empirically verify that
the bindings occur only once in this case, and each time the procedure
is called in the prior case.

One moral of this story is *whenever possible, move your bindings
outside the `lambda`*.   Let's return to the `vowel?`
procedure we wrote above.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel?
  (lambda (ch)
    (let ([lc (char-downcase ch)])
      (or (char=? lc #\a)
          (char=? lc #\e)
          (char=? lc #\i)
          (char=? lc #\o)
          (char=? lc #\u)))))
```

That code is still somewhat repetitious.  After all, we're doing the
same thing for each of each of the cases: comparing.  We can take
advantage of our friends `any` and `cut` to help out.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel?
  (lambda (ch)
    (let ([lc (char-downcase ch)]
          [vowels (string->list "aeiou")])
      (ormap (cut (char=? lc <>)) vowels))))
```

But that definition requires DrRacket to build the list every time
we call the `vowel?` procedure.  It may not
matter if we do that once, or twice, or even a hundred times.  But
when we're tallying a list of 42,000 elements (e.g., comparing vowels
to consonants in _The Wizard of Oz_, that's a lot of
extra work.  Hence, we might more sensibly write the following.

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (let ([lc (char-downcase ch)])
        (ormap (cut (char=? lc <>)) vowels)))))
```

Unfortunately, it is not always possible to move the bindings outside of
the `lambda`. In particular, if your let-bindings use parameters, then you
need to keep them within the body of the lambda. 

```drracket
;;; (vowel? ch) -> boolean?
;;;   ch : char?
;;; Determine whether ch is a vowel.
(define vowel-INCORRECT?
  (let ([vowels (string->list "aeiou")]
        [lc (char-downcase ch)])
    (lambda (ch)
      (ormap (cut (char=? lc <>)) vowels))))
```

If you try to run this, it will complain that it doesn't know what `ch`
is.  (Or, worse yet, it will use some other `ch` that bears no relation
to the input to the procedure.

## Local procedures

As you may have noted, `let` behaves somewhat like `define` in that
programmers can use it to name values. But we've used `define` to name
more than values; we've also used it to name procedures. Can we also use
`let` for procedures?

Yes, one can use a `let`- or `let*`-expression to create a local name
for a procedure. And we name procedures locally for the same reason that
we name values, because it speeds and clarifies the code.

```drracket
(define hypotenuse-of-right-triangle
  (let ([square (lambda (n) (* n n))])
    (lambda (first-leg second-leg)
      (sqrt (+ (square first-leg) (square second-leg))))))
```

Regardless of whether `square` is also defined outside this definition
(e.g., as a procedure that draws squares), the local binding gives
it the appropriate meaning within the lambda-expression that describes
what `hypotenuse-of-right-triangle` does.

Note, once again, that there are two places one might define `square`
locally. We can define it before the lambda (as above) or after the lambda
(as below). In the first case, the definition is done only once. In the
second case, it is done *every time* the procedure is executed.

```drracket
(define hypotenuse-of-right-triangle
  (lambda (first-leg second-leg)
    (let ([square (lambda (n) (* n n))])
      (sqrt (+ (square first-leg) (square second-leg))))))
```

So, which we should you do it? If the helper procedure you're defining
uses any of the parameters of the main procedure, it needs to come after
the `lambda`. Otherwise, it is generally a better idea to do it before
the lambda. As you practice more with `let`, you'll find times that each
choice is appropriate.  It may be difficult at first, but it will become
clearer as time goes on.

## Nested `define` Statements

Although most versions of Scheme frown upon using `define` for local
bindings, DrRacket also lets you create local bindings by nesting
`define` statements within each other. We recommend that you limit
your use of `define` to top-level definitions, using just `let` and
`let*` for internal definitions. While you can use one `define` within
another, the semantics are a bit complicated, and such use can lead
to unexpected results and therefore confusion. (We also find internal
`define` statements inelegant; others may feel differently.)

Here's a simple example of why we suggest that you use `let` rather
than `define`.  Suppose that you've decided to increment one of the
parameters and would like to use the same name to refer to that parameter.
You know that Scheme does not let you easily change the value bound
to a name.  However, it does allow you to rebind the name.  You might
try the following.  

```drracket
(define sample-w/let
  (lambda (x)
    (let ([x (+ x 1)])
      (list x x x))))

(define sample-w/define
  (lambda (x)
    (define x (+ x 1))
    (list x x x)))
```

What happens if we use these two definitions?  Let's start with `let`.

```drracket
> (sample-w/let 41)
'(42 42 42)
```

That works fine.  What about the one that uses `define`?

```drracket
> (sample-w/define 41)
. . x: undefined;
 cannot use before initialization
```

My, that's strange.  Isn't `x` defined through the `lambda`?  It turns out
that while `x` *is* defined by the `lambda`, the evaluate of `define`
is such that it binds the name before it evaluates the expression.
That is, in evaluating `(define name exp)`, the Racket interpreter
first puts `name` into the binding table with a value of *undefined*.
Then it evaluates the expression.  Then it updates the binding table.
That may be a strange order, particularly in the middle of the procedure,
but it tends to be useful at the top level.

## Self checks

### Check 1: Exploring `let` (‡)

What are the values of the following `let`-expressions? You may use
DrRacket to help you answer these questions, but be sure you can
explain how it arrived at its answers.

{:type="a"}
a.

```drracket
(let ([tone "fa"]
      [call-me "al"])
  (string-append call-me tone "l" tone))
```

b.

```drracket
(let ([total (+ 8 3 4 2 7)])
  (let ([mean (/ total 5)])
    (* mean mean)))
```

c.

```drracket
(let* ([total (+ 8 3 4 2 7)]
       [mean (/ total 5)])
   (* mean mean))
```

d.

```drracket
(let ([total (+ 8 3 4 2 7)]
      [mean (/ total 5)])
   (* mean mean))
```

e.

```drracket
(let ([inches-per-foot 12.0]
      [feet-per-mile 5280])
  (let ([inches-per-mile (* inches-per-foot feet-per-mile)])
    (* inches-per-mile inches-per-mile)))
```

### Check 2: Comparing `let` and `let*`

{:type="a"}
a. You may have discovered that Check 1b and Check 1c are equivalent.
Which do you prefer? Why?

b. Rewrite Check 1e to use `let*`.

### Check 3: Ratios, revisited (‡)

a. Rewrite `v2c-ratio` using a helper procedure to avoid the
redundant call to `string->list`.

b. Rewrite `v2c-ratio` using `let` to avoid the redundant call
to `string->list`..

Questions and Answers
---------------------

Why do we care about avoiding the redundant call to `string->list`?

> `string->list` is a comparatively "expensive" procedure (in terms
of computing resources).  So we'd rather not do it twice.

What do you mean by "helper procedure"?

> We tend to use "helper" generically for "any procedure we write to use 
  specifically in another procedure".

Why would we want to use `let` instead of `let*`?

> `let` permits simultaneous evaluation, which can be more efficient.

> Also, we may want to use the original value associated with a name.

> However, I'll note that at least one of the instructors in the
  department thinks that we should only use `let*`.
