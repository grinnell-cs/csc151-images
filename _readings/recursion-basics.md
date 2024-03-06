---
title: Recursion basics
summary: |
  We explore the idea that we frequently can decompose a problem into a smaller version of itself: *recursive decomposition*.
---

In this course, we focus on the idea of *algorithmic decomposition*---solving a problem by solving relevant sub-problems.
And we realize a particular decomposition through functions.
For example, consider a familiar image from a previous reading:

![A cottage in a forest.]({{ "/images/decomposition-forest.png" | relative_url }}).

We broke up this cottage into smaller sub-images, *e.g.*:

+ Trees.
+ The cottage itself.

We then wrote functions that drew trees and the cottage and them composed them together to form the final picture.

However, what about this image?

![Nested blue triangle outlines.]({{ "/images/nested-triangles.png" | relative_url }})

How can we decompose this image?
The way that we might decompose this problem now is to recast it as a list transformation problem, transforming the list `'(0 1 2 3 4)` into a collection of blue triangles that are combined with `overlay`.

Let's consider an alternative decomposition.

![An outline of a blue triangle with a solid triangle representing the remaining work.]({{ "/images/triangle-with-hole.png" | relative_url }})

Here, we can decompose the problem into two sub-problems:

1. Creating the outermost triangle (the outline)
2. Creating the rest of the triangles (the solid triangle).

And then we can combine the results with overlay.
We know how to create the outermost triangle with a call to `triangle`.
But what about the rest of the triangles?

The answer to this question is the insight that we'll study for the next part of this course:

> The problem of creating the rest of the triangles is **the original problem, just smaller**.
> It is smaller by exactly one triangle.

This idea that we can decompose a problem into a **smaller version of itself** is called *recursion*.
Recursion is a cornerstone of algorithmic design in computer science.
Many problems are expressed beautifully and concisely using recursion.
However, recognizing that a problem can be decomposed using recursion requires substantial practice, so we will take our time working through and understanding this approach to problem solving.

## Interpreting lists recursively

We introduced *lists* as a fundamental data structure earlier in the course.
For example, here is a picture that represents the list `'(1 2 3 4 5)`.

![A list of the numbers 1 through 5.]({{ "/images/list-of-5-example.png" | relative_url }})

A *recursive interpretation* of a data structure involves being able to express that data structure in terms of a smaller version of itself.
In other words, where in this overall list do we see a small list lurking?
The interpretation that we use in Racket is the following:

![A list with the head element as 1 and the rest of the list unknown.]({{ "/images/list-of-5-example-head.png" | relative_url }})

Here, we identify the *head element* of the list which is 1.
By doing this, we can see that the rest of the list or *its tail* is simply the remainder of the elements---they form a smaller list!

We can also think of lists in the opposite way, building up from the empty list to any list.  That is,

* The empty list is a list.
* The result of putting any value at the front of a list is a list.

In Racket, the `car` and `cdr` functions (pronounced "car" and "could-er", respectively) allow us to decompose a list in this manner, respectively:

~~~racket
> (car (list 1 2 3 4 5))
1
> (cdr (list 1 2 3 4 5))
(list 2 3 4 5)
~~~

Note that these functions only "make sense" when the list in question is non-empty.
If we try calling these functions with empty lists (`null`, `(list)`, or `'()`), we receive errors:

~~~racket
> (car null)
car: contract violation
    expected: pair?
    given: '()
> (cdr null)
cdr: contract violation
    expected: pair?
    given: '()
~~~

Note that these errors say that `pair` is expected instead of a `list`.
There's a specific reason why the error says this, but for now, just note that if you call `car` and `cdr` on empty lists, you'll receive these errors.

To ensure that we don't call `car` and `cdr` on an empty list, we can use the `null?` function which takes a list as input and returns `#t` if and only if the list is empty, *i.e.*, *null*.
As an example, here is a use of `car`, `cdr`, and `null?` in combination to define a function `singleton?` that returns `#t` if the input list contains exactly one element.

~~~racket
(define singleton?
  (lambda (lst)
    (if (null? lst) 
        #f
        (null? (cdr lst)))))
~~~

Note that we can read this code as follows:

+   If the list is empty, then it *is not* a singleton.
+   Otherwise, the list is a singleton if the tail of the list is empty.
    We know this because in the else-branch of the conditional, we know the list contains at least one element, its head.
    So it is sufficient to check to see if the tail is empty which would imply there are no more elements other than the first.

