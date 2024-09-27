---
title: List basics
summary: |
  We consider some basic issues of Scheme's _list_ data type, which
  is used to collect multiple values.  We explore the ways to create
  lists and a few operations used to manipulate lists.
---

## Introduction

In your initial explorations with Scheme you have investigated a variety
of basic types of data, including numbers, strings, and images. You can
work on many kinds of problems with just these types. However, when you
want to address more complex problems, particularly problems from data
science, you will need to work with collections of data - not just the
rating of a movie from one newspaper, but the rating of that movie from
many newspapers (or even the ratings of many movies from many
newspapers); not just one word, but a sequence of words.

In Scheme, the simplest mechanism for dealing with collections of data
is the _list_ data type. Lists are collections of values that you can
process one-by-one or en masse.  In this reading, we will consider
Scheme's list data type as well as a few procedures to build and
manipulate lists.  We will return to lists in a near future.

You may recall that there are five basic issues we should consider when
we encounter a new type: its _name_, its _purpose_, how one _expresses
values_ in the type, how the computer _displays_ values in the type, and
what _operations_ are available to you.  (It may seem that we are
repeating this list of issues; that's because we want you to accustom
yourself to asking about those five issues each time you encounter or
design a new type.)

We've already covered the first two: The name of the type is "list" and
its primary purpose is to group or collect values.  Let's explore the
rest.

## Displaying lists

What does a list value look like?
We have already seen several examples of lists as the result of functions from the standard library.
For example, `string->list` produces a list of characters from a string:

~~~racket
(string->list "hello world!")
> (list #\h #\e #\l #\l #\o #\space #\w #\o #\r #\l #\d #\!)
~~~

Observe the result of this function call.
In Scamper, we display a list as a _finished call_ to the `list` function.
Each of the arguments are the values stored in that list.
We can observe this distinction in the following example:

<pre class="scamper-output output-prog">
(list (+ 1 1) (string-length "hello world!") 32)
</pre>

Note how the resulting list contains the values `2` (the result of `(+ 1 1)`), `12` (the result of `string-length`) and `32`.

As a historical note (and perhaps a forewarning if we forget to modify the readings!), in Scheme, a list is displayed in a different way: a parenthesized list of values starting with an apostrophe, also called a _tick_.
For example, the result of `(string->list "hello world!")` in Racket would be:

~~~racket
> (string->list "hello world!")
'(#\h #\e #\l #\l #\o #\space #\w #\o #\r #\l #\d #\!)
~~~

To avoid throwing more syntax at you, we elect in Scamper to use the function form of `list` to represent list values.

## Creating lists

Because lists play a central role in Scheme, there are a wide variety of
ways to create lists.  One common way to create lists is with the
`(list exp0 exp1 ...)` procedure, which evaluates all of its
parameters and creates a list from those parameters.

<pre class="scamper-output output-prog">
(list 2 3 5 7)
(list "two" "three" "five" "seven")
(list 1 (+ 2 3) 4)
(list 1 (list + 2 3) 4)
(list 1 (list (+ 2 3)) 4)
(list)
</pre>

If you need a list of identical values for some reason, you can use the
`(make-list n val)` procedure, which takes two parameters: the
number of copies of a value to make in the list and the particular value
to copy.

<pre class="scamper-output output-prog">
(make-list 5 "hello")
(make-list 2 4)
(make-list 4 2)
</pre>

Because we often find that we need a sequence of numbers, Scheme
includes a procedure called `(range n)` that takes an integer `n` as input produces a list numbers from `0` up to `n`, exclusive.

<pre class="scamper-output output-prog">
(range 7)
(range 4)
</pre>

Additionally, `range` can take two, or even three arguments so that you can further specify the pattern of numbers the function produces.

With two arguments, `(range n m)` produces a list in the range `n` to `m`, exclusive.

<pre class="scamper-output output-prog">
(range 3 10)
(range -11 2)
</pre>

With three arguments, `(range n m k)` will create a list of number from `n` to `m`, exclusive, but step by `k`.
This allows us to specify ranges that go backwards rather than forwards!

<pre class="scamper-output output-prog">
(range 1 10 2)
(range 13 -5 -3)
</pre>

Note that the three argument form of `range` is the most general form, and we can view the two-argument and one-argument forms as _special cases_ of the general form.
For example, the following `range` calls are equivalent:

<pre class="scamper-output output-prog">
(range 10)
(range 0 10 1)
</pre>

## Some list operations

Perhaps the simplest list operation is `(length lst)`, which gives you
the number of elements in the list.

<pre class="scamper-output output-prog">
(length (list))
(length (list 3 4 5))
(length (string-split "he took his vorpal sword in hand" " "))
</pre>

You can also extract an element of a list using the
`(list-ref list index)` operation.  In Scheme, the position of an
element is the number of values that appear before that element; hence,
the initial element of a list is element 0, not element 1.

<pre class="scamper-output output-prog">
(define observation (list "Computers" "are" "sentient" "and" "Malicious"))
observation
(list-ref observation 0)
(list-ref observation 2)
(length observation)
(list-ref observation 4)
(list-ref observation 5)
</pre>

The `(index-of val lst)` procedure serves as something like the
opposite of `list-ref`: Given a list and an element, it returns the
position (index) of the first instance of that element.

<pre class="scamper-output output-prog">
(define lead-in (list "a" "one" "and" "a" "two" "and" "a" "..."))
(index-of lead-in "one")
(index-of lead-in "and")
(list-ref lead-in (index-of lead-in "and"))
</pre>

The `(reverse lst)` procedure creates a new list that consists of the
same elements as `lst`, but in the opposite order.

<pre class="scamper-output output-prog">
(reverse (range 10))
(reverse (list "a" "b" "c" "d" "e"))
</pre>

The `(append lst1 lst2)` procedure creates a new list that consists
of all the elements of the first list followed by the elements of the
second list.

<pre class="scamper-output output-prog">
(append (range 5) (range 5))
(append (make-list 3 "hello") (make-list 4 "echo"))
</pre>

The `(list-take lst n)` procedure builds a new list that consists
of the first `n` elements of `lst` and the `(list-drop lst n)`
procedure builds a list by removing the first `n` elements of `lst`.

<pre class="scamper-output output-prog">
(define some-ia-counties
  (list "Adair" "Adams" "Alamakee" "Appanoose" "Audobon"))
(list-take some-ia-counties 3)
(list-drop some-ia-counties 3)
(list-take (reverse some-ia-counties) 2)
</pre>

## Self Checks

### Check 1: Checking list procedures (‡)

Predict the results of evaluating each of the following expressions.

```drracket
(list 2 1)
(make-list 1 2)
(make-list -1 2)
(append (list 2 1) (list 2 1))
(index-of (list "a" "b") "a")
(index-of (list "a" "b") "c")
(range 3)
(range 0)
```

### Check 2: Ranges, revisited

How could we make the list `(list 6 5 4 3)` with `range` in conjunction with other standard library list functions?