---
title: Symbolic values in Racket
summary: |
   In this reading, we consider one of Scheme's central kinds of
   values, symbols.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Expressions and types](../readings/exprs-and--types).
---
## Introduction

You've just encountered a variety of types in Scheme, including not only
many numeric types (integers, reals, rationals, etc.), but also strings,
which are used to represent texts of various sorts.  In our tour of
the basic types used in Scheme, we should consider one more: *symbols*.

Scheme's ancestor, Lisp, was originally developed to aid in experiments
in artificial intelligence. At the time, a leading theory suggested that
intelligence emphasizes symbolic manipulation. Hence, it is sensible
that Lisp and Scheme include symbols as a basic type. Evidence also shows
that many programs most appropriately work on abstract symbolic value.

So, what is a symbol? A symbol is simply a word (usually) that we use to
denote only itself. Unlike a variable, it has no associated value.
Symbols are also *atomic*, we cannot split them apart (as we might
a string, which we can split into individual characters).  The
primary operation we perform on symbols is comparison (determining
whether two symbols are the same). We can't even compare two symbols
for order. (Should jelly come before or after jam? Who decides?)

## Writing symbols

When we want to refer to something as a value involved in a
computation, rather than as the name of some other value, we put
an apostrophe (usually pronounced "quote" or "tick") in front of
it. In effect, by quoting the symbol, we're telling Scheme to take
it literally and without further interpretation or evaluation:

```
> 'sample
'sample
```

We can also create symbols using the `quote` operation.  (In fact,
the apostrophe is a shorthand for "use `quote`.)

```
> (quote sample)
'sample
```

Note: The apostrophe and the quote operation only turn words and
word-like structures into symbols.  If you provide them with, say,
a list or a number, they behave somewhat differently.  A quoted
number is just that number.  A quoted list is a list containing
quoted versions of each element (more or less).

## Using symbols

What good are symbols?  It turns out that the design of Lisp (and Scheme,
and Racket) is such that it's much faster to compare symbols than to 
compare strings.  That means that we often use symbols when we want to
provide a mnemonic value to a procedure.  For example, you've seen us
use the `'solid` parameter to the `circle` procedure.

For the first part of the semester, we will primarily use symbols in
this fashion.  Later in the semester, we may consider other approaches
to using symbols.

## Symbols vs. identifiers

Note that `'sample` (with the quote) is very different from `sample`
(without the quote). In the first case, Scheme interprets it as a
symbol (an atomic value). In the second, Scheme interprets it as
an identifier that names another value (e.g., something defined
with `define`). At first, you may find the distinction a bit
confusing. However, as you get used to programming in Scheme, the
distinction will become natural.

```
> (define sample 85)
> 'sample
'sample
> sample
85
> (list sample)
'(85)
> '(sample)
'(sample)
```

## Self checks

### Check 1: Uses of symbols

We've identified `'solid` as a symbol we've used already.  Identify
a few others.

## Q&A

Are lists symbols?  They also use the tick mark.

> No, lists are not symbols.  The tick mark means "take this verbatim".
  For lists, the tick mark means "don't treat this as an expression".
