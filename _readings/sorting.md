---
title: Algorithms for sorting lists and vectors
summary: |
  We consider a variety of techniques used to put a list or
  vector in order, using a binary comparison operation to determine the
  ordering of pairs of elements.
---
**This reading has been rewritten for Fall Term Two 2020.**

The problem of sorting
----------------------

Sorting a collection of values---arranging them in a fixed order,
usually alphabetical or numerical---is one of the most common computing
applications.  When the number of values is even moderately large,
sorting is such a tiresome, error-prone, and time-consuming process for
human beings that the programmer should automate it whenever possible.
For this reason, computer scientists have studied this application with
extreme care and thoroughness.

One of the clear results of their investigations is that no one algorithm
for sorting is best in all cases.  Which approach is best depends on
whether one is sorting a small collection or a large one, on whether the
individual elements occupy a lot of storage (so that moving them around
in memory is time-consuming), on how easy or hard it is to compare two
elements to figure out which one should precede the other, and so on.
In this course we'll be looking at two of the most generally useful
algorithms for sorting: *insertion sort*, which is the subject of this
reading, and *merge sort*, which we will consider in another reading.
In our general exploration of sorting, we may also discuss other sorting
algorithms.

Imagine first that we're given a collection of values and a rule for
arranging them.  The values might actually be stored in a list, vector, or
file.  Let's assume first that they are in a list.  The rule for arranging
them typically takes the form of a predicate with two parameters that can
be applied to any two values in the collection to determine whether the
first of them could precede the second when the values have been sorted.
(For example, if one wants to sort a collection of real numbers into
ascending numerical order, the rule should be the predicate `<=`;
if one wants to sort a collection of strings into alphabetical order,
ignoring case, the rule should be `string-ci<=?`; if one wants to
sort a collection of real numbers into descending numerical order,
the rule should be `>=`; and so on.)

The insertion sort algorithm
----------------------------

As one might guess, the key operation in insertion sort is that of
*insertion*.  We envision separating the elements to be sorted into two
collections: those that are not yet sorted, and those that are already
sorted.  We repeatedly *insert* one value from the unsorted collection
into the proper place in the sorted collection.

The way in which we represent the unsorted and sorted collections has
an effect on the way in which we implement the insertion operation.
Let's start by representing collections as lists.  Midway through the
sorting process, we have one list of unsorted values (the values we have
not yet processed) and a second, sorted, list.  To insert a value into
the sorted list, we step over the elements that should precede the value,
stopping when we find an element that should follow the value (or when
we run out of elements).  We then cons the new value onto that section
of the list and rebuild the prior elements.

### Inserting elements

Let us first consider the specific case of sorting a list of real numbers
in ascending order.

We begin with the procedure used to insert a new value into a list that
is already in order.  Because we're inserting the numbers in ascending
order, we can use `<=` as the ordering predicate.

```
;;; (insert-number sorted new-element) -> list?
;;;   sorted : listof real?, sorted?
;;;   new-element : real?
;;; Insert a new value into a sorted list.
(define insert-number
  (lambda (sorted new-element)
    (cond 
      [(null? sorted) 
       (list new-element)]
      [(<= new-element (car sorted)) 
       (cons new-element sorted)]
      [else 
       (cons (car sorted) 
             (insert-number (cdr sorted) new-element))])))
```

In English: If the list into which the new element is to be inserted
is empty, return a list containing only the new element.  If the new
element can precede the first element of the existing list, then,
since the existing list is assumed to be sorted already, it must also
be able to precede *every* element of the existing list, so attach the
new element onto the front of the existing list and return the result.
Otherwise, we haven't yet found the place, so issue a recursive call to
insert the new element into the cdr of the current list, then re-attach
its car at the beginning of the result.

### Sorting a list

Let us now return to the overall process of sorting an entire list.
The insertion sort algorithm simply takes up the elements of the
list to be sorted one by one and inserts each one into a new list,
which is initially empty.

