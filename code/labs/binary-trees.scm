;; CSC-151-NN (SEMESTER)
;; Lab: Binary Trees (binary-trees.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Binary Trees")

; -------------------------------------------------------------------
(part "Provided code: The definition of a tree")

;; A tree is either:
;;   + Empty (a leaf) or
;;   + Non-empty (a node) with a value, left subtree, and right subtree.
(struct leaf ())
(struct node (value left right))

;;; (tree? v) -> boolean?
;;;   v: any
;;; Returns #t iff v is a tree.
(define tree?
  (lambda (v) (or (leaf? v) (node? v))))

;;; (tree-level->string level tree) -> string?
;;;   level: nat?
;;;   tree: tree?
;;; Returns the string representation of tree starting at the given level.
(define tree-level->string
  (let ([bullets (vector "* " "+ " "- " ". ")]
        [make-spaces (lambda (n)
                       (list->string (make-list n #\space)))])
    (lambda (level tree)
      (let* ([spaces (make-spaces (* 2 level))]
             [bullet
               (string-append
                 spaces
                 (vector-ref bullets (remainder level (vector-length bullets))))])
        (match tree
          [(leaf) ""]
          [(node value (leaf) (leaf)) (string-append bullet value)]
          [(node value left (leaf))
           (string-append
             (string-append bullet value)
             "\n"
             (tree-level->string (+ level 1) left))]
          [(node value (leaf) right)
           (string-append
             (string-append bullet value)
             "\n"
             (tree-level->string (+ level 1) right))]
          [(node value left right)
          (string-append
            (string-append bullet value)
            "\n"
            (tree-level->string (+ 1 level) left)
            "\n"
            (tree-level->string (+ 1 level) right))])))))

;;; (tree->string tree) -> string?
;;;   tree: tree?
;;; Returns the string representation of tree.
(define tree->string
  (lambda (tree)
    (tree-level->string 0 tree)))

;;; The legendary management tree
(define management-tree
  (node
    "Board"
    (leaf)
    (node
      "CEO"
      (node
        "Head of Engineering"
        (node "Software Developer" (leaf) (leaf))
        (node "Tester" (leaf) (leaf)))
      (node
        "Head of Legal"
        (leaf)
        (node "Lawyer" (leaf) (leaf))))))

(tree->string management-tree)

; -------------------------------------------------------------------
(part "Part 1: Making trees")

; (Partner A drives!)

(problem "1a")

; Consider the following trees of numbers drawn with ASCII art:

; i. tree-i
;           "b"
;           / \
;          /   \
;        "a"   "c"

; ii. tree-ii
;            "e"
;            / \
;           /   \
;          "b"  "f"
;          / \    \
;         /   \    \
;       "a"   "c"  "g"
;             /
;            "d"

; iii. tree-iii
;           "f"
;           /
;         "e"
;         /
;       "d"
;       /
;     "c"
;     /
;   "b"
;   /
; "a"

; For each of these trees, use the tree-making functions from the
; reading to complete the definitions of `tree-i`, `tree-ii`, and
; `tree-iii` below. 

; Make sure to check that each thing you enter is a binary tree with
; `tree?` and that it has the right form with `tree->string`

;     > (tree? tree-i)
;     #t
;     > (tree->string tree-i)
;     * b
;       + a
;       + c
;     > (tree? tree-ii)
;     #t
;     > (tree->string tree-ii)
;     * 5
;       + 2
;         - 1
;         - 4
;       + 7
;         - 9
;           . 8
;     > (tree? tree-iii)
;     #t
;     > (tree->string tree-iii)
;     * 5
;       + 4
;         - 3
;           . 2
;             . 1
;               . 0

(description "tree-i")

(define tree-i
  ; TODO: fill me in!
  (leaf))

(display (tree->string tree-i))

(description "tree-ii")

(define tree-ii
  ; TODO: fill me in!
  (leaf))

(display (tree->string tree-ii))

(description "tree-iii")

(define tree-iii
  ; TODO: fill me in!
  (leaf))

(display (tree->string tree-iii))

(problem "1b")

; Note that tree-iii is a left-leaning tree. That is, all its children are
; left children. Complete the definition of tree-iv below which is
; the same as tree-iii except that its leaves grow to the right rather
; than the left.

; "a"
;   \
;   "b"
;     \
;     "c"
;       \ 
;       "d"
;         \ 
;         "e"
;           \
;           "f"

; > (tree? tree-iv)
; #t
; > (tree->string tree-iv)
; * 5
;   + 4
;     - 3
;       . 2
;         * 1
;           + 0

(description "tree-iv")

(define tree-iv 
  ; TODO: fill me in!
  (leaf))

(display (tree->string tree-iv))

(problem "1c")

; Finally, in the space below describe in a few sentences the
; differences and similarities between tree-iii and tree-iv. Do you
; consider these trees to be the same tree or different trees?
; Why?

(description "<TODO: write your analysis here.>")

; -------------------------------------------------------------------
(part "Part 2: Leaves")

; (Partner B drives!)

(problem "2a")

; As you may have noted, in the sample code, we use the very verbose
;
; (node val (leaf) (leaf))
;
; To create a node with no children. This is a bit tedious! Write a
; helper function 'singleton' that takes a value as input and produces
; a node with no children as output, i.e., a tree of one element.
; Document and test the function appropriately.

; TODO: write your documentation here
(define singleton
  ; TODO: fill me in!
  (leaf))

(description "singleton tests")

; TODO: write your tests here

; Now, write a function 'singleton?' that takes a tree as input and
; returns #t if and only if the tree has no children. Use the query
; functions produced by our struct declarations leaf? and node? in
; conjunction with operations over booleans for this task.  Document
; and test this function appropriately, too.

; TODO: write your documentation here
(define singleton?
  ; TODO: fill me in!
  #f)

(description "singleton? tests")

; TODO: write your tests here

; -------------------------------------------------------------------
(part "Part 3: Traversing trees")

; (Partner A drives!)

; Recall from our discussion of structs that we can get out the
; fields of a struct in two ways:
;
; 1. Using struct projection functions.
; 2. Pattern matching.
;
; For our tree structs, we have:
;
; + The (leaf) pattern to match a leaf.
; + The (node-value n), (node-left n), and (node-right n) functions
;   retrieve the value, left child, and right child of a node.
;   We also have the pattern (node value left right) to pattern
;   match a node and bind its value, left, and right fields all
;   at once.
;
; In the space below, write two expressions to retrieve the given
; value from the trees you created above:
;
; + One expression using combinations of projection functions.
; + One expression using a pattern matching consisting of a single
;   pattern. Recall that you can nest patterns inside of other
;   patterns.

(problem "3a: \"b\" from tree-i")

(define tree-i-projection
  "TODO: fill me in!")

(define tree-i-match
  "TODO: fill me in!")

(test-case "tree-i-projection"
  equal? "b"
  (lambda () tree-i-projection))

(test-case "tree-i-match"
  equal? "b"
  (lambda () tree-i-match))

(problem "3b: \"c\" from tree-ii")

(define tree-ii-projection
  "TODO: fill me in!")

(define tree-ii-match
  "TODO: fill me in!")

(test-case "tree-ii-projection"
  equal? "c"
  (lambda () tree-ii-projection))

(test-case "tree-ii-match"
  equal? "c"
  (lambda () tree-ii-match))

(problem "3c: \"b\" from tree-iii")

(define tree-iii-projection
  "TODO: fill me in!")

(define tree-iii-match
  "TODO: fill me in!")

(test-case "tree-iii-projection"
  equal? "b"
  (lambda () tree-iii-projection))

(test-case "tree-iii-match"
  equal? "b"
  (lambda () tree-iii-match))

(problem "3d: \"Head of Legal\" from management-tree")

(define management-tree-i-projection
  "TODO: fill me in!")

(define management-tree-i-match
  "TODO: fill me in!")

(test-case "management-tree-i-projection"
  equal? "Head of Legal"
  (lambda () management-tree-i-projection))

(test-case "management-tree-i-match"
  equal? "Head of Legal"
  (lambda () management-tree-i-match))

(problem "3e: \"Software Developer\" from management-tree")

(define management-tree-ii-projection
  "TODO: fill me in!")

(define management-tree-ii-match
  "TODO: fill me in!")

(test-case "management-tree-ii-projection"
  equal? "Software Developer"
  (lambda () management-tree-ii-projection))

(test-case "management-tree-ii-match"
  equal? "Software Developer"
  (lambda () management-tree-ii-match))

; -------------------------------------------------------------------
(part "Part 4: Exploring tree recursion")

; (Partner A drives!)

; From the reading, we noted that a binary tree is recursively defined like a
; list. A binary tree is either:

; + *Empty*, or
; + *Non-empty* where the tree contains a value and up to two *children*
;   (*subtrees*) that are, themselves, trees.

; Like lists, our tree operations mirror this recursive decomposition of
; the list. As a first example, consider the following function which
; computes the *size* of the input tree, *i.e.*, the number of values it
; contains.

;;; (tree-size tree) -> integer?
;;;   tree : tree?
;;; Determine how many values are in binary tree.
(define tree-size
  (lambda (t)
    (match t
      [(leaf) 0]
      [(node _ l r) (+ 1 (tree-size l) (tree-size r))])))

; a. For reference, copy and paste your definitions from tree-i and
; tree-ii from a previous problem within this comment below:

; (define tree-i
;    ; TODO: fill me in!
; )

; (define tree-ii
;    ; TODO: fill me in!
; )

; Now, use your mental model of computation to give an evaluation trace
; of the following expression in the space below. In your derivation,
; you may take the following short-cuts:
;
; + You may evaluate a recursive call to tree-size directly to the
;   branch of the pattern match that is selected.
; + You may elide the contents of the tree's children during evaluation.
;
; Make sure to check your work with the stepper when you are done!

; a. (tree-size tree-i)
; --> ...

(description "Size of tree-i:")

(tree-size tree-i)

; b. (tree-size tree-ii)
; --> ...

(description "Size of tree-ii:")

(tree-size tree-ii)

; Fill out the following high-level description of `tree-size` in
; terms of the base and recursive cases of the function above.

(description "The size of a tree is:")
(description "+ ... in the base case.")
(description "+ ... in the recursive case.")

; -------------------------------------------------------------------
(part "Part 5: Additional Tree Recursion Problems")

;; For the following two functions, follow the prompts to implement the
;; functions using tree recursion. Make sure to write a test suite for
;; the functions using the trees you created from exercise 1.

;; (B side drives!)

;; Consider the following recursive skeleton for a function that computes the
;; combined product of all the elements in a tree of numbers.
;;
;; To compute the product of a binary tree:
;; + If the tree is empty, the product is 1.
;; + If the tree is non-empty, the product is the value at the root of the tree
;;   times the products of left and right subtrees.
;;
;; Use this skeleton to complete the implementation of tree-product below:

;;; (tree-product t) -> number
;;;   t: tree? of numbers
;;; Returns the product of all the elements in the tree t.
(define tree-product
  (lambda (t)
    ; TODO: implement me!
    0))

(description "tree-product tests")

; TODO: write your test suite here!

;; (B side drives!)

;; Consider the following recursive skeleton for a function that computes the
;; number of leaves in a tree.
;;
;; To compute the number of leaves in the tree:
;; + If the tree is empty, the tree is a leaf, so the number of leaves is 1.
;; + If the tree is non-empty, the number of leaves is the sum of the number of
;;   leaves in the left and right subtrees
;;
;; Use this skeleton to complete the implementation of tree-leaf-count below:

;; (tree-leaf-count t) -> number
;;   t: tree?
;; Returns a count of the number of leaves in tree t.
(define tree-leaf-count
  (lambda (t)
    ; TODO: fill me in!
    0))

(description "tree-leaf-count tests")

; TODO: write your test suite here!