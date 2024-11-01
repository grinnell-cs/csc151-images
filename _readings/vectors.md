---
title: Vectors
summary: |
  Vectors are data structures that are very similar to lists
  in that they arrange data in linear fashion. Vectors differ from lists
  in two significant ways: Unlike lists, vectors are *indexed* and vectors
  are *mutable*.
---

## Introduction: Deficiencies of Lists

As you've seen in many of the procedures and programs we've written so
far, there are many problems in which we have to deal with collections
of information. We have several techniques for representing collections
of data:

* We can represent the collection as a list.
* We can represent the collection as a nested list.
* We can store the collection in a file.

Representing a collection as a list has some problems. In particular, it
is relatively expensive to *get* a particular element and it is equally
expensive to *change* a particular element. Why is it expensive to get
an element (say, the tenth element)? In the case of a list, we need
to follow the `car` of each pair through the list until we reach the
element. In the case of a tree, we need to figure out how many values
are in the left subtree to decide where to look. Changing an element
may be even worse, because once we've reached the position, we need to
build the structure back to a new form.

Does this mean that lists and other similar structures are inappropriate
ways to represent collections? Certainly not. Rather, they work very well
for some purposes (e.g., it is easy to extend a list) and less well for
other purposes (e.g., extracting and changing).

To resolve these deficiencies, Scheme provides an alternate mechanism
for representing collections, the *vector*.

## Indexing, a key feature of vectors

You may have noted that when we use lists to group data (e.g., the count
of the words in a book), we need to use `list-ref` or repeated calls
to `cdr` to get later elements of the list. Unfortunately, `list-ref`
works by `cdr`'ing down the list. Hence, it takes about five steps to
get to the fifth element of the list and about one hundred steps to
get to the one hundredth element of a list. Similarly, to get to the
fifth element of a file, we'll need to read the preceding elements and
to get to the hundredth element, we'll also need to read through the
preceding elements. It would be nicer if we could access any element of
the group of data in the same amount of time (preferably a small amount
of time).

Vectors address this problem. Vectors contain a fixed number of elements
and provide *indexed access* (also called *random access*) to those
elements, in the sense that each element, regardless of its position in
the vector, can be recovered in the same amount of time. In this respect,
a vector differs from a list or a file: The initial element of a list
is immediately accessible, but subsequent elements are increasingly
difficult and time-consuming to access.

## Mutation, another key feature of vectors

You may have also noted that we occasionally want to change an element
of a group of data (_e.g._, to change a student's grade in the structure
we use to represent that student; to update a count). When we use lists,
we essentially need to build a new list to change one element. When we
use files, we often have to build a new file, copying both preceding
and subsequent values.

Vectors are *mutable* data structures: It is possible to replace an
element of a vector with a different value, just as one can take out the
contents of a container and put in something else instead. It's still
the same vector after the replacement, just as the container retains
its identity no matter how often its contents are changed.

The particular values that a vector contains at some particular moment
constitute its *state*. One could summarize the preceding paragraph by
saying that the state of a vector can change and that state changes do
not affect the underlying identity of the vector.


## Vector procedures

Standard Scheme provides the following fundamental procedures for creating
vectors and selecting and replacing their elements.  You'll find that many
of them correspond to similar list procedures.

### `vector`

The constructor `vector` takes any number of arguments and assembles
them into a vector, which it returns.

<pre class="scamper source">
(vector "alpha" "beta" "gamma")
; Note: this is the empty vector!
(vector)
(define beta 2)
(vector "alpha" beta (list "gamma" 3) (vector "delta" 4) (vector "epsilon"))
</pre>

As the last example shows, Scheme vectors, like Scheme lists, can be
*heterogeneous*, containing elements of various types.

### `make-vector`

The `make-vector` procedure takes two arguments, a natural number `k`
and a Scheme value `obj`, and returns a `k`-element vector in which each
position is occupied by `obj`.

<pre class="scamper source">
(make-vector 12 "foo")
(make-vector 4 0)
(make-vector 0 4)
</pre>

