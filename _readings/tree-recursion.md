---
title: Tree recursion
summary: |
  Since trees are recursive structure, we define operations over them recursively, leading to a *recursive pattern for trees* that we can use to design code that involves tree manipulation.
---

So far, we have developed the data structure of a *binary tree* as a hierarchical structure recursively defined as follows: a binary tree is either

+ Empty or
+ Non-empty with a value and up to two children (subtrees) that are trees.

As with lists, we can define operations over trees by mirroring this structure.
That is, we can use something like `empty-tree?` or `leaf?` for the base-case test and we can solve a problem on a whole tree by solving it on the subtrees and then combining the solutions.

We'll develop a few examples and then look for patterns.

## The size of binary trees

One basic example of tree recursion is computing the "size" of the tree, the number of values stored in the tree.
We can define the size operation recursively by case analysis on the structure of the tree:

+   When the tree is empty, it has no values---its size is zero.
+   When the tree is non-empty, it has a root containing one value and up to two children that, themselves, are trees.
    The value contributes one to the overall size, so we can add one along with the sizes of the children, recursively.

We can then translate this recursive algorithm into code:

~~~racket
;;; (binary-tree-size tree) -> integer?
;;;   tree : binary-tree?
;;; Compute the number of values in the tree.
(define binary-tree-size
  (lambda (tree)
    (if (empty-tree? tree)
        0
        (+ 1
           (binary-tree-size (bt/l tree))
           (binary-tree-size (bt/r tree))))))
~~~

And here is an example run of `tree-size` on a sample tree using the tree-creation helper functions we wrote in [the previous reading]({{ "/readings/trees" | relative_url }}).
Note: We're using the list-based representation of trees.

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
(define example-tree
  (binary-tree 5
               (binary-tree 3
                            (leaf 1)
                            (leaf 4))
               (binary-tree 7
                            (empty-tree)
                            (binary-tree 9
                                         (leaf 8)
                                         (empty-tree)))))
~~~

~~~racket
> example-tree
'(5 (3 (1 ◬ ◬) (4 ◬ ◬)) (7 ◬ (9 (8 ◬ ◬) ◬)))
> (binary-tree-size example-tree)
7
~~~

Here is the step-by-step evaluation of the function.
Note the *order* of evaluation between the left and right branches of each sub-tree.
For concision, we're using `size` rather than `binary-tree-size`.
And we've underlined the part of the expression we're evaluating with x's.

~~~
    (size example-tree) 
          xxxxxxxxxxxx
