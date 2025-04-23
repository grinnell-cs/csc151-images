---
title: Representing trees as Racket structures
summary: |
  We return to trees, a kind of recursively defined hierarchical
  structure.  This time, we consider how to represent trees as
  Racket structures.
---

_This reading was newly developed for Fall 2021._

## A quick review

As you may recall, we recently explored "trees", recursively defined hierarchical structures that we can use to store hierarchical information.

Quick check: What is a binary tree, as we defined them?

{% capture code %}

A binary tree is either

* the empty tree
* the combination of a value, which we call `top`, and two binary trees, 
  which we call `left` and `right`.

{% endcapture %}
{% capture caption %}
You may have used `list` in your definition.
However, good practice suggests that we should be as abstract as possible.
{% endcapture %}
{% include toggle-field.html id="toggle-tree-definition" button="Defining binary trees" text=code caption=caption %}

Quick check: What operations would you expect to use with binary trees?
Recall that you'll need procedures for creating them (akin to `cons` and `null`), procedures for extracting information (akin to `car` and `cdr`), and affiliated predicates (akin to `list?` and `null?`).

{% capture text %}
Constructors

* `(binary-tree val left right)` - Create a new binary tree with the
  given top/root value, left subtree, and right subtree.
* `(empty-tree)` - Build an empty tree.
* `(leaf val)` - Build a leaf.  (Optional)

Extractors

* `(binary-tree-top tree)` - Get the value at the top or root of the tree.
  Also called `bt/t`.
* `(binary-tree-left tree)` - Get the left subtree.
  Also called `bt/l`.
* `(binary-tree-left tree)` - Get the right subtree.
  Also called `bt/r`.

Predicates

* `(binary-tree? val)` - Determine if `val` is a binary tree.
* `(empty-tree? val)` - Determine if `val` is an empty tree.

{% endcapture %}
{% include toggle-field.html id="toggle-tree-procs" button="Basic binary tree procedures" text=text %}

## Implementing binary trees as Racket structs

As you may recall, when we're designing new data structures in Racket, we can often use Racket's structures.
For example, given that binary trees have a value, a left subtree, and a right subtree, we might write

```
(struct binary-tree (top left right))
```

That automatically gives us `binary-tree`, `binary-tree?`, `binary-tree-top`, `binary-tree-left`, and `binary-tree-right`.

Let's see how it works.

```
> (define management-tree
    (binary-tree "Board"
                 (empty-tree)
                 (binary-tree "CEO"
                              (binary-tree "Head of Engineering"
                                           (binary-tree "Software Developer"
                                                        (empty-tree)
                                                        (empty-tree))
                                           (binary-tree "Tester"
                                                        (empty-tree)
                                                        (empty-tree)))
                              (binary-tree "Head of Legal"
                                           (empty-tree)
                                           (binary-tree "Lawyer"
                                                        (empty-tree)
                                                        (empty-tree))))))
> (binary-tree? management-tree)
#t
> (binary-tree-top management-tree)
"Board"
> (binary-tree-top (binary-tree-right management-tree))
"CEO"
> (empty-tree? (binary-tree-left management-tree))
#t
> (binary-tree-top (binary-tree-right (binary-tree-right management-tree)))
"Head of Legal"
> (binary-tree-top (binary-tree-left (binary-tree-right management-tree)))
"Head of Engineering"
```

It works pretty well.  But there are some problems.

Can you identify them?

We'll get to a few in the next section.

## Going beyond the basics

As we noted above, there are some problems with the basic structure definition.
Unfortunately, Racket structures, at least what we've learned about Racket structures, don't quite allow us to achieve everything we want.
In this section, we'll identify some of the problems, but we won't fix them.
In the next section, we'll go on to fix the problem, although perhaps in a different order.

### The primary predicate

First of all, `binary-tree?` only returns true for values created by `binary-tree`, but not for empty trees.
In some sense, that mimics the difference between `pair?`, which returns false for the empty list, and `list?`, which returns true.

```
> (binary-tree? (empty-tree))
#f
> (binary-tree? (binary-tree "Tree" (empty-tree) (empty-tree)))
#t
> (pair? null)
#f
> (list? null)
#t
```