```
;;; (numbers-insertion-sort numbers) -> listof real?
;;;   numbers : listof real?
;;; Returns a sorted version of numbers, sorted from least to greatest.
(define numbers-insertion-sort
  (lambda (numbers)
    (letrec ([helper
              (lambda (unsorted sorted)
                (if (null? unsorted) 
                    sorted
                    (helper (cdr unsorted) (insert-number sorted (car unsorted)))))])
      (helper numbers null))))
```

Generalizing the algorithm
--------------------------

Of course, the insertion sort procedure we just wrote works only for
lists of real numbers, and only sorts such lists into increasing order.
What if we want a more general version?  As you may recall, we were
able to generalize the process of searching by adding a `less-equal?`
parameter.  We can add a similar parameter to our sorting routine.

```drracket
;;; (list-sort lst less-equal?)
;;;   lst : list?
;;;   less-equal? : binary-predicate?
;;; Sort `lst` into increasing order using `less-equal?`.  
```

Now, on to the harder part.  What conditions must hold in order for
us to be able to sort?  We will use `less-equal?` to compare values.
That means that we must be able to apply it to any two elements of
the list.  We also want to make sure that the `less-equal?` predicate
is sensible.  That is, it should be transitive (if a may precede b and
b may precede c, then a may precede c) and must order any two elements
(for any two elements, a may precede b or b may precede a).  What should
we do about equal elements?  We'll say that each may precede the other.

```drracket
;;; Preconditions:
;;;   less-equal? can be used with the elements of lst. That is for
;;;     all values a and b in lst, (less-equal? a b) successfully
;;;     returns a truth value.
;;;   less-equal? is transitive.  That is, for all values a, b, and 
;;;     c in lst, if (less-equal? a b) and (less-equal? b c), then
;;;     (less-equal? a c).
;;;   less-equal? is sensible.  That is, for all values a and b,
;;;     either (less-equal? a b), (less-equal? b a), or both.
```

Admittedly, we haven't been doing that much detail in our procedures.
And we won't include it in this documentation.  Still, it can be valuable
to think through all of the expectations.

Let's do the same for the postconditions.  What does it mean to
sort a list?  The result must be in order (which we specify using
`less-equal?`).  In addition, sorting should neither add nor remove
values from the list.  The easiest way to formalize that idea is
to say that the result must be a permutation of the original list.
We might also indicate that we do not modify the original list, but
that's implicit.  (That is, we traditionally only indicate when we
modify parameters, not when we fail to modify them.)

```
;;; Postconditions:
;;;   * sorted is sorted by less-equal?.  That is, for all i such that
;;;     0 <= i < (- (length lst) 1),
;;;     (less-equal? (list-ref sorted i) (list-ref sorted (+ i 1)))
;;;   * sorted is a permutation of lst.
```

As you may recall, we also looked at searching through collections of
*keyed values* for a value with a particular key.  Since we search for
keyed values, we might also want to sort by key, and use the key as an
explicit parameter to the procedure.

```
;;; (list-keyed-sort lst get-key less-equal?)
;;;   lst : list?
;;;   get-key : procedure?
;;;   less-equal? : binary-predicate?
;;; Sorts the list by key, in the order specified by less-equal?.
```

That's getting a bit complicated, isn't it?  And we haven't even
put the particular algorithm in the name!  That is, we've thought
through the different kinds of *interfaces* to sorting algorithms
without thinking about the underlying *implementation*.

Insertion sort, generalized
---------------------------

Let's now implement the two forms of generalized insertion sort.
What changes do we need to make?  This time, we'll make the `insert`
procedure local, since it need not be used outside of insertion sort.
We have to add `less-equal?` as a parameter.  And, of course, instead
of using `<=` to compare elements, we'll use `less-equal?`.

```
(define list-insertion-sort
  (lambda (lst less-equal?)
    (letrec ([insert
              (lambda (lst val)
                (cond
                  [(null? lst)
                   (list val)]
                  [(less-equal? val (car lst))
                   (cons val lst)]
                  [else
                   (cons (car lst) (insert (cdr lst) val))]))]
             [helper
              (lambda (unsorted sorted)
                (if (null? unsorted) 
                    sorted
                    (helper (cdr unsorted) (insert sorted (car unsorted)))))])
      (helper lst null))))
```

