---
title: Documenting Your Code
summary: |
  In this reading, we motivate the need to document our code to increase its readability and codify latent assumptions we make about our program design.
  We also introduce the particular format of code of documentation we will use for the remainder of the course.
---

In computer programming, we design computational solutions to problems and then translate those solutions into our programming language of choice.
Therefore, when we reason about the correctness of our programs, we need to do two things:

1.  Is our solution (our *algorithm*) correct?
2.  Is our *translation* of our solution to a program correct?

The second of these things is the reason why we care about making our code *readable*.
Even if our code's *intent is correct, we will have difficulty determining that fact if we can't decide what the code does.
This is why we emphasize the idea of *making our code mirror our intent* in this course.
We heavily prefer realizing our solution to a problem directly as language constructs in our code to make it painfully evident that our translation from algorithm-to-program is correct.

While functional languages like Racket make such translation easier, it is not always obvious from our code what our intent is, even with good structure and names.
A great example of this is the humble `substring` function from the standard library:

~~~racket
(substring "hello world" 3 7)
~~~

`substring` takes three arguments: the string under consideration and two indices that describe the substring to extract from the first argument.
However, how are the indices used by `substring`?
Are the indices of the string 0-based or 1-based?
Are the indices inclusive or exclusive?
Execution of this example unveils the answers:

~~~racket
> (substring "hello world" 3 7)
"lo w"
~~~

The resulting substring starts from the fourth character of the input string and ends on the seventh.
This implies that the indices are 0-based (since we specified the fourth character with index `3`) and that the start index is inclusive and the end index is exclusive (since the index of the last character in the substring is `6`).

Having to execute our function to figure out what it does is not ideal.
What if the function we're considering takes a long time to execute?
What if the function is deeply nested inside of our system and, thus, difficult to execute on its own?
What if the function's behavior is so convoluted we don't even what we could pass to the function to experiment?

Perhaps we could look at the source code of the function and gain some insights.
In some cases, this will work.
However, we do not always have the source code available to us.
For example, there is not an easy way to jump from Racket's API documentation to the source code it is documenting.
Additionally, some functions, even when well-written, do not convey all these details.
For example, here is the best implementation of `substring` I can come up with.
(*Note*: We would have shown you the actual implementation of `substring` for Racket, but it is in the C programming language!)

~~~racket
(define substring
  (lambda (str start end)
    (list->string
     (map (lambda (i) (string-ref str i))
          (range start end)))))
~~~

We construct a `substring` by transforming the range of indices indicated by `start` and `end` into characters of the string.
Note that while this is a direct, concise description of the function, the answers to our original questions---Are the indices 0- or 1-based?  Are the arguments inclusive or exclusive?---are not evident from the source!

To make the answers to these questions obvious, we use *function documentation comments* or *doc comment* for short.
Here is a doc comment for `substring`:

~~~racket
;;; (substring str start end) -> string?
;;;   str : string?
;;;   start : integer?, a 0-based index
;;;   end : integer?, a 0-based index
;;; Returns the substring of `str` denoted by the start index `start` 
;;; (inclusive) and end index `end` (exclusive).
(define substring
  (lambda (str start end)
    (list->string
     (map (lambda (i) (string-ref str i))
          (range start end)))))
~~~

Doc comments give us the full picture of what a function requires as input and what we can expect as output.
Practically speaking, they form the bulk of the code documentation that we write in our programs.

## The Anatomy of a Function Documentation Comment

Many programming languages provide special support for documenting functions, including a special syntax for specifying parameters and what the function returns.
These languages then provide tools that extract these doc comments and create *API documentation*, *e.g.*, the reference pages you've read for Racket's API:

