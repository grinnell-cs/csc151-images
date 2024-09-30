---
title: List basics
summary: |
  We further explore Scheme's *list* structures.  Lists permit us to
  group data and process those data as a group.  We also explore the procedures
  that we can use with lists, such as `range`, `map`, and `apply`
---

## Useful procedures and notation

### Standard list notation

`(list v1 v2 ... vk)` is a list containing the elements `v1`, `v2`, ..., `vk`.

### Creating lists

`(list e1 e2 ... ek)` returns a list of the elements `e1`, `e2`, ..., `ek`.

`(make-list n v)` returns a list of `n` copies of `v`.

`(range n)` returns a list of all the natural numbers strictly less
than `n` (starting with `0`).

`(range s n)` returns a list of all the natural numbers between `s`
(inclusive) and `n` (exclusive).

`(range s n i)` returns a list of all the natural numbers between `s`
(inclusive) and `n` (exclusive), incrementing by `i` each time.

### Manipulating lists

`(map f l)` returns a new list that is the result of applying the function `f` to each element of the list `l`.
In other words, `(map f (list v1 v2 ... vk))` is equivalent to `(list (f v1) (f v2) ... (f vk))`.

`(apply f l)` calls variable-argument function `f` with the elements of `l`.
In other words, `(apply f (list v1 v2 ... vk))` is equivalent to `(f v1 v2 ... vk)`.

`(map f l1 l2)` returns a new list that is the result of applying the binary function `f` to each of the elements in `l1` and `l2` element-wise.
In other words, `(map f (list u1 u2 ... uk) (list v1 v2 ... vk))` is equivalent to `(list (f u1 v1) (f u2 v2) ... (f uk vk))`.

### Other list operations

`(length lst)` returns the length of list `lst`.

`(reverse lst)` returns the list `lst` but with its elements in reverse order.

`(append l1 l2)` appends lists `l1` and `l2` together.

`(take lst n)` returns a new list consisting of the first `n` elements of `lst`.

`(drop lst n)` returns new list consisting of all but the first `n` elements of `lst`.

`(list-ref lst n)` returns the `n`th element of list `lst`, zero index-based.

`(index-of val lst)` returns the index of the first occurrence of `val` in list `lst`.

## Preparation

a. Review the list of procedures above.

b. If you have not done so already, you may want to open a separate tab or window in your browser for [the reading on list basics](../readings/list-basics) and [the reading on transforming lists](../readings/list-transform).

c. Load the lab.  Remember that the person closer to the board is Side A and the person further fro the board is Side B.

* [list-basics.scm](../code/labs/list-basics.scm)

d. Get started!

