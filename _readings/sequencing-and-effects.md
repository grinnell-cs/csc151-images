---
title: Sequencing and Effects
---

Vector mutation provides a sharp contrast to the sort of programming we have been doing in the course up to this point.
In introducing _side effects_ into our programs, we have, perhaps unwittingly, opened up a proverbial can of worms!
Consider the following innocent-looking definition of a vector:

<pre class="scamper source-only">
(define data (vector 3.1 7.2 8.5 4.0 5 6.0))
</pre>

Now answer the following question:

> At an arbitrary point in the execution of our program, what is inside the `data` vector?

Before mutation, the answer was blindly obvious: the value bound to `data` cannot change, so we know that `data` is _always_ exactly what is originally defined to be.
However, with mutation available to us, now all bets are off; we don't know what `data` can be without heavily scrutinizing our code.
While mutation may be a more intuitive solution to many problems that we encounter, if we are not disciplined, we can produce code that is very difficult to debug.
In this reading, we'll reflect on the pure, functional programming approach we've espoused in this class, contrast it with this _imperative_ style of programming that vector mutation encourages, and how we might reconcile the two in real-world programs, irrespective of the language that we use.

## Pure, Functional Programming

In this course, we've introduced computer programming in the context of the Scheme programming language.
Scheme itself is a _functional programming language_.
Virtually every programming language has functions, so it is not functions alone that make a language "functional."
Instead, it is the fact that functions are _first-class values_, _i.e._, can be treated like any other value, that makes a language functional.
In particular, when a function is a first-class value, it can be passed to other functions as inputs and produced by other functions as outputs.
Functions that process other functions are called _higher-order functions_.
Our quintessential example of a higher-order function is `map`:

<pre class="scamper source">
(define halve
  (lambda (n) (/ n 2)))

(map halve (list 37 22 8 5 -2 1 18 6))
</pre>

In addition to "functional," we also use the term "pure" to describe the kind of programming we learned.
What does pure mean?
_Purity_ in a language refers to the fact that its computations do not produce side effects.
Side effects, like mutation, are any other "effects" that occur when running a computation beyond the final value that the computation evaluates to.

In particular, the only thing that a pure function does is produce some output when given some inputs; it does not produce any side effects.
In practical terms, this means that a pure function behaves like a _mathematical function_.
For example, consider the `sin` function:

<pre class="scamper source">
(sin pi)

(sin pi)

(sin pi)
</pre>

Observe that when we call a mathematical function like `sin` with the same input, `pi` in this case, we get the same output, no matter how hard we try.
This has some important benefits we've been enjoying implicitly throughout the course:

+   **Consistency**: we've internalized that a function always behaves the same when we give it the same inputs.
    So we were confident in writing test cases over individual function calls knowing that the behavior of the function won't change when used in the context of our larger program.
+   **Ownership**: because pure functions operate solely in terms of inputs and outputs, when we debugged a function we wrote, we could refine our search to  either the inputs to the function ("did the correct values get passed in?") or the behavior of the function itself ("does the function compute the right thing?").
    In particular, we never had to reason outside of a function definition or its associated calls to understand a problem with that function itself.
+   **Scope**: since functions can only interact via inputs and outputs, we only had to reason about the _pipeline-like_ behavior of functions to understand a program.
    With some training, we can (with relative ease) follow a pipeline of function calls from input to final result.

These benefits can be summarized concisely by a single term, _referential transparency_.
An expression is referentially transparent if it can be replaced by the value that it evaluates to without any change in meaning to our program.
For example, consider the following code snippet:

<pre class="scamper source">
(define halve
  (lambda (n) (/ n 2)))

; Call halve and then add one to the result
(+ (halve 50) 1)

; Observe how we get the same result when we replace the
; function call with the return value of halve.
(+ 25 1)
</pre>

When we can substitute, in particular, a function call with its result, without loss of meaning to our program, we gain all the benefits of consistency, ownership, and scope described above.

## The Perils of Mutation

One immediate observation: if a function mutates a non-local variable, it is no longer referentially transparent!
For example, consider this code snippet:

<pre class="scamper source">
(define vec (vector 0 0 0 0 0))

(define increment
  (lambda (i)
    ; Increment the ith element of the vector and return i
    (begin (vector-set! vec i (+ (vector-ref vec i) 1))
           i)))

vec
(increment 3)
vec
</pre>

In terms of input-output, it is clear that `increment` is equivalent to the _identity function_ (for `i = 0, ..., 4`) that returns its input.

<pre class="scamper source">
(define vec (vector 0 0 0 0 0))

(define increment
  (lambda (i)
    ; Increment the ith element of the vector and return i
    (begin (vector-set! vec i (+ (vector-ref vec i) 1))
           i)))

(define id
  (lambda (i) i))

(increment 3)
(id 3)
</pre>

However, replacing `increment` with the input value we gave to it clearly doesn't result in the same program behavior!

<pre class="scamper source">
(define vec (vector 0 0 0 0 0))

(define increment
  (lambda (i)
    ; Increment the ith element of the vector and return i
    (begin (vector-set! vec i (+ (vector-ref vec i) 1))
           i)))

vec
(increment 3)
; ...and the third index has been incremented!
vec
3
; ...and unsurprisingly, vec has not changed!
vec
</pre>

So what's the big deal?
The problem is that _any_ function in scope could modify `vec`, not just the one we see here!
Imagine having `vec` with not just one but several functions in scope:

<pre class="scamper source">
(define vec (vector 0 0 0 0 0))

(define func1
  (lambda (x y)
    {??}))

(define func2
  (lambda (x)
    {??}))

(define func3
  (lambda (x y z)
    {??}))

(define func4
  (lambda (x y)
    {??}))

(define func5
  (lambda (x)
    {??}))
</pre>

All of these functions might call each other and interact with `vec` in different ways!
Consequently, to ascertain what `vec` contains, we can do nothing short of meticulously tracing through our code to see exactly how the functions mutate `vec`.
In this sense, all five functions are now _entangled_ with the shared value `vec` that they mutate.
We can no longer reason about their behavior independently but must instead reason about how they work in tandem.

In lab, we'll explore these problems in more detail, briefly explore other kinds of effects that our programs can produce, and derive some prescriptive advice for how we should structure our programs when we need to use side effects.

# Self-Check

## Problem: Our Mental Model, Nooooo... (‡)

Consider the following code snippets:

<pre class="scamper source">
; Code snippet (a)
(let* ([x 7]
       [y (+ x 1)]
       [z (+ x y)])
  (+ x y z))

; Code snippet (b)
(let* ([x (vector 7)]
       [y (+ (vector-ref x 0) 1)]
       [ignore (vector-set! x 0 2)]
       [z (+ (vector-ref x 0) y)])
  (+ (vector-ref x 0) y z))
</pre>

Use your mental model of computation to trace through the execution of both code snippets.
You should find that it isn't clear how to proceed for code snippet (b)!
In a sentence or two, describe the difficulty that you encounter when tracing through code snippet (b) and how you might resolve the issue.