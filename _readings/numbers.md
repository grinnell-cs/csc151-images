---
title: Numeric values
summary: |
  We examine a variety of issues pertaining to numeric values in
  Racket, including the types of numbers that Racket supports and
  some common numeric functions.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Data types](../readings/data-types).
---
## Introduction

Computer scientists write algorithms for a variety of problems. Some
types of computation, such as representation of knowledge, use symbols
and lists. Others, such as the construction of Web pages, may involve
the manipulation of strings (sequences of alphabetic characters).
Even when working with text, a significant amount of computation
involves numbers.  And, even though numbers seem simple, it turns out
that there are some subtleties to the representation of numbers in
Racket.

As you may recall from our first discussion of data types, when learning
about data types, you should consider the _name_ of teach type, its
_purpose_, how DrRacket _displays_ values in the type, how you _express_
those values, and what _operations_ are available for those values.

While it seems like "numbers" is an obvious name for this type, Racket
provides multiple kinds of numeric values.  In each case, the purpose is
the same: to support computation that involves numbers.

## Categories of numeric values

As you probably learned in secondary school, there are a variety of
categories of numeric values. The most common categories are _integers_,
(numbers with no fractional component), _rational numbers_ (numbers
that can be expressed as the ratio of two integers), and _real numbers_
(numbers that can be plotted on a number line).  DrRacket also permits
_complex numbers_ (numbers that can include an imaginary component).

In traditional mathematics, each category is a subset of the next
category.  That is, every integer is a rational number because it can be
expressed with a denominator of zero, every rational number is a real
number because it can be plotted on the number line, and every real
number is complex because it can be expressed with a an imaginary
component of zero.

In contrast, Racket does not readily distinguish the rational and real
numbers.  There's an underlying philosophy for this choice; behind the
scenes, every real number is represented as a rational number.

However, Racket does distinguish between numbers in another way: Some
numbers it represents precisely and some numbers it approximates. Why
does it make that choice?  In part, because most programming languages
include at least one approximate representation.  In part, because
working with precise representations of very large numbers may be both
computationally expensive and misleading (e.g., we may think that our
computations are more prceise than they are).

How can you tell the difference?  When DrRacket displays a number that
may be approximated (which we will refer to as an _inexact number_),
it includes a decimal point, an exponentional component in the result,
or both.

```drracket
> (sqrt 2) ; The square root of 2
1.4142135623730951
> (expt 3.0 100) ; 3.0 to the 100th power
5.153775207320113e+47
```

Why is the square root of 2 approximated?  Because it's impossible to
represent precisely as a finite decimal number.  That means that
DrRacket approximates it.  And, because it's approximated, our
calculations using that result will also be approximate.

```drracket
> (* (sqrt 2) (sqrt 2))
2.0000000000000004
```

The decimal sign warns us that we are straying into the realm of
estimations and approximations.

In contrast, when displaying a number that it has represented exactly,
DrRacket includes no decimal point.

```drracket
> (/ 3 6)
1/2
> (expt 3 100)
515377520732011331036461129765621272702107522001
> (sqrt -4)
0+2i
```

You can express values to DrRacket using similar notation.  That is,
when you want an exact number, you do not include a decimal point or the
exponent.  When you want a constant rational number (one that does not
involve variables), you can write the numerator, a slash, and the
denominator.  When you want a complex number, you write a plus sign
between the two halves and put an `i` at the end.

```drracket
> 1/2
1/2
> 0.5
0.5
> 1/7
1/7
> (* 3+4i 0+1i)
-4+3i
```

If you've been keeping track, you may have realized that we have at
least six different kinds of numbers in DrRacket: exact integers,
inexact integers, exact real/rational numbers (we'll call these
"rational numbers"), inexact real/rational numbers (we'll call these
"real numbers"), exact complex numbers, and inexact complex numbers.
You will find that each has its own particular use.  When we want to be
precise, such as when dealing with financial matters, we will use exact
numbers (most likely, exact integers).  When the computation does not
permit exact representation, such as when we start to deal with certain
square roots, we will use inexact values. What about complex numbers?
We'll generally leave those to the physicists.

When describing the procedures that work with numbers, we should try to
describe how the type of the result depends on the type of the input.
For example, the addition operator, `,+` provides an exact result only
when all of its inputs are exact.

