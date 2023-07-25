---
title: The Zen of Booleans
---
# {{ page.title }}

The more you use and read code that uses conditionals and Booleans,
the more you will find that not only are there different ways to
express the same conditional, but some are regularly shorter or
more elegant (whatever that means to you) than others.  Some of
Grinnell's CS faculty consider that a sign that you've finally
understood Booleans and that it's a natural progression.  Others
refer to it as "The Zen of Booleans", a phrase they learned from
some curmudgeon at the University of Washington.

Note: It will take a while to fully embrace the Zen of Booleans.
It's fine if you write non-Zen code on the first go-round.  But
once you have the code work, use some of the patterns you see here
in making your code more Zen-like.

## Some basics

You likely learned an early rule of the Zen of Booleans in the first
lab on Booleans.  In particular, `(if GUARD #t #f)` is a long way
to write `GUARD`.  That is, when `GUARD` has the value `#t`, `(if
GUARD #t #f)` also has the value `#t`.  Similarly, when `GUARD` has
the value `#f`, `(if GUARD #t #f)` also has the value `#f`.  So
`(if GUARD #t #f)` has the same value as `GUARD`, making it a
more-complicated way to write `GUARD`.  For example `(if (>= x 2)
#t #f)` should be written as `(>= x 2)`.

There's a similar, but slightly more complex rule in the Zen of
Booleans.  `(if GUARD #f #t)` is a complicated way to write
`(not GUARD)`.  We'll let you work on the details.  So,
don't write `(if (>= x 2) #f #t)`, write `(not (>= x 2))` or,
better yet, `(< x 2)`.  (See how much easier it is to figure
out that simpler version when you've simplified a bit already?)
Similarly, don't write `(if (and (odd? x) (>= x 3)) #f #t)`, write
`(not (and (odd? x) (>= x 3)))`.  (That one is a bit harder to
rewrite.)

## Be implicit, not explicit

More generally, the Zen of Booleans involves avoiding explicit
`#t` and `#f` in your tests.  Avoiding those constants tends
to make your code more concise.  You may find it a bit harder to
read at first, but it becomes more natural over time.  More importantly,
as the `not` example above suggested, it can a step toward even more
concise code.

What are some other common rules of the Zen of Booleans?  One is
that you should never explicitly compare to `#t` or `#f`.  That
is `(equal? GUARD #t)` is just a complicated way to write `GUARD` and
`(equal? GUARD #f)` is a complicated way to write `(not GUARD)`.  So
use those two expressions instead.

## Rethinking conditionals with `and` and `or`.

Here's a more complicated one.  Suppose you find you are writing
something like the following,

```drracket
(cond
  [GUARD1
   #t]
  [GUARD2
   #t]
  [GUARD3
   #t]
  [else
   #f])
```

Why not just write `(or GUARD1 GUARD2 GUARD3)`?  It gives the same
result and it's much more concise.

That suggests a second major aspect of the Zen of Booleans: Consider
ways to use `and` and `or`.  Suppose you find yourself writing
something like this.

```drracket
(if GUARD1
    (if GUARD2
        CONSEQUENT
        ALTERNATE)
    ALTERNATE)
```

That is, we need both `GUARD1` and `GUARD2` to hold, in which case we
do `CONSEQUENT`.  Otherwise, we need to do `ALTERNATE`.  We can write
that more concisely as follows.

```drracket
(if (AND GUARD1 GUARD2)
    CONSEQUENT
    ALTERNATE)
```

Here's one more fun use of `and`: Over time, you may find that you
regularly write `(if TEST CONSEQUENT #f)`.  `(and TEST CONSEQUENT)`
achieves the same goal.

## Avoiding redundant work in `cond` statements

Is this really part of the Zen of Booleans?  I'm not sure.  But I'm putting
it here anyway.

As you write `cond` statements, you should remember that when we get to
each guard, *all of the previous guards have failed*.  So there's no
need to re-check those guards.

Consider the problem of converting a numeric grade to a letter grade 
according to the rules: 

* Anything 4.0 and higher is an A.
* Anything at least 3.0 and less than 4.0 is a B.
* Anything at least 2.0 and less than 3.0 is a C.
* Anything at least 1.0 and less than 2.0 is a D.
* Anything else is an F.

Here's how some people might write that.

```drracket
(cond
  [(>= grade 4.0)
   "A"]
  [(and (>= grade 3.0) (< grade 4.0))
   "B"]
  [(and (>= grade 2.0) (< grade 3.0))
   "C"]
  [(and (>= grade 1.0) (< grade 2.0))
   "D"]
  [else
   "F"])
```

But that's doing extra work.  If the first guard holds, we know that
`grade` can't be greater than or equal to 4.0, so it must be less than
4.0.  There's no reason for the `(< grade 4.0)` in the second guard.
Similarly, if the second guard fails, we know the grade must be less than
3.0.  And so on and so forth.  So we can instead write something like
the following.

```drracket
(cond
  [(>= grade 4.0)
   "A"]
  [(>= grade 3.0)
   "B"]
  [(>= grade 2.0)
   "C"]
  [(>= grade 1.0)
   "D"]
  [else
   "F"])
```

Isn't that easier to read?  It's also less work for the computer.

## Review: Some principles

* Avoid explicit `#t` and `#f`.  (_See rules below._)
* Consider rewriting `(NOT GUARD)` to a `NEWGUARD` with the same meaning.  (_See some rules below._)
* Take advantage of `and` and `or`.

## Review: Some basic rules

* Rewrite `(if GUARD #t #f)` to `GUARD`
* Rewrite `(if GUARD #f #t)` to `(not GUARD)`
* Rewrite `(equal? GUARD #t)` to `GUARD`
* Rewrite `(equal? GUARD #f)` to `(not GUARD)`
* Rewrite `(not (<= A B))` to `(> A B)`
* Rewrite `(not (< A B))` to `(>= A B)`
* Rewrite `(not (>= A B))` to `(< A B)`
* Rewrite `(not (> A B))` to `(<= A B)`
* Rewrite `(if GUARD CONSEQUENT #f)` to `(and GUARD CONSEQUENT)`.

You will find others.

## Some other issues

Note that `(not (positive? A))` is not the same as `(negative? A)`, since
zero is neither positive nor negative.
