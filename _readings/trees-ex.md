---
title: Trees
summary: |
  Trees are a class of data structures that organizes data in a hierarchical fashion.
  We explore trees briefly because they beautifully generalize the recursive definition of lists we have used extensively so far and as a functional language, Scheme is particular adapt at handling this common form of data.
---

## Lists as sequential structures

Recall that a list is defined recursively as a finite set of cases:

* The list is empty, or
* The list is non-empty and consists of a head element and the rest of the list, its tail.

In Scheme, you build lists with `null` (empty list) and
`cons` (add a value to the front of a list).
You deconstruct lists with `null?` (check for empty list), `car` (grab the first element), and `cdr` (grab everything but the first element).
(Alternatively, pattern matching allows us to decompose a list directly, performing `car` and `cdr` behind the scenes.)
Every other list operation we use can be built from those basics.

The structure of a list organizes its data in a *sequential* fashion.
That is there is an *ordering* imposed by the list structure.
For example, consider the following list of strings:

<pre class="scamper source-only">
(define favorite-fruit (list "pear" "apple" "peach" "grape" "olive"))
</pre>

The recursive definition of a list implies that we will walk through the elements of the list in *left-to-right* order.
For example, the following recursive function returns the first occurrence of a string that starts with the letter 'p':

<pre class="scamper source">
(define favorite-fruit (list "pear" "apple" "peach" "grape" "olive"))

