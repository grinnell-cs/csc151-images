---
title: Composing and decomposiing lists
summary: |
  We continue our exploration of Scheme's *list* structures, focusing
  on lists as ways to collect *heterogeneous* data.  We explore new 
  procedures that we can use with lists, such as `cons`, `car`, and `cdr`
---

## Useful procedures and notation

### Standard list notation

`'(val1 val2 ... valn)` - a list of `n` values.

`'(list val1 val2 ... valn)` - another way that Racket sometimes shows lists.

### Core list values and operations

`'null` - the empty list.

`(cons value lst)` - add `value` to the front of `lst`.

`(cdr lst)` - get a list containing all but the first element of `lst`.

`(car lst)` - get the first element of `lst`.

`(null? val)` - determine if a value is the empty list.

`(list? val)` - determine if a value is a list.

### Combinations of `car` and `cdr`

`(cadr lst)` - get the second element of `lst`. (Drop one element and then access the first remaining element.)

`(cddr lst)` - drop the first two elements of `lst`.

`(caddr lst)` - get the third element (element 2) of `lst`.

`(caar lst)` - get the first element of the first element of `lst`. Only useful for nested lists.

### Creating lists

`(list exp1 exp2 ... expn)` - create a list by evaluating each of the
expressions and then joining together their values.

`(make-list n val)` - make a list of `n` copies of `val`.

`(range n)` - create a list of all the natural numbers strictly less
than `n` (starting with `0`).

`(range s n)` - create a list of all the natural numbers between `m`
(inclusive) and `n` (exclusive).

`(range s n i)` - create a list of all the natural numbers between `m`
(inclusive) and `n` (exclusive), incrementing by `i` each time.

### Manipulating lists

`(apply fun lst)` - apply the function to all the elements of the
list, _en masse_.

`(filter pred? lst)` - Select only the elements of the list for
which the predicate holds.

`(map fun lst)` - apply the function to each element of the list.
`(map fun (list val1 val2 ... valn))` gives you
`(list (fun val1) (fun val2) ... (fun valn))`.

`(map fun lst1 lst2)` - create a new list by applying the function to
corresponding pairs of elements from the two lists.  You can also use
`map` with more than two lists.

`(reduce binproc lst)` - reduce a list to a single value

`(sort lst compare?)` - sort a list. 

`(tally predicate? lst)` - count how many values meet the predicate.

### Other list operations

`(length lst)` - Determine how many elements are in a list.

`(reverse lst)` - Create a new list with the elements in the opposite
order.

`(append lst1 lst2)` - Join two lists together.

`(take lst n)` - Build a new list consisting of the first `n` elements
of `lst`.

`(drop lst n)` - Build a new list consisting of all but the first `n` 
elements of `lst`.

`(list-ref lst n)` - Extract element `n` of the list.  (Remember that
lists start with element 0.)

`(index-of val lst)` - Determine the position of `val` in `lst`.  (It
turns out the position is how many values need to be dropped
from `lst` to reach `val`.)

`(indexes-of lst val)` - Find all the indices of the value in the list.

## Preparation

a. If you have not done so already, you may want to open a separate tab or window in your browser for the various readings.

b. Introduce yourself to your partner. Describe your strengths and approaches to work.

c. Update the `csc151` library.

d. The person closer to the board is Side A.  The other is Side B.

e. Load the lab: [list-composition.rkt](../code/labs/list-composition.rkt).

f. Save it as `list-composition.rkt`.

g. Get started.

## Notes on _Exercise 3: it’s So cons-fusing_

As you might guess, `one-two-b` is the list `'(1 2)`. As you might not have guessed, `one-two-a` is the value `'(1 . 2)`. That value looks much like a list, but it has a period in the middle. The period is a signal to you that the value is *not* a list.

Since `one-two-a` is not a list, it is not possible to reverse it or to append it to another list.

However, like the typical implementation of `cons`, the typical implementation of `append` does not confirm that its second parameter is a list. And, like `cons`, when given a non-list as a second parameter, `append` returns a non-list. In this case, append returns '`(0 0 1 . 2)`. Once again, the period indicates “hey, that’s not a list”.

Why does Scheme permit these non-lists? Because they are a generalization of lists (or at least of the techniques by which we process lists). As we’ll see later in the semester, these non-lists can be quite useful.

## Acknowledgements

Exercises 1--3 from this lab were adapted from [a similar lab from Spring 2017](https://rebelsky.cs.grinnell.edu/~rebelsky/Courses/CSC151/2017S/labs/heterogeneous-lists-lab.html).

Exercise 4 was adapated from [a similar lab from Spring 2007](https://rebelsky.cs.grinnell.edu/Courses/CS151/2007S/Labs/lists.html)

Exercises 5--6 were newly written in Spring 2024.

The extra problem was newly written in Spring 2024. However, the `sublist` problem has appeared throughout the years.


