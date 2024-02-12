---
title: Boolean values and predicate procedures
summary: |
  Many of Scheme's control structures, such as conditionals
  (which you will learn about in a subsequent reading), need mechanisms
  for constructing tests that return the values *true* or *false*. These
  tests can also be useful for gathering information about a variety of
  kinds of values. In this reading, we consider the types, basic procedures,
  and mechanisms for combining results that support such tests.
---

## Introduction

When writing complex programs, we often need to ask questions about the
values with which we are computing.  For example, should this entry come
before this other entry when we sort the entries in a table or is this
location within 100 miles of this second location?  Frequently, these
questions, which we often phrase as *tests* (not the same as unit tests),
are used in control structures.  For example, we might decide to do 
one thing if a value is a string and another if it is an integer.

To express these kinds of questions, we need a variety of
tools. First, we need a *type* in which to express the valid answers to
questions. Second, we need a collection of procedures that can answer
simple questions. Third, we need ways to combine questions. Finally,
we need control structures that use these questions. In the subsequent
sections of this reading, we consider each of these issues. We will return
to more complex control structures in another reading.

## Boolean values

A *Boolean value* is a datum that reflects the outcome of a single
yes-or-no test. For instance, if one were to ask whether Des Moines is
within 100 miles of Boston, it would determine that the two cities are not
that close and it would signal this result by displaying the Boolean
value for "no" or "false", which is `#f`. There is only one other Boolean
value, the one meaning "yes" or "true", which is `#t`. These are called
"Boolean values" in honor of the logician George Boole who was the first
to develop a satisfactory formal theory of them. (Some folks now talk
about "fuzzy logic" that includes values other than "true" and "false",
but that's beyond the scope of this course.)

## Predicates

A *predicate* is a procedure that always returns a Boolean value. A
procedure call in which the procedure is a predicate performs some
yes-or-no test on its arguments. For instance, the predicate `number?`
(the question mark is part of the name of the procedure) takes one
argument and returns `#t` if that argument is a number, `#f` if it does
not. Similarly, the predicate `even?` takes one argument, which must be
an integer, and returns `#t` if the integer is even and `#f` if it is
odd. The names of most Scheme predicates end with question marks, and
Grinnell's computer scientists recommend this useful convention, even
though it is not required by the rules of the programming language.

Scheme provides a wide variety of basic predicates and the `csc151`
package adds a few more. We will consider a few right now, but learn
more as the course progresses.

### Type predicates

The simplest predicates let you test the type of a value. Scheme provides
a number of such predicates.

* `number?` tests whether its argument is a number.
* `integer?` tests whether its argument is an integer.
* `real?` tests whether its argument is a real number.
* `string?` tests whether its argument is a string.
* `procedure?` tests whether its argument is a procedure.
* `boolean?` tests whether its argument is a Boolean value.
* `list?` tests whether its argument is a list.

The `csc151` library provides many others. Here are a few.

* `rgb?` tests whether its argument is an RGB color.
* `color-name?` tests whether its argument is a color name.
* `color?` tests whether its argument is one of the various representations
  of colors we use.
* `image?` tests whether its argument is an image.
* `polygon?` tests whether an image is a polygon.

### Equality predicates

Scheme provides a variety of predicates for testing whether two values
can be understood to be the same.

* `eq?` tests whether its two arguments are identical, in the very
  narrow sense of occupying the same storage location in the computer's
  memory. In practice, this is useful information only if at least one
  argument is known to be a symbol, a Boolean value, or an integer.
* `eqv?` tests whether its two arguments "should normally be regarded as 
  the same object" (as the language standard declares). Note, however,
  that two lists of values can have the same elements without being
  "regarded as the same object". Also note that in Scheme's view the
  number 5, which is "exact", is not necessarily the same object as the
  number 5.0, which might be an approximation.
* `equal?` tests whether its two arguments are the same or, in the case 
  of lists, whether they have the same contents.
*  `=` tests whether its arguments, which must all be numbers, are 
  numerically equal; 5 and 5.0 are numerically equal for this purpose.

*For this class, you are not required to understand the difference between the `eq?`, `eqv?`, and `equal?` procedures. In particular, you need not plan to use the `eqv?` procedure. At least for the first half of the semester, you also need not understand the difference between the `eq?` and `equal?` procedures. Feel free to use `equal?` almost exclusively, except when dealing with numbers, in which case you should use `=`.*

### Numeric predicates

Scheme also provides many numeric predicates, some of which you may have
already explored.

* `even?` tests whether its argument, which must be an integer, is even.
* `odd?` tests whether its argument, which must be an integer, is odd.
* `zero?` tests whether its argument, which must be a number, is equal to zero.
* `positive?` tests whether its argument, which must be a real number, is positive.
* `negative?` tests whether its argument, which must be a real number, is negative.
* `exact?` tests whether its argument, which must be a number, is represented exactly.
* `inexact?` tests whether its argument, which must be a number, is not represented exactly.

## Comparators

When we use a predicate to compare two values, most frequently to see
if one should precede the other in some natural ordering, we often refer
to that predicate as a "comparator".

### Numeric comparators

Scheme provides a number of numeric comparators.

* `<` tests whether its arguments, which must all be numbers, are in
  strictly ascending numerical order. (The `<` operation is one of the
  few built-in predicates that does not have an accompanying question mark.)
* `>` tests whether its arguments, which must all be numbers, are in strictly 
  descending numerical order.
* `<=` tests whether its arguments, which must all be numbers, are in 
  ascending numerical order, allowing equality.
*  `>=` tests whether its arguments, which must all be numbers, are in 
  descending numerical order, allowing equality.

### Some other comparators

As you've studied other types, you may have seen other comparators.
Here are some of the more common ones.

* `char<?` tests whether itss arguments, which must all be characters,
  are in strictly ascending alphabetical order.
* `char<=?` tests whether its arguments, which must all be characters,
  are in ascending alphabetical order.
* `char>?` tests whether its arguments, which must all be characters,
  are in strictly descending alphabetical order.
* `char>=?` tests whether its arguments, which must all be characters,
  are in descending alphabetical order.
* `char-ci<?` tests whether itss arguments, which must all be characters,
  are in strictly ascending alphabetical order, ignoring case.
* `char-ci<=?` tests whether its arguments, which must all be characters,
  are in ascending alphabetical order, ignoring case.
* `char-ci>?` tests whether its arguments, which must all be characters,
  are in strictly descending alphabetical order, ignoring case.
* `char-ci>=?` tests whether its arguments, which must all be characters,
  are in descending alphabetical order, ignoring case.

```
> (char<? #\a #\a)
#f
> (char<=? #\a #\a)
#t
> (char<? #\a #\b)
#t
> (char<? #\a #\B)
#f
> (char-ci<? #\a #\B)
#t
> (char<=? #\a #\A)
#f
> (char-ci<=? #\a #\A)
#t
```

* `string<?` tests whether its arguments, which must all be strings,
  are in strictly ascending alphabetical order.
* `string<=?` tests whether its arguments, which must all be strings,
  are in ascending alphabetical order.
* `string>?` tests whether its arguments, which must all be strings,
  are in strictly descending alphabetical order.
* `string>=?` tests whether its arguments, which must all be strings,
  are in descending alphabetical order.
* `string-ci<?` tests whether its arguments, which must all be strings,
  are in strictly ascending alphabetical order, but ignoring case.
* `string-ci<=?` tests whether its arguments, which must all be strings,
  are in ascending alphabetical order, but ignoring case.
* `string-ci>?` tests whether its arguments, which must all be strings,
  are in strictly descending alphabetical order, but ignoring case.
* `string-ci>=?` tests whether its arguments, which must all be strings,
  are in descending alphabetical order, but ignoring case.

## Negating Boolean values with `not`

Not all the procedures we use to work with Boolean values are strictly
predicates. Another useful Boolean procedure is `not`, which takes
one argument and returns `#t` if the argument is `#f` and `#f` if the
argument is anything else. For example, one can test whether `picture`
is not an image with

```
> (not (image? picture))
```

If Scheme says that the value of this expression is `#t`, then `picture`
is not an image.

## Combining Boolean values with `and` and `or`

The `and` and `or` keywords have simple logical meanings. In particular,
the *and* of a collection of Boolean values is true if all are true and
false if any value is false, the *or* of a collection of Boolean values
is true if any of the values is true and false if all the values are
false. For example,

```racket
> (and #t #t #t)
#t
> (and (< 1 2) (< 2 3))
#t
> (and (odd? 1) (odd? 3) (odd? 5) (odd? 6))
#f
> (and)
#t
> (or (odd? 1) (odd? 3) (odd? 5) (odd? 6))
#t
> (or (even? 1) (even? 3) (even? 4) (even? 5))
#t
> (or)
#f
```

## Detour: Keywords vs. procedures

You may note that we were careful to describe `and` and `or` as "keywords"
rather than as "procedures". The distinction is an important one. Although
keywords look remarkably like procedures, Scheme distinguishes keywords
from procedures by the order of evaluation of the parameters. For
procedures, all the parameters are evaluated and then the procedure is
applied. For keywords, not all parameters need be evaluated, and custom
orders of evaluation are possible.

If `and` and `or` were procedures, we could not guarantee their control
behavior. We'd also get some ugly errors. For example, consider the
extended version of the `even?` predicate below:

```
(define new-even?
  (lambda (val)
    (and (integer? val) (even? val))))
```

Suppose `new-even?` is called with 2.3 as a parameter. In the keyword
implementation of `and`, the first test, `(integer? ...)`{:.signature},
fails, and `new-even?` returns false. If `and` were a procedure, we
would still evaluate the `(even? ...)`{:.signature}, and that test would
generate an error, since `even?` can only be called on integers.

## Another detour: Separating the world into false and "truish" (everything not false)

Although many computer scientists, philosophers, and mathematicians prefer
the purity of dividing the world into "false" and "true", Scheme supports
a somewhat more general separation. In Scheme, anything that is not false
is considered "truish". Hence, you can use expressions that return values
other than Boolean values wherever a truth value is expected. For example,

```
> (and #t 1)
1
> (or 3 #t #t)
3
> (not 1)
#f
> (not (not 1))
#t
```

## Writing our own predicates and comparators

We can, of course, write our own predicates.  For example, here is a
predicate that determines whether its input, a real number, is between
0 and 100, inclusive.

```
(define valid-grade?
  (lambda (val)
    (<= 0 val 100)))
```

Note that we might might also write

```
(define valid-grade? (cut (<= 0 <> 100)))
```

We can also write our own comparators.  For example, here's a somewhat
pointless comparator that orders words based on their second letter.

```
;;; (second-letter<? str1 str2) -> boolean?
;;;   str1 : string?
;;;   str2 : string?
;;; Determine if the second letter of str1 alphabetically precedes 
;;; the second letter of str2.
(define second-letter<?
  (lambda (str1 str2)
    (char-ci<? (string-ref str1 1) 
               (string-ref str2 1))))
```

<!--
Let's see how sorting with this comparator differs from sorting with
a more traditional comparator.

```
> (define start-of-jabberwocky
    (list "twas" "brillig" "and" "the" "slithy" "toves" "did" "gyre" "and" 
          "gimble" "in" "the" "wabe" "all" "mimsy" "were" "the" 
          "borogoves" "and" "the" "mome" "raths" "outgrabe"))
> (sort start-of-jabberwocky string<?)
'("all"
  "and"
  "and"
  "and"
  "borogoves"
  "brillig"
  "did"
  "gimble"
  ...
  "twas"
  "wabe"
  "were")
> (sort start-of-jabberwocky second-letter<?)
'("wabe"
  "raths"
  "were"
  "the"
  ...
  "outgrabe"
  "twas"
  "gyre")
```
-->

## Mental models: Tracing `and` and `or`

As you may recall, it is useful to have a mental model for how things work in Racket.  
Our traditional model is that we evaluate the parameters to a procedure and then apply the procedure.  
However, `and` and `or` behave a bit differently.  

Here's the basic behavior of `and`.
Note that we do *not* necessarily evaluate all of its parameters.

* Rule A1: If `and` has no parameters, replace `(and)` with `#t`
* Rule A2: If `and` has exactly one parameter, evaluate that parameter and replace the and expression by the value of the parameter.
* Rule A3: If `and` has more than one parameter, evaluate the first parameter.
    * Rule A3a: If the evaluated parameter is false, replace the whole and expression by false (`#f`).
    * Rule A3b: If the evaluated parameter is truish, remove the first parameter to `and` and continue.

Let's look at a simple but silly example.

```
    (* 2 (and (< 3 4) 5 (+ 1 2)))
    ; Rule A3: More than one parameter
--> (* 2 (and #t 5 (+ 1 2)))
    ; Rule A3b: Parameter (#t) is truish, so drop it.
--> (* 2 (and 5 (+ 1 2)))
    ; Rule A3b: Parameter (5) is truish, so drop it
--> (* 2 (and (+ 1 2)))
    ; Rule A2: Only one parameter, use it in place of the `and`.
--> (* 2 (+ 1 2))
--> (* 2 3)
--> 6
```

We won't usually use `and` with non-Boolean values.
However, there are times that it can be useful to do so.
Let's look at one possibility.

```
(define divide
  (lambda (x y)
    (and (not (zero? y)) (/ x y))))

    (divide 4 2)
    ; Procedure call: Replace x by 4 and y by 2 in the body.
--> (and (not (zero? 2)) (/ 4 2))
    ; Rule A3: Evaluate the first parameter
--> (and (not #f) (/ 4 2))
--> (and #t (/ 4 2))
    ; Rule A3b: First parameter is truish, so drop it
--> (and (/ 4 2))
    ; Rule A2: Only one parameter.  Use it in place of the and.
--> (/ 4 2)
--> 2

    (divide 4 0)
    ; Procedure call: Replace x by 4 and y by 2 in the body.
--> (and (not (zero? 0)) (/ 4 0))
    ; Rule A3: Evaluate the first parameter
--> (and (not #t) (/ 4 0))
--> (and #f (/ 4 0))
    ; Rule A3a: If the first parameter is fale, replace the and by #f
--> #f
```

Note that in the second example, we never attempted the illegal division
of 4 by zero.  Contrast this with what happens if we used a standard
procedure, such as `list`.

```
    (list (not (zero? 0)) (/ 4 0))
--> (list (not #t) (/ 4 0))
--> (list #f (/ 4 0))
--> BOOM!  Can't divide 4 by zero.
```

Let's see the difference in DrRacket.

```
> (and (not (zero? 2)) (/ 4 2))
2
> (list (not (zero? 2)) (/ 4 2))
'(#t 2)
> (and (not (zero? 0)) (/ 4 0))
#f
> (list (not (zero? 0)) (/ 4 0))
. . /: division by zero
```

We'll find other uses for this behavior.

What about `or`?  Here are the rules for or expressions.

* Rule O1: If `or` has no parameters, replace `(or)` with `#f`
* Rule O2: If `or` has exactly one parameter, evaluate that parameter and replace the and expression by the value of the parameter.
* Rule O3: If `or` has more than one parameter, evaluate the first parameter.
    * Rule O3a: If the evaluated parameter is false, remove the first parameter and continue.
    * Rule O3b: If the evaluated parameter is truish, replace the or expression by the first parameter.

## `and` and `or` as control structures

We've seen how `and` and `or` can be used to combine tests. But `and`
and `or` can be used for so much more. In fact, they can be used as
control structures.

In an `and`-expression, the expressions that follow the keyword `and`
are evaluated in succession until one is found to have the value `#f`
(in which case the rest of the expressions are skipped and the `#f`
becomes the value of the entire `and`-expression). If, after evaluating
all of the expressions, none is found to be `#f` then the value of the
last expression becomes the value of the entire `and` expression. This
evaluation strategy gives the programmer a way to combine several tests
into one that will succeed only if all of its parts succeed.

This strategy also gives the programmer a way to avoid meaningless
tests. For example, we should not make the comparison `(<
...)`{:.signature} unless we are sure that both `a` and `b` are numbers.

In an `or` expression, the expressions that follow the keyword `or`
are evaluated in succession until one is found to have a value other
than`#f`, in which case the rest of the expressions are skipped and
this value becomes the value of the entire `or`-expression. If all of
the expressions have been evaluated and all have the value `#f`, then
the value of the `or`-expression is `#f`. This gives the programmer a
way to combine several tests into one that will succeed if *any* of its
parts succeeds.

In these cases, `and` returns the last parameter it encounters (or false,
if it encounters a false value) while `or` returns the first non-false
value it encounters. For example,

```
> (and 1 2 3)
3
> (define x 'two)
> (define y 3)
> (+ x y)
+: expects type <number> as 1st argument, given: two; other arguments were: 3
> (and (number? x) (number? y) (+ x y))
#f
> (define x 2)
> (and (number? x) (number? y) (+ x y))
5
> (or 1 2 3)
1
> (or 1 #f 3)
1
> (or #f 2 3)
2
> (or #f #f 3)
3
```

We can use the ideas above to make an addition procedure that returns
`#f` if either parameter is not a number. We might say that such a
procedure is a bit safer than the normal addition procedure.

```
;;; (safe-add x y) -> number?
;;;   x : number? [verified]
;;;   y : number? [verified]
;;; Add x and y, returning #f is either is not a number.
(define safe-add
  (lambda (x y)
    (and (number? x) (number? y) (+ x y))))
```

Let's compare this version to the standard addition procedure, `+`.

```
> (+ 2 3)
5
> (safe-add 2 3)
5
> (+ 2 'three)
Error: +: argument 2 must be: number
> (safe-add 2 'three)
#f
```

If we'd prefer to return 0, rather than `#f`, we could add an `or` clause.

```
;;; (safer-add x y) -> number?
;;;   x : number? [verified]
;;;   y : number? [verified]
;;; Add x and y, returning 0 if either is not a number.
(define safer-add
  (lambda (x y)
    (or (and (number? x) (number? y) (+ x y))
        0)))
```

In most cases, `safer-add` acts much like `safe-add`. However, when we use the result of the two procedures as an argument to another procedure, we get a little bit further through the calculation.

```
> (* 4 (+ 2 3))
20
> (* 4 (safer-add 2 3))
20
> (* 4 (+ 2 'three))
Error: +: argument 2 must be: number
> (* 4 (safe-add 2 'three))
Error: *: argument 2 must be: number
> (* 4 (safer-add 2 'three))
0
```

Different situations will call for different choices between those strategies.

## Self checks

### Exercise 1: Combining boolean values

Experience suggests that students understand `and` and `or` much better after a little general practice figuring out how they combine values. Fill in the following tables for each of the operations `and` and `or`. The third column of the table should be the value of `(and arg1 arg2)`{:.signature}, where *`arg1`* is the first argument and *`arg2`* is the second argument. The fourth column should be the value of `(or arg1 arg2)`{:.signature}.

| `arg1` | `arg2` | `(and arg1 arg2)`{:.signature} | `(or arg1 arg2)`{:.signature} |
|--------|--------|--------------------------------|-------------------------------|
|  `#f`  |  `#f`  |                                |                               |
|  `#f`  |  `#t`  |                                |                               |
|  `#t`  |  `#f`  |                                |                               |
|  `#t`  |  `#t`  |                                |                               |
{:.table.table-bordered}

### Exercise 2: Comparing strings for length (‡)

We know how to compare strings alphabetically.  Write a comparator,
`(shorter? str1 str2)` that returns true if the length of `str1`
is strictly less than the length of `str2`.

```
> (shorter? "a" "ab")
#t
> (shorter? "abc" "ab")
#f
> (shorter? "ab" "ba")
#f
> (shorter "" "abc")
#t
```

## Acknowledgements

This reading is closely based on [a similar reading from CSC 151
2018S](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/readings/boolean).  We've removed a section on the `comparator` procedure, which we've
dropped from the class library, and added short sections on regular expressions,
filtering, and combining predicates.  Much of the discussion of combining
predicates comes from [a reading on filtering from CSC 151 2018S](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/_dev/_readings/list-filters.md).
.

In Spring 2022, we added a section on tracing.
