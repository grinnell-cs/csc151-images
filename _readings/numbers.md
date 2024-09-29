---
title: Numeric values
summary: |
  We examine a variety of issues pertaining to numeric values in
  Scheme, including the types of numbers that Scheme supports and
  some common numeric functions.
---

## Introduction

Computer scientists write algorithms for a variety of problems. Some
types of computation, such as representation of knowledge, use symbols
and lists. Others, such as the construction of Web pages, may involve
the manipulation of strings (sequences of alphabetic characters).
Even when working with text, a significant amount of computation
involves numbers.  And, even though numbers seem simple, it turns out
that there are some subtleties to the representation of numbers in
Scheme.

As you may recall from our first discussion of data types, when learning
about data types, you should consider the _name_ of teach type, its
_purpose_, how Scamper _displays_ values in the type, how you _express_
those values, and what _operations_ are available for those values.

While it seems like "numbers" is an obvious name for this type, Scheme
provides multiple kinds of numeric values.  In each case, the purpose is
the same: to support computation that involves numbers.

## Categories of numeric values

As you probably learned in secondary school, there are a variety of categories
of numeric values. The most common categories are _integers_, (numbers with no
fractional component), _rational numbers_ (numbers that can be expressed as the
ratio of two integers), and _real numbers_ (numbers that can be plotted on
a number line).  You also learned about _complex numbers_ (numbers that can
include an imaginary component) that arose when you solved polynomials with
real coefficients.

In traditional mathematics, each category is a subset of the next
category.  That is, every integer is a rational number because it can be
expressed with a denominator of zero, every rational number is a real
number because it can be plotted on the number line, and every real
number is complex because it can be expressed with an imaginary
component of zero.

In contrast, Scamper does not readily distinguish the rational and real
numbers. Instead, like most conventional programming languages, Scamper
distinguishes between two broad classes of numbers:

+   _Integral_ values, _i.e._, numbers without a fractional component, _e.g._, `427198`.
+   _Floating-point_ values, _i.e._, numbers with a fractional component, _e.g._, `3.4170`.

Importantly, because these numbers must be physically stored in a computer
somewhere, they are necessary _bounded_ values, _i.e._, there are limits
to the sizes of values these numbers can represent.

Recall that some numbers, _e.g._, the _irrational numbers_ such as $$\pi$$,
have infinite decimal expansions. A consequence of the bounded nature of
numbers in a computer program is that we have to represent numbers like $$\pi$$
as _approximations_. In other cases, when we perform some computations
involving infinite fractional components, we may induce _round-off error_
because we have to store these infinite values using a finite amount of space.

When Scamper displays a number that is a floating point value, it includes
a decimal point, an exponential component in the result, or both.

<pre class="scamper source">
(sqrt 2)
(expt 3.0 100)
</pre>

Why is the square root of 2 approximated?  Because it's impossible to
represent precisely as a finite decimal number.  That means that
Scamper approximates it.  And, because it's approximated, our
calculations using that result will also be approximate.

<pre class="scamper source">
(* (sqrt 2) (sqrt 2))
</pre>

The decimal sign warns us that we are straying into the realm of
estimations and approximations.

In contrast, integer computations are always exact provided that we don't
produce numbers that are bigger than the maximum size of an integer in Scamper.
In those cases, Scamper will automatically move to a floating-point
representation which is approximate.

<pre class="scamper source">
(+ 1 1)
(/ 10 2)
(* 426198421879421897412 4782147894721489712)
</pre>

You can express values to Scamper using similar notation.  That is, when you
want a precise integer value, you do not include a decimal point or the
exponent.  When you want a floating-point number, you include the dot and/or
exponent.

<pre class="scamper source">
-3
0.5
(+ 1 1e-7)
</pre>

