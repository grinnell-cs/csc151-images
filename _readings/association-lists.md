---
title: Association Lists
summary: |
  We introduce an important data structure that builds upon our knowledge of lists: dictionaries.
  Dictionaries allow us to represent lookup tables, associating *keys* with *values*.
  We also introduce a particular implementation of a dictionary, the *association list*.
---

In this course, we explore two broad classes of data structures:

+   *Sequences* that associate elements in a *sequential* fashion.
    We represent sequences in Scheme primarily with *lists*.
+   *Hierarchies* that establishes *parent-child* relationships between elements.
    We represent hierarchies in Scheme primarily with _trees_ (which we will discuss in the last third of the course).

However, are there any other kinds of relationships we might establish between data?
If such relationships exist, how do we capture them in Scheme?

As a motivating example, consider writing a program that captures the inventory of an online store.
In particular, we have identified that for each item the store sells, we need to record how many of that item we have in the warehouse.
We also expect to perform three operations on our inventory:

+   Given an item, determine if our inventory has an entry for that item.
+   Given an item, lookup the amount of that item we have in the inventory.
+   Given an item and a new amount, update the inventory entry for that item with the given amount.

For example, we might note in our inventory we have:

~~~
"apples"  -> 5
"bananas" -> 2
"oranges" -> 8
~~~

Here are some sample outcomes of our operations over this example inventory:

1.  The inventory has an entry for `"apples"`.
    The inventory does not have an entry for `"grapes"`.
2.  The inventory has an entry mapping `"bananas"` onto `2`, *i.e.*, the inventory has two bananas.
    Likewise, the inventory records that we have eight oranges.
3.  If someone buys two applies, we can update the inventory by first looking up the number of apples originally in the inventory, subtracting two from that amount, and then updating the entry for apples with the new amount, `5 - 2 = 3`.

In all of these cases, we operate over a *collection of mappings*.
The mappings in question are the three inventory entries above, which associates fruits to numbers.
Note that the mappings are ultimately arbitrary: any fruit can be assigned any (non-negative) integer value.

In computer science, the class of data structures that captures these sorts of *arbitrary mappings* between elements is called a *map* or a *dictionary*.
The name "dictionary" is evocative of the prototypical example of these kinds of data structures: a mapping from a word to its definition.
We say that the *keys* of the dictionary are the values we're "mapping from"—fruits in our example.
The *values* of the dictionary are the values we're "mapping to"—numbers in our example.

## An Aside: Pairs in Scheme

In our dictionary data structure, we will need to associate a key with a value.
The simplest way of doing this is with a _pair structure_ which holds two values.
For example, we can represent $$x$$-$$y$$ coordinates in a two-dimensional space by using the `pair` function to create a pair.

To get out the components of a `pair` we use the `car` and `cdr` functions:

<pre class="scamper source">
(define origin (pair 0 0))

(display (pair 0 0))

(define translate
  (lambda (p dx dy)
    (pair (+ (car p) dx) (+ (cdr p) dy))))

(display (translate origin 3 5))
</pre>

But wait, we used `car` and `cdr` to access the head and tail of lists!

<pre class="scamper source">
(define lst (range 0 10))

(display (car lst))

(display (cdr lst))
</pre>

How can `car` and `cdr` serve these two different roles?

The answer is both surprisingly simple but also thought-provoking: **a list _is_ a pair!**
More specifically a list _is_ a pair of a value and a list, recursively!
So `null` is a list, a pair of a value and `null` is a list, a pair of a value and _a pair of a value and `null` is a list_, and so forth!

<pre class="scamper source">
(display null)

(display
  (pair 5 null))

(display
  (pair "a"
    (pair 5 null)))
</pre>

If the last component is not a `list`, Scamper will happily display the value as the collection of nested pairs that the value really is:

<pre class="scamper source">
; Observe how the nested pairs "bottom out" to
; a number instead of a list.
(display
  (pair "a"
    (pair 5 0)))
</pre>

In this sense, you can think of a value being displayed as a `list` as _convenient short-hand_ for nested pairs that meet this criteria!
Dually, as you see above, `cons` and `pair` are interchangable—both produce pairs that may or may not be considered lists!

A final note here is that because pairs and lists are interchangable, we can also use pattern matching to concisely access both elements of a pair.
Here is the redefinition of the `translate` function above but using pattern matching.
Note that the elementary pair value is `cons` rather than `pair`, so we need to pattern match on the `cons` constructor:

