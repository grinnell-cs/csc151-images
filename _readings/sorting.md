---
title: Algorithms for sorting lists and vectors
summary: |
  We consider a variety of techniques used to put a list or
  vector in order, using a binary comparison operation to determine the
  ordering of pairs of elements.
---

## The problem of sorting

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

## The insertion sort algorithm

As one might guess, the key operation in insertion sort is that of
*insertion*.  We envision separating the elements to be sorted into two
collections: those that are not yet sorted, and those that are already
sorted. We repeatedly *insert* one value from the unsorted collection
into the proper place in the sorted collection. For now, we'll assume
we're working with lists and then modify our resulting algorithm for
vectors at the end of this reading.

Initially, we have an empty sorted collection and an unsorted collection
consisting of all the elements in our list. By repeatedly inserting an
element from the unsorted region into the sorted region, eventually all
the elements of the list appear in the sorted region and are thus, sorted!

Let's try executing this algorithm on a small example before we try to
state it formally. Consider the following list of elements:

~~~
[4, 8, 1, 9, 10, 6, 2, 3, 7, 5]
~~~

We'll start with an empty sorted collection and the original list as the
unsorted collection:

~~~
sorted:   []
unsorted: [4, 8, 1, 9, 10, 6, 2, 3, 7, 5]
~~~

We will then repeatedly take one element from the unsorted list and place
it into its proper position in the sorted list. Because our lists allow us
to grad the head of the list efficiently via pattern matching, we'll
repeatedly pull the head of the unsorted list until we have sorted all 
the elements.

Initially, `4` goes into the sorted region directly, resulting in the
following updated lists:

~~~
sorted:   [4]
unsorted: [8, 1, 9, 10, 6, 2, 3, 7, 5]
~~~

Next, we insert `8`, which goes after `4` in the sorted region:

~~~
sorted:   [4, 8]
unsorted: [1, 9, 10, 6, 2, 3, 7, 5]
~~~

And so forth! The procedure is the same for each new "head": insert the
head of the unsorted region into the sorted region (in sorted order). We'll
show the remaining steps:

~~~
sorted:   [1, 4, 8]
unsorted: [9, 10, 6, 2, 3, 7, 5]

sorted:   [1, 4, 8, 9]
unsorted: [10, 6, 2, 3, 7, 5]

sorted:   [1, 4, 8, 9, 10]
unsorted: [6, 2, 3, 7, 5]

sorted:   [1, 4, 6, 8, 9, 10]
unsorted: [2, 3, 7, 5]

sorted:   [1, 2, 4, 6, 8, 9, 10]
unsorted: [3, 7, 5]

sorted:   [1, 2, 3, 4, 6, 8, 9, 10]
unsorted: [7, 5]

sorted:   [1, 2, 3, 4, 6, 7, 8, 9, 10]
unsorted: [5]

sorted:   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
unsorted: []
~~~

### Inserting elements

The key to our algorithm is inserting an element into a sorted list.
Suppose that we are midway through the execution of our insertion sort
algorithm, and we must insert `7` into the sorted list `[1, 2, 3, 4, 6, 8, 9, 10]`.
Because we are operating over lists, we should envision a _recursive algorithm_
over the structure of the sorted list.

To begin with, let's consider the head of the full list, `1`. Note that
our primary function for building lists is `cons` which puts an element onto
_the front_ of a list. Thus, it does not make sense to `cons` `7` onto the
front of the list starting with `1`---the result would not be a sorted list!
Thus, we should look to recursively insert into the tail of the list!

This process repeats as we discover that `7` is greater than `2`, `3`, `4`,
and `6`. However, once we reach the sorted sublist with the head `8`, we
find that `7` is less than the head! Thus, it makes sense to `cons` `7`
onto the front of this sublist. Recursively rebuilding the list results
in the final sorted list: `[1, 2, 3, 4, 6, 7, 8, 9, 10]`.

Let's write a recursive skeleton for this algorithm according to what we
observed with our example:

*   To insert an element `v` into a sorted list `l`:
    +   If `l` is empty, create a list only containing `v`.
    +   Otherwise if `l` is non-empty, decompose `l` into its `head` and `tail`.
        -   If `v` is less than or equal to the head, then cons `v` onto
            the front of `l`.
        -   Otherwise, recursively insert `v` into the `tail` and cons
            the `head` onto the front of the result.

