---
title: "Sample LA: Tree recursion"
---
# {{ page.title }}

_Design and write recursive functions over trees (or nested lists)._

Write the following procedure.

```
;;; (bt-find tree str) -> string? or boolean?
;;;   tree : treeof string?
;;;   str : string?
;;; Find a string equal to string (ignoring case) in tree.  If
;;; no such string exists, return false.
```

> _Space for answer_

*Note*: You can access the primary tree procedures by updating the csc151 librar
y and then using `(include csc151/binary-trees-from-lists)`.

Here are some tests.

```
(define one-of-many
  (lambda (n i primary secondary)
    (let ([vec (list->vector (make-list n primary))])
      (vector-set! vec i secondary)
      (vector->tree vec))))
```

```
(check-false (bt-find (empty-tree) "A")
             "Base case: Nothing is in the empty tree")
(check-equal? (bt-find (leaf "A") "A")
              "A"
              "Simple case: At root, same capitalization")
(check-equal? (bt-find (leaf "a") "A")
              "a"
              "Simple case: At root, different capitalization")
(check-equal? (bt-find (leaf "alphabet") "ALPHAbet")
              "alphabet"
              "Simple case: At root, different capitalization")
(check-false (bt-find (leaf "B") "A")
             "Simple case: Not in small tree")
(check-false (bt-find (one-of-many 10 2 "C" "D") "E")
             "Normal case, not in big tree")
(check-equal? (bt-find (one-of-many 10 0 "E" "zero") "ZERO")
              "zero"
              "Big tree zero")
(check-equal? (bt-find (one-of-many 10 1 "F" "one") "ONE")
              "one"
              "Big tree one")
(check-equal? (bt-find (one-of-many 10 2 "G" "two") "TWO")
              "two"
              "Big tree two")
(check-equal? (bt-find (one-of-many 10 3 "H" "three") "THREE")
              "three"
              "Big tree three")
(check-equal? (bt-find (one-of-many 10 4 "I" "four") "FOUR")
              "four"
              "Big tree four")
(check-equal? (bt-find (one-of-many 10 5 "J" "five") "FIVE")
              "five"
              "Big tree five")
(check-equal? (bt-find (one-of-many 10 6 "K" "six") "SIX")
              "six"
              "Big tree six")
(check-equal? (bt-find (one-of-many 10 7 "L" "seven") "SEVEN")
              "seven"
              "Big tree seven")
(check-equal? (bt-find (one-of-many 10 8 "M" "eight") "EIGHT")
              "eight"
              "Big tree eight")
(check-equal? (bt-find (one-of-many 10 9 "N" "nine") "NINE")
              "nine"
              "Big tree nine")
```

## Extra question

(_Note that this problem focuses more on tracing tree recursion than on implemen
ting it.  We've found that tracing tree recursion is too time consuming for a So
LA.  But we leave it on as an example of a kind of procedure you might write._)

Consider the following procedure.

```
(define tree-level
  (lambda (tree n)
    (cond
      [(empty-tree? tree)
       null]
      [(= n 0)
       (list (btt tree))]
      [else
       (append (tree-level (btl tree) (- n 1))
               (tree-level (btr tree) (- n 1)))])))
```

Summarize the steps involved in computing `(tree-level t 3)` for the
following tree.  (You need not do a full trace.)

```
                  "A"
                  / \
                "B" "C"
                /   / \
              "D" "E" "F"
              / \   \   \
            "G" "H" "I" "J"
            /       / \   \
          "K"     "L" "M" "N"
            \     / \
            "P" "Q" "R"
                      \
                      "S"
```

i
Your answer will look something like the following.

> `(tree-level (bt "A" ...) 3)` appends `(tree-level (bt "B" ...) 2)`
  and `(tree-level (bt "C" ...) 2)`.

> `(tree-level (bt "B" ...) 2) appends ...

> ...

> Therefore, `(tree-level (bt "B" ...) 2)` returns ...

> `(tree-level (bt "C" ...) 2)` appends ...

> ...

> Therefore, `(tree-level (bt "C" ...) 2)` returns ...

> So the final result is ...

Alternately, you can do a more traditional trace.

```
    (tree-level (bt "A" ...) 3)
--> (append (tree-level (bt "B" ...) 2) (tree-level (bt "C" ...) 2))
--> ...
```

> _Space for answer_

Explain, in your own words, what `tree-level` computes.

> _Space for answer_

*Note*: You can access the binary-tree library we've been using with
`(require csc151/binary-trees-list)`.   You may have to update your
`csc151` library in order to do so.

*Note*: Here's the code for the tree above.

```
(define sample
  (bt "A"
      (bt "B"
          (bt "D"
              (bt "G"
                  (bt "K"
                      (empty-tree)
                      (leaf "P"))
                  (empty-tree))
              (leaf "H"))
          (empty-tree))
      (bt "C"
          (bt "E"
              (empty-tree)
              (bt "I"
                  (bt "L"
                      (leaf "Q")
                      (bt "R"
                          (empty-tree)
                          (leaf "S")))
                  (leaf "M")))
          (bt "F"
               (empty-tree)
               (bt "J"
                   (empty-tree)
                   (leaf "N"))))))
```