### `vector?`

The type predicate `vector?` takes any Scheme value as argument and
determines whether it is a vector.

<pre class="scamper source">
(vector? (vector "alpha" "beta" "gamma"))
(vector? (list "alpha" "beta" "gamma"))
(vector? "alpha beta gamma")
</pre>

### `vector-length`

The `vector-length` procedure takes one argument, which must be a vector,
and returns the number of elements in the vector.  Unlike the `length`
procedure for lists, which must look through the whole list to find the
length, `vector-length` can immediately determine the length of a vector.

<pre class="scamper source">
(vector-length (vector 3 1 4 1 5 9))
(vector-length (vector "alpha" "beta" "gamma"))
(vector-length (vector))
</pre>

### `vector-ref`

The selector `vector-ref` takes two arguments---a vector `vec` and a
natural number `k` (which must be less than the length of `vec`). It
returns the element of `vec` that is preceded by exactly `k` other
elements. In other words, if `k` is 0, you get the element that begins
the vector; if `k` is 1, you get the element after that; and so on.

<pre class="scamper source">
(vector-ref (vector 3 1 4 1 5 9) 4)
(vector-ref (vector "alpha" "beta" "gamma") 0)
(vector-ref (vector "alpha" "beta" "gamma") 2)
</pre>

### `vector->list` and `list->vector`

The `vector->list` procedure takes any vector as argument and returns a
list containing the same elements in the same order; the `list->vector`
procedure performs the converse operation.