We can then translate our recursive skeleton directly into code:

<pre class="scamper source">
;;; (insert-sorted-number l v) -> list?
;;;   l: list? of numbers, sorted
;;;   v: number?
;;; Insert a new value into a sorted list.
(define insert-sorted-number
  (lambda (l v)
    (match l
      [null (list v)]
      [(cons head tail)
       (if (<= v head)
           (cons v l)
           (cons head (insert-sorted-number tail v)))])))

(insert-sorted-number (list 1 2 3 4 6 8 9 10) 7)
</pre>

We can immediately generalize this insertion procedure to any type that has
some sort of "less than" comparison operator, _e.g._, `<=` for numbers,
`string<=?` for strings. This requires adding a parameter to
`insert-sorted`: `leq?`, the binary comparison function used to compare
elements of the list.

<pre class="scamper source">
;;; (insert-sorted l v gt?) -> list?
;;;   l: list? of numbers, sorted
;;;   v: number?
;;;   leq?: procedure?, a binary function that performs an
;;;         "<=" operation for elements of l.
;;; Insert a new value into a sorted list.
(define insert-sorted
  (lambda (l v leq?)
    (match l
      [null (list v)]
      [(cons head tail)
       (if (leq? v head)
           (cons v l)
           (cons head (insert-sorted tail v leq?)))])))

(insert-sorted (list 1 2 3 4 6 8 9 10) 7 <=)
(insert-sorted (list "a" "b" "c" "d" "f" "h" "i" "j") "g" string<=?)
</pre>

## Sorting a list

Let us now return to the overall process of sorting an entire list.
The insertion sort algorithm simply takes up the elements of the
list to be sorted one by one and inserts each one into a new list,
which is initially empty. We can define a recursive skeleton for this
sorting procedure using `insert-sorted` as a helper function. This
recursive skeleton, the "kernel" of the insertion sort also takes the
current sorted list as input, adding to it on each recursive call,
and eventually outputting it once we have traversed through all of
the elements of the list.

*   To insert the elements of `unsorted` list into `sorted` list:
    -   If `unsorted` is empty, simply produce `sorted`.
    +   If `unsorted` is non-empty with a `head` and `tail`,
        then `insert-sorted` the `head` into `sorted` and recursively
        insert the unsorted `tail` into the result.

`insertion-sort` then becomes a "husk" that calls this "kernel" with an
initially empty sorted list. Ultimately, `insert-sorted` does the bulk of the
work as we see in our implementation of this skeleton:

<pre class="scamper source">
(define insert-sorted
  (lambda (l v leq?)
    (match l
      [null (list v)]
      [(cons head tail)
       (if (leq? v head)
           (cons v l)
           (cons head (insert-sorted tail v leq?)))])))

(define insertion-sort-helper
  (lambda (unsorted sorted leq?)
    (match unsorted
      [null sorted]
      [(cons head tail)
       (insertion-sort-helper tail (insert-sorted sorted head leq?) leq?)])))

(define insertion-sort
  (lambda (l leq?)
    (insertion-sort-helper l null leq?)))

(insertion-sort (list 4 8 1 9 10 6 2 3 7 5) <=)
(insertion-sort (list "d" "h" "a" "i" "j" "f" "b" "c" "g" "e") string<=?)
(insertion-sort (list 4 8 1 9 10 6 2 3 7 5) >=)
(insertion-sort (list "d" "h" "a" "i" "j" "f" "b" "c" "g" "e") string>=?)
</pre>

In the last two cases, observe that by switching the comparison function, we can obtain different effects.
For example, we can use a greater-than comparison to sort the list in _reverse order_, _i.e._, largest to smallest, a nice side effect of making our functions more generalizable!

## The costs of insertion sort

Now that we've established the insertion sort algorithm, we can analyze its computational complexity.
When we previously analyzed functions, we counted the number of recursive calls they made since recursion dominated their runtime.
Traditionally, when we analyze _comparison-based sorting_ algorithms like insertion sort, we instead count the _number of comparisons_ that the algorithm makes.
This is because while we expect that different sorting algorithms will perform different operations, ultimately all comparison-based sorting algorithms make their decisions by comparing elements.

