---
title: Tree recursion
summary: |
  Since trees are recursive structure, we define operations over them recursively, leading to a *recursive pattern for trees* that we can use to design code that involves tree manipulation.
---

So far, we have developed the data structure of a *binary tree* as a hierarchical structure recursively defined as follows: a binary tree is either

+ Empty (`leaf`) or
+ Non-empty (`node)` with a `value` and up to two children (subtrees) that are trees, the `left` subtree and `right` subtree.

As with lists, we can define operations over trees by mirroring this structure.
We can use `leaf?` to test whether the tree is empty and `node-value`, `node-left`, and `node-right` to obtain the value, left subtree, and right subtree of some non-empty tree.
Alternatively, we can use pattern matching, `(leaf)` and `(node v l r)` for some value `v`, left subtree `l`, and right subtree `r`.
In this reading, we'll develop a few examples and then look for patterns.

## The size of binary trees

One basic example of tree recursion is computing the "size" of the tree, the number of values stored in the tree.
We can define the size operation recursively by case analysis on the structure of the tree:

+   When the tree is empty, it has no values---its size is zero.
+   When the tree is non-empty, it has a root containing one value and up to two children that, themselves, are trees.
    The value contributes one to the overall size, so we can add one along with the sizes of the children, recursively.

We can then translate this recursive algorithm into code:

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

;;; (tree-size t) -> integer?
;;;   t: tree?
;;; Compute the number of values in the tree.
(define tree-size
  (lambda (t)
    (match t
      [(leaf) 0]
      [(node _ l r) (+ 1 (tree-size l) (tree-size r))])))
</pre>

And here is an example run of `tree-size` on a sample tree using the functions automatically generated from our `struct` declarations:

~~~racket
;;; example-tree : binary-tree?
;;; Encodes the following tree:
;;;       5
;;;      / \
;;;     3   7
;;;    / \   \
;;;   1   4   9
;;;          /
;;;         8
~~~

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define tree-size
  (lambda (t)
    (match t
      [(leaf) 0]
      [(node _ l r) (+ 1 (tree-size l) (tree-size r))])))

(define example-tree
  (node 5
        (node 3
              (node 1 (leaf) (leaf))
              (node 4 (leaf) (leaf)))
        (node 7
              (leaf)
              (node 9
                    (node 8 (leaf) (leaf))
                    (leaf)))))

(tree-size example-tree)
</pre>

## Patterns of tree recursion

As you should recall from our initial explorations of recursion, there
is a traditional pattern for recursion over lists:

<pre class="scamper source-only">
(define recursive-proc
  (lambda (lst)
    (match lst
      [null "base-case"]
      [(cons head tail) "recursive case"])))
</pre>

In the recursive case, we perform a recursive call on the `tail` of the list
and then combine that result with the `head` using some operation.

We chose this pattern because of the common definition of a list.
Because *a list is either (a) null or (b) the cons of a value and
a list* we have two cases: one for when the list is null and one
for the cons case.

A binary tree, in comparison, is either the (a) empty tree or (b)
a combination of a value and two subtrees. If it is a non-empty tree, we will
need to recurse on both halves, as well as look at the value in the
node.

<pre class="scamper source-only">
(define binary-tree-proc
  (lambda (tree)
    (match tree
      [(leaf) "base-case"]
      [(node value left right) "recursive case"])))
</pre>

Likewise, in this recursive case, we perform a recursive call on _one or both_
of the subtrees of the overall tree, `left` and/or `right`, and combine those
results with the `value` at node of the tree.

For the `tree-size` above:

* The base case is 0.
* We combine the recursive calls to the subtrees of the overall tree and the value with addition, `(+)`.
* The `value` at the current node contributes `1` to the overall size.

### Finding the depth of a tree

We can also use this pattern to find the `depth` of a tree: the number of
levels in the tree.

* The depth of the empty tree is 0.
* The depth of a non-empty tree is 1 plus the larger of the depths of
  its subtrees.

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define tree-depth
  (lambda (t)
    (match t
      [(leaf) 0]
      [(node _ l r) (+ 1 (max (tree-depth l) (tree-depth r)))])))

(define example-tree
  (node 5
        (node 3
              (node 1 (leaf) (leaf))
              (node 4 (leaf) (leaf)))
        (node 7
              (leaf)
              (node 9
                    (node 8 (leaf) (leaf))
                    (leaf)))))