What changes do we need to make for keyed insertion sort?  Not many.
The only differences are (a) we need to add the `get-key` parameter and
(b) every time we used `less-equal?`, we must now add calls to `get-key`.
Fortunately, there's only one call to `less-equal?`, so the update is small.

```
(define list-keyed-insertion-sort
  (lambda (lst get-key less-equal?)
    (letrec ([insert
              (lambda (lst val)
                (cond
                  ((null? lst)
                   (list val))
                  ((less-equal? (get-key val) (get-key (car lst)))
                   (cons val lst))
                  (else
                   (cons (car lst) (insert (cdr lst) val)))))]
             [helper
              (lambda (unsorted sorted)
                (if (null? unsorted) 
                    sorted
                    (helper (cdr unsorted) (insert sorted (car unsorted)))))])
      (helper lst null))))
```

This code is quite close to that of `list-insertion-sort`.  Hence,
rather than doing a cut-paste-edit on that code, we might instead *call*
`list-insertion-sort`, providing it with a predicate that extracts keys
and then compares.

```drracket
(define list-keyed-insertion-sort
  (lambda (lst get-key less-equal?)
    (list-insertion-sort lst
                         (lambda (v1 v2)
                           (less-equal? (get-key v1) (get-key v2))))))
```

Why use the second strategy?  That is, why call another function with
a newly-created parameter, rather than cutting, pasting, and changing?
One obvious reason is that it's smaller.  A second is that it may actually
be less work to write this version than to figure out what to change in
`list-insertion-sort`.  But the best reason to use this strategy is that
it makes updates much easier.  If we realize that we made a mistake in
`list-insertion-sort` or simply find a better way to do some part of it,
we only have one procedure to update, rather than two.

Sorting vectors
---------------

Of course, as we saw in our exploration of binary search, in order to do
binary search, we need a sorted *vector*, rather than a sorted *list*.
To sort a vector, we could turn that vector into a list, sort the list,
and then build a new vector.

However, in sorting a vector, the goal of sorting is often to *overwrite*
the old arrangement of those values with a new, sorted arrangement of the
same values.  This type of sorting is often called *in-place* sorting.
Let us consider how we might use the ideas of insertion sort to sort a
vector in place.

As you may recall, insertion sort requires us to have two collections: one
of which is sorted and the other of which is unsorted.  We will partition
the original vector into two sub-vectors: a sorted sub-vector, in which
all of the elements are in the correct order relative to one another, and
an unsorted sub-vector in which the elements are still in their original
positions.  The two sub-vectors are not actually separated; instead, we
just keep track of a boundary between them inside the original vector.
Items to the left of the boundary are in the sorted sub-vector; items to
its right, in the unsorted one.  Initially the boundary is at the left end
of the vector.  The plan is to shift the boundary, one position at a time,
to the right end.  When it arrives, the entire vector has been sorted.

Here's the plan for the main algorithm.

```
;;; (vector-insertion-sort! vec less-equal?)
;;;   vec : vector?
;;;   less-equal? : binary-predicate?
;;; Sorts the vector in place.
(define vector-insertion-sort!
  (lambda (vec less-equal?)
    (let ([len (vector-length vec)])
      (letrec ([helper 
                (lambda (boundary) ; The index of the first unsorted value
                  (when (< boundary len) ; If we have elements left to sort
                     (vector-insert! vec 
                                     (vector-ref vec boundary) 
                                     boundary
                                     less-equal?)
                     (helper (+ boundary 1))))])
        (helper 1)))))
```

The `insert!` procedure takes four parameters: an element to be inserted
into the sorted part of the vector, the vector itself, the current
boundary position, and the comparison procedure.  The new element can
be inserted at any position up to and including the current boundary
position, but it must be placed in the correct order relative to elements
to the left of that boundary.  This means that any elements that should
follow the new one should be shifted one position to the right in order
to make room for the new one.  (Elements that precede the new one can
keep their current positions.)