If we look at the implementation of `insertion-sort`, we see that the function itself does not make any comparisons!
Instead, it is the repeated calls to `insert-sorted` that make comparisons.
Thus, our analysis of `insertion-sort` is ultimately an analysis of its helper function, `insert-sorted`.

How many comparisons does `insert-sorted` make?
Let's instrument the function and try some examples:

<pre class="scamper source">
(define count (ref 0))

(define inc-count
  (lambda ()
    (ref-set! count (+ 1 (deref count)))))

(define get-count
  (lambda ()
    (deref count)))

(define reset-count!
  (lambda ()
    (ref-set! count 0)))

(define insert-sorted
  (lambda (l v leq?)
    (match l
      [null (list v)]
      [(cons head tail)
       (begin
         ; The comparison happens in the non-empty case.
         (inc-count)
         (if (leq? v head)
             (cons v l)
             (cons head (insert-sorted tail v leq?))))])))

(define count-comparisons
  (lambda (l v leq?)
    (begin
      (reset-count!)
      (let* ([result (insert-sorted l v leq?)])
        (pair result (get-count))))))

(count-comparisons (list 1 2 3 4 6 8 9 10) 7 <=)
(count-comparisons (list 1 2 3 4 6 8 9 10) 0 <=)
(count-comparisons (list 1 2 3 4 6 8 9 10) 50 <=)
</pre>

From these examples, we can see that the number of comparisons that any particular `insert-sorted` call makes depends on its inputs! In particular:

+   In the second case, the element to be inserted is smaller than
    any other element in the sorted list. Consequently, only a single
    comparison is necessary.
+   In the third case, the element to be inserted is greater than
    any other element in the sorted list. However, the algorithm doesn't
    know this upfront! It, instead, must compare the inserted element
    against _every_ element in the list to discover that it needs to
    insert at the end.

These extremes represent the _best_ and _worst_ case scenarios for
`insert-sorted`. Note that we can do no better than one comparison and no worse
than comparing against every element in the list!

The first example, in contrast, reflects the "average" case. On average, we
expect the insertion point to float somewhere in the middle of the list,
sometimes a little above the midway point, sometimes a little less. Note
that "average" here is a debatable term as the "average" list may have a
different distribution of elements depending on the task at hand.
Nevertheless we use "average" to try to characterize the situation when there
are no specific domain-specific constraints on the inputs.

So which of these cases---best, average, worst---should we use to analyze the
complexity of `insert-sorted`?

+   The best case scenario where only one comparison is necessary paints a
    optimistic view of the function. It is useful to know that this scenario
    exists, but we tend to want to be more pessimistic in our analyses to
    "cover our bases," so to speak.
+   The average case scenario where we compare against approximately half of
    the elements of the list reflects what we expect "on average." But as
    discussed previously, this may not reflect reality if our problem puts
    particular constraints on the input lists.
+   The worst case scenario where we compare against every element in the list
    is, indeed, pessimistic. It is important to know we can't do worse than
    this scenario, but it may occur rarely, so it is more a technicality than
    a reality.

In short, analyzing all three cases has their merits, and we should certainly
consider all three. However, understanding the worst case scenario for our
algorithms, _i.e._, establishing upper bounds on complexity, gives us
particularly useful guarantees when analyzing algorithms. So we'll focus the
remainder of our discussion on understanding sorting algorithms in terms of
their worst case scenarios.

With the worst case scenario for `insert-sorted` established, let's consider
the complexity of `insertion-sort`. First, we must establish _when_ the worst
case scenario for `insertion-sort` occurs. The worst case scenario arises when
_every_ call to `insert-sorted` is the worst-case---inserting an element larger
than any other element in the sorted list.

When does this arise? This situation arises when the input list to
`insertion-sort` is in _sorted order_ already! Let's step through
the execution of `insertion-sort` on such a list to see this fact:

~~~
sorted:   []
unsorted: [1, 2, 3, 4, 5]

sorted:   [1]
unsorted: [2, 3, 4, 5]
(0 comparisons made so far)

sorted:   [1, 2]
unsorted: [3, 4, 5]
(0+1=1 comparison made so far)

sorted:   [1, 2, 3]
unsorted: [4, 5]
(1+2=3 comparisons made so far)

sorted:   [1, 2, 3, 4]
unsorted: [5]
(3+3=6 comparisons made so far)

sorted:   [1, 2, 3, 4, 5]
unsorted: []
(6+4=10 comparisons made so far)
~~~

