#lang racket

(require csc151)
(require csc151/binary-trees-from-lists)
(require racket/match)
(require rackunit)

;; CSC-151-NN (SEMESTER)
;; Lab: Binary Trees (binary-trees.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------------------------------+--------------------------
; | Provided code: The hideous shorthands |
; +---------------------------------------+

(define bt/tl (o bt/t bt/l))
(define bt/ll (o bt/l bt/l))
(define bt/rl (o bt/r bt/l))

(define bt/tr (o bt/t bt/r))
(define bt/lr (o bt/l bt/r))
(define bt/rr (o bt/r bt/r))

(define bt/tll (o bt/tl bt/l)) 
(define bt/lll (o bt/ll bt/l))
(define bt/rll (o bt/rl bt/l))

(define bt/trl (o bt/tr bt/l))
(define bt/lrl (o bt/lr bt/l))
(define bt/rrl (o bt/rr bt/l))

(define bt/tlr (o bt/tl bt/r))
(define bt/llr (o bt/ll bt/r))
(define bt/rlr (o bt/rl bt/r))

(define bt/trr (o bt/tr bt/r))
(define bt/lrr (o bt/lr bt/r))
(define bt/rrr (o bt/rr bt/r))

; +---------------------------------+--------------------------------
; | Provided code: Displaying trees |
; +---------------------------------+

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

; +----------------------------------------------+-------------------
; | Provided code: The legendary management tree |
; +----------------------------------------------+

(define management-tree
  (binary-tree
    "Board"
    (empty-tree)
    (binary-tree
      "CEO"
      (binary-tree
        "Head of Engineering"
        (binary-tree "Software Developer" (empty-tree) (empty-tree))
        (binary-tree "Tester" (empty-tree) (empty-tree)))
      (binary-tree
        "Head of Legal"
        (empty-tree)
        (binary-tree "Lawyer" (empty-tree) (empty-tree))))))

; +-----------+------------------------------------------------------
; | Exercises |
; +-----------+

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Conduct the normal start-of-lab discussion.

b. Save this file as `binary-trees.rkt`.

c. In the space below, describe the normal "start of lab" steps
and summarize what you answered for each.

[TODO: ENTER YOUR ANSWER HERE]

d. If you did not include "update the CSC-151 library" as one of your
   instructions, please update the library.
   
e. Review the code at
https://github.com/grinnell-cs/csc151/blob/main/binary-trees-from-lists.rkt

You may want to keep that code at hand as you progress through the lab.
|#

#| A |#

; +--------------------------+---------------------------------------
; | Exercise 1: Making trees |
; +--------------------------+

#|
a. Consider the following trees of numbers drawn with ASCII art:

i. tree-i
          "b"
          / \
         /   \
       "a"   "c"

ii. tree-ii
           5
          / \
         2   7
        / \   \
       1   4   9
              /
             8

iii. tree-iii
           5
          /
         4
        /
       3
      /
     2
    /
   1
  /
 0

For each of these trees, use the tree-making functions from the
reading to complete the definitions of `tree-i`, `tree-ii`, and
`tree-iii` below. 

Make sure to check that each thing you enter is a binary tree with
`binary-tree?` and that it has the right form with `display-binary-tree`

    > (binary-tree? tree-i)
    #t
    > (display-binary-tree tree-i)
    * b
      + a
      + c
    > (binary-tree? tree-ii)
    #t
    > (display-binary-tree tree-ii)
    * 5
      + 2
        - 1
        - 4
      + 7
        - 9
          . 8
    > (binary-tree? tree-iii)
    #t
    > (display-binary-tree tree-iii)
    * 5
      + 4
        - 3
          . 2
            . 1
              . 0

|#

(define tree-i
  ???)

(define tree-ii
  ???)

(define tree-iii
  ???)

#|
b. Note that tree-iii is a left-leaning tree. That is, all its children are
left children. Complete the definition of tree-iv below which is
the same as tree-iii except that its leaves grow to the right rather
than the left.

    5
     \
      4
       \
        3
         \ 
          2
           \ 
            1
             \
              0

    > (binary-tree? tree-iv)
    #t
    > (display-binary-tree tree-iv)
    * 5
      + 4
        - 3
          . 2
            . 1
              . 0
|#

(define tree-iv 
  (binary-tree 5
               (empty-tree)
               (binary-tree 4
                            (empty-tree)
                            (binary-tree 3
                                         (empty-tree)
                                         (binary-tree 2
                                                      (empty-tree)
                                                      ???)))))

#|
d. Finally, in the space below describe in a few sentences the
differences and similarities between tree-iii and tree-iv. Do you
consider these trees to be the same tree or different trees?
Why?

<TODO: your analysis goes here!>
|#

#| B |#

; +--------------------+---------------------------------------------
; | Exercise 2: Leaves |
; +--------------------+

#|
a. As you may have noted, in the sample code, we create leaves (the
values at the ends of trees) with the very verbose.

    (binary-tree val (empty-tree) (empty-tree))

We can also build that tree with `(leaf val)`.  Write your own version of
`leaf`, called `make-leaf`.  Your procedure should take one value and
return a valid binary tree.

    > (binary-tree? (leaf 1))
    #t
    > (display-binary-tree (leaf 1))
    * 1
    > (binary-tree? (binary-tree 1 (leaf 2) (leaf 3)))
    #t
    > (display-binary-tree (binary-tree 1 (leaf 2) (leaf 3)))
    * 1
      + 2
      + 3
|#

(define make-leaf
  ???)

#|
b. As you know, a leaf is a binary tree node with an empty left subtree
and an empty right subtree.  Write the `(is-leaf? tree)` procedure as 
described below.
|#

;;; (is-leaf? val) -> boolean?
;;;   val : any?
;;; Returns #t if tree is a leaf in a tree and #f otherwise.
(define is-leaf?
  ???)

#|
c. You may have noticed that `leaf` and `leaf?` do not appear in
the `binary-trees-as-lists.rkt` file.  That's because they are in
a separate code file, one that is included in `binary-trees-as-lists.rkt`.

Look at the start of the included file, which is available at
https://github.com/grinnell-cs/csc151/blob/main/includes/binary-trees-common.inc

How do your definitions of `make-leaf` and `is-leaf?` differ from the
ones in that file?

[TODO: Enter your answer here.]
|#

#| A |#

; +------------------------------+-----------------------------------
; | Exercise 3: Traversing trees |
; +------------------------------+

#|
You may have observed a few things about the binary tree procedures,
such as `bt/lr` or `bt/rrr` that we call "the hideous shorthands".
Here are some things we think about them (other than that they are
somewhat hideous).

* They are hard to read.
* There are a lot of them.
* Even though there are a lot of them, the ones we need may still be
  missing.
* They feel a bit "backwards".  That is, the first thing you do is the
  last letter in the thing, rather than the first.  For example, 
  `bt/trll`  means "go left, go left, go right, take the top element".
  Or at least it would if it were defined.

We can't necessarily solve the first problem, but we can probably solve
the others.
|#

#|
a. Finish the definition of the procedure, `(traverse path tree)` that
takes a string of r's and l's as its first parameter and a tree as its
second parameter, and returns the portion of the tree specified by that
string in left-to-right order.  For example, `(traverse "llrl" tree)`
means "go left, then left, then right, then left".  We're not going to
worry about the top element for now.
|#

;;; (traverse path tree) -> binary-tree?
;;;   path : string? (contains only r's and l's)
;;;   bree : binary-tree?
;;; Follow the path given by the path and return the described
;;; value.
(define traverse
  (lambda (path tree)
    (cond
      [(equal? path "")
       tree]
      [(empty-tree? tree)
       (error "You've run off the end of the tree")]
      [(char=? #\l (string-ref path 0))
       (traverse ???            ; You need to figure out this parameter.
                 (binary-tree-left tree))]
      [(char=? #\r (string-ref path 0))
       ???]                     ; You need to figure out this recursive call.
      [else
       (error "Invalid subpath" path)])))

#|
b. Try a few examples of `traverse` with the management tree and/or 
some of the trees you defined earlier.

<TODO: Include your experiments from the interactions pane.>
|#

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 4: Changing representations |
; +--------------------------------------+

#|
The wonder of data abstraction suggests that because we're using the 
tree procedures, rather than the underlying structural procedures
(e.g., `cons` and `car`), we can change our underlying representation 
of trees.  In this exercise, we attempt to do so.
|#

#|
a. What do you expect the following to produce?  (It's okay if you 
don't give exact Racket output.)

    > (define sample
        (binary-tree "a" 
                     (binary-tree "b" 
                                  (make-leaf "c")
                                  (empty-tree))
                     (binary-tree "d"
                                  (binary-tree "e"
                                               (make-leaf "f")
                                               (make-leaf "g"))
                                  (empty-tree))))
    > (binary-tree? sample)
    ?
    > sample
    ?
    > (display-binary-tree sample)
    ?
    > (traverse "rlr" sample)
    ?
    > (traverse "rll" sample)
    ?
|#

#|
b. Check your answers expermentally.

    > (binary-tree? sample)
    ?
    > sample
    ?
    > (display-binary-tree sample)
    ?
    > (traverse "rlr" sample)
    ?
    > (traverse "rll" sample)
    ?
|#

#|
c. Open 
https://github.com/grinnell-cs/csc151/blob/main/binary-trees-from-hashes.rkt
in your Web browser and quickly skim through it.
|#

#|
d. Replace the `(require csc151/binary-trees-from-lists)` line at the start
of this file with `(require csc151/binary-trees-from-hashes)`.  Do you
expect to get the same or different answers for each of the above?

    > (binary-tree? sample)
    [SAME or DIFFERENT:How]
    > sample
    [SAME or DIFFERENT:How]
    > (display-binary-tree sample)
    [SAME or DIFFERENT:How]
    > (traverse "rlr" sample)
    [SAME or DIFFERENT:How]
    > (traverse "rll" sample)
    [SAME or DIFFERENT:How]
|#

#|
e. Check your answer experimentally.

    > (binary-tree? sample)
    ?
    > sample
    ?
    > (display-binary-tree sample)
    ?
    > (traverse "rlr" sample)
    ?
    > (traverse "rll" sample)
    ?
|#

#|
e. If all has gone well, the only difference you will see is how the
binary tree is represented when we ask Racket to print it by giving
its name. That's one of those advantages of data abstraction.
|#

#| A |#

; +--------------------------------------------+---------------------
; | Exercise 5: Changing representations again |
; +--------------------------------------------+

#|
Suppose we are switching from lists or structs to vectors.  Check
off the procedures or values you would expect to have to update if
we decided to change our representation of non-empty binary trees
from three-element lists or three-element structs to three-element 
vectors, using a zero-element vector as the empty tree.

Tree constructors

[ ] `empty-tree`
[ ] `binary-tree`
[ ] `leaf`

Tree checkers

[ ] `empty-tree?`
[ ] `binary-tree?`
[ ] `leaf?`

Tree traversers

[ ] `binary-tree-top`
[ ] `binary-tree-left`
[ ] `binary-tree-right`
[ ] `traverse`

Other

[ ] `display-binary-tree`
[ ] `management-tree` (and `tree-i` through `tree-iv)`
[ ] <anything else you want to fill in>
|#

#| B |#

#|
As you may have noticed, the `binary-tree?` procedure in the list-based 
implementation of binary trees makes a lot of assumptions about the 
implementation of binary trees.

    ;;; (binary-tree? t) -> boolean?
    ;;;   t : any?
    ;;; Returns true iff t is a binary tree.
    (define binary-tree?
      (lambda (t)
        (or (empty-tree? t)                    ; the empty tree is a tree
            (and (binary-tree-node? t)         ; A node in the tree
                 (binary-tree? (cadr t))       ; Where element 1 is a tree
                 (binary-tree? (caddr t))))))  ; And element 2 is a tree

Rewrite this so that it does not use any explicit calls to list-based
operations, which would make it more generalizable.
|#

(define my-binary-tree?
  (lambda (t)
    ???))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
You know the drill.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you should go through the
following exercises in order.  We will return to some of the issues 
raised by these exercises in the next class.
|#

; +---------------------------+--------------------------------------
; | Extra 1: Changing bullets |
; +---------------------------+

#|
You may have noticed that the `display-binary-tree` procedure has a
helper procedure, `bullet`, that selects an appropriate bullet.  

Here's a tree with more than four levels.

|#

(define taller-tree
  (binary-tree "a"
               (binary-tree "b"
                            (binary-tree "c"
                                         (binary-tree "d"
                                                      (binary-tree "e"
                                                                   (leaf "f")
                                                                   (leaf "g"))
                                                      (leaf "h"))
                                         (leaf "i"))
                            (leaf "j"))
               (leaf "k")))

#|
a. What bullet do you expect to get if your tree has more than four levels,
as in the case of `taller-tree`?

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your code from the interactions pane.>

|#

#|
b. In your own words, explain how `bullet` works.

<TDOO: Enter your answer here>
|#

#|
c. As you might guess, you can change the bullets by changing the
value of `bullets`.  Create a new version of `bullets` with at least
five bullets, using the Unicode bullets, which you can find on
Wikipedia.

  https://en.wikipedia.org/wiki/Bullet_(typography)

For example, you can get the triangular bullet with "\u2023 ".

<TODO: Enter your new definition here and above.>
|#

#|
d. In your own words, explain how `display-binary-tree` seems to work.
|#

; +------------------------------------+-----------------------------
; | Extra 2 : Exploring tree recursion |
; +------------------------------------+

#|
From the reading, we noted that a binary tree is recursively defined like a
list. A binary tree is either:

+ *Empty*, or
+ *Non-empty* where the tree contains a valueand up to two *children*
  (*subtrees*) that are, themselves, trees.

Like lists, our tree operations mirror this recursive decomposition of
the list. As a first example, consider the following function which
computes the *size* of the input tree, *i.e.*, the number of values it
contains.
|#

;;; (binary-tree-size tree) -> integer?
;;;   tree : binary-tree?
;;; Determine how many values are in binary tree tree.
(define binary-tree-size
  (lambda (t)
    (if (empty-tree? t)
        0
        (+ 1
           (binary-tree-size (binary-tree-left t))
           (binary-tree-size (binary-tree-right t))))))

#|
a. For reference, copy and paste your definitions from tree-i and
tree-ii from a previous problem within this comment below:

(define tree-i undefined)

(define tree-ii undefined)

Now, use your mental model of computation to give an evaluation trace
of the following expression in the space below:

For this derivations, you can evaluate the `cond` expression directly
to the branch it evaluates to, immediately evaluate the results of the
`car` and `cdr` calls, to the sub-trees they evaluate to, as well as
elide the contents of the tree's children during evaluation.  You can
write the trees as lists or vectors, depending on which is easier for
you to think about.

<TODO: your derivations go below>

    (binary-tree-size tree-i)
--> (binary-tree-size ...)

|#

#|
b. Do the same for tree-ii

<TODO: your derivations go below>

    (binary-tree-size tree-ii)
--> 

|#

#|
c. Fill out the following high-level description of `tree-size` in
terms of the base and recursive cases of the function above.

> The size of a tree is:
> *   ... in the base case
> *   ... in the recursive case
|#

; +-------------------------------------+----------------------------
; | Extra 3: Patterns of tree recursion |
; +-------------------------------------+

#|
You've now seen or written four procedures that recurse over binary trees:

* `binary-tree?`, which checks if something is a binary tree.
* `display-binary-tree`, which prints out a binary tree
* `traverse`, which traverses a binary tree
* `binary-tree-size`, which finds the number of values in the tree

Each uses a slightly different form of recursion.

As you've likely figured out, it's helpful to generalize the patterns of
recursion we see.  For example, we've realized that most list recursion
stops with null lists or one element lists (that's our base-case test)
and that most list recursion requires us to take the cdr of the list.
|#

#|
a. Let's do the same here.  `binary-tree-size` uses one of the more
common forms of tree recursion, so we'll focus on that.  Using
`binary-tree-size` as a starting point, sketch a form of recursion
over trees.  Make sure to make it clear what the base case test is
and what the recursive case looks like.>

<TODO: Enter your sketch here.>
|#

#|
b. How is binary tree recursion similar to and dissimilar from
list recursion?

<TODO: Enter your answer here.>
|#

