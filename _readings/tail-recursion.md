---
title: Tail Recursion
---

So far, we have not dwelled too much on _program efficiency_.
By program efficiency, we mean two qualities:

+   _Time efficiency_: how long a program takes to run?
+   _Space efficiency_: how much memory does a program consume during execution?

We will cover efficiency in depth in later courses.
However, today we'll cover a particular problem of efficiency as it pertains to recursion and functional programming.
Our solution to this problem, _tail recursion_, is a fundamental part of every functional programming language.

# Blowing the Stack

Consider the function `(make-list n v)` which makes a list of `n` copies of `v`, implemented recursively:

<pre class="scamper source-only">
(define make-list
  (lambda (n v)
    (if (= n 0)
        null
        (cons v (make-list (- n 1) v)))))
</pre>

And let's trace its execution on an example:

~~~scheme
     (make-list 5 "z")
-->* (cons "z" (make-list 4 "z"))
-->* (cons "z" (cons "z" (make-list 3 "z")))
-->* (cons "z" (cons "z" (cons "z" (make-list 2 "z"))))
-->* (cons "z" (cons "z" (cons "z" (cons "z" (make-list 1 "z")))))
-->* (cons "z" (cons "z" (cons "z" (cons "z" (cons "z" (make-list 0 "z"))))))
-->* (cons "z" (cons "z" (cons "z" (cons "z" (cons "z" null)))))
-->* (list "z" "z" "z" "z" "z")
~~~

Observe the "essence" of this computation: for every element of the input list, we "pop out" a `(cons "z" ...)` call.
These `cons` calls do not immediately evaluate!
Instead, we continue making recursive calls until we hit the base case.
It isn't until _after_ this point that we evaluate the five `cons` calls that we accumulate along the way.

Looking at the trace, we see that if we pass in `n` to `make-list`, after `k` calls of `make-list`, we will have `n-k` pending calls to `cons` built up as we continue with the recursion:

~~~
(cons "z" (cons "z" (cons "z" ... (cons "z" (make-list (- n k) "z")))))
\                                         /
 -----------------------------------------
                      |
                      k
~~~

Observe that our mental model of computation suggests that our computer must store these pending calls somewhere!
Each `(cons "z" ...)` call represents the work that a particular call to `make-list` must do _after_ it makes its recursive call.
Indeed, behind the scenes, our program maintains a _call stack_, the collection of currently active function calls that are waiting to complete.
The call stack contains a _stack frame_ for each active function call that records the information necessary for that function to continue when any function calls it makes finishes execution.

For five elements, this additional work does not seem to be a problem, but imagine if we tried to call `make-list` with, say, `n = 1000000`.
We would need to allocate a million stack frames to perform this computation!
To put this into context, let's imagine that a single stack frame, for simplicity's sake, is only 4 bytes big, an underestimate.
(A _byte_, or 8 _bits_, is an elementary unit of data in a computer system.)
We would need to allocate \\( 1000000 \times 4 = 4000000 \\) or 4 _megabytes_ (MB) of stack frames.
It turns out that most programming language runtimes only allow for stacks to grow to, at most, several megabytes, so that the system's memory can be used for other tasks.

When we run out of stack space to record active function calls, our programs raise a _stack overflow_ error indicating that it has run out of memory!
These physical limits of memory become a problem in functional programming because we use recursion to perform our repetitive tasks.
While we haven't encountered this problem yet, real-world programs might process data that contains millions or even billions of elements.
Naively performing recursive computation in these situations simply does not work!