Ick! We can see that the number comparisons quickly grows because as the
sorted list grows, we have to traverse more and more elements repeatedly.
Let's look at some counts to get a sense of this growth:

<pre class="scamper source">
(define count (ref 0))

(define inc-count
  (lambda ()
    (ref-set! count (+ 1 (deref count)))))

(define get-count
  (lambda ()
    (deref count)))

(define reset-count!
  (lambda ()
    (ref-set! count 0)))

(define insert-sorted
  (lambda (l v leq?)
    (match l
      [null (list v)]
      [(cons head tail)
       (begin
         (inc-count)
         (if (leq? v head)
             (cons v l)
             (cons head (insert-sorted tail v leq?))))])))

(define insertion-sort-helper
  (lambda (unsorted sorted leq?)
    (match unsorted
      [null sorted]
      [(cons head tail)
       (insertion-sort-helper tail (insert-sorted sorted head leq?) leq?)])))

(define insertion-sort
  (lambda (l leq?)
    (insertion-sort-helper l null leq?)))

(define count-comparisons
  (lambda (l leq?)
    (begin
      (reset-count!)
      (insertion-sort l leq?)
      (get-count))))

(count-comparisons (range 1) <=)
(count-comparisons (range 5) <=)
(count-comparisons (range 10) <=)
(count-comparisons (range 50) <=)
(count-comparisons (range 100) <=)
(count-comparisons (range 200) <=)
</pre>

Eek! The number of comparisons seems to grow very quickly as the size of the
list grows. It turns out that we can compute this number precisely: if $$n$$ is
the size of the input list, then in the worst-case, `insertion-sort` will
perform $$\frac{n^2 - n}{2}$$ insertions! In other words, the number of
comparisons we make grows _quadratically_ in the size of the input. While
computers are fast, if there, _e.g._, a million elements in our list---not an
unreasonable number given the size of the data sets we process nowadays---we
will perform:

$$
\frac{1000000^2 - 1000000}{2} = 4999995000000
$$

Comparisons! This will take quite a bit of time, even on modern hardware.
Can we do better than this?

# The merge sort algorithm

When searching for an element in a list, we were able to do better than
linear search by _dividing and conquering_. That is, we found a way to
divide up the input vector in half and efficiently dealing with the resulting
smaller sub-problem.

It turns out that there is a similar divide-and-conquer approach to sorting
that will ultimately reduce in a far better algorithm than insertion sort.
However, we'll need to trust in our knowledge of recursion to design this
algorithm properly!

Rather than starting with an example, let's first try to sketch out a recursive
skeleton for sorting, using divide-and-conquer as a starting point. We'll
proceed by recursion on the structure of the list `l`:

+   To sort a list `l`:
    -   If `l` is empty or contains one element, `l` is already sorted.
    -   If `l` has at least two elements in it …

As with all of our recursive functions, the base cases are simple as lists
containing zero or one element are already sorted so no work needs to be done.
If there are at least two elements in the list, we can now employ our
divide-and-conquer strategy: let's divide the list in half and recursively
sort both halves.

*   To sort a list `l`:
    +   If `l` is empty or contains one element, `l` is already sorted.
    +   If `l` has at least two elements in it:
        -   Divide `l` into two halves, `l1` and `l2`, and sort them recursively.
        -   …

How can we do this? Recall this is precisely what recursion gives us! We assume
we can "solve the problem" for smaller sublists, here `l1` and `l2`. The
difficulty lies in _putting together the solutions_ obtained from the recursive calls.

Let's imagine that we are sorting a list that contained the numbers 1–10 and after recursively sorting the two halves of the list, we receive the following results:

~~~
[1, 3, 4, 7, 8]
[2, 5, 6, 7, 9, 10]
~~~

Observe that we assume---our "recursive assumption"---that the results of the two recursive calls will be two lists, each of which are one of the halves, but sorted.

How do we combine these two lists into a list that is the sorted, complete
list? We just need to _merge_ the two sorted lists together in an efficiency
way! Luckily, because they are sorted, this is efficient to implement.

Let's imagine performing this merge operation on the two lists above.
Like insertion sort, we will insert the elements of these two lists, call them `l1`, and `l2`, into a `sorted` result, initially empty:

~~~
l1:     [1, 3, 4, 7, 8]
l2:     [2, 5, 6, 9, 10]
sorted: []
~~~