### Another issue with the primary predicate

As you've seen, the default predicate associated with structs does not check that the fields are the appropriate type.  Hence, the `binary-tree?` predicate will return `#t` on things we don't think of as binary trees.

```
> (binary-tree? (binary-tree "Not" "A" "Tree"))
#t
```

### Improving the constructor

One might argue that the prior problem is not with the `binary-tree?` predicate, but with the `binary-tree` constructor.
That is, instead of `(binary-tree "Not" "A" "Tree")`, creating a tree, it should instead report an error.

```
> (binary-tree "Not" "A" "Tree")
. . binary-tree: Expects a binary tree as second parameter, received "A"
```

### Viewing binary tree structures

One nice thing about lists is that we can see the structure of a list by giving its name.

```drracket
> (define favorite-fruits '("pear" "apple" "peach" "grape" "olive"))
> favorite-fruits
'("pear" "apple" "peach" "grape" "olive")
```

Can we do the same with binary trees?

```
> management-tree
#<binary-tree>
```

Whoops!  That's another problem to address.

## Resolving the issues

### Making structs transparent

As you may recall, when we tried to peek inside a binary tree, we just saw that it was a binary tree.

```
> management-tree
#<binary-tree>
```

That's because Racket structures are generally "opaque"; you can't see within them.
Fortunately, there is a way to make structures "transparent"; all you need to do is add `#:transparent` after the list of fields.

```
(struct binary-tree (value left right) 
  #:transparent)
```

Now, we can see inside binary trees, just like we can see inside lists.

```
> management-tree
(binary-tree
 "Board"
 (empty-tree)
 (binary-tree
  "CEO"
  (binary-tree
   "Head of Engineering"
   (binary-tree "Software Developer" (empty-tree) (empty-tree))
   (binary-tree "Tester" (empty-tree) (empty-tree)))
  (binary-tree "Head of Legal" (empty-tree) (binary-tree "Lawyer" (empty-tree) (empty-tree)))))
```

These are not quite as readable as lists, but you can see the general structure if you read carefully (or are willing to reformat).

### Validating binary trees

There are at least two problems with the default `binary-tree?` predicate:

* It returns true on some things that are not binary trees, particularly things created with the `binary-tree` procedure.
* It returns false on some things that are binary trees, particularly the empty tree.

We know how to fix the first problem.  We can use a "husk and kernel" strategy to check the preconditions.

```
(struct binary-tree-node (top left right))

(define binary-tree-left binary-tree-node-left)
(define binary-tree-right binary-tree-node-right)
(define binary-tree-top binary-tree-node-top)
(define binary-tree binary-tree-node)

(define binary-tree?
  (lambda (val)
    (and (binary-tree-node? val)
         (binary-tree? (binary-tree-left val))
         (binary-tree? (binary-tree-right val)))))
```

Let's see if that works.

```
> (binary-tree? (binary-tree "Not" "A" "Tree"))
#f
> (binary-tree? (binary-tree "Tree" (empty-tree) (empty-tree)))
#f
```

Nope.
It doesn't.
That's because we need to deal with the base case, the simplest possible binary tree.
That's right; we have to solve both problems at once.
So let's add another test to the `binary-tree?` predicate.

```
(define binary-tree?
  (lambda (val)
    (or (empty-tree? val)
        (and (binary-tree-node? val)
             (binary-tree? (binary-tree-left val))
             (binary-tree? (binary-tree-right val))))))
```

Let's conduct some experiments.

```
> (binary-tree? (binary-tree "Not" "A" "Tree"))
#f
> (binary-tree? (binary-tree "Tree" (empty-tree) (empty-tree)))
#t
> (binary-tree? (binary-tree "Tree"
                             (binary-tree "Also a tree" (empty-tree) (empty-tree))
                             (empty-tree)))
#t
> (binary-tree? (binary-tree "Not a Tree"
                             (binary-tree "Also a tree" (empty-tree) (empty-tree))
                             "Hello"))
#f
> (binary-tree? (binary-tree "Still not a Tree"
                             (binary-tree "Also a tree" (empty-tree) (empty-tree))
                             (binary-tree "Tree-like" (empty-tree) 3)))
#f
```

