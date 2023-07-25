---
title: Tracing `alphabetically-first`
---
# {{ page.title }}

A [recent laboratory](../labs/recursion-practice) had a problem in which
students were asked to write a procedure that finds the alphabetically
first string in a non-empty list of strings.

There were two basic approaches.

Some students came up with a solution similar to that for `longest-string`
from [the recursion magic reading](../readings/recursion-magic).
That solution involved writing a helper procedure that takes two
strings and finds the one of those two strings that comes first.

```
(define alphabetically-first
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (first-of-two (car lst)
                      (alphabetically-first (cdr lst))))))

(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))
```

Others did something a bit different.

```
(define alphabetically-first
  (lambda (lst)
    (cond
      [(null? (cdr lst))
       (car lst)]
      [(string-ci<=? (car lst)
                     (alphabetically-first (cdr lst)))
       (car lst)]
      [else
       (alphabetically-first (cdr lst))])))
```

Both are correct.  However, the second has a subtle issue.  It's not
a problem right now; you are just learning recursion and your goal
is correct code, not necessarily the most elegant or most efficient
code.  But I thought it would be a good exercise in recursive tracing
to consider the subtle issue in that code.

So let's try the second on a few short lists.

```
      (alphabetically-first '("a" "b" "c"))

      ; Procedure call, insert body and substitute
-01-> (cond
        [(null? (cdr '("a" "b" "c")))
         (car '("a" "b" "c"))]
        [(string-ci<=? (car '("a" "b" "c"))
                       (alphabetically-first (cdr '("a" "b" "c"))))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; To check the first guard, we need to evaluate its parameter
-02-> (cond
        [(null? '("b" "c"))
         (car '("a" "b" "c"))]
        [(string-ci<=? (car '("a" "b" "c"))
                       (alphabetically-first (cdr '("a" "b" "c"))))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; The list '("b" "c") is not null, so we drop that clause.
-03-> (cond
        [(string-ci<=? (car '("a" "b" "c"))
                       (alphabetically-first (cdr '("a" "b" "c"))))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; We're ready to try the second guard.  We evaluate the car
-04-> (cond
        [(string-ci<=? "a"
                       (alphabetically-first (cdr '("a" "b" "c"))))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; We need to evaluate that recursive call, but first, we take the cdr.
-05-> (cond
        [(string-ci<=? "a"
                       (alphabetically-first '("b" "c")))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; We can now expand the recursive call
-06-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(null? (cdr '("b" "c")))
                          (car '("b" "c"))]
                         [(string-ci<=? (car '("b" "c"))
                                        (alphabetically-first (cdr '("b" "c"))))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; To evaluate the first guard, we need to do the cdr
-07-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(null? '("c"))
                          (car '("b" "c"))]
                         [(string-ci<=? (car '("b" "c"))
                                        (alphabetically-first (cdr '("b" "c"))))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

       ; The list '("c") is not null.  We drop the clause.
-08-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? (car '("b" "c"))
                                        (alphabetically-first (cdr '("b" "c"))))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; To evaluate the guard, we need to take the car
-09-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? "b"
                                        (alphabetically-first (cdr '("b" "c"))))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; To evaluate the recursive call, we need the cdr.
-10-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? "b"
                                        (alphabetically-first '("c")))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; And we can do the recursive call
-11-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? "b"
                                        (cond
                                          [(null? (cdr '("c")))
                                           (car '("c"))]
                                          [(string-ci<=? (car '("c"))
                                                         (alphabetically-first (cdr '("c"))))
                                           (car '("c"))]
                                          [else
                                           (alphabetically-first (cdr '("c")))]))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; To evaluate the first guard of that new cond, we need to take the cdr
-12-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? "b"
                                        (cond
                                          [(null? '())
                                           (car '("c"))]
                                          [(string-ci<=? (car '("c"))
                                                         (alphabetically-first (cdr '("c"))))
                                           (car '("c"))]
                                          [else
                                           (alphabetically-first (cdr '("c")))]))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; The guard holds!  Use the consequent.
-13-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? "b"
                                        (car '("c")))
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; Take the car
-14-> (cond
        [(string-ci<=? "a"
                       (cond
                         [(string-ci<=? "b"
                                        "c")
                          (car '("b" "c"))]
                         [else
                          (alphabetically-first (cdr '("b" "c")))]))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; (string-ci<=? "b" "c") holds.  Take the consequent
-15-> (cond
        [(string-ci<=? "a"
                       (car '("b" "c")))
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; To evaluate the `string-ci<=?`, we need to take the car
-16-> (cond
        [(string-ci<=? "a"
                       "b")
         (car '("a" "b" "c"))]
        [else
         (alphabetically-first (cdr '("a" "b" "c")))])

      ; (string-ci<=? "a" "b") holds.  We take the consequent
-17-> (car '("a" "b" "c"))

      ; And then the car
-18-> "a"
```