What element should go into `sorted` first? Our key observation is that because
`l1` and `l2` are sorted, it is sufficient to only look at the _heads of the
two lists_ to determine what to add next to `sorted`. This is because the
heads of the lists must be the two smallest elements of the lists under consideration!

In our particular example, we'll add `1` from `l1` first, producing this updated diagram:

~~~
l1:     [3, 4, 7, 8]
l2:     [2, 5, 6, 9, 10]
sorted: [1]
~~~

We now repeat the process, repeatedly adding the _smaller_ of `l1` and `l2` to
`sorted`. Let's continue that process until we empty one of the lists:

~~~
l1:     [3, 4, 7, 8]
l2:     [2, 5, 6, 9, 10]
sorted: [1]

l1:     [3, 4, 7, 8]
l2:     [5, 6, 9, 10]
sorted: [1, 2]

l1:     [4, 7, 8]
l2:     [5, 6, 9, 10]
sorted: [1, 2, 3]

l1:     [7, 8]
l2:     [5, 6, 9, 10]
sorted: [1, 2, 3, 4]

l1:     [7, 8]
l2:     [6, 7, 9, 10]
sorted: [1, 2, 3, 4, 5]

l1:     [7, 8]
l2:     [9, 10]
sorted: [1, 2, 3, 4, 5, 6]

l1:     [8]
l2:     [9, 10]
sorted: [1, 2, 3, 4, 5, 6, 7]

l1:     []
l2:     [9, 10]
sorted: [1, 2, 3, 4, 5, 6, 7, 8]
~~~

Finally, we arrived at the point where one of `l1`, and `l2` are exhausted! The
remaining list, `l2`, is already sorted and must be equal to or larger than the
elements in `sorted`, so it should be safe to simply append them to end of
`sorted`, completing the merge process:

~~~
l1:     []
l2:     []
sorted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
~~~

Let's try to write a recursive skeleton for this merge operation based on what
we observed. Unlike other functions we have written, this function requires
that we perform case analysis on the two input lists, `l1` and `l2`
_simultaneously_. Otherwise, the definition of the skeleton is similar to
`sorted-insert` in that we'll write this skeleton as a "kernel" that also
maintains the `sorted` list. `sorted` starts empty and eventually contains the
elements of `l1` and `l2`, but in sorted order.

There is also one final caveat we need to consider. In our merge algorithm, we
added elements to the _end_ of `sorted`, not the front. Note that adding to
the end of a list requires that we traverse all of its elements which will
result in poor performance! Instead, we'll use `cons` to append onto the
_front_ of `sorted` which will result in a _reverse sorted list_ as larger elements will be placed before smaller ones. We can then reverse this list in
our base case before we append the remaining elements onto it to receive a
final, sorted list.

(_Note_: when you trace merge sort's execution by-hand, you do not need to take
this detail into account. You can simply maintain regular sorted order and
append onto the end of the `sorted` list. This is merely a technicality due to
the nature of lists and the `cons` operator.)

*   To merge the elements of sorted lists `l1` and `l2` into a sorted list while maintaining a `reverse-sorted` list of the elements:
    +   If either `l1` or `l2` are empty, append the other list onto the end
        of the result of reversing `reverse-sorted`. (Note: this case covers
        the case when both `l1` and `l2` are empty!)
    +   Otherwise, both `l1` and `l2` are non-empty. Let `head1`, `tail1`,
        `head2`, and `tail2` be the heads and tails of `l1` and `l2`,
        respectively.
        -   If `head1 ≤ head2`, then cons `head1` onto `reverse-sorted` and recursively merge `tail1` and `l2`.
        -   Otherwise, `head2 < head1`. Cons `head2` onto `reverse-sorted` and recursively merge `l1` and `tail2`.

Let's implement this recursive skeleton and take it for a spin!

<pre class="scamper source">
;;; (merge-helper l1 l2 reverse-sorted) -> list?
;;;   l1, l2: list?, sorted
;;;   reverse-sorted: list?, sorted in reverse order
;;; Merges the elements of l1, l2, and reverse-sorted into a single
;;; list in sorted order.
(define merge-helper
  (lambda (l1 l2 reverse-sorted)
    (match (pair l1 l2)
      [(pair null _) (append (reverse reverse-sorted) l2)]
      [(pair _ null) (append (reverse reverse-sorted) l1)]
      [(pair (cons head1 tail1)
             (cons head2 tail2))
       (if (<= head1 head2)
           (merge-helper tail1 l2 (cons head1 reverse-sorted))
           (merge-helper l1 tail2 (cons head2 reverse-sorted)))])))