Yes, it looks like it works.

### Improving output

As you may recall, one problem with the husk and kernel method for structures is that we get "the wrong name" when we look at a structure.

What happens if we use the simplest version of the `binary-tree-node` structure?

```
(struct binary-tree-node (top left right))
```

```
> (binary-tree "Tree" (empty-tree) (empty-tree))
#<binary-tree-node>
```

Oh, that's right, we need to add `#:transparent`.

```
(struct binary-tree-node (top left right)
  #:transparent)
```

```
> (binary-tree "Tree" (empty-tree) (empty-tree))
(binary-tree-node "Tree" (empty-tree) (empty-tree))

> (binary-tree "Tree"
               (binary-tree "Subtree" (empty-tree) (empty-tree))
               (binary-tree "Branch" (empty-tree) (empty-tree)))
(binary-tree-node "Tree" (binary-tree-node "Subtree" (empty-tree) (empty-tree)) (binary-tree-node "Branch" (empty-tree) (empty-tree)))
```

That's not bad.
But we'd like to make it look more like the code we use to create the trees.
Perhaps we'd even like to make it identical to the code we use to create the trees.

Fortunately, Racket provides a way to override what term it uses when printing out transparent structures.
You can use `#:reflection-name name` to specify a name to use instead of the structure name when printing.

```
> (binary-tree "Tree" (empty-tree) (empty-tree))
(binary-tree "Tree" (empty-tree) (empty-tree))

> (binary-tree "Tree"
               (binary-tree "Subtree" (empty-tree) (empty-tree))
               (binary-tree "Branch" (empty-tree) (empty-tree)))
(binary-tree "Tree" (binary-tree "Subtree" (empty-tree) (empty-tree)) (binary-tree "Branch" (empty-tree) (empty-tree)))

> management-tree
(binary-tree
 "Board"
 (empty-tree)
 (binary-tree
  "CEO"
  (binary-tree
   "Head of Engineering"
   (binary-tree
    "Software Developer"
    (empty-tree)
    (empty-tree))
   (binary-tree "Tester" (empty-tree) (empty-tree)))
  (binary-tree
   "Head of Legal"
   (empty-tree)
   (binary-tree "Lawyer" (empty-tree) (empty-tree)))))
```

It's a bit strange to get back exactly what we typed, but it gives us some confidence that it's represented correctly.
In addition, it means we can see what happens when we build up trees.

```
> (define t1 (binary-tree "A" (empty-tree) (empty-tree)))
> (define t2 (binary-tree "B" t1 t1))
> (define t3 (binary-tree "C" t1 t2))
> t3
(binary-tree
 "C"
 (binary-tree "A" (empty-tree) (empty-tree))
 (binary-tree
  "B"
  (binary-tree "A" (empty-tree) (empty-tree))
  (binary-tree "A" (empty-tree) (empty-tree))))
```

It's okay if it's not perfectly readable; that's why we have `display-binary-tree`.

### Improving the constructor

What's left?
Oh, that's right.
We'd like the constructor to validate its parameters.
And we know of one way to do that.
Instead of making `binary-tree` the same as `binary-tree-node`, we'll add the husk.

```
(define binary-tree
  (lambda (top left right)
    (cond
      [(not (binary-tree? left))
       (error "binary-tree: Expects a binary tree as second parameter, received"
              left)]
      [(not (binary-tree? right))
       (error "binary-tree: Expects a binary tree as third parameter, received"
              right)]
      [else
       (binary-tree-node top left right)])))
```

We get the error message we want.

```
> (binary-tree? (binary-tree "Not" "A" "Tree"))
. . binary-tree: Expects a binary tree as second parameter, received "A"
```

Unfortunately, we can still build non-trees.

```
> (define not-a-tree (binary-tree-node "Not" "A" "Tree"))
> (binary-tree? not-a-tree)
#f
> not-a-tree
(binary-tree "Not" "A" "Tree")
```

We've seen one technique for preventing the misuse of the kernel: We can store it in a separate file.

