---
title: Anonymous procedures
summary: |
  While lambda expressions are the most common way to write procedures,
  there are also a variety of others.  We consider how to use composition
  and sectioning to build new procedures from old.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Data types](../readings/data-types).
  [Writing your own procedures](../readings/procedures).
  [Lists and map](../readings/list-map).
---

## Introduction

You've learned the most common approach we will use to defining
procedures. To define a procedure, you use a form like the following.

```drracket
(define <identifier>
  (lambda (<arguments>
    <expression>)))
```

If we wanted to define a procedure, `add`, that adds two values, we
might write something like the following.

<pre class="scamper source">
(define add
  (lambda (x y)
    (+ x y)))
</pre>

However, you've already seen another way to define a procedure.  Instead
of the `lambda` expression, you can use `define` to give another name
to a procedure that already exists.  For example,

<pre class="scamper source">
(define add +)
</pre>

How are these two definitions similar?  Both use the `define` keyword to
associate a name (`add`) with something that defines a procedure. In
the first case, it's a lambda expression.  In the second, it's an
existing procedure.  Perhaps that's not surprising.  We can also define
numeric values using expressions or constants.

<pre class="scamper source">
(define x (+ 1 5))
(define y 6)
</pre>

The Lisp family of languages (including Scheme) set
themselves apart from many programming languages by permitting you
to use a variety of kinds of expressions to define procedures.
You've already seen two: lambda expressions and existing procedures.
In this reading, we'll explore two more: composition and partial
expressions.  Just as an arithmetic operation, like `+`, creates a
numeric value, the composition and partial-expression operations
create a procedural value.

It may not be a surprise that these operations can create new 
procedures; after all, procedures like `map` and `apply` take
procedures as parameters.

## Building new procedures through composition

You may have already seen composition in your study of mathematics. The
composition of two functions, \\( f \\) and \\( g \\), is written \\( f \circ g \\) and
represents a function that first applies \\( g \\) and then \\( f \\).  That is,
\\( (f \circ g)(x) = f(g(x)) \\).

In scamper, we use the `compose` function to represent function composition.
Let's start by composing a few procedures with themselves.

<pre class="scamper source">
(square 3)

(define quad (compose square square))

(quad 3)

(define add1 (lambda (n) (+ n 1)))

(add1 3)

(define add2 (compose add1 add1))

(add2 3)
</pre>

Scamper also provides a synonym function for `compose`, `o` (lower-case 'o'), that is slightly more evocative of the mathematical definition of composition.
For example, we can rewrite the definition of `quad` above using `o` as follows:

<pre class="scamper source">
(define quad (o square square))
</pre>

As these examples suggest, both `quad` and `add2` are procedures.
We've created these procedures in a new way, without a `lambda`.
The `quad` procedure squares its parameter and then squares it again
(\\( 3 \times 3 = 9 \\), \\( 9 \times 9 = 81 \\)).  The `add2` procedure adds one to its
parameter and then adds another one.

What happens if we compose two different procedures?  Let's check.

<pre class="scamper source">
(define add1
  (lambda (n) (+ n 1)))

(define f1 (o square add1))

(f1 4)

(define f2 (o add1 square))

(f2 4)
</pre>

As these examples suggest, the composed procedure applies the other
procedures from right to left.  That is, `f1` adds one to its parameter
and then squares its result, and `f2` squares is parameter and then adds 1.
If we wanted to make it perfectly clear what we want each procedure
to do, we could name them as follows.

<pre class="scamper source">
(define add1
  (lambda (n) (+ n 1)))

(define add1-then-square (o square add1))

(add1-then-square 4)

(define square-then-add1 (o add1 square))

(square-then-add1 4)
</pre>

You can also compose more than two procedures.  For example, we might
write the following silly procedure.

<pre class="scamper source">
(define add1
  (lambda (n) (+ n 1)))

(define fun (o add1 square add1))
</pre>