(define merge
  (lambda (l1 l2)
    (merge-helper l1 l2 null)))

(merge (list 3 4 7 8) (list 2 5 6 9 10))
</pre>

With `merge` defined, we can complete the recursive skeleton of merge sort:

*   To sort a list `l`:
    +   If `l` is empty or contains one element, `l` is already sorted.
    +   If `l` has at least two elements in it:
        -   Divide `l` into two halves, `l1` and `l2`, and sort them recursively.
        -   Merge `l1` and `l2` into a sorted whole.

Believe it or not, that's it! Recursion is quite powerful as long as we believe
it can work. In terms of implementation, the only thing that remains is
dividing the input list in half. We can accomplish this with `length` and
a quick helper function that walks to a specified index of a list and returns
the result of splitting the list in half at that index.

<pre class="scamper source">
;;; (list-split l n) -> pair?
;;;   l: list?
;;;   n: integer?, a valid index into l
;;; Returns a pair of lists that is the result of splitting l
;;; at index n.
(define list-split
  (lambda (l n)
    (if (zero? n)
        (pair null l)
        (match l
          [null (error "list-split: index out of bound")]
          [(cons head tail)
           (let ([result (list-split tail (- n 1))])
             (pair (cons head (car result)) (cdr result)))]))))

;;; (list-split-half l) -> pair?
;;;   l: list?
;;; Returns a pair of lists that is the result of splitting l in half.
(define list-split-half
  (lambda (l)
    (list-split l (floor (/ (length l) 2)))))

(define merge-helper
  (lambda (l1 l2 reverse-sorted)
    (match (pair l1 l2)
      [(pair null _) (append (reverse reverse-sorted) l2)]
      [(pair _ null) (append (reverse reverse-sorted) l1)]
      [(pair (cons head1 tail1)
             (cons head2 tail2))
       (if (<= head1 head2)
           (merge-helper tail1 l2 (cons head1 reverse-sorted))
           (merge-helper l1 tail2 (cons head2 reverse-sorted)))])))

(define merge
  (lambda (l1 l2)
    (merge-helper l1 l2 null)))

(define merge-sort
  (lambda (l)
    (match l
      [null l]          ; the empty list case
      [(cons _ null) l] ; the one-element list case
      [_ (let* ([halves (list-split-half l)]
                [l1     (merge-sort (car halves))]
                [l2     (merge-sort (cdr halves))])
           (merge l1 l2))])))

(merge-sort (list 0 6 2 3 5 7 4 1 8 9 10))
</pre>

Now that we've fully developed the algorithm, let's trace the merge sort
algorithm on this input list. From the definition of merge sort, we
see that we:

