---
title: List basics
summary: |
  We consider some basic issues of Racket's _list_ data type, which
  is used to collect multiple values.  We explore the ways to create
  lists and a few operations used to manipulate lists.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Data types](../readings/data-types).
---

## Introduction

In your initial explorations with Scheme you have investigated a variety of basic types of data, including numbers, strings, and images. You can work on many kinds of problems with just these types. However, when you want to address more complex problems you will need to work with collections of data - not just the rating of a movie from one newspaper, but the rating of that movie from many newspapers (or even the ratings of many movies from many newspapers); not just one word, but a sequence of words; not just one color, but many colors.

In Scheme, the simplest mechanism for dealing with collections of data is the _list_ data type. Lists are collections of values that you can process one-by-one or en masse.  In this reading, we will consider Scheme's list data type as well as a few procedures to build and manipulate lists.  

You may recall that there are five basic issues we should consider when we encounter a new type: its _name_, its _purpose_, how one _expresses values_ in the type, how the computer _displays_ values in the type, and what _operations_ are available to you.  (It may seem that we are repeating this list of issues; that's because we want you to accustom yourself to asking about those five issues each time you encounter or design a new type.)

We've already covered the first two: The name of the type is "list" and its primary purpose is to group or collect values.  Let's explore the rest.

## Displaying lists

Because of some early decisions in the design of Lisp, the precursor to
Scheme, lists in Scheme look a lot like procedure calls.  That is, they have an open parenthesis, a bunch of values separated by spaces, and a close parenthesis.  The individual values can also themselves be lists.  However, many implementations of Scheme, including Racket, distinguish lists from expressions with a tick mark (a single-quotation mark).  For example, while `(+ 2 3)` is an expression that indicates that the computer should add the numbers 2 and 3, `'(+ 2 3)` is a list with three values, the symbol `+` and the numbers `2` and `3`.  You will
always see this tick mark on lists that Racket displays.

```drracket
> (+ 2 3)
5
> '(+ 2 3)
'(+ 2 3)
> (string-split "the jaws that bite the claws that catch" " ")
'("the" "jaws" "that" "bite" "the" "claws" "that" "catch")
> (list 1 2 3)
'(1 2 3)
```

## Creating lists

Because lists play a central role in Scheme, there a wide variety of ways to create lists.  One common way to create lists is with the `(list exp0 exp1 ...)` procedure, which evaluates all of its parameters and creates a list from those parameters.

```drracket
> (list 2 3 5 7)
'(2 3 5 7)
> (list "two" "three" "five" "seven")
'("two" "three" "five" "seven")
> (list 1 (+ 2 3) 4)
'(1 5 4)
> (list 1 (list + 2 3) 4)
'(1 (#<procedure:+> 2 3) 4)
> (list 1 (list '+ 2 3) 4)
'(1 (+ 2 3) 4)
> (list)
'()
```

If you need a list of identical values for some reason, you can use the `(make-list n val)` procedure, which takes two parameters: the number of copies of a value to make in the list and the particular value to copy.

```drracket
> (make-list 5 "hello")
'("hello" "hello" "hello" "hello" "hello")
> (make-list 2 4)
'(4 4)
> (make-list 4 2)
'(2 2 2 2)
```

Because we often find that we need a sequence of numbers, many implementations of Scheme include a procedure called `(range lower upper)` that takes two integers as parameters and produces a list of all the numbers greater than or equal to the first and less than the second.

```drracket
> (range 7 11)
'(7 8 9 10)
> (range 2 9)
'(2 3 4 5 6 7 8)
> (range -2 3)
'(-2 -1 0 1 2)
```

There's also a one-parameter version of `range` that produces all the natural numbers less than the parameter.

```drracket
> (range 7)
'(0 1 2 3 4 5 6)
> (range 4)
'(0 1 2 3)
```

While we do not recommend it, you can write list literals using the same syntax as the Scheme interpreter; that is, if you write a tick mark before an open parentheses, the interpreter will treat everything inside as a list, including any nested lists.

```drracket
> '(7 11 doubles)
'(7 11 doubles)
> '()
'()
```

A bit later in the course, we'll learn how to build lists piece by piece.

## Some list operations

Perhaps the simplest list operation is `(length lst)`, which gives you the number of elements in the list.

```drracket
> (length (list))
0
> (length (list 3 4 5))
3
> (length (string-split "he took his vorpal sword in hand" " "))
7
```

You can also extract an element of a list using the `(list-ref list index)` operation.  In Racket, the position of an element is the number of values that appear before that element; hence, the initial element of a list is element 0, not element 1.

```drracket
> (define observation (list "Computers" "are" "sentient" "and" "Malicious"))
> observation
'("Computers" "are" "sentient" "and" "Malicious")
> (list-ref observation 0)
"Computers"
> (list-ref observation 2)
"sentient"
> (length observation)
5
> (list-ref observation 4)
"Malicious"
> (list-ref observation 5)
Error! list-ref: index too large for list
Error!   index: 5
Error!   in: '("Computers" "are" "sentient" "and" "Malicious")
```

The `(index-of val lst)` procedure serves as something like the opposite of `list-ref`: Given a list and an element, it returns the position (index) of the first instance of that element.

```drracket
> (define lead-in (list "a" "one" "and" "a" "two" "and" "a" "..."))
> (index-of lead-in "one")
1
> (index-of lead-in "and")
2
> (list-ref lead-in (index-of lead-in "and"))
"and"
```

The similar `(indexes-of lst val)` (we would have named it `indices-of`) returns a list of all the indices of a value in a list.

```drracket
> (indexes-of lead-in "a")
'(0 3 6)
> (indexes-of lead-in "and")
'(2 5)
```

The `(reverse lst)` procedure creates a new list that consists of the same elements as `lst`, but in the opposite order.

```drracket
> (reverse (range 10))
'(9 8 7 6 5 4 3 2 1 0)
> (reverse (list 'a 'b 'c 'd 'e))
'(e d c b a)
```

The `(append lst1 lst2)` procedure creates a new list that consists of all the elements of the first list followed by the elements of the second list.

```drracket
> (append (range 5) (range 5))
'(0 1 2 3 4 0 1 2 3 4)
> (append (make-list 3 'hello) (make-list 4 'echo))
'(hello hello hello echo echo echo echo)
```

The `(take lst n)` procedure builds a new list that consists of the first `n` elements of `lst` and the `(drop lst n)` procedure builds a list by removing the first `n` elements of `lst`.

```drracket
> (define some-ia-counties
    (list "Adair" "Adams" "Alamakee" "Appanoose" "Audobon"))
> (take some-ia-counties 3)
'("Adair" "Adams" "Alamakee")
> (drop some-ia-counties 3)
'("Appanoose" "Audobon")
> (take (reverse some-ia-counties) 2)
'("Audobon" "Appanoose")
```

## Self Checks

### Check 1: Checking list procedures

Predict the results of evaluating each of the following expressions.

```drracket
(list 2 1)
(make-list 1 2)
(make-list -1 2)
(append (list 2 1) (list 2 1))
(index-of (list 'a 'b) 'a)
(index-of (list 'a 'b) 'c)
(range -3 0)
(range 3)
(range 0)
```

### Check 2: Ranges, revisited (‡)

Suppose we only had the one-parameter version of `range`.  How could you make the list `'(6 5 4 3)`?