+ [Pairs and Lists (The Racket Reference)](https://docs.racket-lang.org/reference/pairs.html)

Even though these doc comments' practical effect is their extraction from code, it is useful to keep them in code so that we are reminded to update the documentation whenever we change the behavior of the function.

Racket's system for writing documentation is called [Scribble](https://docs.racket-lang.org/scribble/index.html).
Scribble showcases one of Racket's powers: because of Racket's expressiveness, Scribble is a library or *domain-specific language* constructed in Racket.
In other words, you can write Racket documentation with Racket code!

Unfortunately, this has the side effect of being somewhat complicated to use as it is meant for documenting *modules* of code in the context of large programs rather than the smaller single-file programs we write in this course.
So rather than introducing this library in all of its glory, we instead present a simplified set of *conventions* for writing doc comments in the style of Scribble's output.

The doc comment for `substring` can be broken up into three parts.
Note that throughout, we use triple semicolons (`;;;`) to encase our doc comments to make them stand out from other comments we might write.

**Signature**

~~~racket
;;; (substring str start end) -> string?
~~~

The signature of a function describes what it takes as input and produces as output.
It should replicate a call to the function but with the parameter names in place of the actual values.
As before, the names should be evocative of their intended use within the function.
This gives the user an immediate sense of how to use the function.
In addition to the call, the *return type* of the function is given following the arrow (`->`).
The type of the value returned by the function is described by a predicate, typically one that tests the type of its argument.

**Parameters**

~~~racket
;;;   str : string?
;;;   start : integer?, a 0-based index
;;;   end : integer?, a 0-based index
~~~

This section describes the types of each parameter again by way of predicates that usually test type identity.
In addition to the predicates, we might also specify other essential properties of the parameters that aren't necessarily captured in the predicate.
For example, we note that both `start` and `end` are 0-based indices.
In contrast, there is nothing special about `str` beyond the fact it is a `string?`, so we have nothing else include in its entry.

The set of conditions we place on a function's parameters are called the **preconditions** of the function.
They represent the set of properties that the *caller of the function* must fulfill to ensure that function can operate successfully.

Note that the `integer?` predicate doesn't quite describe what values `start` and `end` ought to take on.
In particular, negative integers do not make sense---they are not valid indices into the string.
We could consider introducing a *more specific* predicate and use that instead:

~~~racket
;;; (natural? n) --> boolean?
;;;   n : integer?
;;;
;;; Returns true if and only if n is a natural number (n >= 0).
(define natural?
  (lambda (n) (>= n 0)))
~~~

However, this quickly leads to a rabbit hole of making up tons of new predicates all over the place!
Rather than this, we'll favor using the type predicates defined in the standard library for our basic types:

+   `number?` and its associated predicates for [different types of numbers](https://docs.racket-lang.org/reference/number-types.html).
+   `string?`
+   `boolean?`
+   `symbol?`
+   `list?`
+   `procedure?`

And a few others we will introduce in the coming weeks.
When our parameters have more requirements beyond what is captured by these functions, we'll use prose to describe them, *e.g.*, "0-based index" for `start` and `end`.
This prose can appear either in the parameters list alongside the relevant parameter if it is short.
It can also appear in the description if the requirements on the parameters are more complicated to describe or involve multiple parameters.
For example, by "index", we mean that `start` and `end` ought to be a *valid* index for the string.
To make this explicit, we can describe this in the parameters list:

~~~racket
;;;   str : string?
;;;   start : integer?, a 0-based index (<= 0 start (length str))
;;;   end : integer?, a 0-based index (<= 0 end (length str))
~~~

Here, the constraint can be expressed as inequalities on `start` and `end`, namely that `0 ≤ start ≤ (length str)` (and similarly for `end`).
In the comment, we express this with a equivalent Racket expression (`<= 0 start (length str)`).
But writing this in traditional mathematical notation is also fine:

~~~racket
;;;   start : integer?, a 0-based index (0 <= start <= (length str))
~~~

It is also reasonable to push this information into the description, *e.g.*,

~~~racket
;;;
;;; Returns the substring of `str` denoted by the start index `start` 
;;; (inclusive) and the end index `end` (exclusive).  We expect that 
;;; 0 <= start <= (length str) and that 0 <= end <= (length str).
~~~

As a rule of thumb, if a constraint only involves one parameter and it is short to express (either with a Racket expression, mathematical formula, or phrase), place it with the parameter list.
If the constraint involves the interaction of multiple parameters or is complicated, place it in the description where there is more prose.

However, it is important that these preconditions are captured *somewhere* in our doc comment rather than worrying about where.
In other words, follow this rule of thumb, but if it makes more logical sense
or looks better to break the rule, feel free!

**Description**

~~~racket
;;;
;;; Returns the substring of `str` denoted by the start index `start` 
;;; (inclusive) and end index `end` (exclusive).
~~~

Finally, this section describes the behavior of the function.
This includes:

1.  A description of the computation that the function performs and the result value that it outputs.
2.  Any important details about the function's behavior that a *user* of the function ought to know.

Practically speaking, we are writing simple enough functions in the course that the function description will be one sentence that describes the function's output.
This description, coupled with the return type specified in the signature, serves as the **postcondition** to the function.
A postcondition is what the function guarantees will occur *provided that its precondition is satisfied*.

When we think about other prose to write beyond the description of the function's output, we must keep in mind the audience of these doc comments.
The audience for these doc comments is not us!
Since we're writing the code, we usually have the implementation in our heads, so that these details are self-evident.
Doc comments are meant for our *collaborators and other potential users of this code* to quickly learn about the program's available functionality without having to dive through the details of the code.
This audience also includes *our future selves* who may have forgotten these details!

With this in mind, we want to include those details that are captured in our well-designed, "self-evident" code that users of our function ought to know.
For `substring`, we want our users to know whether the indices are inclusive or exclusive on their ends.
In general, this will include additional preconditions on the parameters of the functions that aren't readily captured in the parameters section of the doc comment.

## Preconditions and Postconditions as Contracts

We think of our doc comments as describing a sort of *contract* between the caller and implementor of a function.
This contract is made up of the preconditions---expected types and properties of the function parameters---and the postconditions---expected type and properties of the output---described by the doc comment.
The contract acts as follows:

> If the contract's preconditions are satisfied by the caller of the function, then the implementor of the function guarantees that the function will fulfill the postconditions of the contract.

In the context of `substring`, this means:

> If the user provides a string and two valid, 0-based indices, then `substring` produces the substring starting at index `start` (inclusive) and `end` (exclusive).

If the function's caller does not fulfill these preconditions, then like in real life, the function is not bound to the contract; the function is free to do whatever it wants!
It might throw an error, or it might return garbage entirely unrelated to the intended result.
For example:

~~~racket
> (substring 24710 0 3)
. . string-ref: contract violation
  expected: string?
  given: 24710
  argument position: 1st
  other arguments...:
~~~

If our `substring` implementation gets a number as the first argument, it happily continues to process it.
However, when we try to call `string-ref` on the number, we get a type error at that point in execution.

In summary, preconditions and postconditions give us a quick and easy way to understand a function's behavior.
In the coming days, we'll see that they also give us a hook for *reasoning* about our code, especially if we encounter a *bug* in our implementations!

## Documenting other parts of your code

As we've seen, doc comments are only one kind of comment we might use in our code.
We might choose to document other places as well, *e.g.*, inside the implementation of a function:

~~~racket
(cond 
  [(> x 0)  
   1]
  [(< x 0) 
   -1]
  ; x is neither positive nor negative, it must be zero.
  [else   
   0]) 
~~~

Here we remind ourselves in a comment that we arrive at the `else` branch because it must be the case that `x` is not greater than or less than `0`.
Is this comment necessarily?
In some sense, it is because it isn't immediately obvious from the `else` what is true about `x`.
However, if we took a few seconds to reason about how the `cond` operates, we could have arrived at that conclusion pretty quickly.

Even if this comment's utility is suspect, is there any harm in including such little notes?
Different faculty have different perspectives.
One set argues that it's worthwhile to include such comments as they ease the cognitive load on the reader.
Some members of that group also tend to write the code in natural language before writing programming code.
And that's a strategy we think you should use (writing in English first).

One argues that there is harm for including such comments on two levels:

1.  It makes our code more verbose.
    While it is a small amount of additional visual clutter, it is still cluttered, nevertheless.
2.  More importantly, the comment represents yet another thing that must be changed if we change the code!
    We do not want our documentation to get *out of sync* of the code it is documenting, so we are obligated to update these comments whenever we made relevant changes to the program.

This last point is the real nail in the coffin for including excessive amounts of documentation in code.
The more documentation we include, the more *maintenance cost* we incur in keeping everything up to date.

In our small-scale programming context, the effect of code maintenance is minimal.
But we want to ensure that you develop good programming habits in this course!
We will discourage you from writing inter-function (*i.e.*, within a function) in favor of writing code that is readable without additional comments (beyond doc comments).
If you need a comment to remember how the innards of a function work, this is a strong sign you have made the function too complicated.
Instead, use the decomposition tools we've introduced, such as helper functions and let-bindings, to make sense of the situation!

## Self-Checks

### Check: Oops (‡)

Here's the documentation for `substring`, gathered all together in one place.

```racket
;;; (substring str start end) -> string?
;;;   str : string?
;;;   start : integer?, a 0-based index (<= 0 start (length str))
;;;   end : integer?, a 0-based index (<= 0 end (length str))
;;; Returns the substring of `str` denoted by the start index `start` 
;;; (inclusive) and end index `end` (exclusive).
```

It turns out that the contract for `substring` is not complete; it is missing at least one precondition!
Experiment with various possible inputs for `substring` until you find a precondition not covered by our current doc comment.
Give an updated doc comment that covers this new precondition, adding it to either the parameter list or description of the comment.