Wow!  That expanded a lot in the middle of the trace, didn't it?
But it collapsed quickly once we finished with the base case, as
recursive procedures often do.  If I count correctly, there were
about eighteen steps in the derivation.

What happens if we use a slightly different list, say `("e" "d" "c")`?
In this case, the alphabetically first string appears at the end of
the list, rather than the beginning.

The reduction to the base case is remarkably similar.  Feel free to
skip to the end of this code section (14 steps) before we move on to the
differences.


```
      (alphabetically-first '("e" "d" "c"))

      ; Procedure call, insert body and substitute
-01-> (cond
        [(null? (cdr '("e" "d" "c")))
         (car '("e" "d" "c"))]
        [(string-ci<=? (car '("e" "d" "c"))
                       (alphabetically-first (cdr '("e" "d" "c"))))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; To check the first guard, we need to evaluate its parameter
-02-> (cond
        [(null? '("d" "c"))
         (car '("e" "d" "c"))]
        [(string-ci<=? (car '("e" "d" "c"))
                       (alphabetically-first (cdr '("e" "d" "c"))))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; The list '("d" "c") is not null, so we drop that clause.
-03-> (cond
        [(string-ci<=? (car '("e" "d" "c"))
                       (alphabetically-first (cdr '("e" "d" "c"))))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; We're ready to try the second guard.  We evaluate the car
-04-> (cond
        [(string-ci<=? "e"
                       (alphabetically-first (cdr '("e" "d" "c"))))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; We need to evaluate that recursive call, but first, we take the cdr.
-05-> (cond
        [(string-ci<=? "e"
                       (alphabetically-first '("d" "c")))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; We can now expand the recursive call
-06-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(null? (cdr '("d" "c")))
                          (car '("d" "c"))]
                         [(string-ci<=? (car '("d" "c"))
                                        (alphabetically-first (cdr '("d" "c"))))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; To evaluate the first guard, we need to do the cdr
-07-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(null? '("c"))
                          (car '("d" "c"))]
                         [(string-ci<=? (car '("d" "c"))
                                        (alphabetically-first (cdr '("d" "c"))))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

       ; The list '("c") is not null.  We drop the clause.
-08-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? (car '("d" "c"))
                                        (alphabetically-first (cdr '("d" "c"))))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))]))

      ; To evaluate the guard, we need to take the car
-09-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? "d"
                                        (alphabetically-first (cdr '("d" "c"))))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; To evaluate the recursive call, we need the cdr.
-10-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? "d"
                                        (alphabetically-first '("c")))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; And we can do the recursive call
-11-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? "d"
                                        (cond
                                          [(null? (cdr '("c")))
                                           (car '("c"))]
                                          [(string-ci<=? (car '("c"))
                                                         (alphabetically-first (cdr '("c"))))
                                           (car '("c"))]
                                          [else
                                           (alphabetically-first (cdr '("c")))]))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; To evaluate the first guard of that new cond, we need to take the cdr
-12-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? "d"
                                        (cond
                                          [(null? '())
                                           (car '("c"))]
                                          [(string-ci<=? (car '("c"))
                                                         (alphabetically-first (cdr '("c"))))
                                           (car '("c"))]
                                          [else
                                           (alphabetically-first (cdr '("c")))]))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; The guard holds!  Use the consequent.
-13-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? "d"
                                        (car '("c")))
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; Take the car
-14-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(string-ci<=? "d"
                                        "c")
                          (car '("d" "c"))]
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])
```

