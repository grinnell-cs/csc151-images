---
title: "Sample LA: Use higher-order procedures"
---
# {{ page.title }}

_Use `cut` and composition to simplify computation._

Consider the following procedures

```drracket
;;; (vowel? char) -> boolean
;;;   char : char?
;;; Determine if char is a vowel.
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))

;;; (count-vowels str) -> integer?
;;;   str : string?
;;; Count the number of vowels in str
(define count-vowels
  (lambda (str)
    (tally vowel? (string->list str))))

;;; (select-special-words words) -> list-of string?
;;;   words : list-of string?
;;; Selects all the special words in words using the ALTV criterion.
(define select-special-words
  (lambda (words)
    (filter (o (cut (> <> 2)) count-vowels) words)))
```

a. What kinds of words does `select-special-words` select?

b. Explain how `(o (cut (> <> 2)) count-vowels)` works as a
predicate for such words.

c. Rewrite `vowel?` using `cut` and composition but no `lambda`.

## Use higher-order procedures (extra)

_This is a particularly evil problem.  You are unlikely to get one
this hard._

Consider the following procedure.

```drracket
(define silly
  (lambda (lst)
    (map (lambda (x) (sqr (+ 1 x)))
         (filter odd? lst))))
```

Rewrite the procedure using `o` and `cut` so that it has *no* lambdas.

Notes:

* Use `o` when you want to sequence actions. (Do *this* to the parameter,
  then *this* to the result, then *this* to the next result, and so on and
  so forth.)
* Use `cut` when you want to fill in one or more parameters to a procedure,
  thereby creating a new procedure.
* This is a case in which the lambda-free version is likely much harder to
  read.