+   Split the list in half (rounding down as per `list-split-half`'s `floor` call).
+   Recursively sort the two halves.
+   Merge the two halves into a sorted whole.

We already traced how the merge operation operates, so let's just trace
the behavior of the `merge-sort` calls themselves.

~~~
                [0, 6, 2, 3, 5, 7, 4, 1, 8, 9, 10]
             -->[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                   /                         \
                  /                           \
          [0, 6, 2, 3, 5]               [4, 1, 8, 9, 10]
       -->[0, 2, 3, 5, 6]            -->[1, 4, 8, 9, 10]
            /      \                       /       \
           /        \                     /         \
      [0, 6]    [2, 3, 5]               [4, 1]    [8, 9, 10]
   -->[0, 6] -->[2, 3, 5]            -->[1, 4] -->[8, 9, 10]
      /   \      /    \                  /  \        /    \
    [0]   [6]  [2]  [3, 5]            [4]  [1]     [8]  [9, 10]
                 -->[3, 5]                           -->[9, 10]
                    /    \                             /     \
                  [3]    [5]                         [9]    [10]
~~~

Note how the calls to `merge-sort` form a binary tree. At each node,
we show the input list and the result of sorting it at that point in
the algorithm.

It looks complicated, much more complicated than insertion sort! Have
we saved anything in terms of performance? While we are performing many
more traversals of the lists, the operation that we are counting, comparisons,
occurs exclusively in `merge`. In the worst case, we have to compare every
every element of the two input lists to merge them together. Does this
strategy beat out `insert-sorted`? Let's instrument the code and find out!

<pre class="scamper source">
(define count (ref 0))

(define inc-count
  (lambda ()
    (ref-set! count (+ 1 (deref count)))))

(define get-count
  (lambda ()
    (deref count)))

(define reset-count!
  (lambda ()
    (ref-set! count 0)))

(define list-split
  (lambda (l n)
    (if (zero? n)
        (pair null l)
        (match l
          [null (error "list-split: index out of bound")]
          [(cons head tail)
           (let ([result (list-split tail (- n 1))])
             (pair (cons head (car result)) (cdr result)))]))))

(define list-split-half
  (lambda (l)
    (list-split l (floor (/ (length l) 2)))))

(define merge-helper
  (lambda (l1 l2 reverse-sorted)
    (match (pair l1 l2)
      [(pair null _) (append (reverse reverse-sorted) l2)]
      [(pair _ null) (append (reverse reverse-sorted) l1)]
      [(pair (cons head1 tail1)
             (cons head2 tail2))
       (begin
         ; This is the only point where we perform a comparison!
         (inc-count)
         (if (<= head1 head2)
             (merge-helper tail1 l2 (cons head1 reverse-sorted))
             (merge-helper l1 tail2 (cons head2 reverse-sorted))))])))

(define merge
  (lambda (l1 l2)
    (merge-helper l1 l2 null)))

(define merge-sort
  (lambda (l)
    (match l
      [null l]          ; the empty list case
      [(cons _ null) l] ; the one-element list case
      [_ (let* ([halves (list-split-half l)]
                [l1     (merge-sort (car halves))]
                [l2     (merge-sort (cdr halves))])
           (merge l1 l2))])))

(define count-comparisons
  (lambda (l)
    (begin
      (reset-count!)
      (merge-sort l)
      (get-count))))

; insertion-sort: 0
(count-comparisons (range 1))
; insertion-sort: 10
(count-comparisons (range 5))
; insertion-sort 45
(count-comparisons (range 10))
; insertion-sort 1225
(count-comparisons (range 50))
; insertion-sort 4950
(count-comparisons (range 100))
; insertion-sort 19900
(count-comparisons (range 200))
</pre>

Look at that difference! While it appears that merge sort, by virtue of its
complexity, is doing more work than insertion sort, it performs much better as
the size of the list grows! In a future course, you'll formally analyze
merge sort and its divide-by-conquer cousins, but it turns out that if $$n$$ is the size of the input list, then merge sort performs (roughly) $$n \log{n}$$ comparisons. This _linearithmetic_ function, $$n \log{n}$$ grows much slower than the quadratic function $$n^2$$. For example, for the same list of a million elements, merge sort performs:

$$
1000000 \times \log{1000000} \approx 19931569.
$$

Comparisons, orders of magnitude less than insertion sort!

# Self checks

## Check 1: Tracing sorts (‡)

Consider the following sequence of elements:

~~~
[1, 3, 9, 8, 6, 4, 7, 10, 2, 5]
~~~

Give the step-by-step execution of the following sorting algorithms
on this sequence:

{:type="a"}
a.  Insertion sort assuming the sequence is stored in a list. Show the sorted
    and unsorted lists are updated through each step of the algorithm.
b.  Insertion sort assuming the sequence is stored in a vector. Show the single
    vector updated in-place by the algorithm, denoting which regions are the
    unsorted and sorted regions.
c.  Merge sort assuming the sequence is stored in a list. Show the tree of
    calls that merge sort recursively makes and the input and output of each
    call as demonstrated in the reading.

## Check 2: Tracing list merging (‡)

Consider the following pair of sorted lists:

~~~
l1: [1, 3, 4, 5, 9]
l2: [2, 6, 7, 8, 10]
~~~

Give the step-by-step execution of the merge algorithm on this sequence as
demonstrated in the reading.

## Check 3: Best case scenario

In the reading, we discussed the _worst case scenario_ for insertion sort,
_i.e._, the shape of inputs to the algorithm that cause the most comparisons to
occur. What is the _best case scenario_ for insertion sort? In other words what
kind of inputs will cause insertion sort to perform a minimal number of
comparisons?