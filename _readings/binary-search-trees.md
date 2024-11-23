---
title: Binary Search Trees
summary: |
  We explore a particularly powerful application of trees, _binary search trees_, that allow us to efficiently capture an ordering being objects via a hierarchical relationship.
---

We have observed that many of the data we might represent in a program have a hierarchical structure to them, _e.g._, employees in a company, governmental structures, or biological systems.
These relationships are best represented using trees.
However, with sufficient ingenuity, we can envision more _abstract_ kinds of hierarchical relationships that might allow us to obtain different effects with trees that we might not otherwise realize possible.

For example, consider the following tree of numbers:

~~~
       4
      / \
     /   \
    /     \
   2       6
  / \     / \
 /   \   /   \
1    3  5     7
~~~

What is the relationship between the different "parents" and "children" of this tree?
The relationship is a bit more "abstract," but a powerful one to recognize.
For any given subtree with a root or parent value `v`:

+   All the children in the left subtree are less than `v`.
+   All the children in the right subtree are greater than `v`.

When a tree has this property, we call it a _binary search tree_ or "bst" for short.
At first glance, it seems like we are overcomplicating the situation.
We could have stored these values in a list, maintaining the sorted order of the values:

~~~
[1, 2, 3, 4, 5, 6, 7]
~~~

What did we gain by storing the elements in a tree?
Imagine trying to find an element in this list.
Even though we know that the list is sorted, that information doesn't help us narrow the search for the element.
The nature of a list forces us to scan it left-to-right.
In contrast, a binary search tree allows us to take advantage of "sortedness" to make finding elements quicker.

To see this, imagine looking for `5` in our bst:

~~~
       4
      / \
     /   \
    /     \
   2       6
  / \     / \
 /   \   /   \
1    3  5     7
~~~

How might we do this, starting from the root of the tree, `4`?

+   We first observe that because our tree is a binary search tree that all the elements less than `4` are in the left subtree and all the elements to the right of `4` are in the right subtree.
    Because `5` is greater than `4`, we know that we can search the right subtree rooted at `6` for the element.
+   Next, we search the subtree rooted at `6`.
    `5` is less than `6`, so we can refine our search to the subtree rooted at `5`.
+   `5` is the element we were looking for, so we can conclude that `5` is indeed in the bst!

If we were to look for `5` in our list, we would have needed to check `5` elements: `1`, `2`, `3`, `4`, and `5`.
In contrast, this search only took three steps.
This is because at every step, the choice of which subtree to explore next meant that we _didn't have to explore the other subtree_!
It isn't obvious from our small example, but this results in a significant savings in time, especially as the number of elements in our collection grows!
We'll dive into the specifics of this time savings when we talk about _computational complexity_, _i.e._, how we characterize the performance aspects of an algorithm.

## Searching Binary Search Trees

Implementing a binary search tree so that we can reap these benefits is straightforward in Scheme.
We'll use exactly the same binary search tree setup we introduced in our discussion of binary trees.
However, we will enforce the binary search tree invariant:

> For any subtree with root value `v` contained within a **binary search tree**, the following properties hold:
>
> +   All elements in the left subtree are less than `v`.
> +   All elements in the right subtree are greater than `v`.

First, let's consider the "payoff" function for bsts, search.
In our regular binary tree, we had to recursively search both the left-hand and right-hand children of the tree since we had no guarantees where data was stored.
The binary search tree invariant allows us to refine our search accordingly:

> To find a value `v` in a binary search tree `t`:
> +   If `t` is a leaf, then the tree is empty and thus it doesn't contain `v`.
> +   If `t` is a node, then it has a value `u` and a left subtree `l` and right subtree `r`.
>     -   If `v = u`, then `t` definitively contains `v`.
>     -   If `v < u`, then (recursively) search `l` for `v`.
>     -   Otherwise `v > u`. (Recursively) search `r` for `v`.

This recursive decomposition can be directly translated into code as follows:

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define singleton
  (lambda (value)
    (node value (leaf) (leaf))))

(define example-bst
  (node 4
    (node 2
      (singleton 1)
      (singleton 3))
    (node 6
      (singleton 5)
      (singleton 7))))

(define bst-contains
  (lambda (t v)
    (match t
      [(leaf) #f]
      [(node value left right)
       (cond
         [(equal? v value) #t]
         [(< v value)      (bst-contains left v)]
         [else             (bst-contains right v)])])))
  
(bst-contains example-bst 3)
(bst-contains example-bst 8)
</pre>

In lab, we'll look at other operations over binary search trees: insertion into a bst and converting a bst to a (sorted) list.

## Self Checks

### Check 1: Searching

Consider the following binary search tree:

~~~
            7
           / \
          /   \
         /     \
        4       9
       / \       \ 
      /   \       \
     2     6       10
~~~

Using the search algorithm for bsts described above, for each of the given target values, determine the _sequence of elements_ that you touch while searching the bst for that target.

+   6
+   10
+   8

### Check 2: Did It Matter? (‡)

Recall that we defined the following _binary search tree invariant_:

> For any subtree with root value `v` contained within a **binary search tree**, the following properties hold:
>
> +   All elements in the left subtree are less than `v`.
> +   All elements in the right subtree are greater than `v`.

This definition assumes that our bsts contain unique elements, _i.e._, they have no duplicates.
If we allowed for duplicates, we might augment our definition to say that:

> +   All elements in the right subtree are _greater than or equal_ to `v`.

Does our search algorithm still work in this case?
In a sentence or two, describe why or why not?