(define find-first-p
  (lambda (l)
    (match l
      [null (error "(find-first-p) not found!")]
      [(cons head tail)
       (if (equal? (string-ref head 0) #\p)
           head
           (find-first-p tail))])))

(find-first-p favorite-fruit)
</pre>

Note that when used on our sample list, the function returns `"pear"` rather than `"peach"` because it encounters `"pear"` first.

We can use the sequential nature of lists to encode *orderings*, something that we will revisit at the end of the course when we talk about *sorting algorithms*.
For now, we can observe that if assume that the list contains our favorite fruits in *decreasing* order of favor, then we can easily define functions that retrieve our most favorite and least favorite fruits from the list:

<pre class="scamper output">
(define favorite-fruit (list "pear" "apple" "peach" "grape" "olive"))

(define most-favorite
  (lambda (l) (list-ref l 0)))
(define least-favorite
  (lambda (l) (list-ref l (- 1 (length l)))))
</pre>

In short, we can take advantage of the structure of a data type—here, a list—to make defining operations easier as well as more efficient.
This is the motivation behind the study of *data structures* which allow us to organize our data in various ways.
Lists are our first example of such a data structure, and perhaps, the most fundamental in computing.

## Not everything is naturally sequential

Lists work particular well when our data has a natural sequential interpretation or ordering to it.
However, not all data behaves in this manner.
For example, consider a *management hierarchy* that describes the groups that the managers of a company oversee:

+ There are *software developers* that all report to the *head of engineering*.
+ There are also *testers* that all report to the *head of engineering*.
+ There are *data analysts* that report to the *head of marketing*.
+ There are *lawyers* that report to the *head of legal*.
+ The different group heads all report to the *chief executive officer* (CEO).
+ The CEO reports directly to the *board of directors*.

The manner in which employees report to each other seems sequential in nature, but breaks down if we try to put them all into a list.
We might try to do so with the board at the head of the list---since they're the "top" of the management structure---and then work our way downwards.

<pre class="scamper source-only">
(define management-hierarchy
  (list
    "Board"
    "CEO"
    "Head of Engineering"
    "Head of Marketing"
    "Head of Legal"
    "Software Developer"
    "Tester"
    "Data Analyst"
    "Lawyer"))
</pre>

The sequential nature of the list implies that the `"CEO"` reports to the `"Board"` which is correct.
However, the `"Head of Marketing"` does not report to the `"Head of Engineering"`---they are actual *equals* in the management hierarchy!
Likewise, a `"Software Developer"` doesn't manage `"Lawyers"`; they do not have a direct relationship in terms of management.

## Representing hierarchical structures

As the example above suggests, management hierarchies are not sequential in nature.
They are, as suggested by their name, *hierarchical*.
We can think of a hierarchy as imposing a *parent-child* structure on data.
In this view, every child has *one parent*, but parents can have *multiple children*.
In the above example, an example of a parent would be the `"CEO"` and its children would be the `"Head of Engineering"`, `"Head of Marketing"` and `"Head of Legal"`.

### Representing hierarchical structures using nested lists

Of course, we could use nested lists to better represent the hierarchy.  Each list contains the role (a string) and then any direct reports.  If a direct report has its own reports, we represent it as a list.  If not, it's just the string.

<pre class="scamper source-only">
(list
  "Board"
  (list
   "CEO"
   (list
    "Head of Engineering"
    "Software Developer"
    "Tester"
    "Data Analyst")
   "Head of Marketing"
   (list
    "Head of Legal"
    "Lawyer")))
</pre>

If we added a "Lead Tester" role, we might rewrite this as

<pre class="scamper source-only">
(list
  "Board"
  (list
   "CEO"
   (list
    "Head of Engineering"
    "Software Developer"
    (list
      "Lead Tester"
      "Tester")
    "Data Analyst")
   "Head of Marketing"
   (list "Head of Legal"
    "Lawyer")))
</pre>

### Representing hierarchies with trees

These nested lists appear useful.
But perhaps we should formalize what we're doing.
In addition, we know that we have some responsibility to separate *what* we want to do with the structure from *how* we implement it.
Perhaps nested lists aren't the way to go.

In computer programs, we represent hierarchies using a data structure called a *tree*.
We might represent the management hierarchy above with a tree pictorially as follows:

![The management tree example, but without testers]({{ "/images/management-tree-example.png" | relative_url }})

In the picture, a line between two names corresponds to a parent-child relationship where the parent is *higher* in the diagram than its child.
We call each element of a tree a *node* of the tree.
We also traditionally use tree terminology to describe the different parts of the structure:

+   The `"Board"` is the *root* of the tree.
    It is the piece of data with no parent.
+   `"Software Developer"`, `"Tester"`, `"Data Analyst"`, and `"Lawyer"` are all considered *leaves* of the tree.
    Each of them have no children.
+   Each of the heads have parents and children---we call them *interior nodes* of the tree.
    (Ok.  That one isn't really terminology from trees, but you get the point.)

You might note that the `"Board"` is at the top of tree whereas the roots of the trees are found on the ground.
That is correct!
It turns out that the way computer scientists think of trees are upside-down:

![An upside-down tree with the structure of the management tree embedded inside]({{ "/images/upside-down-tree.png" | relative_url }})

## A recursive interpretation of trees

Recall that the key insight behind performing recursive operations over lists was decomposing its structure in a way that we could identify a *smaller sublist* inside of a larger list.
We can do the same thing for trees.
In our above example, the overall tree's root is `"Board"`, but note that this overall tree contains a smaller sub-tree: the sub-tree's root is `"CEO"`!
Furthermore, `"CEO"` contains *3 subtrees* with each group head as roots.

With this in mind, we can define a tree recursively as follows.
A tree is either:

+ *Empty*, or
+ *Non-empty* where it contains a datum and zero or more *children* that are, themselves, trees.  (We will sometimes use the term "subtrees" rather than "children".)

## Representing binary trees in Scheme

In our example above, the maximum number of children any one of the nodes has is three: the `"CEO"` has three children.
However, for the purposes of our first exploration into trees, we'll first look at trees that have at most *two* children, the so-called *binary trees*.
When we work with binary trees, we refer to the first child as the "left child" or the "left subtree" and the second child as the "right child" or the right subtree.

How might we represent a tree using the Scheme programming constructs we've seen so far?
Note that the only difference between a list and a tree is that a list can only have *one sublist* whereas a binary tree can have up to *two subtrees*.
This implies we can use all of our list constructs---`null` and `cons` for construction and `car` and `cdr` to decomposition.
To represent *multiple* subtrees, we can use the pair construct we learned about previously: the "tail" of a tree will be a pair of subtrees instead of a single subtree!

However, as we saw in our discussion of data abstraction, encoding a tree in terms of a list has downsides.
Writing operations on trees in terms of lists obfuscates our code---it is sometimes not clear that the intricate series of list operations we are performing are actually operating over a tree!
Furthermore, it takes a substantial amount of time to write functions to abstract away these low-level details.

Instead, let's use the `struct` construct of Scheme to _directly define_ a tree in terms of two types:

+ The empty tree is a `leaf` with no contained values.
+ The non-empty tree is a `node` composed of a `value`, `left` subtree, and a `right` subtree.

The following pair of `struct` declarations declares these two types with appropriate fields:

<pre class="scamper source-only">
(struct leaf ())
(struct node (value left right))
</pre>

Note that `leaf` takes no parameters and thus, it has no fields.
So to create a `leaf`, we call it as a _zero-argument function_: `(leaf)`.

Here are some examples of using these structs:

<pre class="scamper source-only">
(struct leaf ())
(struct node (value left right))

(leaf)

(node "Board" (leaf) (leaf))

(node "Board" (node "CEO" (leaf) (leaf)) (leaf))
</pre>

The first example is an _empty tree_, _i.e._, a tree containing no values.
The second example is a tree containing one node with the value `"Board"`.
The third example is a tree containing two nodes with the values `"Board"` and `"CEO"`.
Observe that the _left-hand child_ of `"Board"` is `"CEO"`, and it has no right-hand child, _i.e._, the right-hand child is a `leaf`.

As a bigger example, if we restrict our management hierarchy example to just its engineering and legal branches, we can represent this structure in Scheme with our structs as follows:

<pre class="scamper source">
(struct leaf ())
(struct node (left value right))

(define management-tree
  (node "Board"
        (leaf)
        (node "CEO"
              (node "Head of Engineering"
                    (node "Software Developer"
                          (leaf)
                          (leaf))
                    (node "Tester"
                          (leaf)
                          (leaf)))
              (node "Head of Legal"
                    (leaf)
                    (node "Lawyer"
                          (leaf)
                          (leaf))))))

management-tree
</pre>

Observe how we use good code style and indentation to outline the levels of the tree where children are indented one level deeper than their parents.

## An example recursive operation: pretty-printing

While we've structured the tree nicely, Scheme is not so clear in printing it out!
We can do better by writing a function that takes a tree and prints out its elements, one element per line, where we use indentation to represent the levels, similarly to how we formatted `management-tree` above.
Because a binary tree is recursively defined in terms of two cases, `leaf` or `node`, our strategy will be to define a recursive function `tree->string` that _pattern matches_ on the tree and does something in each of the cases.
This is surprisingly similar to list recursion except now there are _two_ "tails", _i.e._, children, of a non-empty tree.

To implement `tree->string`, we employ a helper function `tree->string/helper` that tracks the current _level_ of the tree we're on in addition to the (sub-)tree itself.
Additionally, rather than a single string, `tree->string/helper` returns a list of strings where each entry in the list is one element of tree, properly indented.
Each (non-`leaf`) recursive call combines (via `append`) the strings generated from recursively visiting the children along with a new entry for the data at the current position in the tree.
`tree->string` then folds over this list of strings and joins them together with a newline character.

Performing _tree recursion_ is the subject of our next class, so don't worry about these details just yet!
For now, we encourage you to check out the following implementation of this strategy and try to map what you know about list recursion onto this code that performs tree recursion:

<pre class="scamper source">
(struct leaf ())
(struct node (value left right))

;;; (indent lvl) -> string
;;;   lvl : nat?
;;; Returns a string that contains the whitespace appropriate to
;;; indenting to level lvl, i.e., (lvl * 2) spaces.
(define indent
  (lambda (lvl)
    (if (zero? lvl)
        ""
        (apply string (make-list (* lvl 2) #\space)))))

;;; (bullet lvl) -> string
;;;   lvl : nat?
;;; Returns a bullet appropriate for the given level.
(define bullet
  (lambda (lvl)
    (match (remainder lvl 4)
      [0 "*"]
      [1 "+"]
      [2 "-"]
      [3 "⋅"])))

;;; (tree->string/helper lvl t) -> listof string?
;;;   lvl : nat?
;;;   t : tree?
;;; Returns a list of strings where each string is one
;;; element of the tree, appropriately indented given its
;;; level in the overall tree.
(define tree->string/helper
  (lambda (lvl t)
    (match t
      [(leaf) null]
      [(node v l r)
       (append
         (list (string-append (indent lvl)
                              (bullet lvl)
                              " "
                              v))
         (tree->string/helper (+ lvl 1) l)
         (tree->string/helper (+ lvl 1) r))])))

;;; (tree->string t) -> string?
;;;   t : tree?
;;; Returns a well-indented string representation of tree t.
(define tree->string
  (lambda (t)
    (match (tree->string/helper 0 t)
      [null ""]
      [(cons head null) head]
      [(cons head tail)
        (fold-left
          (lambda (acc v) (string-append acc "\n" v))
          head
          tail)])))

(define management-tree
  (node "Board"
        (leaf)
        (node "CEO"
              (node "Head of Engineering"
                    (node "Software Developer"
                          (leaf)
                          (leaf))
                    (node "Tester"
                          (leaf)
                          (leaf)))
              (node "Head of Legal"
                    (leaf)
                    (node "Lawyer"
                          (leaf)
                          (leaf))))))

(display management-tree)

(display (tree->string management-tree))
</pre>

## Self Checks

### Check 1: Another example of a tree (‡)

1.  Come up with another example of a hierarchical structure that we could represent using trees.
    Describe the parent-child relationships in this example.
2.  Use `leaf` and `node` to give a concrete example of your structure in Scheme.
    Make sure your example involves a few levels so that you get practice writing our tree values.  (You don't have to write working code; just practice doing it.)