In general, programmers tend to model objects in the world using integers
because they provide precise, predictable results. When we use floating-point
numbers, we have to be highly aware of their approximate nature and go out
of our way to ensure our programs are correct in spite of those limitations.
In fact, whole areas of mathematics, _e.g._, applied computational mathematics,
are dedicated to studying algorithms that perform tasks with floating-point
numbers that minimize errors!

When describing the procedures that work with numbers, we should try to
describe how the type of the result depends on the type of the input. For
example, the addition operator, `,+` provides an integer result only when all
of its inputs are integers. Note that Scamper will gladly give an integral
result if it can deduce that one of the arguments is actually integral, even
when written as a floating-point number.

<pre class="scamper source">
(+ 2 3 4)
(+ 2 3.0 4)
(+ 2 1e-3 5)
(+ 2 3.0 -3.1)
</pre>

## Numeric operations

You've already encountered the four basic arithmetic operations of
addition (`+`), subtraction (`-`), multiplication (`*`), and
division (`/`).  But those are not the only basic arithmetic
operations available.  Scheme also provides a host of other numeric
operations.  We'll introduce most as they become necessary.  For now,
we'll start with a few basics.

### Integer division

In addition to "real division", Scheme also provides two procedures that
handle "integer division", `quotient` and `remainder`. Integer division
is is likely the kind of division you first learned; when you divide one
integer by a number, you get an integer result (the quotient) with,
potentially, some left over (the remainder). For example, if you have
to divide eleven jelly beans among four people, each person will get two
(the quotient) and you'll have three left over (the remainder).

<pre class="scamper source">
(quotient 11 4)
(remainder 11 4)
(quotient 15 5)
(remainder 15 5)
</pre>

We also get sensible results when mixing floating-point and integer values.

<pre class="scamper source">
(quotient 5.5 2)
(remainder 5.5 4)
</pre>

### Roots and exponents

As you've seen, Scheme provides ways to compute the square root of a number,
using `(sqrt x)` and to compute "x to the n" using `(expt x n)`.  When given
integer inputs, both return inexact results.  Both will provide floating-point
results if the output demands it or if the inputs are floating-point numbers.

<pre class="scamper source">
(sqrt 4)
(sqrt 4.0)
(sqrt 2)
(expt 2 5)
(expt 0.3 0.8)
</pre>

What happens when we take the square root of a negative number? Recall that
the result is a _complex number_, a number with the imaginary number $$i$$.

<pre class="scamper source">
(sqrt -2)
</pre>

In Scamper, we get `NaN` which is a special number called _Not a Number_.
`NaN`s are produced by our math operations when they would end up producing
a non-real number.

### Finding small and large values

Scheme provides the `(max` `val1` `val2` `...)` and
`(min` `val1` `val2` `...)` procedures to find the largest or smallest
in a set of values.  Both of these procedures will produce an exact
number only when all of the arguments are exact.  As you might expect,
the value produced will be an integer only when it meets the criterion
of being largest or smallest.

<pre class="scamper source">
(max 1 2 3)
(max 3 1 2)
(max 2 1 3)
(max 1 2 3 1.5)
(min 3 1 2 4 8 7 -1)
</pre>

### Rounding

Scheme provides _four_ different ways to round real numbers to nearby
integers.  `(round` `num)` rounds to the nearest integer.
`(floor` `num)` rounds down.  `(ceiling` `num)` rounds up.
`(truncate` `num)` throws away the fractional part, effectively rounding
toward zero.

<pre class="scamper source">
(round 3.2)
(round 3.8)
(floor 3.8)
(ceiling 3.8)
(truncate 3.8)
(floor -3.8)
(truncate -3.8)
</pre>

## Self Checks

### Check 1: Exploring exponentiation (‡)

In the examples above, we gave a wide variety of examples of the `expt`
procedure in action. Try `expt` on additional examples of your own design, and
try to cover all the possible combinations of integer, negative/non-negative,
and floating-point values to the function.

After you have done this, try to summarize as concisely as possible the
situations in which `expt` will produce:

+   An integral result and
+   A floating-point result.