--> (size '(5 (3 ...) (7 ...)))
    xxxxxxxxxxxxxxxxxxxxxxxxxxx 
--> (+ 1 (size '(3 ...)) (size '(7 ...)))
         xxxxxxxxxxxxxxx
--> (+ 1 (+ 1 (size '(1 ◬ ◬)) (size '(4 ◬ ◬))) (size '(7 ...)))
              xxxxxxxxxxxxxxx
--> (+ 1 (+ 1 (+ 1 (size '◬) (size '◬)) (size '(4 ◬ ◬))) (size '(7 ...)))
                   xxxxxxxxx
--> (+ 1 (+ 1 (+ 1 0 (size '◬)) (size '(4 ◬ ◬))) (size '(7 ...)))
                     xxxxxxxxx
--> (+ 1 (+ 1 (+ 1 0 0) (size '(4 ◬ ◬))) (size '(7 ...)))
              xxxxxxxxx
--> (+ 1 (+ 1 1 (size '(4 ◬ ◬))) (size '(7 ...)))
                xxxxxxxxxxxxxxx
--> (+ 1 (+ 1 1 (+ 1 (size '◬) (size '◬))) (size '(7 ...)))
                     xxxxxxxxx xxxxxxxxx
--> (+ 1 (+ 1 1 (+ 1 0 0)) (size '(7 ...)))
                xxxxxxxxx
--> (+ 1 (+ 1 1 1) (size '(7 ...)))
         xxxxxxxxx
--> (+ 1 3 (size '(7 ◬ (9 ...))))
           xxxxxxxxxxxxxxxxxxx
--> (+ 1 3 (+ 1 (size ' ◬) (size '(9 ...))))
                xxxxxxxxxx
--> (+ 1 3 (+ 1 0 (size '(9 (8 ...) ◬))))
                  xxxxxxxxxxxxxxxxxxxx
--> (+ 1 3 (+ 1 0 (+ 1 (size '(8 ◬ ◬)) (size '◬))))
                       xxxxxxxxxxxxxx  ; Skipping a few steps
--> (+ 1 3 (+ 1 0 (+ 1 1 (size '◬))))
                         xxxxxxxxx
--> (+ 1 3 (+ 1 0 (+ 1 1 0)))
                  xxxxxxxxx
--> (+ 1 3 (+ 1 0 2))
           xxxxxxxxx
--> (+ 1 3 3)
    xxxxxxxxx
--> 7
~~~

## Patterns of tree recursion

As you should recall from our initial explorations of recursion, there
is a traditional pattern for recursion over lists:

```drracket
(define recursive-proc
  (lambda (lst)
      (if (null? lst)
          (base-case)
          (combine (car lst)
                   (recursive-proc (cdr lst) other)))))
```

We chose this pattern because of the common definition of a list.
Because *a list is either (a) null or (b) the cons of a value and
a list* we have two cases: one for when the list is null and one
for the cons case. Since the cdr of a list is itself a list, in
makes sense to recurse on the cdr.

A binary tree, in comparison, is either the (a) empty tree or (b)
a combination of a value and two subtrees. If it's Hence, we will
need to recurse on both halves, as well as look at the value in the
node.

```drracket
(define binary-tree-proc
  (lambda (tree)
      (if (empty-tree? tree)
          (base-case)
          (combine (process (bt/t tree))
                   (binary-tree-proc (bt/l tree))
                   (binary-tree-proc (bt/r tree))))))
```

For the `binary-tree-size` above, 

* the base case is 0
* the `combine` procedure is `+`
* we `process` the top value by using 1

### Finding the depth of a tree

We can also use this pattern to find the `depth` of a tree, the number of
levels in the tree.

* the depth of the empty tree is 0.
* the depth of a non-empty tree is 1 plus the larger of the depths of
  its subtrees.

```drracket
(define binary-tree-depth
  (lambda (tree)
    (if (empty-tree? tree)
        0
        (+ 1 (max (binary-tree-depth (bt/l tree))
                  (binary-tree-depth (bt/r tree)))))))
```

The `combine` here is slightly more subtle.  We have to find a max and then add
1, rather than combining the values directly.  And we throw away the top value,
since it has no relevance.

### Summing the value sin trees

If we have a tree of numbers, we can sum them using a similar pattern.

```drracket
(define binary-tree-sum
  (lambda (tree)
    (if (empty-tree? tree)
        0
        (+ (bt/t tree)
           (binary-tree-sum (bt/l tree))
           (binary-tree-sum (bt/r tree))))))
```

Are you sick of the pattern yet?  We know we are.  But we still have a
few more issues to cover before coming on.

### Dangers of helper recursion

Now that you've learned helper and tail recursion, you may be tempted to write a helper procedure with a `so-far` parameter that accumulates what we've seen so far.
However, it turns out that most procedures over trees work better if we don't use tail recursion; getting the `so-far` parameter to work on both sides of the tree is hard.
When you first write tree-recursive procedures, use *direct recursion*.  That is, assume that the procedure you are writing works on both the left and right subtrees and then build the result for any tree from the recursive calls on the subtrees.

### Other base cases and other recursive cases

You should recall that in processing lists, `(null? lst)` was not our only base case.
In particular, there were procedures, such as `largest`, that required us to stop when we had one value.

We will encounter similar issues in trees.
That is, when we write procedures that recurse over trees, we may need to stop with singleton values.

Consider, for example, the problem of finding the largest value in a tree.

```
;;; (binary-tree-largest tree) -> real?
;;;   tree : binary-tree-of real?
;;; Finds the largest value in the tree.
```

Let's start with the base case.

```
(define binary-tree-largest
  (lambda (tree)
    (if (tree-empty? tree)
        undefined
        undefined)))
```

What's the largest value in an empty tree?

Do you have an answer?

That's right, there isn't one.

So we should update our documentation.

```
;;; (binary-tree-largest tree) -> real?
;;;   tree : binary-tree-of real? (nonempty)
;;; Finds the largest value in the tree.
```

In addition, instead of making our base case the empty tree, we should make our base case a leaf.

```
(define binary-tree-largest
  (lambda (tree)
    (if (leaf? tree)
        (bt/t tree)
        undefined)))
```

That works on leaves.

```
> (binary-tree-largest (leaf 5))
5
> (binary-tree-largest (binary-tree 3 (binary-tree 5) (binary-tree 7)))
#<undefined>
```

What about the recursive case?
It's a bit more complicated than in lists.
In lists, the largest value could be either (a) the car or (b) the largest value in the cdr.
In trees, we effectively have two "cdrs": the left subtree and the right subtree.
Hence, the largest value is either (a) the root value, given by `bt/t`, (b) the largest value in the left subtree, given by recursing on `bt/l`, or (c) the largest value in the right subtree, given by recursing on `bt/r`.

```
(define binary-tree-largest
  (lambda (tree)
    (if (leaf? tree)
        (bt/t tree)
        (max (bt/t tree)
             (binary-tree-largest (bt/l tree))
             (binary-tree-largest (bt/r tree))))))
```

Let's check it out.

```
> (test-equal? "leaf"
               (binary-tree-largest (leaf 0))
               0)

> (test-equal? "largest at root"
               (binary-tree-largest (binary-tree 5 (leaf 3) (leaf 4)))
               5)
> (test-equal? "largest in left subtree"
               (binary-tree-largest (binary-tree 5 (leaf 6) (leaf 4)))
               6)
> (test-equal? "largest in right subtree"
               (binary-tree-largest (binary-tree 5 (leaf 6) (leaf 7)))
               7)

> (test-equal? "deeper tree/1"
               (binary-tree-largest (bt 5
                                        (bt 6
                                            (leaf 7)
                                            (bt 5
                                                (leaf 8)
                                                (leaf 9)))
                                        (leaf 3)))
               9)

> (test-equal? "deeper tree/2"
               (binary-tree-largest (bt 5
                                        (bt 6
                                            (leaf 10)
                                            (bt 5
                                                (leaf 8)
                                                (leaf 9)))
                                        (leaf 3)))
               10)
```

No errors!

We're all good.

Right?

Unfortunately, we're not.

```
> (test-equal? "example-tree"
               (binary-tree-largest example-tree)
               9)
--------------------
example-tree
. ERROR
name:       check-equal?
location:   16-interactions from an unsaved editor:125:2

car: contract violation
  expected: pair?
  given: '◬
--------------------
```

What happened?
It's a bit hard to tell.
But, somehow, we received an empty tree.

That's right!
Some of the nodes in `example-tree` have empty children.
That might be the problem.
Let's test that hypothesis on some simpler trees.

```
> (binary-tree-largest (bt 5 (empty-tree) (leaf 6)))
. . car: contract violation
  expected: pair?
  given: '◬
> (binary-tree-largest (bt 5 (leaf 6) (empty-tree)))
. . car: contract violation
  expected: pair?
  given: '◬
> (binary-tree-largest (bt 5 (empty-tree) (empty-tree)))
5
```

Yup.  The problem occurs when one child is the empty tree.
So we can't just recurse on the children; We have to make sure that they are not empty.

How will we address that issue?
We'll leave that as something for you to consider.

## Self Checks

### Check 1: Sum order

Note the order of the recursive calls to `tree-sum`.
We recursively call the function first on the left subtree and then the right subtree.
What if we flipped these calls?

Consider this alternative version of `binary-tree-sum`:

~~~racket
(define sum-binary-tree
  (lambda (tree)
    (if (null? tree)
        0
        (+ (bt/t tree)
           (sum-binary-tree (bt/r tree))
           (sum-binary-tree (bt/l tree))))))
~~~

How does it behave differently from the original `tree-sum` version?
Justify your answer in terms of the operations that `tree-sum` ultimately performs on its elements.

### Check 2: Finding the largest value, revisited (‡)

As you may recall, our `binary-tree-largest` procedure has a significant flaw.
In particular, if a tree node has an empty left subtree or an empty right subtree (but not both), the procedure fails.

Sketch how you might address this flaw.
By "sketch", we mean that you should come up with an approach, but need not write working Scheme code.
