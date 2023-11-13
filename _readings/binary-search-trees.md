---
title: Searching trees and binary search trees
summary: |
  Just as we search lists for elements, we might also want to search trees for elements.  Here, we consider how to apply our recursive patterns for trees to the problem of searching for particular values.  We also explore a variant of binary trees called *binary search trees*.
---
In writing programs, we often find that we have to search for things: A value in a list, the index of that value, all values that meet a particular predicate, parts of a string that match a regular expression, and so on and so forth.

It is therefore natural to expect that we will also want to search in the trees we are developing.

As you may recall, in [a recent reading](tree-recursion), we developed a basic pattern for tree recursion.

```drracket
(define binary-tree-proc
  (lambda (tree)
      (if (empty-tree? tree)
          (base-case)
          (combine (process (bt/t tree))
                   (binary-tree-proc (bt/l tree))
                   (binary-tree-proc (bt/r tree))))))
```

We can use a variant of this pattern to search the tree for a value.

```drracket
;;; (binary-tree-contains? tree val) -> boolean?
;;;   tree : binary-tree?
;;;   val : any?
;;; Determine if the tree contains a specific value
(define binary-tree-contains?
  (lambda (tree val)
    (cond
      ; The empty tree contains no values
      [(empty-tree? tree)
       #f]
      ; If the value is at the top, the tree contains the value
      [(equal? (bt/t tree) val)
       #t]
      ; If the left subtree contains the value, the tree contains the value
      [(binary-tree-contains? (bt/l tree) val)
       #t]
      ; If the right subtree contains the value, the tree contains the value
      [(binary-tree-contains? (bt/r tree) val)
       #t]
      ; If none of these cases hold, the tree does not contain the value
      [else
       #f])))
```

While this looks quite different from the earlier pattern, it has a similar
concept.  Once again, we have a base case when the tree is empty.  In this
ase, the base case is "the value is not there", or `#f`.  We're also combining
information from the top, the left subtree, and the right subtree.  In particular,
we're considering whether the value appears in any of those three places.

It's just more convenient to express it as a `cond`.

In fact, it there may be even better ways to express it.  The Zen of Booleans
encourages us to think about other ways to write things when we're writing
a lot of explicit Boolean values.  Can we do better?  Here's one option.

```drracket
(define binary-tree-contains?
  (lambda (tree val)
    (and (not (empty-tree? tree))
         (or (equal? (bt/t tree) val)
             (binary-tree-contains? (bt/l tree) val)
             (binary-tree-contains? (bt/r tree) val)))))
```

Isn't that nicely concise?

**Important!**  You will note that in all of these cases, we use
direct recursion rather than tail recursion (or even accumulator
recursion).  That's because it's very difficult to express recursion
on both subtrees using anything other than direct recursion.

## Applications of trees

Computer scientists have found a wide variety of applications of
binary trees and more general trees.  As we suggested at the beginning
of our exploration of trees, a general tree can provide a way to
represent the hierarchy of positions at the organization.  At the
top of the tree we have the President or CEO.  Beneath the President
are the Vice Presidents.  Beneath each Vice President are Deans or
Directors.  And so on or so forth.

However, there's little you can do with a tree representing a hierarchy than
try to find where someone belongs in the hierarchy.  Hence, we use trees
for a variety of other applications.

### Decision trees

As its name suggests, a *decision tree* represents a series of decisions,
such as yes/no questions.  We might have the left branch correspond to a
"yes" answer and the right branch correspond to a "no" answer.  Here is
a text-based decision tree to help students select a course.

```{:.nohighlight}
Have you taken a course in computer science?
  N: Are you interested in learning to program?
     N: We recommend that you take CSC 105, in which you consider social issues in computing.
     Y: We recommend that you take CSC 151, in which you consider both programming issues and more general social issues.
  Y: Did you take CSC 151 or an equivalent course?
     N: Did you enjoy the course?
        N: We recommend that you take CSC 151; it presents a different view you might enjoy.
        Y: We recommend that you take CSC 151.  You'll learn new things.
     Y: We recommend that you talk to a faculty member.
```

### Binary search trees

We also use forms of binary trees called *binary search trees*.  In binary
search trees, everything in the left subtree is smaller than the root (in
a tree of strings, everything in the left subtree comes alphabetically before
the root) and everything in the right subtree is larger than the root
(in a tree of strings, everything in the right subtree comes alphabetically
after the root).