(As an aside, stack overflow errors are precisely why we haven't seen "true" infinite loops in our programs.
In virtually all of the recursive functions we've written so far, we would overflow the stack with an infinite loop, causing an error!)

# Tail Recursion

Consider this alternative version of `make-list`:

<pre class="scamper source-only">
(define make-list
  (lambda (so-far n v)
    (if (= n 0)
        so-far
        (make-list (cons v so-far) (- n 1) v))))
</pre>

This version of `make-list` takes an extra argument, `so-far`, that represents the result of the function _accumulated so far_ in its execution.
Let's trace execution of this function on the same example.
Note that we pass `so-far` the initial value of `null` capturing the fact that, initially, we have not yet done any computation.

~~~racket
     (make-list null 5 "z")
-->* (make-list (cons "z" null) (- 5 1) "z")
-->* (make-list (list "z") 4 "z")
-->* (make-list (cons (list "z")) (- 4 1) "z")
-->* (make-list (list "z" "z") 3 "z")
-->* (make-list (cons "z" (list "z" "z")) (- 3 1) "z")
-->* (make-list (list "z" "z" "z") 2 "z")
-->* (make-list (cons "z" (list "z" "z" "z")) (- 2 1) "z")
-->* (make-list (list "z" "z" "z" "z") 1 "z")
-->* (make-list (cons "z" (list "z" "z" "z" "z")) (- 1 1) "z")
-->* (make-list (list "z" "z" "z" "z" "z") 0 "z")
-->* (list "z" "z" "z" "z" "z")
~~~

Observe how the "computation" occurs on the `so-far` argument rather than the result of the recursive call.
We incrementally `cons` on an additional `"z"` onto `so-far` for each recursive call to the function.
This `cons` is resolved before the next call to `make-list` is made.

Critically, because we evaluate arguments before calling functions, each recursive call of `make-list` perform its computation _before_ it makes its recursive call.
As evidenced by our derivation, there is no work to do after the recursive call.
Such a pattern of recursion is called _tail recursion_ and a function that exhibits this behavior is said to be in _tail-recursive form_.

> **Definition (Tail-Recursive Form):** a function is in _tail-recursive form_ if, for every recursive function call that it makes, that no additional work is performed after that call.
> In other words, a tail recursive function immediately returns the result of any recursive call that it makes.

The second version of `make-list` is in tail-recursive form because it simply returns the result of its recursive call in its else-branch.
In contrast, the first `make-list` is _not_ in tail-recursive form because it performs a `(cons ...)` call _after_ it makes its recursive call.

Importantly, when a recursive function is in tail-recursive form, our language can perform an important optimization called _tail-call optimization_.
If we look at our trace of the second `make-list` call, we see that our executing program never "grows" like the first case.
Behind the scenes, this means that we do not need to keep around each stack frame for a tail-recursive call because we perform no work after that call is made---we simply return whatever the recursive call returns.
This is strictly more efficient in terms of memory usage than regular recursive calls!

Tail-call optimization is so important in functional programming that most functional programming languages mandate that their interpreters and compilers must perform tail-call optimization so that programs can perform unbounded recursion, provided that functions are written in tail-call style.
Scamper does not yet support tail-call optimization---it turns out to be quite a non-trivial program transformation behind the scenes.
But this pattern is prevalent enough in real-world functional programming that it is important to internalize, even without the benefits!

# Converting Functions to Tail-recursive Form

We can see that `make-list` can be rewritten in tail recursive form.
What about other recursive functions?
Let's revisit the list `length` function:

<pre class="scamper source-only">
(define length
  (lambda (l)
    (match l
      [null 0]
      [(cons _ tail) (+ 1 (length l))])))
</pre>

`length` is not in tail-recursive form because it performs additional computation after its recursive call, `(+ 1 ...)`.
Our goal in converting functions to tail-recursive form is to ensure that the function immediately returns the result of any recursive calls that it makes.
Or to put it another way, we need to rewrite `length` so that it performs no additional computation after its recursive calls.

The key to this transformation is transferring any work done _after_ a recursive call to _before_ the recursive call, usually by performing that computation as an argument to the function.
Such a transformation is impossible without modifying the signature of `length`.
In particular, we'll add an argument, conventionally named `so-far`, to perform this computation over.
Observe how the `(+ 1 ...)` performed on the recursive call is moved to the `so-far` argument.

Additionally, we modify the base case to return `so-far`.
When we hit the base case, we're done with the computation
If `so-far` is the work performed so far in the recursive computation, `so-far` should contain the _completed_ computation at the base case, so we return it directly.

Finally, we create a _wrapper function_ that calls our recursive function, but with an appropriate initial argument for `so-far`.
This wrapper function becomes the `length` function that users call, and we call the recursive function the _helper_ function that does the actual work.
The initial value for `so-far` is the value returned by the base case in the original version of the function.

<pre class="scamper source">
(import test)

(define length-helper
  (lambda (so-far l)
    (match l
      [null so-far]
      [(cons _ tail) (length-helper (+ 1 so-far) tail)])))

(define list-length
  (lambda (l)
    (length-helper 0 l)))

(test-case "list-length: non-empty"
  equal? 5
  (lambda ()
    (list-length (list 1 2 3 4 5))))
</pre>

It is instructive to state the recursive decomposition of `length-helper` and compare it to our decomposition of `length`:

+   `length`

    > The length of a list `l`:
    > +   If `l` is empty, then the length of `l` is zero.
    > +   If `l` is non-empty, then the length of `l` is one plus the length of its tail.

+   `length-helper`

    > The length of a list `l`, provided we computed the length `so-far`:
    > +   If `l` is empty, then the length is the length we computed `so-far`.
    > +   If `l` is non-empty, then the length is the length of the tail, observing we have computed one plus `so-far` for the length.

When decomposing a problem recursively in a tail-call style, we define the computation _in terms_ of what has been computed "so far."

## Generalizing Tail-call Conversion

While it is not obvious, it turns out that we can convert _any_ recursive function into tail-recursive form by following the pattern we outlined above:

1.  Create a recursive helper function that does the actual work of the function.
    This function should take an additional argument, `so-far`, that records the results of the computation _before_ recursive calls are made.
2.  Define the recursive helper function similarly to the original function, except:
    +   The base case should return `so-far` since `so-far` should contain the overall result at this point in the computation.
    +   The recursive case should have any work it does _after_ its recursive calls moved to the `so-far` argument passed to those recursive calls.
3.  Create a wrapper function with the desired function's signature that simply calls the helper with a suitable initial value for the `so-far` argument.

In our examples, `so-far` has been a simple value that we've updated.
More generally, we can expect `so-far` to become a _function_ that represents the accumulated work to be done so far.
In this formulation, `so-far` is called a _continuation_ and the transformation is called _continuation-passing style_ (CPS) where _every_ function accept its continuation, _i.e._, what to do after the function completes execution.
While seemingly weird and unnatural, it turns out continuation-passing style is useful in many contexts, even outside functional programming.
For example, CPS is employed as a pattern in the Javascript programming language for writing asynchronous, callback-based code.

# Self Checks

## Exercise 1: Tracing Tail-recursive Functions

Use your mental model of evaluation to give a step-by-step trace of `(length (list 1 2 3 4 5))` for both the non-tail-recursive and tail-recursive versions of `length`, demonstrating that the former implementation requires work done after each recursive call and the latter does not.

## Exercise 2: Tail-recursive Decompositions

Give prose-based recursive decompositions for the original `make-list` function and its tail-recursive variant.

## Exercise 3: Tail-recursive Append (‡)

Translate the standard implementation of `append` into tail-recursive form:

<pre class="scamper source">
(import test)

(define list-append
  (lambda (l1 l2)
    (match l1
      [null l2]
      [(cons head tail) (cons head (list-append tail l2))])))

(test-case "list-append: non-empty"
  equal? (list 1 2 3 4 5)
  (lambda ()
    (list-append (list 1 2 3)
                 (list 4 5))))
</pre>