Those who have embraced [the Zen of Booleans](../handouts/zen-of-booleans) might express `singleton?` as

```drracket
(define singleton?
  (lambda (lst)
    (and (not (null? lst))
         (null? (cdr lst)))))
```

Both versions align with our *recursive definition of a list*:

> A list is either:
> +   *Empty* or
> +   *Non-empty* with a *head* element and the rest of the list, called its *tail*.

`car`, `cdr`, and `null?` allow us to *use* with lists using this particular decomposition in mind.

We can *build* lists using this head-tail distinction with the `cons` function.
`(cons x xs)` creates a new list by appending the element `x` to the front of the list `xs`.

~~~racket
> (cons 1 (list 2 3 4 5))
'(1 2 3 4 5)
~~~

Because the second argument to `cons` is a smaller list, we can use `cons` repeatedly to obtain the same effect as our list literal syntax:

~~~racket
> (list 1 2 3 4 5)
'(1 2 3 4 5)
> (cons 1
    (cons 2
      (cons 3
        (cons 4
          (cons 5 null)))))
'(1 2 3 4 5)
~~~

`null` here is another way to write `'()`, the empty list.

## An example: summation

With our new list functions, let's define a procedure called `sum` that takes one argument, a list of numbers, and returns the result of adding all of the elements of the list together:

```
> (sum (list 91 85 96 82 89))
443
> (sum (list -17 17 12 -4))
8
> (sum (list 9.3))
9.3
> (sum null)
0
```

You already know one way to compute `sum`: You just `reduce` the list with the `+` function.
But let's try to implement `sum` not with `reduce` but recursive decomposition instead!

How can we decompose the problem of implementing `sum` using our recursive definition of a list?
We first recognize that `null?` allows us to easily express the *two cases* we outlined in the definition:

+ `null?` is `#t`: how do we `sum` an empty list?
+ `null?` is `#f`: how do we `sum` a non-empty list?

This leads us to the following initial skeleton for `sum`:

~~~racket
(define sum
  (lambda (numbers)
    (if (null? numbers)
        ; The sum of an empty list
        ; The sum of a non-empty list
    )))
~~~

The sum of the empty list is easy---since there's nothing to add, so the total is 0.
However, what about the non-empty list case?
Well, we know that since the list is non-empty that `car` and `cdr` work on the list.
Let's revisit the concrete list from before: a list containing `1` at the head with an unknown set of elements as its tail:

![A list with the head element as 1 and the rest of the list unknown.]({{ "/images/list-of-5-example-head.png" | relative_url }})