<pre class="scamper source">
(define origin (pair 0 0))

(define translate
  (lambda (p dx dy)
    (match p
      [(cons x y) (pair (+ x dx) (+ y dy))])))

(display (translate origin 3 5))
</pre>

## Association Lists

With this in mind, how might we implement a dictionary?
We can implement dictionaries by using a combination of *lists* and *pairs*, creating a structure called an *association list*.

+   Individual mappings between elements can be captured with pairs.
    For example `(pair "apples" 5)` can represent the association of the string `"apples"` to the number `5`.
+   Collections of these mapping can be gathered up in a list, *e.g.*, our complete inventory can be represented by the following *list of pairs*:

    <pre class="scamper source-only">
    (list (pair "apples" 5) (pair "bananas" 2) (pair "oranges" 8))
    </pre>

With an implementation in mind, we can now talk about how we might implement the major operations over dictionaries we described above:

+   `(assoc-key? k lst)`: returns true if association list `lst` contains an entry key `k`.
+   `(assoc-ref k lst)`: returns the value associated with key `k` in association list `lst`.
+   `(assoc-set k v lst)`: returns a association list that is `lst` with an updated entry associating key `k` with value `v`.

On top of this, we also note that the empty association list is simply the empty list, *i.e.*,

<pre class="scamper source-only">
;;; The empty association list (contains no entries)
(define assoc-empty null)
</pre>

Since we know that the implementation of our dictionary is a list of pairs, we can write recursive implementations of each of these functions, and we'll do so in lab as an exercise.
For example, `assoc-key?` is realized by the following recursive decomposition over the input list `l`:

> Association list `l` contains key `k` as follows:
> +   When `l` is empty, there are no entries, so `l` _does not_ contain `k`.
> +   When `l` is non-empty, let the head of `l` be some `key` and `value` pair.
>     If `k` is equal to `key`, then `l` contains `k`.
>     Otherwise, `l` contains `k` only if the tail of `l` contains `k`.

The following implementation realizes this decomposition:

<pre class="scamper output">
(import test)

(define my-assoc-key?
  (lambda (k l)
    (match l
      [null #f]
      [(cons (pair key _) tail) (if (equal? k key) #t (my-assoc-key? k tail))])))

(define example (list (pair 0 "foo") (pair 1 "bar") (pair 2 "baz")))

(test-case "my-assoc-key? empty"
  equal?
  #f
  (lambda () (my-assoc-key? 0 null)))

(test-case "my-assoc-key? non-empty in"
  equal?
  #t
  (lambda () (my-assoc-key? 1 example)))

(test-case "my-assoc-key? non-empty not in"
  equal?
  #f
  (lambda () (my-assoc-key? 42 example)))
</pre>

Note that Scheme provides implementations of these functions in the standard library!
Here is an example program that shows how we can fully realize our example fruit inventory in Scheme, complete with the operations from the standard library:

<pre class="scamper source">
(define inventory (list (pair "apples" 5) (pair "bananas" 2) (pair "oranges" 8)))

(display inventory)

(assoc-key? "apples" inventory)

(assoc-key? "grapes" inventory)

(assoc-ref "apples" inventory)

(assoc-ref "bananas" inventory)

(assoc-ref "oranges" inventory)

(define updated-inventory (assoc-set "apples" 3 inventory))

(display updated-inventory)

(assoc-ref "apples" updated-inventory)

(assoc-ref "bananas" updated-inventory)

(assoc-ref "oranges" updated-inventory)
</pre>

## Self-Check (‡)

Note that `assoc-set` *replaces* or *overwrites* an entry for a given key by appending to the front of the association list.
Frequently we want to *update* that entry instead.
That is, given the old value in the entry, update the entry in terms of some updating value.

Let's consider a specialized version of this update functionality in terms of our inventory.
Write a function `(assoc-update-inc-by d k n)` that returns a new dictionary that is `d` but updates key-value pair `(pair k v)` of `d` to be `(k (+ v n))`.
That is, we add `n` to the value associated with `k` in `d`.

We could apply the function to concisely write the behavior described in our example as follows:

~~~scheme
> (assoc-update-inc-by inventory "apples" -2)
(list (cons "apples" 3) (cons "bananas" 2) (cons "oranges" 8))
~~~

(_Hint_: follow the pattern for `assoc-key?` but instead of merely returning a boolean, return a new pair containing the desired update!)