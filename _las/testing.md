---
title: "Sample LA: Testing"
---
# {{ page.title }}

_Test programs according to good software engineering principles._

Consider the following not-yet-implemented procedure.

```drracket
;;; (median numbers) -> real?
;;;   numbers : list-of real?
;;; Find the median of a list of a nonempty list of numbers using
;;; the standard approach.
(define median
  (lambda (numbers)
    (car numbers))) ; Incorrect, but a good placeholder.
```

Write a set of tests for `median` using the `test-=` and/or `test-equals?` methods.  Make sure to include at least three "expected" cases and at least three "edge" cases.

Here are some examples to get you started.

```drracket
(test-= "An easy list of integers"
         (median '(1 2 3))
         2
         0
         "An easy list of integers")
(test-= "A list of exact and inexact numbers of even length"
         (median '(1.0 2 3 4))
         2.5
         0.00000001)
```