Consider, for example, the example tree from [the reading on tree recursion](../readings/tree-recursion).

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

This tree is a binary search tree because everything in 5's left subtree is less than 5, everything in 5's right sbutree is greater than 5, *and* both subtrees are also binary search trees.

In contrast, the following tree is *not* a binary search tree.

```
;;;       5
;;;      / \
;;;     3   7
;;;    / \   \
;;;   1   4   6
;;;          /
;;;         8
```

Why is it not a binary search tree?
Although everything in 5's left subtree is smaller than 5 and everything in 5's right subtree is greater than 5, the subtree rooted at 7 is not a binary search tree.
(That 6 is smaller than 7, and therefore shouldn't be on the right subtree.)

Although we've built those trees with numbers, we will more often build binary search trees with strings.  We'll explore those in the next section.

## Searching binary search trees

The `tree-contains?` procedure that we just saw looks everywhere in a tree for a value.
But we noted in the prior section that a tree can be arranged so that smaller things are to the left and larger things are to the right.
In that case, we should only need to look on one side.
If we were looking for 9 in the example tree, once we see the 5 at the root, we know that 9 can't be in the left subtree.
Similarly, if we were looking for 0 in the example tree, once we see the 5 at the root, we know that 0 can't be in the right subtree.

Here's a simple implementation of such a procedure for trees of strings.

```drracket
;;; (bst-find bst str) -> boolean?
;;;   bst : treeof string?
;;;   str : string
;;; Look for a string in a binary search tree of strings.
;;; When we say that bst is a binary search tree, we mean it is a binary
;;;   tree with the property that the left subtree contains smaller values
;;;   the right subtree contains larger values, and the subtrees are both
;;;   binary search trees.
(define bst-find
  (lambda (bst str)
    (if (empty-tree? bst)
        #f
        (let ([root (bt/t bst)])
          (cond
            ; If we find the value at the root, we're done
            [(string-ci=? str root)
             #t]
            ; If the value is less than the root, we should look in the
            ; left subtree.  (And don't need the right subtree.)
            [(string-ci<? str root)
             (bst-find (bt/l bst) str)]
            ; Otherwise, the value is greater than the root.  We should
            ; look in the right subtree.  (And it can't be in the left
            ; subtree.)
            [else
             (bst-find (bt/r bst) str)])))))
```

How does this work in practice?  You'll trace it in a self-check.

## A different kind of tree recursion

Many of the binary-tree procedures we've used need to look at both subtrees of
the tree.  When we print a tree, we print both subtrees.  When we compute the
size of the tree, we compute the size of each subtree.  When we compute the
depth of the tree, we compute the depth of each subtree.  And when we sum
the values in a tree, we sum both subtrees.

But we've also seen some tree recursion in which we only look at one subtree
or the other.
The `traverse` procedure you wrote in an earlier lab only enters
one of the two subtrees.
The `bst-find` procedure only enters one of the
subtrees.
The decision-tree example suggests that you only take on path
(that is, the answers are always one of "yes" or "no", so once we've answered
a question, we've chosen a subtree).

This second kind of recursion is comparatively powerful.
In essence, by choosing one subtree or another, we get to "throw away" half of the tree.
That makes tree procedures that use this model relatively fast.
How fast?
We'll explore all of the details later.

For now, think about an instance in which we have a tree with 1000 elements.
If we look at the top and throw away half, we're left with 500 (or maybe 499).
Then 125.
Then 62, 31, 15, 7, 3, and 1.
Throwing away half the values nine times left us with only one element.
That seems *much* faster than looking at all 1000 elements.

Unfortunately, the "recurse on only half the tree" approach is limited to certain circumstances.
But when we can arrange our data to use it, we probably should.

## Self Checks

### Check 1: Tracing binary search (‡)

Consider the following tree, drawn in lovely ASCII art.

```drracket
               Mongoose
              /       \
          Iguana     Pidgeon
           /          /   \
         Emu      Ocelot  Yak
           \              / \
          Gnu         Skink Zebra
          /             
     FennecFox
```

a. Trace (informally) how `bst-find` finds "Skink".
To avoid drawing the full tree, you can use `L` and `R` to represent "the left subtree" and "the right subtree", respectively.

```
    (bst-search '("Mongoose" L R) "Skink")
    ; Skink comes after Mongoose
--> (bst-search '(Pidgeon L R) "Skink")

```

b. Trace (informally) what happens if we try to find "Hippo" using `bst-find`.
