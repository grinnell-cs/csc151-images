---
title: "Sample LA: Local bindings"
---
# {{ page.title }}

_Refactor redundancy and add clarity in computations with let-bindings._

Consider the following procedure that contains some repetitious code.

```drracket
;;; (letter->number ch) -> either integer? boolean?
;;;   ch : char?
;;; Converts ch to the corresponding number in the English alphabet.
;;; (1 for #\a or #\A, 2 for #\b or #\B, etc.).  Returns false (#f)
;;; if ch is not a letter in the English alphabet.
(define letter->number
  (lambda (ch)
    (cond
      [(<= (char->integer #\a) (char->integer ch) (char->integer #\z))
       (+ 1 (- (char->integer ch) 97))]
      [(<= (char->integer #\a) (+ (char->integer ch) 32) (char->integer #\z))
       (+ 1 (- (+ (char->integer ch) 32) 97))]
      [else #f])))

(check-equal? (map letter->number (string->list "abcde"))
              '(1 2 3 4 5)
              "First five lowercase letters")
(check-equal? (map letter->number (string->list "ABCDE"))
              '(1 2 3 4 5)
              "First five uppercase letters")
(check-equal? (map letter->number (string->list "XYZ"))
              '(24 25 26)
              "Last three uppercase letters")
(check-equal? (map letter->number (string->list "xyz"))
              '(24 25 26)
              "Last three lowercase letters")
(check-equal? (letter->number #\.)
              #f
              "Not a letter")
```

As you know, we should avoid redundant computations and magic numbers.  Using
local bindings (`let` or `let*`), remove the redundant computations and magic
numbers from `letter->number`.  You need not change the primary stucture
of the `cond`, but you should not compute the same value twice.

Note: In case you didn't know, 32 is the result of subtracting the
collating sequence number of `#\A` from the collating sequence number
of `#\a`.  By adding 32, we switch from uppercase to lowercase.  And
97 seems to be the collating sequence number of `#a`, but we probably
shouldn't count on that.