Composition can be quite useful.  The other day, I realized that
there was no `string-reverse`, even though I had assumed there
was.  But reversing a string is a straightforward operation: Convert
to a list, reverse the list, convert back to a string.  So I
can just write,

<pre class="scamper source">
(define string-reverse (o list->string reverse string->list))

(string-reverse "hello world!")
</pre>

## Pipelining

`compose` allows us to build chains of functions.
This is useful when we want to `define` a new function or pass a function to a higher-order function such as `map`.
However, if we wish to invoke the resulting function directly, we still need to call it.

<pre class="scamper source">
((compose square square square) 2)
</pre>

We might find this syntax somewhat unwieldy for two reasons:

+   The right-to-left nature of composition is unintuitive.
+   We are not used to seeing a function application in the "function" position of a call.

The pipe function `|>` (a pipe `|` followed by a greater-than symbol `>`) is useful when we need to chain function calls together, _i.e._, send the inputs of one function into the next, sequentially, and we only to do it once.
For example, here is how we might express the triple `square` computation using pipe:

<pre class="scamper source">
(|> 2 square square square)
</pre>

Note that the argument to the function chain comes first and the functions of the chain come afterwards, each as an argument to `|>`.
Implicit in this example is the fact that pipe processes its arguments in the left-to-right direction which is likely more intuitive to read.
To unveil this, here is a use of pipe over two operations where the order matters:

<pre class="scamper source">
(define add1
  (lambda (n) (+ n 1)))

(|> 11 add1 square)

(|> 11 square add1)
</pre>

The former example computes \\( (11+1)^2 \\) whereas the second computes \\( (11^2) + 1 \\).

## Sectioning

When writing computational pipelines and function compositions, we commonly find ourselves wanting to write functions that simply call other functions with _some_ of the arguments filled in.
For example, `add1` above is an example of such a function where all `add1` does it give one argument to the `(+)` function, `1`, and leaves the other argument as a parameter.
We say that we are _partially applying_ the `(+)` function, providing only one of its arguments, leaving a one-argument function behind.

In standard Scheme syntax, to achieve this effect, we must write out a `lambda` expression that immediately invokes the desired function, filling in values for some of the arguments and passing through the parameters of the `lambda` for the remainder.

<pre class="scamper source">
(define add1
  (lambda (n) (+ n 1)))
</pre>

This occurs often enough that it is useful to have more concise syntax for writing these partial function applications.
Scamper provides such a construct: the _section expression_.
For example, we can define `add1` with `section` as follows:

<pre class="scamper source">
(define add1
  (section + _ 1))
</pre>

Here, Scamper turns `(section + _ 1)` into `(lambda (n) (+ n 1))` where `n` is a _fresh variable name_ for the _hole_ (`_`, the underscore character) in the `section` expression.
Each hole in a `section` expression turns into a _unique parameter_ in the resulting `lambda` that the `section` becomes.

As another example, we can use `section` to concisely write a pair of functions that prepends and appends an exclamation mark to a string:

<pre class="scamper source">
(define prepend-bang
  (section string-append "!" _))

(define append-bang
  (section string-append _ "!"))

(prepend-bang "hello")

(append-bang "hello")
</pre>

In general, a `section` expression `(section e1 ... ek)` turns into a lambda whose body is a function application `(lambda (...) (e1 ... ek))`.
One parameter is added to the `lambda` for each underscore (`_`) found in the `section`'s expressions.

## Self checks

### Check 1: Subtracting three (‡)

Give three ways to define a procedure, `subtract3`, that takes a number
as input and subtracts 3 from that number.

* Using `lambda`.
* Using the composition operation, `o`, along with a function `(sub1 n)` that subtracts `1` from its argument `n`.
* Using `|>`.

Which of the three do you prefer?  Why?

### Check 2: Partial application (‡)

Recall the standard library function `(make-list n v)` creates a list containing `n` copies of `v`.
Use `make-list` and `section` to concisely write a definition for a function `(list-zeroes n)` that creates a list of `n` zeroes.