If this list is `numbers` then `(car numbers)` produces `1` and `(cdr numbers)` produces the tail of the list (filled in to represent the fact that we don't immediately know its contents).

How can we decompose the sum of `numbers` in terms of these components?
If we had a way to sum up the tail of the list, we could simply add the head of the list to the result.
In code, this is expressed as:

```racket
(+ (car numbers) ??)
```

Where `??` is the hole we need to fill in with "sum the tail."
The tail is expressed with `(cdr numbers)`; we just need a function to that sums up the elements of a list for us.
Luckily, *that is exactly the function we are defining right now*:

~~~racket
(+ (car numbers) (sum (cdr numbers)))
~~~

Here, the `sum` function is being called in its own definition.
This is called a *recursive function call*.
If we believe that such a function call works, then we see that our decomposition is valid.
The sum of the elements of a list is the head of list added to the sum of the tail.

As we put it together into a complete procedure, we'll also add some documentation.

```racket
;;; (sum numbers) -> number?
;;;   numbers : listof number?
;;; Returns the sum of the numbers in the list.
(define sum
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (car numbers) (sum (cdr numbers))))))
```

### Recursion and our mental model of computation

At first, this may look strange or magical, like a circular definition: if Scheme has to know the meaning of `sum` before it can process the definition of `sum`, how does it ever get started?
Our mental model can show us how this function computes!

Let's consider a simple example: `(sum (list 5 8 2))`.
(We'll skip a few intermediate steps along the way to highlight the relevant parts of the derivation.)

1.  The argument to `sum` is a value, so we go ahead and substitute for the body of the function:

    ```racket
        (sum (list 5 8 2))
    --> (if (null? (list 5 8 2))
            0
            (+ (car (list 5 8 2)) (sum (cdr (list 5 8 2)))))
    ```
2.  The list `(list 5 8 2)` is non-empty, so `null` evaluates to `#f`.
    This means the conditional evaluates to its else-branch:

    ~~~racket
        (if (null? (list 5 8 2))
            0
            (+ (car (list 5 8 2)) (sum (cdr (list 5 8 2)))))
    --> (if #f
            0
            (+ (car (list 5 8 2)) (sum (cdr (list 5 8 2)))))
    --> (+ (car (list 5 8 2)) (sum (cdr (list 5 8 2)))))
    ~~~

3.  `(car (list 5 8 2))` evaluates to `5` and `(cdr (list 5 8 2))` evaluates to `(8 2)`.
    This leads to the following simplified expression:

    ```racket
        (+ (car (list 5 8 2)) (sum (cdr (list 5 8 2)))))
    --> (+ 5 (sum (cdr (list 5 8 2)))))
    --> (+ 5 (sum (list 8 2)))
    ```

4.  Now, we substitute for the body of `sum` again but this time passing the argument `(list 8 2)`:

    ```racket
        (+ 5 (sum (list 8 2)))
    --> (+ 5 (if (null? (list 8 2))
                 0
                 (+ (car (list 8 2)) (sum (cdr (list 8 2))))))
    ```

5.  Note that the `(+ 5 ...)` from the original call to `sum` is waiting to be evaluated, but we must first deal with this new conditional!
    Also note that we're in a similar situation as step 2 except that the list in question is `(list 8 2)` instead of `(list 5 8 2)`.
    To proceed, we note that `(list 8 2)` is non-null, so we evaluate to the else branch.
    Evaluating `(car (list 8 2))` yields `8` and `(cdr (list 8 2))` yields `(list 2)`, the list containing just `2`.
    This gives us the following derivation:

    ```racket
        (+ 5 (if (null? (list 8 2))
                 0
                 (+ (car (list 8 2)) (sum (cdr (list 8 2))))))
    --> (+ 5 (if #f
                  0
                  (+ (car (list 8 2)) (sum (cdr (list 8 2))))))
    --> (+ 5 (+ (car (list 8 2)) (sum (cdr (list 8 2)))))
    --> (+ 5 (+ 8 (sum (cdr (list 8 2)))))
    --> (+ 5 (+ 8 (sum (list 2))))
    ```

6.  At this point, you can see a pattern---we'll peel off each element from the list going from left-to-right.
    That element becomes part of the overall sum.
    As an check, you will work through the derivation from the expression above to this state:

    ```racket
        (+ 5 (+ 8 (sum (list 2))))
    --> ...
    --> (+ 5 (+ 8 (+ 2 (sum '()))))
    ```

    But what happens now when `sum` is passed the empty list?
    Let's substitute one more time and find out:

    ```racket
        (+ 5 (+ 8 (sum '())))
    --> ...
    --> (+ 5 (+ 8 (+ 2 (if (null? '())
                           0
                           (+ (car '()) (sum (cdr '())))))))
    ```

7.  Finally, the input list is the empty list, so our conditional goes into the if-branch:

    ```racket
        (+ 5 (+ 8 (+ 2 (if (null? '())
                           0
                           (+ (car '()) (sum (cdr '())))))))
        (+ 5 (+ 8 (+ 2 (if #t
                           0
                           (+ (car '()) (sum (cdr '())))))))
    --> (+ 5 (+ 8 (+ 2 0)))
    ```

    You may have been worried that `(car '())` and `(cdr '())` are invalid expressions.  Fortunately, `if` does not behave like most procedure and only evaluates its final parameter (the false part) when the guard is false.
    In this case, the guard was true, and so we never got to the invalid expressions.

8.  We see that the final call to `sum` yields 0.
    From here, we finally compute the sum, giving us the final result:

    ```racket
        (+ 5 (+ 8 (+ 2 0)))
    --> (+ 5 (+ 8 2))
    --> (+ 5 10)
    --> 15
    ```

## Self checks

### Check 1: Complete the missing part (‡)

Fill in the missing steps of the derivation from step 6 above:

```racket
    (+ 5 (+ 8 (sum (list 2))))
--> ...
--> (+ 5 (+ 8 (+ 2 (sum '()))))
```

### Check 2: To infinity and beyond (‡)

Consider the following erroneous definition of `sum`:

~~~racket
(define awesum
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (awesum lst)))))
~~~

The only difference between `awesum` and `sum` is that we passed `lst` rather than `(cdr lst)` to the recursive call.

What happens if we call `(awesum (list 5 2))`?
Use your mental model to predict the result, and then check your result in DrRacket.
**Make sure to save your work before checking!**
Explain your findings in a few sentences!

