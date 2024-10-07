---
title: Pattern matching
summary: |
  We also introduce pattern matching as an elegant way of capturing case analysis on the shape of data.
---

Recall that one of our design goals is to write programs that are correct from inspection.
In particular, when we have a recursive design, we want our code to look like that design.
Let's see how a possible definition of `length` fares in this respect.
Below, we have replicated the definition of `length` with the recursive design in-lined in comments:

<pre class="scamper source-only">
(define length
  (lambda (lst)
    (if (null? lst)                   ; A list is either empty or non-empty.
        0                             ; + The empty list has zero length.
        (let ([head (car lst)]        ; + A non-empty list has a head and tail
              [tail (cdr lst)])       ;   element.
             (+ 1 (length tail))))))  ;   The length of a non-empty list is one
                                      ;   plus the length of the tail.
</pre>

Not too bad!
Like our design, the code is clearly conditioned on whether `lst` is empty or non-empty.
Furthermore, the results of the cases clearly implement the cases of our design, so we can believe our implementation is correct as long as we believe our design is correct.

Is there anything we can improve here?
Yes—some subtle, yet important things, in fact:

+ We need to make sure that the guard of our conditional accurately reflects the cases of our data structure.
  Here, our list is either empty or non-empty which is captured by a `null?` check.
+ We know that in the recursive case that our non-empty list is made up of a `head` and `tail` which we need to manually access using `car` and `cdr`, respectively.
  Let-bindings name these individual pieces so that we don't interchange `car` and `cdr` in our code, but the let-binding adds a significant layer of complexity.

To fix these issues, we'll use the *pattern matching* facilities of Scamper to express our recursive design directly without the need for a guard expression or let-binding.
A pattern match is a language construct that looks at and performs case analysis on the *shape* of a data type.

First, we'll revise our list definition slightly based on the functions we use to construct lists.

> A list is either:
> + `null`, the empty list (either `null` or the `list` function called with no arguments, `(list)`)
> + `(cons x xs)`, a non-empty list constructed with `cons` that consists of a head element `x` and a list `xs`.

Remember that a list is ultimately composed of repeated `cons` calls ending in the empty list `null`.
For example:

<pre class="scamper source">
(list 1 2 3 4 5)
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))
</pre>

Because of this, we know that our *constructive definition* of a list covers all possible lists.
Now, we'll use pattern matching to directly express `length` in terms of this constructive definition.
We'll call our version `list-length` to avoid conflicting with the standard library function!

<pre class="scamper source">
(define list-length
  (lambda (l)
    (match l
      [null 0]
      [(cons head tail) (+ 1 (list-length tail))])))

(list-length (range 0 20))
</pre>

This version of `length` behaves identically to the previous version of the code but is more concise, directly reflecting our constructive definition of a list.
By doing so, we no longer need a let-expression to bind names to the components of the non-empty list—the `match` construct of Scamper does this for us automatically!

### Pattern matching in detail

The `match` expression form is syntactically similar to a `cond` expression:

```racket
(match <expr>
  [<pat1> <expr1>]
  [<pat2> <expr2>]
  ...)
```

Following the `match` is an expression that evaluates to the value that we match against.
We'll call that the _match value_ or _scrutinee_.
Following the match value is a collection of match blocks or _branches_.
With `cond`, these blocks had the form:

```racket
[<guard> <expr>]
```

Where `<guard>` is a boolean expression and `<expr>` is the expression that the overall `cond` evaluates to if `<guard>` evaluates to true.
Each of the guards are evaluated sequentially until one returns true.

`match` behaves similarly.
However, the blocks of the `match` does not have guards; they have *patterns* instead!
A pattern describes a potential *shape* of the match value.
If the pattern has that shape, then that block is selected, values are bound, and the match evaluates to the branch's expression, its _body_.

In the case of the empty list, this amounts to a simplified equality check.
The pattern `null` means "is `l` equal to `null`?
So whenever `l` is the empty list the `match` evaluates to `0`.

The non-empty list case is more interesting.
Recall that a non-empty list is formed by the `cons` function.
The pattern `(cons head tail)` checks to see if `l` is such a list.
However, on top of this check, if successful, the match also *binds* the two arguments of the `cons` to the variables `head` and `tail` respectively.
For example, we know that if `l` is `(list 1 2 3 4 5)`, we can think of this as the following sequence of `cons` calls:

~~~racket
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))
~~~

Then the pattern `(cons head tail)` will bind `head` to `1` and `tail` to `(cons 2 (cons 3 (cons 4 (cons 5 null))))`.