As we said, this part was more or less identical.  But now things change.
The guard that worked last time (when we compared `"b"` to `"c"` doesn't
hold.  Let's see what difference that makes.

```
      ; (string-ci<=? "d" "c") fails.  On to the next clause.
-15-> (cond
        [(string-ci<=? "e"
                       (cond
                         [else
                          (alphabetically-first (cdr '("d" "c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; When we're down to the else.  We use the alternate part.
-16-> (cond
        [(string-ci<=? "e"
                       (alphabetically-first (cdr '("d" "c"))))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; Before we can do the recursive call, we need to take the `cdr`
-17-> (cond
        [(string-ci<=? "e"
                       (alphabetically-first '("c")))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; We can now expand `(alphabetically-first '("c"))`, which seems familiar
-18-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(null? (cdr '("c")))
                          (car '("c"))]
                         [(string-ci<=? (car '("c"))
                                        (alphabetically-first (cdr '("c"))))
                          (car '("c"))]
                         [else
                          (alphabetically-first (cdr '("c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; To evaluate the first guard, we need to evaluate (cdr '("c"))
-19-> (cond
        [(string-ci<=? "e"
                       (cond
                         [(null? '())
                          (car '("c"))]
                         [(string-ci<=? (car '("c"))
                                        (alphabetically-first (cdr '("c"))))
                          (car '("c"))]
                         [else
                          (alphabetically-first (cdr '("c")))]))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; The guard holds.  We replace the inner `cond` by the consequent
-20-> (cond
        [(string-ci<=? "e"
                       (car '("c")))
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])
```

Things are looking good, aren't they?  The expression is getting
shorter again.  But we did seem to do an extra call to
`(alphabetically-first '("c"))`, and we're also already at twenty
or so steps.  Let's see how things go.

```
      ; To evaluate the string-ci<=?, we need (car '("c")).
-21-> (cond
        [(string-ci<=? "e"
                       "c")
         (car '("e" "d" "c"))]
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; (string-ci<=? "e" "c") does not hold.  Drop the clause.
-22-> (cond
        [else
         (alphabetically-first (cdr '("e" "d" "c")))])

      ; When all you're left with in an else, use the alternate
-23-> (alphabetically-first (cdr '("e" "d" "c")))

      ; Before we can evaluate the recursive call, we must take the cdr
-24-> (alphabetically-first '("d" "c"))

      ; And we can expand
-25-> (cond
        [(null? (cdr '("d" "c")))
         (car '("d" "c"))]
        [(string-ci<=? (car '("d" "c"))
                       (alphabetically-first (cdr '("d" "c"))))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; Before we can evaluate the first guard, we need to evaluate the cdr.
-26-> (cond
        [(null? '("c"))
         (car '("d" "c"))]
        [(string-ci<=? (car '("d" "c"))
                       (alphabetically-first (cdr '("d" "c"))))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; The first guard does not hold, so drop the first block
-27-> (cond
        [(string-ci<=? (car '("d" "c"))
                       (alphabetically-first (cdr '("d" "c"))))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; To evaluate the string-ci<=?, we need to take the car.
-28-> (cond
        [(string-ci<=? "d"
                       (alphabetically-first (cdr '("d" "c"))))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; Before we can do the recursive call, we need to take the cdr
-29-> (cond
        [(string-ci<=? "d"
                       (alphabetically-first '("c")))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; And it's time to expand (alphabetically-first '("c"))
-30-> (cond
        [(string-ci<=? "d"
                       (cond
                         [(null? (cdr '("c")))
                          (car '("c"))]
                         [(string-ci<=? (car '("c"))
                                        (alphabetically-first (cdr '("c"))))
                          (car '("c"))]
                         [else
                          (alphabetically-first (cdr '("c")))]))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; To evaluate the first guard, we need (cdr '("c"))
-31-> (cond
        [(string-ci<=? "d"
                       (cond
                         [(null? '())
                          (car '("c"))]
                         [(string-ci<=? (car '("c"))
                                        (alphabetically-first (cdr '("c"))))
                          (car '("c"))]
                         [else
                          (alphabetically-first (cdr '("c")))]))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; The first guard holds, so we can just use the consequent.
-32-> (cond
        [(string-ci<=? "d"
                       (car '("c")))
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; We need to evaluate (car '("c"))
-33-> (cond
        [(string-ci<=? "d"
                       "c")
         (car '("d" "c"))]
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; (string-ci<=? "d" "c") does not hold.  Drop the clause.
-34-> (cond
        [else
         (alphabetically-first (cdr '("d" "c")))])

      ; (string-ci<=? "d" "c") does not hold.  Drop the clause.
-35-> (alphabetically-first (cdr '("d" "c")))

      ; Take the cdr.
-36-> (alphabetically-first '("c"))
```

If I count correctly, we're about to head into our fourth call to
`(alphabetically-first '("c"))`.  Strange, isn't it?

```
      ; Expand the call to `alphabetically-first`
-37-> (cond
        [(null? (cdr '("c")))
         (car '("c"))]
        [(string-ci<=? (car '("c"))
                       (alphabetically-first (cdr '("c"))))
         (car '("c"))]
        [else
         (alphabetically-first (cdr '("c")))])

      ; Evaluate the cdr in the first guard
-38-> (cond            
        [(null? '())
         (car '("c"))]    
        [(string-ci<=? (car '("c"))
                       (alphabetically-first (cdr '("c"))))
         (car '("c"))]    
        [else            
         (alphabetically-first (cdr '("c")))])

      ; The first guard holds.  Use the consequent
-39-> (car '("c"))

      ; Evaluate the car
-40-> "c"
```

Wow!  A lot more steps going from an in-order list to a backwards-order
list.  In part, that's because we evaluated `(alphabetically-first
'("b" "c"))` twice and `(alphabetically-first '("c"))` four times.
Why did that happen?  Because we have *two* recursive calls in our
definition, rather than one.  We'll come back to that issue later.

How about the first definition of `alphabetically-first`?  Let's remind 
ourselves of that definition.

```
(define alphabetically-first
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (first-of-two (car lst)
                      (alphabetically-first (cdr lst))))))

(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))
```

Here we go.

```
      (alphabetically-first '("a" "b" "c"))

      ; Expand the call
-01-> (if (null? (cdr '("a" "b" "c")))
          (car '("a" "b" "c"))
          (first-of-two (car '("a" "b" "c"))
                        (alphabetically-first (cdr '("a" "b" "c")))))

      ; Take the cdr
-02-> (if (null? '("b" "c"))
          (car '("a" "b" "c"))
          (first-of-two (car '("a" "b" "c"))
                        (alphabetically-first (cdr '("a" "b" "c")))))

      ; The test does not hold, use the alternate
-03-> (first-of-two (car '("a" "b" "c"))
                    (alphabetically-first (cdr '("a" "b" "c"))))

      ; Take the car
-04-> (first-of-two "a"
                    (alphabetically-first (cdr '("a" "b" "c"))))

      ; Take the cdr
-05-> (first-of-two "a"
                    (alphabetically-first '("b" "c")))

      ; Expand the call
-06-> (first-of-two "a"
                    (if (null? (cdr '("b" "c")))
                        (car '("b" "c"))
                        (first-of-two (car '("b" "c"))
                                      (alphabetically-first (cdr '("b" "c"))))))

      ; Take the cdr
-07-> (first-of-two "a"
                    (if (null? '("c"))
                        (car '("b" "c"))
                        (first-of-two (car '("b" "c"))
                                      (alphabetically-first (cdr '("b" "c"))))))

      ; The test does not hold, use the alternate
-08-> (first-of-two "a"
                    (first-of-two (car '("b" "c"))
                                  (alphabetically-first (cdr '("b" "c")))))

      ; Evaluate the car
-09-> (first-of-two "a"
                    (first-of-two "b"
                                  (alphabetically-first (cdr '("b" "c")))))

      ; Evaluate the cdr
-10-> (first-of-two "a"
                    (first-of-two "b"
                                  (alphabetically-first '("c"))))


      ; Expand the recursive call
-11-> (first-of-two "a"
                    (first-of-two "b"
                                  (if (null? (cdr '("c")))
                                      (car '("c"))
                                      (first-of-two (car '("c"))
                                                    (alphabetically-first (cdr '("c")))))))

      ; Evaluate the cdr
-12-> (first-of-two "a"
                    (first-of-two "b"
                                  (if (null? '())
                                      (car '("c"))
                                      (first-of-two (car '("c"))
                                                    (alphabetically-first (cdr '("c")))))))

      ; The test holds.  Use the consequent.
-13-> (first-of-two "a"
                    (first-of-two "b"
                                  (car '("c"))))

      ; Evaluate the car
-14-> (first-of-two "a"
                    (first-of-two "b"
                                  "c"))

      ; Expand the call to (first-of-two "b" "c")
-15-> (first-of-two "a"
                    (if (string-ci<=? "b" "c")
                        "b"
                        "c"))

      ; The test holds, use the consequent.
-16-> (first-of-two "a"
                    "b")

      ; Expand the call to (first-of-two "a" "b")
-17-> (if (string-ci<=? "a" "b")
          "a"
          "b")))

      ; The guard holds, so we return the consequent
-18-> "a"
```

The same number of steps as the other version of `alphabetically-first`.
Perhaps there's a bit less "extra work" sitting around that we discard.
But what happens if we try the list in the opposite order, computing
`(alphabetically-first '("e" "d" "c")?  Once again, the first fourteen 
or so steps are the same.

```
      (alphabetically-first '("e" "d" "c"))

      ; Expand the call
-01-> (if (null? (cdr '("e" "d" "c")))
          (car '("e" "d" "c"))
          (first-of-two (car '("e" "d" "c"))
                        (alphabetically-first (cdr '("e" "d" "c")))))

      ; Take the cdr
-02-> (if (null? '("d" "c"))
          (car '("e" "d" "c"))
          (first-of-two (car '("e" "d" "c"))
                        (alphabetically-first (cdr '("e" "d" "c")))))

      ; The test does not hold, use the alternate
-03-> (first-of-two (car '("e" "d" "c"))
                    (alphabetically-first (cdr '("e" "d" "c"))))

      ; Take the car
-04-> (first-of-two "e"
                    (alphabetically-first (cdr '("e" "d" "c"))))

      ; Take the cdr
-05-> (first-of-two "e"
                    (alphabetically-first '("d" "c")))

      ; Expand the call
-06-> (first-of-two "e"
                    (if (null? (cdr '("d" "c")))
                        (car '("d" "c"))
                        (first-of-two (car '("d" "c"))
                                      (alphabetically-first (cdr '("d" "c"))))))

      ; Take the cdr
-07-> (first-of-two "e"
                    (if (null? '("c"))
                        (car '("d" "c"))
                        (first-of-two (car '("d" "c"))
                                      (alphabetically-first (cdr '("d" "c"))))))

      ; The test does not hold, use the alternate
-08-> (first-of-two "e"
                    (first-of-two (car '("d" "c"))
                                  (alphabetically-first (cdr '("d" "c")))))

      ; Evaluate the car
-09-> (first-of-two "e"
                    (first-of-two "d"
                                  (alphabetically-first (cdr '("d" "c")))))

      ; Evaluate the cdr
-10-> (first-of-two "e"
                    (first-of-two "d"
                                  (alphabetically-first '("c"))))


      ; Expand the recursive call
-11-> (first-of-two "e"
                    (first-of-two "d"
                                  (if (null? (cdr '("c")))
                                      (car '("c"))
                                      (first-of-two (car '("c"))
                                                    (alphabetically-first (cdr '("c")))))))

      ; Evaluate the cdr
-12-> (first-of-two "e"
                    (first-of-two "d"
                                  (if (null? '())
                                      (car '("c"))
                                      (first-of-two (car '("c"))
                                                    (alphabetically-first (cdr '("c")))))))

      ; The test holds.  Use the consequent.
-13-> (first-of-two "e"
                    (first-of-two "d"
                                  (car '("c"))))

      ; Evaluate the car
-14-> (first-of-two "e"
                    (first-of-two "d"
                                  "c"))
```

What happens next?

```
      ; Expand the call to (first-of-two "d" "c")
-15-> (first-of-two "e"
                    (if (string-ci<=? "d" "c")
                        "d"
                        "c"))

      ; The test does not hold, use the alternate.
-16-> (first-of-two "e"
                    "c")

      ; Expand the call to (first-of-two "e" "d")
-17-> (if (string-ci<=? "e" "d")
          "e"
          "d")))

      ; The guard does not hold, so we return the alternate.
-18-> "e"
```

Wow!  This one took eighteen steps whether the list was in order or
backwards.  In fact, since it always boils down to `(first-of-two val1 (first-of-two val2 val3))`, it will take eighteen steps for any three-element list.

Is there a moral here?  There are a few.

* Decompose the problem and use helpers!
* Beware of situations in which you make the same recursive call twice.

We'll return to these issues later in the semester.
