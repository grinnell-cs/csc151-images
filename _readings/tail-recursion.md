---
title: Tail Recursion
summary: |
  In this reading, we explore problems and solutions associated with scaling recursive functions up to larger amounts of data.
---

Consider the humble `length` function we analyzed several times in our previous discussions on recursive design.  Here, we define the function as `my-length` to avoid shadowing the standard library list `length` function.

```racket
(define my-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (my-length (cdr lst))))))
```

We can observe that this function behaves like `length` pretty easily, *e.g.*, with Charles Dickens's [*A Tale of Two Cities*](https://www.gutenberg.org/files/98/98-0.txt):

```racket
> (length (file->words "98-0.txt"))
141606
> (my-length (file->words "98-0.txt"))
141606
```

Not too bad! But what if the book is larger than A Tale of Two Cities?  Let's try faking a larger list using `range`:

```racket
> (define big-list (range 0 1000000))   ; might take a minute or two to execute!
```

Now `length` works fine.  But on my machine at least, `my-length` takes noticeably longer to run.


```racket
> (length big-list)     ; returns instantaneously
1000000
> (my-length big-list)  ; takes a solid couple of seconds to return
1000000
```

When you try this example out on your own, you might find that your machine chokes on both `length` and `my-length` or is able to handle both fine.  Try varying the size of `big-list` by factors of 10, *i.e.*, add/remove `0`s from `range` until you see this difference in behavior!

Recursion and memory usage
--------------------------

Why is `my-length` slow whereas `length` is not slow?  It isn't because `length` is part of the standard library!  Our implementation, while technically correct, performs its execution in a way that is memory inefficient.  To see why, let's use our mental model to begin to evaluate `(my-length big-list)`:

```racket
    (my-length big-list)
--> (+ 1 (my-length '(0 ... 999999)))
--> (+ 1 (+ 1 (my-length '(0 ... 999998))))
--> (+ 1 (+ 1 (+ 1 (my-length '(0 ... 999997)))))
--> ...
```

We see that to evaluate `(my-length big-list)`, the resulting expression will first resolve all its recursive calls:

```
(+ 1 (+ 1 (+ 1 (+ 1 (+ 1 ... (+ 1 0))))))
   \___________________________/
          1000000 times!
```

Only after resolving all of these calls will we begin to collapse the repeated additions into the final result.  However, Racket must still *remember* to perform all of these additions while it is carrying out the recursive `my-length` calls!  This is where the inefficiency of the function lies: Racket needs to remember `1000000` `(+ 1 ...)` expressions, one for each `my-length` call made, so that they can be resolved after the last `my-length` call that returns `0` resolves.

Is there a way to rewrite `my-length` to avoid this inefficiency?  It turns out there is if we are willing to think a bit outside of the box.  Note the problem resides in the recursive case of the function:

```racket
(+ 1 (my-length tail))
```

This expression:

1.   Recursively calls `my-length` on the `tail` of the list.
2.   Adds one to the result of the recursive call.

What if we could reverse the steps?  Rather than acting on the *return value* of the recursive call, can we figure out a way to add one to the result and *pass that result to the recursive call*?  If we figured out some way of doing that, then we wouldn't have any work to do after the recursive call and the resulting expression would not grow in size like it currently does.

However, `my-length` only takes one argument, a list.  So there seems no way to "add one" to the recursive call's parameters in any way.  This is, in fact true!
Instead, we need to change the parameters to `my-length` so that we *can* add one to the parameters in some meaningful way.

To do this, we'll add an additional parameter to `my-length` that is the *intended result of the computation so far*.  Rather than updating the result as it *returns* from successive recursive calls, we'll, instead, update the result as we *pass* it to successive recursive calls.  Here's our updated `my-length` function which we call `my-length/helper` for reasons that will be made clear shortly:

```racket
;;; (my-length/helper lst so-far) -> exact-nonnegative-integer?
;;;   lst : list?
;;;   so-far : exact-nonnegative-integer?
;;; Returns the length of l plus the length of the list calculated so-far.
(define my-length/helper
  (lambda (lst so-far)
    (if (null? lst)
        so-far
        (my-length/helper (cdr lst) (+ 1 so-far)))))
```

`my-length/helper` differs from `my-length` in that it takes an extra argument, `so-far`.  This parameter is intended to be *the result computed so far in the recursion*.  We call this parameter an *accumulator parameter*.
Our goal is to *update* this parameter on every recursive call so that we don't have to do any work when the function call returns.

