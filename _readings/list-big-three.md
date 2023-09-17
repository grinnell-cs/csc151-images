---
title: The "big three" list operations
summary: |
  We continue our exploration Racket's _list_ data type, focusing on
  "the big three" list processing operations: `map`, `filter`, and
  `reduce`.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Data types](../readings/data-types).
  [Writing your own procedures](../readings/procedures).
  [Lists and map](../readings/list-map).
  [Anonymous procedures](../readings/anonymous-procedures).
---

_This page is now ready for public consumption.._

We've started to see some significant power in using two "higher order" list operations, `map` and `apply`.  These are called "higher order" procedures because they take procedures as inputs.

`map` is particularly useful for a variety of reasons.  First, it lets us do a form of repetition: We use `map` to repeatedly apply a procedure to different values (the elements of the list or lists we map over).  But it's more than that.  Experience suggests that using `map` leads to a different way of thinking about repetition than some of the other mechanisms, such as "for loops".  (Don't worry if you've never heard of for loops.  You'll learn about them in another CS class.) As importantly, `map` permits some cool implementations.  Since `map` does not specify the order in which the elements are processed, one can implement map so that all (or at least many) of the applications can be done *at the same time*.  (Computer scientists say "in parallel".)

As we start to reach the limits on the speed of one processing unit, the way we make large computations faster is to parallelize them, to make them run on multiple processing units.  While there are explicit ways to break up a program, by relying on procedures like `map`, we can trust the underlying system to paralellize sensibly, without worrying about particular details.  In fact, `map` is so important that it's a core part of the parallelization technologies that both Google and Amazon use.

As you might expect, `map` alone does not suffice.  As you've already seen, it helps to be able to combine the elements of a list into a single value.  We've used `apply` for that, but, as we shall soon see, it does not suffice for all cases.  In addition, we may find that not all of the values in a list are worth considering.  So let's consider some other useful procedures.

## Combining the elements in a list

When we began our exploration of numbers, we used a variety of unary (one parameter) procedures, such as those above.  But we also used some binary (two parameter) operations, such as addition or multiplication.  Can we also use those with lists?  It seems like we'd want to.  For example, if we wanted to compute mean value in a collection of numbers, we want to add up all of the elements in the collection and then divide by the length of the collection.

We've seen one way to do so.  We can use `apply`.  For example, we can sum the elements in a list with `(apply + lst)`.  But what happens if we don't have an "n-ary" procedure (one that takes arbitrarily many inputs).  Consider, for example, the problem of reversing each word in a string consisting of a sequence of words separated by spaces.

The first two steps seem relatively straightforward.  We use `string-split` to break the string into words.  We use `string-reverse` (or our anonymous version of `string-reverse`) to reverse each word. 

```drracket
> (map (o list->string reverse string->list)
       (string-split "this is a sample set of words"))
'("siht" "si" "a" "elpmas" "tes" "fo" "sdrow")
```

How do we get them back together?  We could try `string-append`.

```drracket
> (apply string-append
         (map (o list->string reverse string->list)
              (string-split "this is a sample set of words")))
"sihtsiaelpmastesfosdrow"
```

Whoops!  We've lost the spaces.  What to do?  What to do?

Fortunately, there's a standard approach that involves a different kind of decomposition.  Rather than thinking about putting everything together all at once, we write a procedure that combines neighboring elements and then repeatedly apply it to neighboring pairs until we're down to a single element.  There are two common terms for that work, "_folding_" and "_reducing_".  We'll use the latter.

First, let's build our helper procedure.  While it will eventually be an anonymous procedure (more on those later), we'll start by naming it for convenience.

```drracket
> (define combine-with-space
    (cut (string-append <> " " <>)))
> (combine-with-space "a" "b")
"a b"
> (combine-with-space "Hello" "Goodbye")
"Hello Goodbye"
```

Now, we can use the `reduce` procedure with `combine-with-space`.  `(reduce FUN LST)`, converts `LST` to a single value by repeatedly applying `FUN` to neighboring pairs of values, replacing the pair with the result of the function.

```drracket
> (reduce combine-with-space (list "a" "b" "c" "d"))
"a b c d"
```

How does that work?  Well, we said that `reduce` repeatedly applies the function to neighboring pairs of values.  Let's consider what happens.

* We start with four values to combine: 
  `"a"`, `"b"`, `"c"`, and `"d"`.
* We combine `"a"` and `"b"` with a space, yielding `"a b"`.  We now
  have three values to combine:
  `"a b"`, `"c"`, and `"d"`.
