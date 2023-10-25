---
title: "Sample LA: Numeric recursion"
---
# {{ page.title }}

_Design and write recursive functions over the natural numbers._

Write a *recursive* procedure, `(bounded-power-of-2 n)`, that finds the largest integer power of 2 less than of equal to the positive integer `n`.

```
(check-equal? (bounded-power-of-2 1)
              1
              "edge case/base case: 2^0")
(check-equal? (bounded-power-of-2 2)
              2
              "edge case/base case: 2^1")
(check-equal? (bounded-power-of-2 3)
              2
              "normal case: small non-power-of-two")
(check-equal? (bounded-power-of-2 7)
              4
              "normal case: small non-power-of-two")
(check-equal? (bounded-power-of-2 16)
              16
              "normal case: relatively small power of 2")
(check-equal? (bounded-power-of-2 17)
              16
              "normal case: relatively small non-power-of-two")
(check-equal? (bounded-power-of-2 72)
              64
              "normal case: somewhat larger non-powr-of-two")
(check-equal? (bounded-power-of-2 (expt 2 123))
              (expt 2 123)
              "edge case: large power of 2")
(check-equal? (bounded-power-of-2 (+ (expt 2 123) 123))
              (expt 2 123)
              "edge case: large non-power of 2")
```