* In the base case, because `so-far` is assumed to be the result of the computation.  Therefore, we return it as the final result since we've hit the base case.
* In the recursive case, rather than updating the result of the recursive call (`(+ 1 (my-length/helper tail))`), we update `so-far` as it is *passed in* to the recursive call.

Does `my-length/helper` behave as we'd like?  Let's consider how it executes, *e.g.*, `(my-length/helper '(1 2 3) 8)`:

```racket
    (my-length/helper '(1 2 3) 8)
--> (my-length/helper '(2 3) (+ 1 8))
--> (my-length/helper '(2 3) 9)
--> (my-length/helper '(3) (+ 1 9))
--> (my-length/helper '(3) 10)
--> (my-length '() (+ 1 10))
--> (my-length '() 11)
--> 11
```

Note how the function executes: we *eagerly* evaluate the repeated additions rather than waiting for them to resolve after all the recursive function calls have made.  As a result, `my-length/helper` consumes far less memory than our original `my-length` function!

There's only one catch---`my-length/helper` isn't the function we wanted to write!  We wanted to write `(my-length l)` which reports the length of `l`.
Is there a way that we can write `my-length` in terms of `my-length/helper`?
Certainly, we just need to provide an appropriate initial value for `so-far`!

To come up with such a value, we can answer the following question:

+    What should the result of `my-length/helper` be if *we have not seen any elements of the list yet*?

In this particular case, `0` is a reasonable value to return if we haven't seen any elements of the list yet---as far as we know, the list has no elements so far!
This leads to a final, efficient implementation of `my-length` in terms of `my-length/helper`:

```racket
(define my-length
  (lambda (lst)                 ; or (r-s my-length/helper 0)!
    (my-length/helper lst 0)))
```

With this implementation, we can see that `my-length` is now as efficient as the standard library `length` function!

```racket
> (define big-list (range 0 1000000))
> (length big-list)
1000000
> (my-length big-list)  ; just as fast as `length`!
1000000
```

Tail-recursive functions
------------------------

In the above example, we solved the memory inefficiency with `my-length` by taking computations that happen *after* the recursive call returns and turning them into computation that happens *before* the recursive call is made.
We call such functions that do all their work before they make their recursive calls *tail-recursive functions*.
*Tail-call optimization* refers to both the process of making a function tail-recursive by the programmer as well as specific optimizations done by Racket behind the scenes to make tail-recursive functions efficient.
Consequently, tail-recursive functions are more efficient than their non-tail recursive counterparts when large inputs (lists in our case) are used.

As another example consider a naive recursive implementation of the `replicate` function.

```racket
(define replicate
  (lambda (n x)
    (if (zero? n)
        '()
        (cons n (replicate (- n 1) x)))))
```

This function exhibits the same issues with large inputs as `length`.  If I give `replicate` a large `n`, say `1000000`, it takes a few seconds to execute, whereas the standard library equivalent, `make-list` returns instantaneously on the same `n`.

Note that `replicate` is not tail recursive because work happens after the recursive call---namely, we `cons` `n` onto the result of the recursive call.
Let's transform `replicate` into a tail-recursive function where this behavior does not occur.

First, we'll define a helper function that takes an extra argument that represents the result computed by `replicate` so far in its execution.  We then update the base case and recursive case use this argument:

* In the base case, we return the result argument since it is assumed to contain the result of traversing the list up until this point.  Since we are in the base case of the recursion, we must have processed every element of the list, so the result argument contains our final result.
* In the recursive case, rather than updating the result of the recursive call, we'll update the result argument as it is passed in to the recursive function.
These changes result in the following helper function for `replicate`:

```racket
(define replicate/helper
  (lambda (n x so-far)
    (if (zero? n)
        so-far
        (replicate/helper (- n 1) (cons x so-far)))))
```

Note that `replicate/helper` is a tail-recursive function because no computation happens after its recursive call.  We instead perform that computation beforehand with `so-far`.

Finally, we note that if we have not processed `n` yet, then we have not replicated anything, so we expect `so-far` to be the empty list.  This motivates the definition of `replicate` in terms of our helper function.

```racket
(define replicate
  (lambda (n x) 
    (replicate/helper n x null)))
```

In summary, we made a recursive function tail-recursive by:

* Creating a helper function that acts like the original function but includes an extra parameter, an accumulator, that captures the result of the function "so far" in the computation.
* Updating the helper function to use the accumulator parameter.  In the base case, this usually means returning the parameter as the overall result of the computation.  In the recursive case, this usually means updating the parameter in some way when making the recursive call.
* Notably, for the function to be tail-recursive, no recursive call made by the function can contain computation *after* the function call returns.  To put it another way, in its recursive cases, the function is only allowed to return the result of a recursive call directly.