* We combine the `"a b"` and the `"c"` with a space in between, yielding
  `"a b c"`.  We now have two values to combine.
  `"a b c"` and `"d"`.
* We combine the `"a b c"` and the `"d"` with a space in between,
  yielding `"a b c d"`.  We are now down to one value.

Of course, we could also combine the values in other ways.

* We start with four values to combine: 
  `"a"`, `"b"`, `"c"`, and `"d"`.
* We combine `"c"` and `"d"` with a space, yielding `"c d"`.  We now
  have three values to combine:
  `"a"`, `"b"`, and `"c d"`.
* We combine `"a"` and `"b"` with a space, yielding `"a b"`.  We now
  have two values to combine:
  `"a b"` and `"c d"`.
* We combine the "a b" and the "c d" with a space, yielding `"a b c d"`.
  We are now down to one value.

Fortunately, we end up with the same value either way.

So we can now go back to our original problem: Creating a new string with reversed versions of all the original words.

```drracket
> (reduce (cut (string-append <> " " <>))
          (map (o list->string reverse string->list)
               (string-split "this is a sample set of words")))
"siht si a elpmas tes fo sdrow"
```

Like `map`, `reduce` provides some advantages to the computer scientist, programmer, or software engineer.  First, it encourages you to think in terms of decomposition.  Rather than dealing with the whole list at once, you simply think of what to do with neighboring pairs and then rely on `reduce` to do the heavy lifting.  And, once again, we can gain some efficiencies.  If it doesn't matter which order we do the operations, we can do some of them simultaneously and otherwise find orderings that are a bit more efficient.  (Yes, it turns out that there are orderings that are more efficient.) And `string-append` (or, in our case, `combine-with-space`) is not the only operation in which the order of operations doesn't matter.  The same holds (more or less) for addition and multiplication.  For those of you with a mathematical mindset, `reduce` works well with any _associative_ binary operation.

We can, of course, use `reduce` in many other ways.  To find the largest value in the list, we reduce with `max`.

```drracket
> (reduce max (list 3 1 5 10 3 2))
10
```

```drracket
> (reduce min (list 3 1 5 10 3 2))
1
```

## Order of operations

Of course, we're working with computers, which means that some things aren't as simple as you might expect.  Here's one potential problem.  We noted that `reduce` relies on our ability to combine neighboring pairs in any order.  Are there operations in which the order in which you combine neighboring pairs matters?  Certainly.  Let's consider subtraction, using the expression (4 - 1 - 6 - 3 - 2 - 10 - 5).  Here's one computation, in which we randomly choose which pair of numbers to use.

> 4 - 1 - **6 - 3** - 2 - 10 - 8  = 4 - 1 - **3** - 2 - 10 - 8

> 4 - 1 - **3 - 2** - 10 - 8 = 4 - 1 - **1** - 10 - 8

> 4 - **1 - 1** - 10 - 8 = 4 - **0** - 10 - 8

> **4 - 0** - 10 - 8 = **4** - 10 - 8

> 4 - **10 - 8** = 4 - 2

> **4 - 2** = **2**

But that's probably not what most of us would expect.  Let's see what the
procedure does.

```drracket
> (reduce - numbers)
20
> (reduce - numbers)
6
> (reduce - numbers)
28```

Ooh, that's not very good, is it.  We'd almost certainly prefer consistent results.

We might, perhaps, take a more systematic approach, either doing the subtraction from left to right or from right to left.  We'll start by working from left to right.

> **4 - 1** - 6 - 3 - 2 - 10 - 8  = **3* - 6 - 3 - 2 - 10 - 8

> **3 - 6** - 3 - 2 - 10 - 8  = **-3** - 3 - 2 - 10 - 8

> **-3 - 3** - 2 - 10 - 8  = **-6** - 2 - 10 - 8

> **-6 - 2** - 10 - 8  = **-8** - 10 - 8

> **-8 - 10** - 8 = **-18** - 8

> **-18 - 8** = **-26**

But let's also try working from right to left.

> 4 - 1 - 6 - 3 - 2 - **10 - 8** = 
> 4 - 1 - 6 - 3 - 2 - **2**

> 4 - 1 - 6 - 3 - **2 - 2** =
> 4 - 1 - 6 - 3 - **0**

> 4 - 1 - 6 - **3 - 0** =
> 4 - 1 - 6 - **3**

> 4 - 1 - **6 - 3** =
> 4 - 1 - **3**

> 4 - **1 - 3** =
> 4 - **-2**

> **4 - -2** =
> **6**

To support these different situations, the `csc151` library also provides `reduce-left` and `reduce-right`.  

