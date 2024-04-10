---
title: "Sample LA: Vectors"

_Design and write functions (potentially recursive functions) that utilize vectors._

Write a procedure, `(vector-product nums)` that finds the product of the numbers in in a vector that contains only numbers.

```
(test-= "normal case: short vector with 1"
        (vector-product (vector 4 1 3))
        12
        0)
(test-= "normal case: includes negatives"
        (vector-product (vector -3 1 7 2))
        -42
        0)
(test-= "normal case: mixed types, includes complex"
        (vector-product (vector 2 3+4i))
        6+8i
        0)
(test-= "edge case: empty vector"
        (vector-product (vector))
        1
        0)
(test-= "edge case: includes 0"
        (vector-product (vector 1 2 3 0))
        0
        0)
```

## Vectors (Extra)

Consider the following recursive procedure that adds all of the numbers in a vector of numbers.

```
(define vector-sum  
  (lambda (vec)
    (vector-sum/helper vec 0)))

(define vector-sum/helper
  (lambda (vec pos)
    (if (< pos len)
        (+ (vector-ref vec pos)
           (vector-sum/helper vec (+ pos 1)))
        0))]
```

Trace the evaluation of `(vector-sum (vector 3 5 7 11))`.  You can skip to the consequent or alternate of the `if` without showing the `if` iteself.  You can also do simple steps (e.g., adding one or looking up a value in a vector) in parallel.

```
    (vector-sum '#(3 5 7 11))
--> (helper '#(3 5 7 11) 0)
    ; 0 < 4
--> (+ (vector-ref '#(3 5 7 11) 0) (helper '#(3 5 7 11) (+ 0 1)))
--> (+ 3 (helper '#(3 5 7 11) 1))
```

## Vectors (Extra)

Consider the following recursive procedure that adds all of the numbers in a vector of numbers. (This one is a bit different than the previous one.)

```
(define vector-sum  
  (lambda (vec)
    (let ([len (vector-length vec)])
      (letrec ([helper
                (lambda (pos sum-so-far)
                  (if (< pos len)
                      (helper (+ pos 1)
                              (+ sum-so-far (vector-ref vec pos)))
                      sum-so-far))])
        (helper 0 0)))))
```

Trace the evaluation of `(vector-sum (vector 3 5 7 11))`.  You can skip to the consequent or alternate of the `if` without showing the `if` iteself.  You can also do simple steps (e.g., adding one or looking up a value in a vector) in parallel.

```
    (vector-sum '#(3 5 7 11))
--> (helper 0 0)
    ; 0 < 4
--> (helper (+ pos 1) (+ 0 (vector-ref vec pos)))
--> (helper 1 (+ 0 3))
--> (helper 1 3)
```

## Vectors (Extra)

Write a procedure, `(vector-swap-neighbors! vec)` that takes an even-length vector as a parameter and swaps the neighboring elements (those at indices 0 and 1, those at indices 2 and 3, etc.).

```
> (define vec (vector 'a 'b 'c 'd 'e 'f))
> (vector-swap-neighbors! (vector 'a 'b 'c 'd 'e 'f))
> vec
'#(b a d c f e)
```

_Hint: You will find a let binding helpful._
