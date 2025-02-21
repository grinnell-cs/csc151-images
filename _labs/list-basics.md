---
title: List basics
summary: |
  We further explore Scheme's *list* structures.  Lists permit us to
  group data and process those data as a group.  We also explore the procedures
  that we can use with lists, such as `range`, `map`, and `apply`
---

## Useful procedures and notation

### Standard list notation

`'(val1 val2 ... valn)` - a list of `n` values.  Note that the
single-quote mark (`'`, also called "tick") means "take this
verbatim", which means that no expressions inside the parentheses
will be evaluated.

`(list val1 val2 ... valn)` - another way that DrRacket sometimes 
shows lists. (We don't know why it sometimes chooses one notation
and other times another; we'll alo use both.)

### Creating lists

`(list exp1 exp2 ... expn)` - create a list by evaluating each of the
expressions and then joining together their values.

`(make-list n val)` - make a list of `n` copies of `val`.

`(range n)` - create a list of all the natural numbers strictly less
than `n` (starting with `0`).

`(range s n)` - create a list of all the natural numbers between `s`
(inclusive) and `n` (exclusive).

`(range s n i)` - create a list of all the natural numbers between `s`
(inclusive) and `n` (exclusive), incrementing by `i` each time.

### Manipulating lists

`(map fun lst)` - apply the function to each element of the list.
`(map fun (list val1 val2 ... valn))` gives you
`(list (fun val1) (fun val2) ... (fun valn))`.

`(apply fun lst)` - apply the function to all the elements of the
list, _en masse_.  `(apply fun (list val1 val2 ... valn))` gives
you `(fun val1 val2 ... valn)`.

`(map fun lst1 lst2)` - create a new list by applying the function to
corresponding pairs of elements from the two lists.  You can also use
`map` with more than two lists.

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

a. Review the list of procedures above.

b. If you have not done so already, you may want to open a separate tab or window in your browser for [the reading on list basics](../readings/list-basics) and [the reading on transforming lists](../readings/list-transform).

{% if site.online %}
c. Decide who will do the Side A problems and who will do the Side B problems.
Then load the two halves of the lab.

* [list-basics-a.rkt](../code/labs/list-basics-a.rkt)
* [list-basics-b.rkt](../code/labs/list-basics-b.rkt)
{% else %}
c. Load the lab.  Remember that the person closer to the board is Side A and the person further from the board is Side B.

* [list-basics.rkt](../code/labs/list-basics.rkt)
{% endif %}

d. Get started!