```
;;; (vector-insert! vec new-element bounardy)
;;;   vec : vector?
;;;   new-element : any?
;;;   boundary : non-negative-integer? (index)
;;;   less-equal? : a binary predicate
;;; Insert new-element into the portion of vec between 0 and `boundary`, 
;;; inclusive.
(define vector-insert!
  (lambda (vec new-element boundary less-equal?)
    (letrec ([helper 
              (lambda (pos)
                (cond 
                  ; If we've reached the left end of the vector, we've run out of
                  ; elements to shift.  Insert the new element.
                  [(zero? pos)  
                   (vector-set! vec pos new-element)]
                  ; If we've reached a point at which the element to the left
                  ; is smaller, we insert the new element here.
                  [(less-equal? (vector-ref vec (- pos 1)) new-element)
                   (vector-set! vec pos new-element)]
                  ; Otherwise, we shift the current element to the right and
                  ; continue.
                  [else
                   (vector-set! vec pos (vector-ref vec (- pos 1)))
                   (helper (- pos 1))])))
     (helper boundary))))
```

How does this work?  We assume that there's a "space" at position
`pos` of the vector.  (That is, that we can safely insert
something there without removing anything from the vector.)  We know
that the condition holds at the beginning from the description.  That is,
the postcondition specifically ignores the value that was in the 
boundary position.  We also know that the conditional holds from the way
`insert!` was called from `insertion-sort!`, since
the boundary is initially the position of the value we insert.

Now, what do we do?  If the position is at the left end of the vector,
there's nothing smaller in the vector, so we just put the new value there.
If the thing to the left of the current position is smaller, we know we've
reached the right place, so we put the value there.  In every other case,
the value to the left is larger than the value we want to insert, so we
shift that value right (into the `pos` position) and continue
working one position to the left.  Since we've copied the value to the right, 
it is remains safe to insert something in the position just vacated
(that is, `(- pos 1)`).


Self checks
-----------

These checks might take you a little bit longer, but they're not
complex. However, they are importantly designed to help you
understand sorting before starting the lab, so please make your
best effort to complete them.

You should make sure to update your `csc151` package before undertaking
these exercises.

### Check 1: Verifying Insert

You'll need a copy of `insert-number` from above for this self-check.

a. Test the `insert-number` procedure by inserting the number 42

* into an empty list;
* into a list of numbers larger than 42, arranged in ascending order;
* into a list of numbers smaller than 42, arranged in ascending order;
* into a list of numbers both smaller and larger than 42, arranged in ascending order; and
* into a list that contains only three copies of 42 (that is, the list created by `(list 42 42 42)`.

b. Why do you think we had you do each of these tests.  (That is,
why would one want to check that `insert-number` works on each of
these lists?)

c. What would you expect to happen if the list is *not* in ascending
order when `insert-number` is invoked?

d. Check your answer experimentally.  Enter the result here.

### Check 2: Displaying steps in insertion sort (‡)

You'll need a copy of `numbers-insertion-sort` from above for this self-check.

a. Add calls to the `display` and `newline` procedures to the body
of the local helper `helper` of `numbers-insertion-sort`, so that it
displays the values of `unsorted` and `sorted`, appropriately labeled,
at each step of the sorting process.

For example, you might write

```
  (display (list 'sorted sorted 'unsorted unsorted)) (newline)
```

b. To sort the values 7, 6, 12, 4, 10, 8, 5, and 1 (given in that order),
what will the values of `sorted` and `unsorted` be for the first few
iterations of the helper?

c. Use your revised `numbers-insertion-sort` procedure to verify your
prediction and see all the iterations.

### Check 3: Checking potential problems

a. When we use a new procedure, we often want to test it on a variety
of cases.  We've seen that `numbers-insertion-sort` works on a few simple
cases.  But we should also check some "special cases", cases that might
stress the algorithm.  Come up with some lists that a poorly-implemented
insertion sort procedure might have difficulty with.

b. As some potential problems, predict what `numbers-insertion-sort`
will do for each of the following cases.  Then check your answer
experimentally.

* An empty list.
* A list containing only one element.
* A list containing all equal values.
* A list in which the elements are originally in
    *descending* numerical order.
* A list in which the elements are already in
    *ascending* numerical order.
* A list containing some duplicate elements.
