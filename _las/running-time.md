---
title: "Sample LA: Running time"
---
# {{ page.title }}

_Use a mental model of computation to count the relevant number of operations performed by a function._

Consider each of the following functions.  Are the functions constant time or linear?  If they are linear, what do they depend upon (e.g., the length of the list, some integer parameter like `n`).

*Include a short explanation of each answer.*

a. `(list-ref lst n)`

[_space for answer_]

b. `(cons val lst)`

[_space for answer_]

c. `(pair? val)`

[_space for answer_]

d. `(length lst)`

[_space for answer_]

e. `(append lst1 lst2)`

[_space for answer_]

f. `(take lst n)`

[_space for answer_]

### Extra problem

You may have noted that the tail-recursive list-building helpers often build lists in the reverse order.  We've usually solved that problem by either reversing the list before calling the helper or by reversing the `so-far` list in the case case.  For example, here's a tail-recursive procedure to increment each value of a list of numbers (or, more precisely, to build a new list).

```racket
;;; (increment-list nums) -> listof number?
;;;   nums : listof number?
;;; Build a new list by adding one to each element of nums.
(define increment-list-1
  (lambda (nums)
    (letrec ([helper
              (lambda (remaining so-far)
                (if (null? remaining)
                    (reverse so-far)
                    (helper (cdr remaining)
                            (cons (+ 1 (car remaining))
                                  so-far))))])
      (helper nums null))))
```

Why does this build the list backward?  Because we put each new element on the front of the list, rather than the back.  We can't just reverse the parameters to `cons`, because we can only cons elements onto lists, not lists onto elements.

But we might be able to use `append` instead.

```racket
(define increment-list-2
  (lambda (nums)
    (letrec ([helper
              (lambda (remaining so-far)
                ; (display (list 'helper remaining so-far)) (newline)
                (if (null? remaining)
                    so-far
                    (helper (cdr remaining)
                            (list-append so-far
                                         (list (+ 1 (car remaining)))))))])
      (helper nums null))))

(define list-append
  (lambda (from to)
    (if (null? from)
        to
        (cons (car from) (list-append (cdr from) to)))))
```

Let's uncomment the call to `display` and see what happens.

```racket
> (increment-list-2 (list 1 2 3 4 5))
(helper (1 2 3 4 5) ())
(helper (2 3 4 5) (2))
(helper (3 4 5) (2 3))
(helper (4 5) (2 3 4))
(helper (5) (2 3 4 5))
(helper () (2 3 4 5 6))
'(2 3 4 5 6)
```

Yay!  We've kept `so-far` in the correct order, and don't need to reverse it.

So why don't we have you use that pattern?  Let's explore the associated costs.

Determine how many times `list-append` will be called in evaluating `(increment-list-2 '(1 2 3 4))`.

You may either (a) use your mental model of computation, (b) instrument the code to print or count, or (c) logically analyze the code. In addition to the final count, show your work---either (a) an execution trace if you use your mental model, (b) the instrumented code if you instrument the code, or (c) an explanation of your analysis, if you analyze.  You can also do more than one of those, if you'd like to check yourself.


