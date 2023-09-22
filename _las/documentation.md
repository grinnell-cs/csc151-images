---
title: "Sample LA: Documentation"
---
# {{ page.title }}

_Document programs according to good software engineering principles._

Consider the following `matching-indices` procedure that finds the
indices of elements of a list that match a particular predicate.
(You need not understand all of the code, just what it does.)

```drracket
(define matching-indices
  (lambda (pred? lst)
    (matching-indices-helper pred? lst 0)))

(define matching-indices-helper
  (lambda (pred? lst pos)
    (cond
      [(null? lst)
       null]
      [(pred? (car lst))
       (cons pos (matching-indices-helper pred? (cdr lst) (+ pos 1)))]
      [else
       (matching-indices-helper pred? (cdr lst) (+ pos 1))])))

> (define starts-with-a?
    (lambda (str)
      (char=? #\a (string-ref str 0))))
> (define words (list "and" "as" "the" "animals" "rode" "off" "into" "the" "sunset"
                      "after" "aiding" "the" "enchantress"))
> (matching-indices starts-with-a? words)
'(0 1 3 9 10)
> (list-ref words 3)
"animals"
```

a. Write the standard documentation for `matching-indices`.

b. Other than the broad types of `pred?` and `lst`, what restrictions
does `matching-indices` impose on its parameters?  For example, can
you call `(matching-indices odd? words)`?  Can you call
`(matching-indices (section substring <> 0 1) words)`?  Should you?

c. Suppose an integer, `i`, appears in the list of values returned
by `matching-indices`.  What an we guarantee about `i` (other than that
it is a non-negative integer)?


