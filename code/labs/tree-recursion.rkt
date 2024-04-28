#lang racket

(require csc151)
(require csc151/binary-trees-from-lists)
(require rackunit)

;; CSC-151-NN (SEMESTER)
;; Tree Recursion (tree-recursion.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-------------------------------------+----------------------------
; | Provided code: Additional utilities |
; +-------------------------------------+

;;; (vector->tree vec) -> binary-tree?
;;;    vec : vector
;;; Converts a vector into a relatively balanced binary tree.
(define vector->tree
  ; The kernel builds a tree from the elements at positions lb (inclusive)
  ; to ub (exclusive).  That is, lb represents the lower bound of the
  ; range we're looking at and ub represents the upper bound.
  (letrec ([helper (lambda (vec lb ub)
                     (if (<= ub lb)
                         (empty-tree)
                         (let [(mid (quotient (+ lb ub) 2))]
                           (bt (vector-ref vec mid)
                               (helper vec lb mid)
                               (helper vec (+ 1 mid) ub)))))])
    (lambda (vec)
      (helper vec 0 (vector-length vec)))))

;;; (random-vector-element vec) -> any?
;;;   vec : vector
;;; Randomly select an element from a non-empty vector
(define random-vector-element
  (lambda (vec)
    (vector-ref vec (random (vector-length vec)))))

;;; (random-list n rproc) -> list?
;;;   n : non-negative integer
;;;   rproc : procedure? (0 parameters)
;;; Create a random list of length n.
(define random-list
  (lambda (n rproc)
    (letrec ([helper
              (lambda (n so-far)
                (if (zero? n)
                    so-far
                    (helper (- n 1) (cons (rproc) so-far))))])
      (helper n null))))

;;; (random-tree n rproc) -> binary-tree?
;;;   n : non-negative integer
;;;   rproc : procedure? (0 parameters)
;;; Create a random tree of size n.
(define random-tree
  (lambda (n rproc)
    (if (zero? n)
        (empty-tree)
        (let ([left-size (random n)])
          (binary-tree (rproc)
                       (random-tree left-size rproc)
                       (random-tree (- n left-size 1) rproc))))))

;;; (random-id) -> string
;;; Create a "random" user id
(define random-id
  (let* ([consonants (list->vector (string->list "BCDFGHJKLMNPQRSTVWXYZ"))]
         [vowels (list->vector (string->list "AEIOU"))]
         [c (lambda () (random-vector-element consonants))]
         [v (lambda () (random-vector-element vowels))])
    (lambda ()
      (string (c) (v) (c) (v) (c) (v)))))

;;; (random-digit) -> integer
;;; Create a random one-digit integer (0 through 9)
(define random-digit
  (lambda ()
    (random 10)))

;;; (random-bst n) -> binary-search-tree?
;;;   n : integer? non-negative?
;;; Construct an unpredictable bst of size n
(define random-bst
  (o vector->tree 
     list->vector 
     (cut (sort <> string-ci<=?))
     (cut (random-list <> random-id))))

;;; (binary-tree-contains? tree val) -> boolean?
;;;   tree : binary-tree?
;;;   val : any?
;;; Determine if val appears somewhere in tree.
(define binary-tree-contains?
  (lambda (tree val)
    (and (not (empty-tree? tree))
         (let ([root (bt/t tree)])
           ; (displayln root)
           (or (equal? root val)
               (binary-tree-contains? (bt/l tree) val)
               (binary-tree-contains? (bt/r tree) val))))))

;;; (binary-tree-depth tree) -> integer?
;;;   tree : binary-tree?
;;; Determine the number of levels in the tree
(define binary-tree-depth
  (lambda (tree)
    (if (empty-tree? tree)
        0
        (+ 1 (max (binary-tree-depth (bt/l tree))
                  (binary-tree-depth (bt/r tree)))))))

;;; (binary-tree-size tree) -> integer?
;;;   tree : binary-tree?
;;; Determine the number of elements in a tree
(define binary-tree-size
  (lambda (tree)
    (if (empty-tree? tree)
        0
        (+ 1
           (binary-tree-size (bt/l tree))
           (binary-tree-size (bt/r tree))))))

;;; (bst-find bst str) -> string
;;;   bst : binary-search-tree?
;;;   str : string
;;; Find str (case insensitive) in bst.  If str is not in bst, returns #f.
(define bst-find
  (lambda (bst str)
    (if (empty-tree? bst)
        #f
        (let ([root (bt/t bst)])
          ; (displayln root)
          (cond
            [(string-ci=? str root)
             root]
            [(string-ci<? str root)
             (bst-find (bt/l bst) str)]
            [else
             (bst-find (bt/r bst) str)])))))
             
; +-----------------------------+------------------------------------
; | Provided code: Sample trees |
; +-----------------------------+

;;; management-tree : binary-tree?
;;; The management tree from the reading.
(define management-tree
  (bt "Board"
      (empty-tree)
      (bt "CEO"
           (bt "Head of Engineering"
               (leaf "Software Developer")
               (leaf "Tester"))
           (bt "Head of Legal"
               (empty-tree)
               (leaf "Lawyer")))))

;;; digits-tree : binary-tree?
;;; The following tree, taken from an earlier lab
;;;        5
;;;       / \
;;;      2   7
;;;     / \   \
;;;    1   4   9
;;;           /
;;;          8
(define digits-tree
  (bt 5
      (bt 2
          (leaf 1)
          (leaf 4))
      (bt 7
           (empty-tree)
           (bt 9
               (leaf 8)
               (empty-tree)))))

; ignore the following
(define *COMBINE* ???)
(define *PROCESS* ???)
(define *BASE-CASE* ???)

; +-----------+------------------------------------------------------
; | Exercises |
; +-----------+

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Have your traditional start-of-lab discussion.
|#

#|
b. Save this file as `tree-recursion.rkt`
|#

#|
c. In a separate window, open the source code for the list-based
tree library, available at

https://github.com/grinnell-cs/csc151/blob/main/binary-trees-from-lists.rkt
|#

#|
d. In a separate window, open the source code for the additional
tree utilities, available at

https://github.com/grinnell-cs/csc151/blob/main/includes/binary-trees-common.inc
|#

#|
f. Review the documentation for the code provided at the top of this lab.
|#

#| B |#

; +-------------------------------------------------+----------------
; | Exercise 1: Finding the largest value in a tree |
; +-------------------------------------------------+

#|
You may recall that we wrote most, but not all, of a procedure that
finds the largest value in a tree of real numbers.
|#

;;; (binary-tree-largest tree) -> real?
;;;   tree : binary-tree-of real? (nonempty)
;;; Finds the largest value in the tree.
(define binary-tree-largest/bad
  (lambda (tree)
    (if (leaf? tree)
        (bt/t tree)
        (max (bt/t tree)
             (binary-tree-largest/bad (bt/l tree))
             (binary-tree-largest/bad (bt/r tree))))))

#|
As we observed in the reading, we encounter a problem when
one, but not both, of a node's children are empty trees.

Rewrite `binary-tree-largest` to address that issue.
|#

(define binary-tree-largest
  (lambda (tree)
    (cond
      [(leaf? tree)
       (bt/t tree)]
      [else
       (max (bt/t tree)
            (binary-tree-largest (bt/l tree))
            (binary-tree-largest (bt/r tree)))])))

#|
(test-equal? "leaf"
             (binary-tree-largest (leaf 0))
             0)
(test-equal? "largest at root"
             (binary-tree-largest (binary-tree 5 (leaf 3) (leaf 4)))
             5)
(test-equal? "largest in left subtree"
             (binary-tree-largest (binary-tree 5 (leaf 6) (leaf 4)))
             6)
(test-equal? "largest in right subtree"
             (binary-tree-largest (binary-tree 5 (leaf 6) (leaf 7)))
             7)
(test-equal? "deeper tree/1"
             (binary-tree-largest (bt 5
                                      (bt 6
                                          (leaf 7)
                                          (bt 5
                                              (leaf 8)
                                              (leaf 9)))
                                      (leaf 3)))
             9)
(test-equal? "deeper tree/2"
             (binary-tree-largest (bt 5
                                      (bt 6
                                          (leaf 10)
                                          (bt 5
                                              (leaf 8)
                                              (leaf 9)))
                                      (leaf 3)))
             10)
(test-equal? "left subtree empty, right subtree larger"
             (binary-tree-largest (bt 5
                                      (empty-tree)
                                      (leaf 6)))
             6)
(test-equal? "left subtree empty, root larger"
             (binary-tree-largest (bt 7
                                      (empty-tree)
                                      (leaf 6)))
             7)
(test-equal? "right subtree empty, largest value on right"
             (binary-tree-largest (bt 7
                                      (leaf 4)
                                      (bt 9
                                          (leaf 4)
                                          (empty-tree))))
             9)
(test-equal? "right-right subtree empty, largest value on left"
             (binary-tree-largest (bt 7
                                      (leaf 10)
                                      (bt 9
                                          (leaf 4)
                                          (empty-tree))))
             10)
(test-equal? "right subtree empty, largest value at root"
             (binary-tree-largest (bt 2
                                      (leaf -1)
                                      (empty-tree)))
             2)
(test-equal? "tree contains only negative numbers"
             (binary-tree-largest (bt -3
                                      (leaf -5)
                                      (leaf -2)))
             -2)
(test-equal? "tree contains only negative numbers, empty subtree"
             (binary-tree-largest (bt -3
                                      (leaf -5)
                                      (empty-tree)))
             -3)
|#

#| A |#

; +-------------------------------------+----------------------------
; | Exercise 2: New ways to build trees |
; +-------------------------------------+

#|
a.  The code for this lab contains a procedure, `vector->tree`.
Read the documentation for the procedure and suggest why you think
we've included it in the sample code for this lab.

<TODO: Enter your answer here>
|#

#|
b. Predict what results you will get for each of the following 
expressions.

   > (vector->tree (vector))
   ?
   > (vector->tree (vector "a"))
   ?
   > (vector->tree (vector "a" "b"))
   ?
   > (vector->tree (vector "a" "b" "c"))
   ?
   > (vector->tree (vector "a" "b" "c" "d" "e"))
   ?
   > (vector->tree (vector "a" "b" "c" "d" "e" "f" "g"))
   ?

Check your results  experimentally.
|#

#|
c. The code for this lab contains a procedure, `random-tree`.  Read
the documentation for the procedure and suggest why you think we've
included it in the sample code for this lab.

<TODO: Enter your answer here>
|#

#|
d. What kind of output do you expect for each of the following?

    > (random-tree 5 random-digit)
    ?
    > (random-tree 5 random-id)
    ?
|#

#|
e. Here are two of the "shapes" given by `(random-tree 5 random-digit)`
(the *'s stand for "some value).

i.        *
         / \
        *   *
       / \
      *   *

ii.       *
         / \
        *   *
           /
          *
           \
            *

Approximately how many different "shapes" do you expect to get from 
`(random-tree 5 random-digit)`?  Give a short rationale for your answer.
Please do not spend more than one or two minutes on this problem.

<TODO: Enter your answer here>
|#


#|
f. The code for this lab contains a procedure, `random-bst`.  Read
the documentation for the procedure and suggest why you think we've
included it in the sample code for this lab.

<TODO: Enter your answer here>
|#

#|
g. What shape trees do you expect to get for `(random-bst 7)`?  Don't
spend more than a minute or two answering this question.

<TODO: Enter your answers here>

Conduct a few experiments to check your answer.

    > (random-bst 7)
    ?
    > (random-bst 7)
    ?
    > (random-bst 7)
    ?
|#

#| B |#

; +-------------------------------+----------------------------------
; | Exercise 3: Searching vectors |
; +-------------------------------+

#|
The reading contains two procedures for searching trees.  Before we
start searching trees, let's remind ourselves of how we might search
vectors.

Consider the following procedure.
|#

;;; (vector-find vec str) -> string? (or boolean?)
;;;   vec : vectorof string?
;;;   str : string?
;;; Finds a word equal to string in vec, ignoring case.
;;; Returns false if it can't find it.
(define vector-find
  (lambda (vec str)
    (letrec ([helper 
              (lambda (pos)
                (if (< pos 0)
                    #f
                    (let ([current (vector-ref vec pos)])
                      ; (displayln current)
                      (if (string-ci=? str current)
                          current
                          (helper (- pos 1))))))])
      (helper (- (vector-length vec) 1)))))

#|
a. Explain, in your own words, how this procedure works.

<TODO: Enter your explanation>
|#

#|
Consider the following vector.
|#

(define names (vector "Aardvark" "Chinchilla" "Dingo" "Emu" "Fennec Fox"
                      "Gnu" "Hippo" "Iguana" "Jackalope" "Llama" "Skink"))

#|
b. What names do you expect the `vector-find` to look at when searching
for `"Koala"`?

<TODO: Enter your answer here.>

Check your answer experimentally (e.g., by printing out the current
value after the `let` with `(displayln current)`).

|#

#|
c. If the vector contains 1000 elements, how many values do you
expect to look at when searching for an element not in the vector?

<TODO: Enter your answer here.>
|#

#| A |#

; +-----------------------------+------------------------------------
; | Exercise 4: Searching trees |
; +-----------------------------+

#|
a. The reading and lab provide two different procedures for searching
trees.  What are they?  How are they similar?  How are they different?

<TODO: Enter your answer here.>
|#


#|
b. The following code converts the vector from the prior exercise
to a tree.  Sketch the tree here using whatever technique you'd
like (e.g., ASCII art, indented racket code, etc.).

<TODO: Enter  your sketch.>

|#

; A tree of names
(define ton (vector->tree names))

#|
c. What names do you expect `(binary-tree-contains? ton "Koala")` to look at?

<TODO: Enter your answer here>

Check your answer experimentally (e.g., by uncommenting the `(displayln root)`
after the `let` that defines `root` in `binary-tree-contains?`).

<TODO: Enter your answer here> (you can copy and paste)
|#

#|
d. What names do you expect the `(binary-tree-contains? ton "Llama")` to 
look at?

<TODO: Enter your answer here>

Check your answer experimentally.
|#

#|
e. If the vector from which we built the tree contained 1000 elements,
how many values do you expect `binary-tree-contains?` to look at
when searching for an element not in the tree?

<TODO: Enter your answer here>

Check your answer experimentally with 
`(binary-tree-contains? (random-bst 1000) "Koala")`.

|#

; +-------------------------------------------+----------------------
; | Exercise 5: Searching binary search trees |
; +-------------------------------------------+

#|
a. What names do you expect the `bst-find` to look at in a call to
`(bst-find? ton "Llama")`?

<TODO: Enter your answer here>

Check your answer experimentally (e.g., by uncommenting the 
`(displayln root)` after the `let` that defines `root` in `bst-find`
and then running the find again).

<TODO: Enter the results of your check.
|#

#|
b. What names do you expect `bst-find` to look at when searching
for `"Koala"`?

<TODO: Enter your answer here>

Check your answer experimentally.
|#

#|
c. If the vector contains 1000 elements, how many values do you
expect to look at when searching for an element not in the vector?

<TODO: Enter your answer here>

Check your answer experimentally with `(bst-find (random-bst 1000) "Koala")`.
|#

#| B |#

; +----------------------------------+-------------------------------
; | Exercise 6: Searching, revisited |
; +----------------------------------+

#|
Let's search another vector, this time of science disciplines.
|#

(define sciences
  (vector->tree (vector "Mathematics" "Statistics" "Computer Science"
                        "Physics" "Chemistry" "Biological Chemistry"
                        "Biology" "Psychology")))
#|
a. What values do you expect `bst-find` to consider as it looks for `"Psychology"` in this tree?

<TODO: Enter your answer here>

Check your answer experimentally.  Note that you may have to uncomment the
`(displayln root)` in `bst-find`.

|#

#|
b. What values do you expect `bst-find` to consider as it looks for
`"Computer Science"`?

<TODO: Enter your answer here>

Check your answer experimentally.
|#

#|
c. If your experimental results did not match your predicted results, 
explain why.

<TODO: Enter your answer here>
|#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yes, it's that time again. Please submit your work on Gradescope.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you should attempt one or more
of the following exercises.
|#

; +----------------------------+-------------------------------------
; | Extra 1: Tallying in trees |
; +----------------------------+

#|
Write a procedure, `(binary-tree-tally-odd tree)`, that takes a tree
of integers as parameters and returns the count of odd integers in
the tree.
|#

(define binary-tree-tally-odd
  (lambda (tree)
    (if (empty-tree? tree)
        *BASE-CASE*
        (*COMBINE* (*PROCESS* (bt/t tree))
                   (binary-tree-tally-odd (bt/l tree))
                   (binary-tree-tally-odd (bt/r tree))))))

#|
(test-equal? "btto: empty tree"
             (binary-tree-tally-odd (empty-tree))
             0)
(test-equal? "btto: even leaf"
             (binary-tree-tally-odd (leaf 2))
             0)
(test-equal? "btto: odd leaf"
             (binary-tree-tally-odd (leaf 3))
             0)
(test-equal? "btto: non-trivial tree/1"
             (binary-tree-tally-odd (bt 4 
                                        (bt 2 (leaf 0) (leaf 8))
                                        (bt 6 (leaf 10) (leaf 8))))
             0)
(test-equal? "btto: non-trivial tree/2"
             (binary-tree-tally-odd (bt 4 
                                        (bt 2 (leaf 0) (leaf 8))
                                        (bt 6 (leaf 10) (leaf 7))))
             1)
(test-equal? "btto: non-trivial tree/3"
             (binary-tree-tally-odd (bt 5 
                                        (bt 2 (leaf 0) (leaf 8))
                                        (bt 6 (leaf 10) (leaf 7))))
             2)
(test-equal? "btto: non-trivial tree/3"
             (binary-tree-tally-odd (bt 5 
                                        (bt 1 (leaf 0) (leaf 8))
                                        (bt 6 (leaf 10) (leaf 7))))
             3)
(test-equal? "btto: non-trivial tree/4"
             (binary-tree-tally-odd (bt 5 
                                        (bt 1 (leaf 3) (leaf 8))
                                        (bt 6 (leaf 10) (leaf 7))))
             4)
|#

; +---------------------------+--------------------------------------
; | Extra 2: Flattening trees |
; +---------------------------+

#|
a. Write a function `(flatten-tree t)` which takes a tree `t` as
input and outputs a list containing all of the elements of `t`.

(*Hint*: recall that `(append l1 l2)` takes two lists `l1` and `l2`
         and returns a list that is the result of appending `l2` onto
         the end of `l1`.)
|#

;;; (flatten-tree t) -> list?
;;;   t : binary-tree?
;;; Convert t to a list.  Each element in t appears once in the list.
(define flatten-tree
  (lambda (t)
    (if (empty-tree? t)
        *BASE-CASE*
        (*COMBINE* (*PROCESS* (bt/t t))
                   (flatten-tree (bt/l t))
                   (flatten-tree (bt/r t))))))

#|
b. What do you expect to get from `(flatten-tree digits-tree)`

<TODO: Enter your answer>

Check your answer experimentally.

    > (flatten-tree digits-tree)
    ?
|#

#|
c. Note that in the recursive case of `flatten-tree`, there are three
"lists" that you are combining:

*  The current element (as a list of one).
*  A list containing the values from the left subtree.
*  A list containing the values from the right subtree.

In the reading, we talked about changing the order of recursive
calls to the left- and right-subtrees for `tree-sum`. Does the order
matter here?

<TODO: Enter your answer here>
|#

#|
d.  Write *two additional variants* of `flatten-tree` that produce
*different* ordering of the elements with the restriction that the
elements in the left subtree have to appear before the elements in
the right subtree.  (Basically, you'll just need to switch where
you handle the root/top relative to the subtrees.)
|#

; IMPORTANT: When implementing these functions, make sure your recursive
;            calls are made to those functions. In other words, don't
;            recursively call `flatten-tree` from flatten-tree-alt-1!

(define flatten-tree-alt-1
  ???)

(define flatten-tree-alt-2
  ???)

#|
c. When you are done, you should have three implementations of
`flatten-tree` that produce different orderings of the input list. The
canonical name for these traversals are *pre-order*, *in-order*, and
*post-order* traversals. Use your intuition about the prefixes "pre"
(before), "in" (between), and "post" (after) to assign your
implementation the names `flatten-pre`, `flatten-in`, and
`flatten-post`, respectively. You can fill in the definitions below by
simply defining these identifiers to be aliases of flatten-tree and
its alternative versions.
|#

; NOTE: which of these functions should we assign flatten-alt,
;       flatten-tree-alt-1 and flatten-tree-alt-2?

(define flatten-preorder
  ???)

(define flatten-inorder
  ???)

(define flatten-postorder
  ???)

#|
e. In the space below, describe the differences between the three
kinds of traversals in terms of the order in which they visit elements
in the tree.

<TODO: write your explanation here>
|#

