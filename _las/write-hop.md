---
title: "Sample LA: Write higher-order procedures"
---
# {{ page.title }}

_Write procedures that take procedures as parameters and return procedures as re
sults._

Write, but do not document, a *recursive* procedure `(split pred? lst)`,
that takes a predicate and a list as parameters and returns a two-element
list, the first of which is all the elements for which the predicate
holds, and the second of which is all the elements for which the
predicate does not hold.  You may assume that the predicate is
applicable to all elements of the list.

```
> (split odd? (list 5 1 5 4 2 3 8))
'((5 1 5 3) (4 2 8))
> (split string->number? (list "11" "fred" "one" "22.1" "two"))
'(("11" "22.1") ("fred" "one" "two"))
```

## Write higher-order procedures (Extra)

a. As you may recall, the `(left-section proc left)` procedure looks 
like this.

```racket
(define left-section
  (lambda (proc left)
    (lambda (right)
      (proc left right))))
```

In your own words, explain why we have two `lambda` expressions
in `left-section.

b. Consider the following alternate definition of `left-section`.

```racket
(define left-section
  (lambda (proc left)
    (let ([result
           (lambda (right) 
             (proc left right))])
      result)))
```

Why might someone prefer this version of `left-section`?

c. Using the strategy of b, write a procedure, `(make-multiplier n)`,
that creates a procedure that takes one input and multiplies it by `n`.

```
;;; (make-multiplier n) -> procedure?
;;;   n : number?
;;; Create a procedure that multiplies its parameter by n
(define make-multiplier
  (lambda (n)
    undefined))
```

```
> (define mul5 (make-multiplier 5))
> (mul5 10)
50
> mul5 1.2)
6.0
```