```drracket
> (+ 2 3 4)
9
> (+ 2 3.0 4)
9.0
> (+ 2 1/3 5)
22/3
> (+ 2 3.0 -3.0)
2.0
```

As the final example suggests, Racket will give an inexact output even
if the inexact components "cancel out".  That's a sensible approach;
once you've introduced approximations into your computation, you should
accept that it's approximate.

## Numeric operations

You've already enountered the four basic arithmetic operations of
addition (`+`), subtraction (`-`), multiplication (`*`), and
division (`/`).  But those are not the only basic arithmetic
operations available.  Racket also provides a host of other numeric
operations.  We'll introduce most as they become necessary.  For now,
we'll start with a few basics.

### Integer division

In addition to "real division", Racket also provides two procedures that
handle "integer division", `quotient` and `remainder`. Integer division
is is likely the kind of division you first learned; when you divide one
integer by a number, you get an integer result (the quotient) with,
potentially, some left over (the remainder). For example, if you have
to divide eleven jelly beans among four people, each person will get two
(the quotient) and you'll have three left over (the remainder).

```drracket
> (quotient 11 4)
2
> (remainder 11 4)
3
> (quotient 15 5)
3
> (remainder 15 5)
0
```

You can also do integer division with inexact integers.  In that case,
you will get an inexact result.

```drracket
> (quotient 11 4.0)
2.0
> (remainder 11.0 4)
3.0
```

We do not recommend that you use inexact integers.  Nonetheless, when
exploring a new procedure, it is useful to consider the different kinds
of inputs that the procedure might or might not take.  And, on that
note, let's see what happens when you try to do integer division with
non-integers.

```drracket
> (quotient 11/2 2)
quotient: contract violation
  expected: integer?
  given: 11/2
  argument position: 1st
  other arguments...:
   2
> (remainder 11 2.5)
remainder: contract violation
  expected: integer?
  given: 2.5
  argument position: 2nd
  other arguments...:
   11
```

As you might have expected, DrRacket issues errors for each of those
cases.

What about negative integers? When you first learned integer division,
you probably didn't think about what happened when the dividend or
divisor is negative.  But the designers of these operations needed to
decide how to handle those cases.  Let's see what happens.

```drracket
> (quotient -11 4)
-2
> (remainder -11 4)
-3
> (quotient 11 -4)
-2
> (remainder 11 -4)
3
> (quotient -11 -4)
2
> (remainder -11 -4)
-3
```

The first pair makes sense because -11 = -2\*4 + -3.  The second pair
makes sense because 11 = -2\*-4 + 3.  The third pair makes sense because
-11 = 2\*-4 + -3.  So all of the computations are consistent. But why
don't we say that -11 = -3\*4 + 1, which also seems to give a quotient
and remainder?  The designers of these operations decided that the
remainder should always have the same sign as the dividend, which
therefore tells us what the quotient should be.

While that's likely more detail than you needed to know, it's important
to remember that what happens in most procedures are not because of some
universal law, but because a designer made a decision, one that should
have some underlying rationale.

### Roots and exponents

As you've seen, Racket provides ways to compute the square root of a
number, using `(sqrt x)` and to compute "x to the n" using
`(expt x n)`.  When given inexact inputs, both return inexact
results.  Both will provide an exact output if they are able to compute
one and an inexact output otherwise.

```drracket
> (sqrt 4)
2
> (sqrt 4.0)
2.0
> (sqrt 2)
1.4142135623730951
> (sqrt -16)
0+4i
> (sqrt -2)
0+1.4142135623730951i
> (sqrt 1+1i)
1.0986841134678098+0.45508986056222733i
> (expt 2 10)
1024
> (expt 2 10.0)
1024.0
> (expt 2.0 10)
1024.0
> (expt 3 -5)
1/243
> (expt 4 1/2)
2
> (expt 1/9 1/2)
1/3
> (expt 2 1/2)
1.4142135623730951
> (expt 243 1/5)
3.0
> (expt 1+1i 4)
-4
> (expt 1.0+1.0i 4)
-4.0+4.898587196589413e-16i
```

### Finding small and large values

