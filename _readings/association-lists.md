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

## Association Lists

How might we implement a dictionarie?
We can implement dictionaries by using a combination of *lists* and *pairs*, creating a structure called an *association list*.

+   Individual mappings between elements can be captured with pairs.
    For example `(pair "apples" 5)` can represent the association of the string `"apples"` to the number `5`.
+   Collections of these mapping can be gathered up in a list, *e.g.*, our complete inventory can be represented by the following *list of pairs*:

    <pre class="scamper source-only">
    (list (pair "apples" 5) (pair "bananas" 2) (pair "oranges" 8))
    </pre>

With an implementation in mind, we can now talk about how we might implement the major operations over dictionaries we described above:

+   `(assoc-key? k l)`: returns true if association list `d` contains an entry key `k`.
+   `(assoc-ref k l)`: returns the value associated with key `k` in association list `d`.
+   `(assoc-set k v l)`: returns a association list that is `l` with an updated entry associating key `k` with value `v`.

On top of this, we also note that the empty association list is simply the empty list, *i.e.*,

<pre class="scamper source-only">
;;; The empty association list (contains no entries)
(define assoc-empty null)
</pre>

Since we know that the implementation of our dictionary is a list of pairs, we could write recursive implementations of each of these functions, and we'll do so in lab as an exercise.
For example, `assoc-key?` is realized by the following recursive decomposition over the input list `l`:

> Association list `l` contains key `k` as follows:
> +   When `l` is empty, there are no entries, so `l` _does not_ contain `k`.
> +   When `l` is non-empty, let the head of `l` be some `key` and `value` pair.
>     If `k` is equal to `key`, then `l` contains `k`.
>     Otherwise, `l` contains `k` only if the tail of `l` contains `k`.

The following implementation realizes this decomposition:

<pre class="scamper output">
(define assoc-key?
  (lambda (k l)
    (match l
      [null #f]
      [(cons (pair key _) tail) (if (equal? k key) #t (assoc-key? k tail))])))

(define example (list (pair 0 "foo") (pair 1 "bar") (pair 2 "baz")))

(test-case "assoc-key? empty"
  equal?
  #f
  (lambda () (assoc-key? 0 null)))

(test-case "assoc-key? non-empty in"
  equal?
  #t
  (lambda () (assoc-key? 1 example)))

(test-case "assoc-key? non-empty not in"
  equal?
  #f
  (lambda () (assoc-key? 42 example)))
</pre>

However, Scheme provides implementations of these functions in the standard library!
Here is an example program that shows how we can fully realize our example fruit inventory in Scheme, complete with the operations from the standard library:

<pre class="scamper output">
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