```
> (reduce-left - numbers)
-23
> (reduce-right - numbers)
3
```

While these two procedures achieve the goal of systematically reducing a list of values by applying a binary procedure, they cannot be easily parallelized because we have chosen a particular sequence of operations.

## The filter procedure

There's one more "big" higher-order list-processing functional procedure, `(filter pred? lst)`.  `filter` takes two parameters, a unary (one-parameter) predicate and a list of values, and selects all the values for which the predicate holds.

```racket
> (define stuff (list -5 10 18 23 14.0 87 1/2 0.5 -12.2))
> stuff
'(-5 10 18 23 14.0 87 1/2 0.5 -12.2)
> (filter inexact? stuff)
'(14.0 0.5 -12.2)
> (filter negative? stuff)
'(-5 -12.2)
> (filter integer? stuff)
'(-5 10 18 23 14.0 87)
> (filter (section <= 0 <> 10) stuff)
'(10 1/2 0.5)
```

That seems pretty powerful, doesn’t it? Believe it or not, but by the end of this course, you’ll be able to write `filter` yourself.  (You'll also be able to write `map` and `reduce`, as well as other higher-order list procedures you design yourself.)

And, as in other cases we've seen, combining `filter` with other procedures can let us do new, clever things.  For example, suppose we want to add up the digits in a string containing both digits and non-digits.

We know that we can convert a string to a list of characters.

```drracket
> (string->list "a 1 and a 2 and a 3")
'(#\a #\space #\1 #\space #\a #\n #\d #\space #\a #\space #\2 #\space #\a #\n #\d #\space #\a #\space #\3)
```

We can convert a digit character to the digit by getting its collating sequence number and subtracting the collating sequence number of zero.

```drracket
> (map (o (cut (- <> (char->integer #\0)))
          char->integer)
       '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9))
'(0 1 2 3 4 5 6 7 8 9)
```

We can extract all the digits from the list of characters with `filter`.

```drracket
> (filter char-numeric? (string->list "a 1 and a 2 and a 3"))
'(#\1 #\2 #\3)
> (map (o (section - <> (char->integer #\0))
          char->integer)
       (filter char-numeric? (string->list "a 1 and a 2 and a 3")))
'(1 2 3)
```

And then we add them all up.

```drracket
> (reduce + (map (o (section - <> (char->integer #\0))
                    char->integer)
                 (filter char-numeric? (string->list "a 1 and a 2 and a 3"))))
6
```

You'll see this combination of "the big three" fairly frequently.  We filter, we map, then we reduce.  Together, they bring great power (and the accompanying great responsibility).

## Using `map` with multiple lists

We've seen one way to use binary procedures with lists: We can reduce a list of values to a single value by repeatedly combining pairs of values with a function.  But there's another.  Just as we can use `map` to create a new list of values by applying a unary procedure to each element of a list, we can also use a more generalized version of `map` that grabs values from multiple lists and combines them into values in a new list.  In particular, `map` can also build a new list by applying the procedure to the corresponding elements of all the lists. For example,

```drracket
> (map * (list 1 2 3) (list 4 5 6))
'(4 10 18) ; That's 1*4, 2*5, and 3*6
> (map + (list 1 2) (list 3 4) (list 5 6))
'(9 12)

> (map list (range 10) (map increment (range 10)) (map square (range 10)))
'((0 1 0) (1 2 1) (2 3 4) (3 4 9) (4 5 16) (5 6 25) (6 7 36) (7 8 49) (8 9 64) (9 10 81))

> (define first-names (list "Addison" "Bailey" "Casey" "Devon" "Emerson"))
> (define last-names (list "Smith" "Jones" "Smyth" "Johnson" "Doe"))
> (map (section string-append <> " " <>) first-names last-names)
'("Addison Smith" "Bailey Jones" "Casey Smyth" "Devon Johnson" "Emerson Doe")
> (map (section string-append <> ", " <>) last-names first-names)
'("Smith, Addison" "Jones, Bailey" "Smyth, Casey" "Johnson, Devon" "Doe, Emerson")
```

You may be starting to see some interesting possibilities.  If you are not,
stay tuned.

## Self checks

### Check 1: Inconsistent subtraction (‡)

We came up with three different results for the expression
(4 - 1 - 6 - 3 - 2 - 10 - 8).  Come up with one or two more and
show their derivation.

## Acknowledgements

Although some sections of this reading are new, such as the discussion of joining strings with spaces, much of this reading draws on a wide variety of earlier readings.  The notion of a "big three" is due to Peter-Michael Osera. (He may have taken it from others.)