(tree-depth example-tree)
</pre>

The combining step here is slightly more subtle.  We have to find a max and then add
1, rather than combining the recursively-generated depths directly.  Note that we throw away the value at the node,
since it has no relevance.

### Summing the values in a tree

If we have a tree of numbers, we can sum them using a similar pattern.

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define tree-sum
  (lambda (t)
    (match t
      [(leaf) 0]
      [(node v l r) (+ v (tree-sum l) (tree-sum r))])))

(define example-tree
  (node 5
        (node 3
              (node 1 (leaf) (leaf))
              (node 4 (leaf) (leaf)))
        (node 7
              (leaf)
              (node 9
                    (node 8 (leaf) (leaf))
                    (leaf)))))

(tree-sum example-tree)
</pre>

Are you sick of the pattern yet?  We know we are.  But we still have a
few more issues to cover before moving on.

### Other base cases and other recursive cases

You should recall that in processing lists, `(null)` was not our only base case.
In particular, there were procedures, such as `largest`, that required us to stop when we had one value.

We will encounter similar issues in trees.
That is, when we write procedures that recurse over trees, we may need to stop at singleton values.

Consider, for example, the problem of finding the largest value in a tree.

<pre class="scamper source-only">
;;; (tree-largest tree) -> number?
;;;   tree : tree? that contains numbers.
;;; Finds the largest value in the tree.
</pre>

Let's start with the base case.

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define tree-largest
  (lambda (tree)
    (match tree
      [(leaf) {??}]
      [(cons v l r) {??}])))
</pre>

What's the largest value in an empty tree?

Do you have an answer?

That's right, there isn't one.

So we should update our documentation.

<pre class="scamper source-only">
;;; (tree-largest tree) -> number?
;;;   tree : tree?, non-empty containing numbers.
;;; Finds the largest value in the tree.
</pre>

In addition, instead of making our base case the empty tree, we should make our base case a node with no children, _i.e._, a _singleton_ tree.

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define tree-largest
  (lambda (tree)
    (match tree
      [(node v (leaf) (leaf)) v]
      [(node v l r) {??}])))

(tree-largest (node 5 (leaf) (leaf)))
</pre>

What about the recursive case?
It's a bit more complicated than in lists.
In lists, the largest value could be either (a) the head or (b) the largest value in the tail.
In trees, we effectively have two "tails": the left subtree and the right subtree.
Hence, the largest value is either (a) the root value, `value` (b) the largest value in the left subtree, given by recursively checking `l`, or (c) the largest value in the right subtree, given by recursively checking `r`.

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

(define tree-largest
  (lambda (tree)
    (match tree
      [(node v (leaf) (leaf)) v]
      [(node v l r) (max v (tree-largest l)
                           (tree-largest r))])))

(define example-tree
  (node 5
        (node 3
              (node 1 (leaf) (leaf))
              (node 4 (leaf) (leaf)))
        (node 7
              (leaf)
              (node 9
                    (node 8 (leaf) (leaf))
                    (leaf)))))

(tree-largest example-tree)
</pre>

Ack!
We still get an error.
What is wrong?

Observe what our pattern matching cases are handling:

+ The first branch handles the case where we have a node whose sub-children are two leaves.
+ The second branch handles the case where we have a node with _some_ children, empty or non-empty.

Do you see the problem now?
What happens when we make recursive calls the children when they are `leaf`s?
We will get an error because we don't have a case for a `leaf`, but the `leaf` case was exactly what we were trying to rule out!
So we can't just recurse on the children; We have to make sure that they are not empty.

How will we address that issue?
We'll leave that as something for you to consider.

## Self Checks

### Check 1: Sum order

Note the order of the recursive calls to `tree-sum`.
We recursively call the function first on the left subtree and then the right subtree.
What if we flipped these calls?

Consider this alternative version of `tree-sum`:

~~~racket
(define tree-sum
  (lambda (tree)
    (match tree
      [(leaf) 0]
      [(node v l r) (+ v (tree-sum r) (tree-sum l))])))
~~~

How does it behave differently from the original `tree-sum` version?
Justify your answer in terms of the operations that `tree-sum` ultimately performs on its elements.

### Check 2: Finding the largest value, revisited (‡)

As you may recall, our `tree-largest` procedure has a significant flaw.
In particular, if a tree node has an empty left subtree or an empty right subtree (but not both), the procedure fails.
Fix the code above to cover these cases!