Racket provides the `(max` `val1` `val2` `...)` and
`(min` `val1` `val2` `...)` procedures to find the largest or smallest
in a set of values.  Both of these procedures will produce an exact
number only when all of the arguments are exact.  As you might expect,
the value produced will be an integer only when it meets the criterion
of being largest or smallest.

```drracket
> (max 1 2 3)
3
> (max 3 1 2)
3
> (max 2 1 3)
3
> (max 1 2 3 1.5)
3.0
> (max 1 1/3 3 1/5)
3
> (max 7/2 2 3)
7/2
> (min 1 1/3 3)
1/3
> (min 3 1 2 4 8 7 -1)
-1
> (min 3 1 2 4/3 8.0 7)
1.0
> (min 3 1 2+1i)
min: contract violation
  expected: real?
  given: 2+1i
  argument position: 3rd
  other arguments...:
   3
   1
```

As the last example suggests, `max` and `min` won't work with complex
numbers.

### Extracting parts of compound values

Racket also provides a way to "pull apart" rational and complex numbers
using the procedures `(numerator` `num)`, `(denominator` `num)`,
`(real-part` `num)` and `(imag-part` `num)`.

```drracket
> (numerator 3/5)
3
> (denominator 3/5)
5
> (numerator -13/7)
-13
> (denominator -13/7)
7
> (numerator 0.5)
1.0
> (denominator 0.5)
2.0
> (numerator 11)
11
> (denominator 11.0)
1.0
```

```drracket
> (real-part 3+4i)
3
> (imag-part 3+4i)
4
> (real-part 5.0+11.0i)
5.0
> (imag-part 5.0+11.0i)
11.0
> (real-part 1/3)
1/3
> (imag-part 1/3)
0
```

### Rounding

Racket provides _four_ different ways to round real numbers to nearby
integers.  `(round` `num)` rounds to the nearest integer.
`(floor` `num)` rounds down.  `(ceiling` `num)` rounds up.
`(truncate` `num)` throws away the fractional part, effectively rounding
toward zero.

```drracket
> (round 3.2)
3.0
> (round 3.8)
4.0
> (floor 3.8)
3.0
> (ceiling 3.8)
4.0
> (truncate 3.8)
3.0
> (floor -3.8)
-4.0
> (truncate -3.8)
-3.0
```

## Self Checks

### Check 1: Exploring exponentiation (‡)

In the examples above, we gave a wide variety of examples of the `expt`
procedure in action.  Each was intended to reveal something different
about that procedure.  They were also intended to suggest the kinds of
exploration you might do when you encounter or design a new procedure.

Suggest what we might be trying to reveal for each of the following.
For example, the for the second, you might note that the first
example suggests that if the exponent is inexact, the result is
inexact, even if the base and the exponent are integers.

a. `(expt 2 10.0)`

b. `(expt 2.0 10)`

c. `(expt 3 -5)`

d. `(expt 4 1/2)`

e. `(expt 1/9 1/2)`

f. `(expt 2 1/2)`

g. `(expt 243 1/5)`

h. `(expt 1+i 4)`

i. `(expt 1.0+i 4)`
```

## Q&A

In the self-check, why is that both d and g have an exact base and an exact exponent, but only d has an exact result?

> From what I understand, Racket does something different for square roots than for other kinds of fractional exponents.  So, while it "should" be able to get an exact value for the fifth root of 243, it does not.

How important is it to be able to identify the type of output for numeric procedures?

> It's important to know when you are moving from the world of exact answers to the world of approximated answers. Whenever possible, we try to stay in the world of exact numbers.

What is the difference between an exact integer and an inexact integer? They seem to be the same thing but one has a .0 and one doesn't. 

> Exact integers are stored exactly.  Inexact integers are approximated.  For large enough values, you'll see a difference.

        > (expt 10.0 50)
        1e+50
        > (expt 10 50)
        100000000000000000000000000000000000000000000000000
        > (+ 1 (expt 10.0 50))
        1e+50
        > (+ 1 (expt 10 50))
        100000000000000000000000000000000000000000000000001

Is there a way to write mixed numbers to simplify large fractions
and still return exact answers? I believe that I have seen 17 1/2
returned as a mixed number result, but there wasn't a clear way to
type it in as a single value.

> If you write `35/2`, you'll get a mixed number back as a result.
Unfortunately, I don't know a way for humans to write mixed numbers.