Local bindings for recursive helpers
------------------------------------

In making our functions tail-recursive, we introduce a helper function, `replicate/helper` that was called exclusively by `replicate`.  It is highly unlikely that `replicate/helper` would ever be used any other function other than `replicate`.  So we would like to make `replicatee-helper` *local* to `replicate` reduce to avoid polluting the global namespace.

Our tool for introducing local bindings is `let`.  However, we encounter an issue if we use `let` to make `replicate/helper` local to `replicate`:

```racket
(define replicate
  (lambda (n x)
    (let ([replicate/helper
           (lambda (n x so-far)
             (if (zero? n)
                 so-far
                 (replicate/helper (- n 1) x (cons x so-far))))])
      (replicate/helper n x '()))))

Error: replicate/helper: unbound identifier in: replicate/helper
```

Recall that `let` introduced its bindings *simultaneously* so that a later binding could not refer to an earlier binding.

```racket
> (let ([x 1]
        [y (+ x 1)])
    (+ y 1))
Error x: undefined;
 cannot reference an identifier before its definition
```

To solve this issue, we introduced `let*` which introduces its bindings sequentially:

```racket
> (let* ([x 1]
         [y (+ x 1)])
    (+ y 1))
3
```

A similar issue occurs here but with *recursive identifiers*.  `let` does not make the identifier `replicate/helper` visible inside the definition of `replicate/helper`!

To fix this issue, we use yet another variant of `let`, `letrec` which acts like `let*` but also allows for recursive identifiers:

```racket
(define replicate
  (lambda (n x)
    (letrec ([replicate/helper
              (lambda (n x so-far)
                (if (zero? n)
                    so-far
                    (replicate/helper (- n 1) x (cons x so-far))))])
      (replicate/helper n x '()))))

> (replicate 5 "!")
'("!" "!" "!" "!" "!")
```

When defining tail-recursive functions, make sure to use `letrec` to make your helper functions local to the main function.  Because they are local, you also choose a pithier name for the helper so you less to type!  My personal preference is to call my local helper function `kernel` or `helper`:

```racket
(define replicate
  (lambda (n x)
    (letrec ([kernel
              (lambda (n x so-far)
                (if (zero? n)
                    so-far
                    (kernel (- n 1) x (cons x so-far))))])
      (kernel n x '()))))

> (replicate 5 "!")
'("!" "!" "!" "!" "!")
```

## Top-down Versus Bottom-up Processing

Up to this point, our recursive functions have computed in a *bottom-up* function by operating on the results of recursive calls.  With tail-recursion, we *invert* the order of computation by operating on the accumulator parameter in a *top-down* pattern.  For `length` and `replicate`, this didn't seem to change how the functions behaves.  But sometimes, the direction matters!

For example, let's consider the `append` function which appends two lists together.  Here is the naive implementation:

```racket
(define append
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1)
              (append (cdr l1) l2)))))
```

Now that we've introduced the notion of an accumulator parameter, you might notice that `l2` seems to almost serve this purpose in `append`!  It is returned as the result of the base case.  The only difference is that we do not modify it when calling `append`.  That seems easy enough to fix, so let's try it:

```racket
(define append-tail
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (append-tail (cdr l1) (cons (car l1) l2)))))
```

`append-tail` is tail-recursive because the recursive case returns the result of `append` directly now, instead of consing an element onto that result before returning.  However, how does this version of the function behave?

```racket
> (append-tail (list 1 2 3) (list 4 5 6))
'(3 2 1 4 5 6)
```

Whoops!  What is going on here?  Let's trace the execution of this expression:

```racket
    (append-tail (list 1 2 3) (list 4 5 6))
--> (append-tail '(2 3) (cons 1 '(4 5 6)))
--> (append-tail '(2 3) '(1 4 5 6))
--> (append-tail '(3) '(2 1 4 5 6))
--> (append-tail '() '(3 2 1 4 5 6))
--> '(3 2 1 4 5 6)
```

By consing the elements in a top-down fashion rather than bottom-up fashion, we've reversed the order of `l1` in the appended list!
This occurred for `append` because `cons` is not a symmetric operator, that is:

```racket
(cons 3 (cons 2 (cons 1 '(4 5 6)))) ≠ (cons 1 (cons 2 (cons 3 '(4 5 6))))
```

The left-hand expression arises in the tail-recursive variant of append.  The right-hand expression arises with the naive version.