We can visualize how a pattern will bind values by *overlaying* the pattern on top of the value:

```racket
Pattern: (cons head tail)
          ↑    ↑    ↑
          │    │    │
          ↓    ↓    ↓
Value:   (cons 1    (cons 2 (cons 3 (cons 4 (cons 5 null)))))

head = 1
tail = (cons 2 (cons 3 (cons 4 (cons 5 null))))
```

Here, we see that `head` lines up with `1` and ` tail` lines up with `(cons 2 ...)`.
In contrast, if `l` was `(cons 8 null)`, then we would have:

```racket
Pattern: (cons head tail)
          ↑    ↑    ↑
          │    │    │
          ↓    ↓    ↓
Value:   (cons 8    null)

head = 8
tail = null
```

As another example, here is the `sum` function rewritten to use pattern matching:

<pre class="scamper source">
(define sum
  (lambda (numbers)
    (match numbers
      [null 0]
      [(cons head tail) (+ head (sum tail))])))

(sum (range 0 20))
</pre>

Again, note how the code is more concise and better reflects our recursive definition for list summation.

### More complex patterns

We gain immediate benefits of readability and conciseness with pattern matching.
But pattern matching is more powerful than what we've used so far: we can specify *arbitrary* patterns of values by using nesting.
For example, suppose we want to write a pattern to bind the *first two* values of a list rather than just the top one.
With lists, we would need to chain `car` and `cdr` calls which is tedious and error-prone.
Instead, we can write the pattern `(cons x (cons y lst))` which matches a list with at least two elements and binds the first two elements to `x` and `y`, respectively, and `lst` to the remainder of the list.

```racket
Pattern: (cons x (cons y lst))
          ↑    ↑  ↑    ↑ ↑
          │    │  │    │ │
          ↓    ↓  ↓    ↓ ↓
Value:   (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))

x = 1
y = 2
lst = (cons 3 (cons 4 (cons 5 null)))
```

Let's check out this behavior:

<pre class="scamper source">
(match (list 1 2 3 4 5)
  [(cons x (cons y lst)) (list "first" x "second" y "rest" lst)]
  [other (list "other" other)])
</pre>

What if we want to match a list of exactly two elements?
We can do this, with the pattern `(cons x (cons y null))`:

<pre class="scamper source">
(match (list 1 2)
  [(cons x (cons y null)) (+ x y)]
  [other -1])
</pre>

As we start out writing recursive functions, we will not need to resort to these more complicated patterns.
However, we will quickly come to the point where this additional expressiveness will greatly simplify our code.

### A note on bindings with pattern matching

In the non-empty case of `sum`, the block:

```racket
    [(cons head tail)
     (+ head (sum tail))]
```

Binds `head` to the head of the list and `tail` to the tail of the list.
This pattern binds the same variable as the following let-expression fragment:

```racket
(let ([head (car l)]
      [tail (cdr l)])
  (+ head (sum tail)))
```

As such, note that the names `head` and `tail` are arbitrary in our pattern and can be anything!
Frequently, you'll see me take the convention of naming the variables of the `cons` pattern wih shorter names:

```racket
[(cons x xs)
 (+ x (sum xs))]
```

`x` is the head of the list, a single value.
`xs` is the tail of the list or, how I think of it: the *rest* of the `x`s (or the excess).
However, you can choose whatever names make sense to you, provided they are likely to also make sense to your reader.

Finally, note that sometimes we don't use all the bindings introduced by a pattern.
For example, in `length`, we don't care about the head element of the list (we always add `1` to the result irrespective of what the head is):

```racket
[(cons x xs)
 (+ 1 (length xs))]
```

It is useful to avoid binding unnecessary identifier in our code as it isn't clear whether we should have incorporated `x` or if we intentionally didn't use it in our computation.
To capture the fact that `x` is unused, we can instead use an underscore `_` which matches anything but doesn't bind that value to a variable.

```racket
[(cons _ xs) (+ 1 (length xs))]
```

## Self checks

### Self check 1: Counting elements (‡)

Write a procedure, `list-length`, that takes a list as a parameter and uses a `match` expression that returns "three" for a list of three elements, "two" for a list of two elements, "one" for a list of one element, "zero" for an empty list, "longer list" for a list of more than three elements, and "not a list" for a non-list.

~~~racket
> (list-length (list "a" "b" "c"))
"three"
> (list-length (list 1))
"one"
> (list-length (list "w" "x" "y" "z"))
"longer list"
> (list-length 2)
"not a list"
~~~