<pre class="scamper source">
(vector->list (vector 31 27 16))
(vector->list (vector))
(list->vector (list #\a #\b #\c))
(list->vector (list 31 27 16))
</pre>

## Mutation and Sequencing

The functions for vectors that we have looked at so far operate
similarly to any other functions we've encountered so far: they take
inputs and produce outputs. However, the following functions behave
differently: they produce _side-effects_. A side-effect is any kind of
effect a function produces beyond the value that it returns, if any.
The kind of effects we'll see here with vectors are _mutation effects_.
We can _change_ the values contained in a vector directly without
rebuilding the vector as with lists.

Mutation potentially gives us significant gains in terms of
performance. However, this performance comes at a price: we lose the
_reasoning benefits_ associated with pure, functional programming!
We'll discuss this point---perhaps _the_ point of the course---in our
next reading on side-effects.

### `vector-set!`

All of the previous procedures look a lot like list procedures, except
that many are more efficient (e.g., `vector?` and `vector-length` take a
constant number of steps; `list?` takes a number of steps proportional
to the length of the list and `list-ref` takes a number of steps
proportional to the index). Now let's see a procedure that's much
different. We can use procedures to change vectors.

The mutator `vector-set!` takes three arguments -- a vector `vec`,
a natural number `k` (which must be less than the length of `vec`),
and a Scheme value `obj` -- and replaces the element of `vec` that is
currently in the position indicated by `k` with `obj`. This changes the
state of the vector irreversibly; there is no way to find out what used
to be in that position after it has been replaced.

It is a Scheme convention to place an exclamation point meaning "Proceed
with caution!" at the end of the name of any procedure that makes such
an irreversible change in the state of an object.

The value returned by `vector-set!` is unspecified; one calls
`vector-set!` only for its side effect on the state of its first argument.

<pre class="scamper source">
(define sample-vector (vector "alpha" "beta" "gamma" "delta" "epsilon"))
sample-vector
(vector-set! sample-vector 2 "zeta")
sample-vector
(vector-set! sample-vector 0 "foo")
sample-vector
(vector-set! sample-vector 2 -38.72)
sample-vector
</pre>

### `vector-fill!`

The `vector-fill!` procedure takes two arguments, the first of which
must be a vector. It changes the state of that vector, replacing each
of the elements it formerly contained with the second argument.

<pre class="scamper source">
(define sample-vector (vector "rho" "sigma" "tau" "upsilon"))
sample-vector
(vector-fill! sample-vector "kappa")
sample-vector
</pre>

The `vector-fill!` procedure is invoked only for its side effect and
returns an unspecified value.

## Sequencing with `begin`

As you can above, we make multiple top-level calls to `vector-set!` and
`vector-fill!` to mutate `sample-vector`. However, suppose we wish to
put this behavior in a function. Writing a function that makes multiple
function calls like this does not work:

<pre class="scamper source">
(define mutate-vector
  (lambda (vec)
    ; This doesn't work! We get a syntax error!
    (vector-set! vec 2 "zeta")
    (vector-set! vec 0 "foo")
    (vector-set! vec 2 -38.72)))
</pre>

We receive a syntax error!
Why?
Recall that the syntax of a `lambda` is:

~~~racket
(lambda (<args>) <expr>)
~~~

Where the body of the `lambda` form is a _single_ expression.
This is problematic because we need to be able to specify a
_sequence of expressions_ to execute, not just one!

One trick we might consider is to abuse a `let*` binding to
execute each of the desired `vector-set!` calls in sequence:

<pre class="scamper source">
(define mutate-vector
  (lambda (vec)
    (let*
      ([x (vector-set! vec 2 "zeta")]
       [y (vector-set! vec 0 "foo")]
       [z (vector-set! vec 2 -38.72)])
      void)))

(define sample-vector (vector "alpha" "beta" "gamma" "delta" "epsilon"))

(display sample-vector)

(mutate-vector sample-vector)

(display sample-vector)
</pre>

The `void` value is a value that we can return from a function to
indicate that the function does not return a meaningful value. This
is necessary here because we use `mutate-vector` solely for its
side effects: mutating the contents of the input vector `vec`. We
don't need this function to return any particular values as output!

While this "works," the code is highly undesirable. In particular,
we know that the bindings `x`, `y`, and `z` should not be used---they
are `void` as well! Nevertheless, the `let*` construct requires us
to include them. Instead, we need a language construct that allows us
to specify a sequence of expressions to execute without having to bind
additional names. This is precisely the purpose of the `begin` expression:

<pre class="scamper source">

(define mutate-vector
  (lambda (vec)
    (begin
      (vector-set! vec 2 "zeta")
      (vector-set! vec 0 "foo")
      (vector-set! vec 2 -38.72))))

(define sample-vector (vector "alpha" "beta" "gamma" "delta" "epsilon"))
(display sample-vector)
(mutate-vector sample-vector)
(display sample-vector)
</pre>

The `begin` expression takes any number of expressions and executes those
expressions in-order. The values produced by each expression except the
last is discarded, and the `begin` evaluates to whatever value that the
final expression evaluates to. In our case above, `begin` produces `void`
as output from the final call to `vector-set!`.

`begin` allows us to clearly indicate when we intend to use side-effects
in our program. Since `begin` discards the produced values of all of its
expressions except the last, we know that the only purpose of those
expressions _must_ be to produce side-effects like mutating vectors!
Thus, using `begin` makes our code more readable.

With this in mind, we recommend _always_ wrapping out vector-mutating
code in a `begin` expression, even at the top-level. Thus, we would
re-write our original example as:

<pre class="scamper source">
(define sample-vector (vector "alpha" "beta" "gamma" "delta" "epsilon"))
sample-vector
(begin
  (vector-set! sample-vector 2 "zeta")
  (vector-set! sample-vector 0 "foo")
  (vector-set! sample-vector 2 -38.72))
sample-vector
</pre>

Note that a pleasant side effect of using `sample-vector` is that we
effectively remove all but one of the extraneous `void` values from our
output!

## Self checks

### Check 1: Creating simple vectors (‡)

a. Create and define a vector, `tn1` that contains the two
values `35` and `"hi"` by using the `vector` procedure.

b. Create and define a vector, `tn2`, that contains the same two values
by using the `make-vector` and `vector-set!` procedures as top-level
expressions.

c. Create and define a vector, `tn3`, that contains the same two
values by using the `make-vector` and `vector-set!` procedures contained
in a single `let` binding that, first, makes the vector and then uses a `begin` block to mutate the vector.