---
title: Verifying preconditions
summary: |
  We consider the constraints we might place upon procedures
  and mechanisms for expressing those constraints.
link: true
---

## Introduction: Implicit constraints

Several of the Scheme procedures that we have written or studied in
preceding labs presuppose that their arguments will meet specific
*preconditions* -- constraints on the types or values of its arguments.
For example, the following procedure assumes that its input is a
list of strings.

<pre class="scamper source-only">
;;; (longest-string-length strings) -> integer?
;;;    strings : listof string? (nonempty)
;;; Find the length of the longest string in strings
(define longest-string-length
  (lambda (strings)
    (reduce max (map string-length strings))))
</pre>

If some careless programmer invokes `longest-string-length` and
gives it, as an argument, the empty list, or a list in which one
of the elements is not a string, or perhaps even some Scheme value
that is not a list at all, the computation that the definition of
`longest-string-length` describes cannot be completed.

<pre class="scamper source">
(define longest-string-length
  (lambda (strings)
    (reduce max (map string-length strings))))

(longest-string-length (list))
(longest-string-length (list "hello" "a" 23))
(longest-string-length "strings")
</pre>

As you can see, none of these error messages are particularly
helpful. Whose responsibility is it to handle these types of errors? As
we will see, it is possible to share responsibility between the person
who writes a procedure and the person who calls a procedure.

## Procedures as contracts

A procedure definition is like a contract between the author of the
definition and someone who invokes the procedure. The *postconditions*
of the procedure are what the author guarantees: When the computation
directed by the procedure is finished, the postconditions shall be
met. Usually the postconditions are constraints on the value of the
result returned by the procedure. For instance, the postcondition of the
`sqr` procedure,

<pre class="scamper source">
(define sqr
  (lambda (val)
    (* val val)))
</pre>

is that the result is the square of the argument `val`.  (Alternately,
we might say that the square root of the result is `val`.)

The preconditions are the guarantees that the invoker of a procedure
makes to the author, the constraints that the arguments shall meet. For
instance, it is a precondition of the `square` procedure that `val`
is a number.

If the invoker of a procedure violates its preconditions, then the
contract is broken and the author's guarantee of the postconditions
is void. (If `val` is, say, a list or a drawing, then the author can't
very well guarantee to return its square. What would that even mean?) To
make it less likely that an invoker violates a precondition by mistake,
it is usual to document preconditions carefully and to include occasional
checks in one's programs, ensuring that the preconditions are met before
starting a complicated computation.

Many of Scheme's primitive procedures have such preconditions, which
they enforce by aborting the computation and displaying a diagnostic
message when the preconditions are not met:

<pre class="scamper source">
(+ 1 "two")
(length 116)
</pre>

## Generating explicit errors

To enable us to enforce preconditions in the same way, most
implementations of Scheme provides a procedure named `error`, which
takes a string as its first argument. Calling the `error` procedure
aborts the entire computation of which the call is a part and causes
the string to be displayed as a diagnostic message.

For instance, we could enforce `longest-string-length`'s precondition
that its parameter be a non-empty list of strings by rewriting its
definition thus:

<pre class="scamper source-only">
(define longest-string-length
  (lambda (strings)
    (if (or (not (list? strings))
            (null? strings)
            (not (fold (lambda (acc x) (and acc (string? x))) strings)))
        (error "longest-string-length: expects a non-empty list of strings")
        (reduce max (map string-length strings)))))
</pre>

With these additions, `longest-string-length` enforces its preconditions.

<pre class="scamper source">
(define longest-string-length
  (lambda (strings)
    (if (or (not (list? strings))
            (null? strings)
            (not (fold (lambda (acc x) (and acc (string? x))) strings)))
        (error "longest-string-length: expects a non-empty list of strings")
        (reduce max (map string-length strings)))))

(longest-string-length (list))
(longest-string-length (list "hello" "a" 23))
(longest-string-length "strings")
</pre>

Of course, while these error messages are better than the original error
messages, they don't tell us the complete story. In particular, they
don't tell us what the value of the incorrect parameter is. Fortunately,
`error` can take additional parameters, which it presents verbatim.

