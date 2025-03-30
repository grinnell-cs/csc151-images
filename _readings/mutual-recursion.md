---
title: Mutual recursion
summary: |
 We consider the idea of _mutual recursion_, a design strategy in which we have  mulitple procedures that call each other.
---

_This reading is under development._

At times, we'll find that we have situations in which we have two (or more) similar tasks to complete that seem to involve recursion. In such situations, it may be best to write _mutually recursive_ procedures; procedures that call each other recursively.

## An example

Here's one example. Suppose we want to check if a list consists of alternating strings and numbers. We'll call the procedure to check that `alternating-strings-and-numbers?`.

### Our first approach

One approach would be to write `alternating-strings-and-numbers?` directly.

This procedure seems to have four base cases.

* If the list contains no elements, then it has alternating strings and numbers.
* If the list starts with something other than a string, it doesn't contain alternating strings and numbers.
* If the list has more than one element, the first element is a string, and the second element is not a number, then the list doesn't contain alternating strings and numbers.
* If the list contains only one element, and that element is a string, then it has alternating strings and numbers.

In the recursive case, we've assured ourselves that the first element is a string and the second element is a number. So we must recurse on the `cddr`.

Putting it all together, we get the following.

```
(define alternating-strings-and-numbers?
  (lambda (lst)
    (cond
      [(null? lst)
       #t]
      [(not (string? (car lst)))
       #f]
      ; if we've reached this point, we know the car is a string.
      [(null? (cdr lst))] 
       #t]
      ; If we've reached this point, we know that the list has at least
      ; two elements.
      [(not (number? (cadr lst)))
       #f]
      ; If we've reached this point, we know that the list has at least
      ; two elements and the first two are a string and a number. We
      ; need to check the rest.
      [else
       (alternating-strings-and-numbers? (cddr lst))]
```

That's a bit cumbersome, isn't it?

### A mutually recursive approach

Let's consider an alternate approach. We're going to write two related procedures, `alternating-strings-and-numbers?` and `alternating-numbers-and-strings?`.

Let's start with `alternating-strings-and-numbers?`. It has two base cases which should be familiar from the previous version.

* Is the list empty? If so, the list has alternating strings and numbers.
* Does the list start with something other than a string? If so, it's not alternating strings and numbers.

Now we can move on to the recursive case.  Does the list start with a string? If so, we need to make sure that the rest of the list has alternating numbers and strings, starting with a number.

The magic recursion fairy promises us that `alternating-numbers-and-strings?` will do the job, as long as we give it a smaller list.

Putting it all together, we get the following.

```
(define alternating-strings-and-numbers?
  (lambda (lst)
    (cond
      [(null? lst)
       #t]
      [(not (string? (car lst)))
       #f]
      [else
       (alternating-numbers-and-strings? (cdr lst))])))
```

What about the `alternating-numbers-and-strings?` procedure? We'll need to define that, too. We can use a similar strategy.

```
(define alternating-numbers-and-strings?
  (lambda (lst)
    (cond
      [(null? lst)
       #t]
      [(not (number? (car lst)))
       #f]
      [else
       (alternating-strings-and-numbers? (cdr lst))])))
```

Let's check them out.

```
(test-true "sn: empty list" (alternating-strings-and-numbers? null))
(test-true "ns: empty list" (alternating-numbers-and-strings? null))

(test-true "sn: singleton string" (alternating-strings-and-numbers? (list "")))
(test-false "ns: singleton string" (alternating-numbers-and-strings? (list "")))
(test-false "sn: singleton number" (alternating-strings-and-numbers? (list 1)))
(test-true "ns: singleton number" (alternating-numbers-and-strings? (list 1)))

(test-true "sn/1: longer list even length"
           (alternating-strings-and-numbers? (list "one" 2 "three" 4 "five" 6)))
(test-true "sn/2: longer list odd length"
           (alternating-strings-and-numbers? (list "one" 2 "three" 4 "five" 6 "seven")))
(test-false "sn/3: longer list even length"
            (alternating-strings-and-numbers? (list 0 "one" 2 "three" 4 "five")))
(test-false "sn/4: longer list odd length"
            (alternating-strings-and-numbers? (list 0 "one" 2 "three" 4 "five" 6)))

(test-false "ns/1: longer list even length"
            (alternating-numbers-and-strings? (list "one" 2 "three" 4 "five" 6)))
(test-false "ns/2: longer list odd length"
            (alternating-numbers-and-strings? (list "one" 2 "three" 4 "five" 6 "seven")))
(test-true "ns/3: longer list even length"
            (alternating-numbers-and-strings? (list 0 "one" 2 "three" 4 "five")))
(test-true "ns/4: longer list odd length"
            (alternating-numbers-and-strings? (list 0 "one" 2 "three" 4 "five" 6)))

(test-false "sn/5: double string at beginning"
            (alternating-strings-and-numbers? (list "zero" "one" 2 "three" 4)))
(test-false "sn/6: double string at end"
            (alternating-strings-and-numbers? (list "one" 2 "three" 4 "five" "six")))
(test-false "sn/7: double string in middle"
            (alternating-strings-and-numbers? (list "one" 2 "three" "four" 5)))
(test-false "sn/8: double number in middle"
            (alternating-strings-and-numbers? (list "one" 2 3 "four" 5)))

(test-false "ns/5: double number at beginning"
            (alternating-numbers-and-strings? (list 0 1 "two" 3 "four" 5)))
(test-false "ns/6: double number at end"
            (alternating-numbers-and-strings? (list 1 "two" 3 "four" 5 6)))
(test-false "ns/7: double number in middle"
            (alternating-numbers-and-strings? (list 1 "two" 3 4 "five" 6)))
(test-false "ns/8: double string in middle"
            (alternating-numbers-and-strings? (list 1 "two" "three" 4 "five" 6)))
```

Yup. They work. We should probably conduct a few more tests, such as lists that contain neither numbers nor strings, as well as other kinds of numbers, but we'll leave those for another time.

Not only do these two work, most people find the pair of procedures a bit clearer (and easier to write) than the single larger procedure.  In addition, we get two useful procedures, rather than one.

### Improving our mutually recursive solution

Of course, if we embrace the [Zen of Booleans](../readings/zen-of-booleans), we might instead write the following.

```
(define alternating-strings-and-numbers?
  (lambda (lst)
    (or (null? lst)
        (and (string? (car lst))
             (alternating-numbers-and-strings? (cdr lst))))))

(define alternating-numbers-and-strings?
  (lambda (lst)
    (or (null? lst)
        (and (number? (car lst))
             (alternating-strings-and-numbers? (cdr lst))))))
```