You might think "well, duh; of course the order matters", but it didn't for `length`!  This is because `+` is a symmetric operator.  Suppose we ran `(length '(1 2 3))` on the tail-recursive and non-tail-recursive versions of `length`.  We find that:

```racket
(+ 3 (+ 2 (+ 1 0))) = (+ 1 (+ 2 (+ 3 0)))
```

The left-hand expression comes from the tail-call version (we start by summing `1` to the initial value of `so-far`), and the right-hand expression comes from the naive version (we start by summing `3` to the base case value `0`).

How can we write a tail-call version of `append`?  We have do something a bit counter-intuitive if performance is our goal: we need to reverse `l1` before feeding it to `append`'s local helper!  Here's a complete implementation:

```racket
(define append
  (lambda (l1 l2)
    (letrec ([kernel (lambda (l1 l2)
                       (if (null? l1)
                           l2
                           (kernel (cdr l1) (cons (car l1) l2))))])
      (kernel (reverse l1) l2))))
```

Where `reverse` is the standard library implementation of `reverse`.  Now `append` is tail-recursive and behaves as we would like:

```racket
> (append '(1 2 3) '(4 5 6))
'(1 2 3 4 5 6)
```

However, we need to be careful.  This implementation only works if `reverse` is tail-recursive!  Otherwise, if `l1` is really big, we run into all the same issues as before.  Luckily, we can use the fact that `cons` employed in a top-down fashion reverses a list to implement `reverse` in a tail-recursive manner!

```racket
;;; (reverse lst) -> list?
;;;   lst : list?
;;; Returns lst but reversed.
(define reverse
  (lambda (lst)
    (letrec ([kernel
              (lambda (lst so-far)
                (if (null? lst)
                    so-far
                    (kernel (cdr lst) (cons (car lst) so-far))))])
      (kernel lst '()))))

> (reverse '(1 2 3 4 5))
'(5 4 3 2 1)
```

And indeed the standard library implementation of `reverse` takes this approach, so we are safe!

## A lesson on dptimization

While our final version of `append` from the previous section is tail-recursive, that transformation came at a price:

* Our implementation became decidedly more complicated.  Rather than being a simple recursive function, `append` requires a helper function as well as a call to `reverse`.
* This complication also leads to potentially decreased performance in some situations.  `reverse` must walk the entire input list to reverse it.  So in effect, this tail-recursive version of `append` walks `l1` twice: once to perform the reversal and once to cons its elements onto the front of `l2`.
* If the size of the inputs to `append` are small (thus not requiring us to use tail-recursion), then the tail-recursive version will be slower than its non-tail-recursive variant!

In summary, tail-recursion is a powerful and necessary transformation to optimize our code in certain circumstances.  But these complications suggest to us the following maxim has merit:

> Premature optimization is the root of all evil.

That is, we should not necessarily pursue the most optimized code upfront This is because optimizations frequently come with a cost: decreased code readability and more time and effort spent, sometimes with lesser gains that expected!  Of course, we should strive to write efficient code when it is convenient to do so.  However, we should only consider more in-depth optimizations like tail-call optimization only when they are needed.

In the specific case of tail-call optimization, we should only aggressively pursue tail-call optimization when we know that the inputs to our recursive functions will be large.  For example, if we are writing recursive functions to analyze all the words of a novel, we might consider making these function tail-recursive!

## Self-checks

### Check 1: To tail or not-tail?

Imagine that we are defining a recursive function `func`.  Determine whether the given recursive calls to `func` will result in a *tail-recursive* definition of `func` or not.  (Throughout, assume that `x`, `y`, and `z` are variables that are bound to numbers and that `func` returns a number.)

{:type="a"}
1.   `(func x y)`
2.   `(+ 5 (func x y))`
3.   `(func x (+ 5 y))`
4.   `(func x (func y z))`

### Check 2: Tail tracing

Give an execution trace for the following expression involving `reverse` using your mental model of computation.  You may assume that the execution trace steps from the initial call to `reverse` to the first step after the initial call to `go` is evaluated:

```racket
    (reverse '(1 2 3 4 5))
--> (kernel '(1 2 3 4 5) '())
--> ...
```

### Check 3: Making tails (‡)

Transform the following recursive definition of `factorial` so that it is tail-recursive.  Make sure to use `letrec` to ensure `factorial`'s helper function is local relative to `factorial`'s definition.

```racket
(define factorial
  (lambda (n)
    (if (zero? n)
        1
        (* n (factorial (- n 1))))))
```
