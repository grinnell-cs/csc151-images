;; CSC-151-NN (SEMESTER)
;; Tree Recursion (tree-recursion.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Tree Recursion")

;; ----------------------------------------------------------------------------- 
(part "Preamble: Tree Definitions")

;; A tree is either:
;;   + Empty (a leaf) or
;;   + Non-empty (a node) with a value, left subtree, and right subtree.
(struct leaf ())
(struct node (value left right))

;;; (singleton v) -> tree?
;;;   v: any
;;; Returns a tree consisting of a single value, i.e., a node with no children.
(define singleton
  (lambda (v)
    (node v (leaf) (leaf))))

;; Example trees for testing purposes

(define empty-tree (leaf))

(define small-tree
  (singleton 5))

(define large-tree
  (node 5
    (node 3
      (node 1
        (leaf)
        (singleton 2))
      (singleton 4))
    (node 8
      (node 7
        (singleton 6)
        (leaf))
      (node 9
        (leaf)
        (singleton 10)))))

(define left-leaning-tree
  (node 5
    (node 4
      (node 3
        (node 2
          (singleton 1)
          (leaf))
        (leaf))
      (leaf))
    (leaf)))

(define right-leaning-tree
  (node 1
    (leaf)
    (node 2
      (leaf)
      (node 3
        (leaf)
        (node 4
          (leaf)
          (singleton 5))))))

(description "(Nothing to display here...)")

(part "Problems")

;; ----------------------------------------------------------------------------- 
(problem "Problem 1: Finding the largest value in a tree")

;; (Partner A drives!)

;; In the reading, we developed a partially correct implementation of a
;; function that finds the largest value in a tree of numbers. The
;; implementation is replicated below for reference:

;;; (tree-largest t) -> number?
;;;   t: tree? of numbers, non-empty
;;; Returns the largest number in tree t.
(define tree-largest
  (lambda (tree)
    (match tree
      [(node v (leaf) (leaf)) v]
      [(node v l r) (max v (tree-largest l) (tree-largest r))])))

;; Recall that we designed tree-largest so that it only accepts non-empty
;; trees because an empty tree does not have any values that can be
;; considered the largest. However, when we go to write this function,
;; our recursive calls to tree-largest are potentially made with empty
;; trees because the sub-trees of a node may be empty.
;;
;; Share your answer to this reading problem with your partner and come up
;; with a shared solution. Fix the implementation of tree-largest above
;; and develop a collection of test cases below that demonstrate that your
;; implementation works.

(description "tree-largest test cases")

; TODO: write your test cases here!

;; ----------------------------------------------------------------------------- 
(problem "Problem 2: Tree?")

;; (Partner B drives!)

;; Observe that we defined a tree in terms of two structs, leaf and node.
;; These functions provide two query functions, leaf? and node?. To implement
;; the tree? function which tests whether a value is a tree, it is tempting to
;; implement it as follows:

(define tree-first-attempt?
  (lambda (v)
    (or (leaf? v) (node? v))))

(test-case "is large-tree a tree?"
  equal? #t
  (lambda () (tree-first-attempt? large-tree)))

;; It seems like it works, but the function has a critical flaw! Describe the
;; bug in a sentence below and demonstrate the bug with a test case:

(description "The flaw in tree-first-attempt? is... <TODO: fill me in!>")

(description "A failing test case for tree-first-attempt?")

; TODO: fill in the test case here

;; Now, let's implement a correct version of the tree? function. We'll do so
;; recursively. First, fill out the recursive skeleton that defines when a tree
;; is indeed a tree:
;;
;; To check if a tree is indeed a tree?
;; + When the tree is empty (a leaf), <<TODO: fill me in!>>
;; + When the tree is non-empty (a node), <<TODO: fill me in!>>
;;
;; Finally, fill in a correct implementation of tree?, document the function,
;; and give a test suite demonstrating its correctness:

; TODO: fill me in!
(define tree?
  ; TODO: fill me in!
  #f)

(description "tree? test cases")

; TODO: fill me in!

;; ----------------------------------------------------------------------------- 
(problem "Problem 3: Binary Search Trees")

;; Recall that a binary search tree (bst) is a binary tree that obeys the
;; following invariant:
;;
;; For any subtree of a binary search tree with root `v`:
;; + All the values in the left subtree are less than `v`.
;; + All the values in the right subtree are greater than `v`.
;;
;; In the reading for today, we looked at how we might find a value in a binary
;; search tree without having to exhaustively check all of the elements. In
;; these remaining problems, we'll further explore what we can do with a bst.
;;
;; As a warm-up, let's write down some binary search trees using our tree-
;; creation functions that we can use for testing purposes. Fill in the
;; definitions of example bsts below with trees of your own design that fulfill
;; the bst invariant:

(define example-bst-1
  ;; TODO: fill me in!
  (leaf))

(define example-bst-2
  ;; TODO: fill me in!
  (leaf))

(define example-bst-3
  ;; TODO: fill me in!
  (leaf))

;; ----------------------------------------------------------------------------- 
(problem "Problem 4: Binary Search Tree Traversal")

;; Next, let's write a function bst->list that converts a bst into a list
;; This process is called "linearization" because we're taking a non-sequential
;; thing (a tree) and converting it into a sequential (or linear thing) thing,
;; a list. We'll use the following recursive decomposition:
;;
;; To linearize a binary search tree:
;; + When the tree is empty (a leaf), produce the empty list.
;; + When the tree is non-empty (a node), append the following lists together:
;;   - The linearization of the left subtree.
;;   - A list containing the value of the current node.
;;   - The linearization of the right subtree.
;;
;; Fill in the implementation of bst->list below and test your implementation on
;; your example bsts. You should notice a pleasant property of the lists created
;; by bst->list, provided that the input tree is indeed a bst! In a sentence,
;; write your findings below.

(define bst->list
  (lambda (t)
    ;; TODO: fill me in!
    null))

(description "bst->list tests")


(description "The output of bst->list is... <TODO: fill me in!>")

;; ----------------------------------------------------------------------------- 
(problem "Problem 4: Binary Search Tree Insertion")

;; Recall that the "snoc" function appends an element onto the end of a list:
;;
;; To snoc an element v onto the end of a list l:
;; + When the list is empty (null), produce a list containing only v.
;; + When the list is non-empty (cons head tail), produce a list containing
;;   head followed by the result of snocing v onto tail.

(define snoc
  (lambda (l v)
    (match l
      [null (list v)]
      [(cons head tail) (cons head (snoc tail v))])))

;; Importantly, in the base case, we reach the end of the list. Snoc
;; effectively replaces the end of the list with the element we're snocing.
;;
;; Let's follow this pattern of "appending to end" to write (bst-insert t v)
;; which inserts a value `v` into a bst `t`. The value `v` should be inserted
;; into a leaf position of the tree, similar to how snoc inserts onto the end
;; of the list. To do this, you will need to use the bst invariant to navigate
;; to the correct leaf of the tree where v should be inserted so that the bst
;; invariant is maintained.
;;
;; First fill in the following recursive decomposition:
;;
;; To insert a value v into a bst t:
;; + When the tree is empty (a leaf): <TODO: fill me in!>
;; + When the tree is non-empty (a node): <TODO: fill me in!>
;;
;; And then use that recursive decomposition to fill in the following function:

(define bst-insert
  (lambda (t v)
    ; TODO: fill me in!
    t))

(description "bst-insert tests")

; TODO: fill me in!

;; ----------------------------------------------------------------------------- 
(problem "Problem 5: There and Back Again")

;; Now let's put together our functions to obtain a cool effect! Using
;; bst->list and bst-insert along with other list functions, complete the
;; definition of `bst-sort` that takes a list of values as inputs and returns
;; a list that contains the same elements but sorted.
;;
;; (Hint: does the order of insertion into the bst matter?)

(define bst-sort
  (lambda (l)
    ; TODO: fill me in!
    l))

(description "bst-sort tests")

; TODO: fill me in!