<pre class="scamper source-only">
(define longest-string-length
  (lambda (strings)
    (if (or (not (list? strings))
              (null? strings)
              (not (fold (lambda (acc x) (and acc (string? x))) #t strings)))
        (error "longest-string-length: expects a non-empty list of strings, given"
             strings)
        (reduce max (map string-length strings)))))
</pre>

With that addition, we get the following output.

<pre class="scamper source">
(define longest-string-length
  (lambda (strings)
    (if (or (not (list? strings))
              (null? strings)
              (not (fold (lambda (acc x) (and acc (string? x))) #t strings)))
        (error "longest-string-length: expects a non-empty list of strings, given"
             strings)
        (reduce max (map string-length strings)))))

(longest-string-length (list))
(longest-string-length (list "hello" "a" 23))
(longest-string-length "strings")
</pre>

Isn't that much nicer?

## Husks and kernels

Including precondition testing in your procedures often makes them
markedly easier to analyze and check, so we recommend the practice,
especially during program development. There is a trade-off, however: It
takes time to test the preconditions, and that time will be consumed on
every invocation of the procedure. Since time is often a scarce resource,
it makes sense to save time by skipping the test when you can prove that
the precondition will be met. This often happens when you, as programmer,
control the context in which the procedure is called as well as the body
of the procedure itself.

For example, in the preceding definition of `longest-string-length`,
although it is useful to test the precondition when the procedure is
invoked "from outside" by a potentially irresponsible caller, if we
are only using it as a helper to another procedure that verifies that
it has a list of strings, it is a waste of time to repeat the 
potentially expensive tests.

One solution to this problem is to replace the definition of
`longest-string-length` with two separate procedures, a "husk" and a
"kernel". The husk interacts with the outside world, performs the
precondition test, and launches the procedure. The kernel is supposed
to be invoked only when the precondition can be proven true; its job
is to perform the main work of the original procedure, as efficiently
as possible:

<pre class="scamper source-only">
(define longest-string-length-kernel
  (lambda (strings)
    (reduce max (map string-length strings))))

(define longest-string-length
  (lambda (strings)
    (if (or (not (list? strings))
            (null? strings)
            (not (fold (lambda (acc x) (and acc (string? x)))) #t strings))
        (error "longest-string-length: expects a non-empty list of strings")
        (longest-string-length-kernel strings))))
</pre>

The kernel has the same preconditions as the husk procedure, but does
not need to enforce them, because we invoke it only in situations where
we already know that the preconditions are satisfied.

The one weakness in this idea is that some potentially irresponsible
caller might still call the kernel procedure directly, bypassing the husk
procedure that he's supposed to invoke. In a subsequent reading and lab,
we'll see that there are a few ways to put the kernel back inside the husk
without losing the efficiency gained by dividing the labor in this way.

While the benefits of this approach may not immediately be obvious, when
you start to write procedures the step through the elements of a list,
you will find it helpful to avoid revisiting all of the elements of
the list at every step.

## Improving error messages

Are we done? Mostly. However, instead of giving the same error message
for every type of error, we might customize error messages for the
particular kind of error, giving a different error message in each
case. The `longest-string-length` procedure is perhaps not the best example,
because all three kinds of errors are essentially a failure to provide
a non-empty list of strings, but we'll use it as a demonstration anyway.

<pre class="scamper source-only">
(define longest-string-length-kernel
  (lambda (strings)
    (reduce max (map string-length strings))))

(define longest-string-length
  (lambda (strings)
    (cond
      [(not (list? strings))
       (error "longest-string-length: expects a list of strings, received a non-list:"
              strings)]
      [(null? strings)
       (error "longest-string-length: expects a *non-empty* list of strings, received an empty list")]
      [(not (fold (lambda (acc x) (and acc (string? x))) #t strings))
       (error "longest-string-length: expects a list of strings, received a list with non-strings:" 
              strings)]
      [else
       (longest-string-length-kernel strings)])))
</pre>


Now, our messages are a bit more informative.

<pre class="scamper source">
(define longest-string-length-kernel
  (lambda (strings)
    (reduce max (map string-length strings))))

(define longest-string-length
  (lambda (strings)
    (cond
      [(not (list? strings))
       (error "longest-string-length: expects a list of strings, received a non-list:"
              strings)]
      [(null? strings)
       (error "longest-string-length: expects a *non-empty* list of strings, received an empty list")]
      [(not (fold (lambda (acc x) (and acc (string? x))) #t strings))
       (error "longest-string-length: expects a list of strings, received a list with non-strings:" 
              strings)]
      [else
       (longest-string-length-kernel strings)])))

(longest-string-length null)
(longest-string-length (list "hello" "a" 23))
(longest-string-length "strings")
</pre>

Here's a pattern we often use when we include precondition checking in
our procedures.

```scheme
(define kernel-procedure
  (lambda (parameters)
    ...))

(define husk-procedure
  (lambda (parameters)
    (cond
      [(precondition-guard-1)
       (error "failed first precondition" parameters)]
      [(precondition-guard-2)
       (error "failed second precondition" parameters)]
      ...
      [(precondition-guard-n)
       (error "failed last precondition" parameters)]
      [else
       (kernel-procedure parameters)])))
```

### Acknowledgements

The general framework for this reading is taken from [a similar
reading from spring
2018](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/readings/preconditions).
The framework in that reading was taken from [another similar reading
from spring
2017](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2017S/readings/preconditions-reading.html).
We have changed the examples used.

It is likely that the original version of this reading was written
by John David Stone in the misty eons of time, or at least on 4
February 2000.  Unfortunately, Mr. Stone's early work on CSC 151
is no longer available online at its original address.  [What appears
to be an archived version](https://web.archive.org/web/20010517131052/http://www.math.grin.edu/~stone/courses/scheme/preconditions-and-postconditions.xhtml)
is available in the [Internet Archive
Wayback Machine](https://web.archive.org/).  A modified version by Prof. Rebelsky
from 15 September 2000 [is still available](http://www.cs.grinnell.edu/~rebelsky/Courses/CS151/2000F/Readings/prepost.html).  Between those times
and the more recent readings, we've removed the dependency on recursion
and added a variety of related text.