Are there others?

Yes.
You've started to learn that `struct` can take extra parameters (or sets of parameters).
One of those is `#:guard proc`, that adds a procedure that checks the parameters.
However, the form of the procedure is a bit odd.

It has one more parameter than the number of fields in the structure.
There is one parameter for each field.
There's one more parameter for the name of the structure.
We're going to ignore that extra parameter for the time being.

If the parameters are valid, it has to return *all* of the parameters, which it does with the special keyword `values`.

Let's try rewriting `binary-tree-node` using a guard.
(Don't worry, you won't have to do this on your own.)

```
(struct binary-tree-node (top left right)
  #:transparent
  #:reflection-name 'binary-tree
  #:guard (lambda (top left right name)
            (cond
              [(not (binary-tree? left))
               (error "binary-tree: Expects a binary tree as second parameter, received"
                      left)]
              [(not (binary-tree? right))
               (error "binary-tree: Expects a binary tree as third parameter, received"
                      right)]
              [else
               (values top left right)])))
```

Does this work?

```
> (define a-tree (binary-tree-node "Tree" (empty-tree) (empty-tree)))
> a-tree
(binary-tree "Tree" (empty-tree) (empty-tree))
> (define not-a-tree (binary-tree-node "Not" "A" "Tree"))
. . binary-tree: Expects a binary tree as second parameter, received "A"
> (define also-not-a-tree (binary-tree-node "Non" (empty-tree) "Tree"))
. . binary-tree: Expects a binary tree as third parameter, received "Tree"
```

Yes, it appears to.

Are we done?
Not quite.
Now that we can no longer build invalid binary trees, we can simplify the `binary-tree?` procedure.

```
(define binary-tree?
  (lambda (val)
    (or (empty-tree? val)
        (binary-tree-node? val))))
```

A short procedure.  And, it seems, the completion of our new, perhaps better, implementation of trees.

## Notes

You can find the code for trees built from structs at
<https://github.com/grinnell-cs/csc151/blob/main/binary-trees-from-structs.rkt>
and
<https://github.com/grinnell-cs/csc151/blob/main/includes/binary-trees-common.inc>.

You can load them into your environment by making sure you have the latest version of the csc151 package and then using.

```
(require csc151/binary-trees-from-structs)
```

## Self Checks

### Check 1: Other tree procedures

Consider the `display-binary-tree` procedure from [the first reading on trees](../readings/trees).
What changes do we have to make to that procedure to make it work with the struct-based trees?

```
;;; (display-binary-tree t) -> void?
;;;   t : tree?
;;; Prints tree t to the console in a well-formatted manner.
(define display-binary-tree
  (lambda (t)
    (let* (; The different levels of bullets
           [bullets (vector "* " "+ " "- " ". ")]
           ; The index of the last bullet
           [last-bullet (- (vector-length bullets) 1)]
           ; Choose the appropriate bullet for a level.
           [bullet
            (lambda (level)
              (vector-ref bullets (min level last-bullet)))])
      (letrec (; Display a binary tree at the appropriate indentation
               [helper
                (lambda (t indent)
                  (when (not (empty-tree? t))
                    (display (make-string (* indent 2) #\space))
                    (display (bullet indent))
                    (display (bt/t t))
                    (newline)
                    (helper (bt/l t) (+ indent 1))
                    (helper (bt/r t) (+ indent 1))))])
        (helper t 0)))))
```

### Check 2: Building trees

We've claimed that once we've ensured that both left and right are binary trees, then it's safe to build a new tree from them.
In writing the guard for the `binary-tree-node` struct, we assumed that the `binary-tree?` predicate checked each of them fully, looking not just at whether there was a value was a `binary-tree-node` structure, but also whether its substructures were binary trees.
Then we made a change to the `binary-tree?` predicate so that it no longer checks its substructures.

Explain, in your own words, why this change is safe.  That is, why can we still be sure that the only structures we build with `binary-tree-node?` are valid binary trees.

### Check 3: Determining your implementation

Both the list-based tree implementation or the struct-based tree implementation provide the same set of functions.
Suggest a way to determine which you are using.
