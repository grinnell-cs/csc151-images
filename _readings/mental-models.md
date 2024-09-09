---
title: Mental models of computation
summary: |
  We introduce a mental model of computation for Scheme programs that allows us to read code and predict its behavior without having to run the program.
mathjax: true
---

So far, we have introduced a number of features of the Scheme programming language including top-level definitions, procedure declarations, and procedure applications.
We have also focused nearly exclusively on how to *author* programs using these tools, appealing to your intuition about these constructs to explain how they work.

We've also recently learned about the _substitutive model of evaluation_.
Basically, to evaluate an expression, we evaluate all of the arguments to the function and then apply the function.
For convenience, we've been doing this left-to-right.
The self-referential nature of the model also means that we end up evaluating expressions from inner to outer.

As you might expect, procedures complicate matters.
Our intuition and the model might not be enough when we run into some special situations (some folks call these "corner cases") that we may run into when writing Scheme programs.

For example, consider the following procedure definitions:

```racket
(define f (lambda (x) (+ x 1)))

(define g (lambda (y) (+ y 1)))
```

Are these two procedures equivalent?
Textually, the procedures `f` and `g` are nearly identical, but the names of the parameters are different.
Does this difference matter?
Our intuition says no: parameter names don't seem to matter in this regard.
For example, if we try out these procedures in the Interactions pane:

```racket
> (f 5)
6
> (g 5)
6
> (f -1)
0
> (g -1)
0
```

There's too many integers to test in this manner, but after a few checks of this sort, we feel pretty confident in our intuition.

However, what happens if we have the following situation:

```racket
(define x 100)

(define f (lambda (x) (+ x 1)))
```

What will `(f 10)` produce?
Two possible answers are:

+  `101` if the `define`ed version of `x` is used in the computation of `f`.
+  `11` if the value of `10` that is passed to the procedure is used.

But maybe the code produces an error because there are two different `x`'s, and the computer gets confused.
Or even more bizarre, but not out of the realm of possibility: maybe the `define`ed `x` is now `10` or `11`!

Which of these is the correct answer?
We can, of course, run this code to find out:

```racket
> (f 10)
11
> x
100
```

But *why* is this the case?
What rules govern the execution of Scheme programs and how can they explain this behavior?

Before going too much further, let's try a similar pair of procedures.

```racket
(define eff (lambda (x) (+ x x)))

(define gee (lambda (y) (+ x y)))
```

Once again, we have a pair of procedures that seem to differ primarily in the name of the parameter.
Both add the parameter to `x`.
But is it the same `x`?  What do you expect to happen for each of the following?

```
> (eff 10)

> (gee 10)

```

Before reading on, come up with a hypothesis.

Did you do so?

Great.
Try it in your Scheme interpreter (DrRacket or Scamper or ...).
You may also want to look at our notes at the end.

(_Pause inserted in document so that you can check your answer by entering it in a Scheme interpreter, looking at the notes, or both._)

Since `x` does not always have a value, `(gee 10)` results in an error that `x` is undefined.

However, if `x` is defined, things will work fine.
The two functions will just be a bit inconsistent.

```racket
> (define x 100)
> (eff 10)
20
> (gee 10)
110
```

As you've likely concluded, understanding all that is going on is a bit complex.

In this reading, we'll consider a set of rules to help us better understand Scheme programs: a *mental model of computation*.
This mental model will allow us to interpret many Scheme programs and accurately predict their results.
Note that the mental model does not completely follow the implementation used in most Scheme interpreters; life is a bit too complex for that.
However, it will help you understand most small programs.
And we will extend the model throughout the semester.

## Expressions

As we've seen, _expressions_ lie at the core of Scheme.
Expressions are syntactic constructs that evaluate to values.
We are intimately familiar with expressions already: they form the basis of computation in arithmetic!
For example, here is an arithmetic expression:

\\[
3 × (8 + 4 ÷ 2)
\\]

This expression evaluates to a final value, \\( 30 \\).
We say that \\( 30 \\) is a *value*: it is an expression that no longer takes any steps of evaluation.

The analogous Scheme code is also an expression:

```racket
> (* 3 (+ 8 (/ 4 2)))
30
```

This extends to Scheme code that doesn't involve numbers at all!

```racket
(> (string-upcase (string-append "hello world" "!!!"))
"HELLO WORLD!!!"
```

Here the expression produces a string as output---the upper-case version of the string resulting from gluing `"hello world"` and `"!!!"` together.

## A substitutive model of evaluation

The process of determining the value that an expression produces is called *evaluation*.
The evaluation of expressions is the primary way that we perform computation in Scheme!
But how do expressions evaluate?
We determine how expressions evaluate by applying two basic sets rules:

1. *Rules of precedence* that tell the order in which to evaluate operators.
2. *Associativity rules* that tell us how the arguments to operators *bind* when chained together.

For arithmetic, we know that division and multiplication are evaluated before addition and subtraction.
Furthermore, expressions in parentheses are evaluated first, irrespective of the operators involved.
Finally, we typically expect that the arithmetic operators are *left-associative* resulting in a *left-to-right* evaluation order.

```
  3 × (8 + 4 ÷ 2)
= 3 × (8 +   2  )
= 3 ×     10
= 30
```
At every step of evaluation,

1. We determine the sub-expression to evaluate next based off of our rules.
2. We evaluate that sub-expression to a value.
3. We *substitute* the resulting value for that sub-expression to create a new, slightly simplified expression.

We then repeat this process until we arrive at a final value.

While we may find Scheme's syntax arcane at first, it has one major benefit: There is only one rule for determining order-of-operations for expressions!
That rule is straightforward: *evaluate the arguments to a procedure before appling the procedure*!
(Some of us say "evaluate the innermost parenthesized expression first".)
There is nothing else to know.
Or almost nothing else to know.
Let's see how that works for the Scheme version of this arithmetic expression:

```
    (* 3 (+ 8 (/ 4 2)))
--> (* 3 (+ 8    2  ))
--> (* 3      10     )
--> 30
```

(Note that we use the symbol `-->` to denote that one expression in Scheme evaluates or *steps* to another expression.)

Perhaps it would've been better in grade school if you were introduced to Scheme-style infix notation for arithmetic operations first.
There are fewer rules to memorize, after all.

Okay, perhaps it's not quite that simple.
What happens if a a procedure is called with multiple arguments, each of which is an expression?

```
    (* (+ 1 2) (+ 4 1))
```

We need to evaluate the `(+ 1 2)` before we do the multiplication.
We need to evaluate the `(+ 4 1)` before we do the multiplication.
But which of those to should we do first?
Generally, *it doesn't matter*.
Let's check.

First, we'll evaluate the first argument first.

```
    (* (+ 1 2) (+ 4 1))
--> (* 3 (+ 4 1))
--> (* 3 5)
--> 15
```

Next, we'll evaluate the second argument first.

```
    (* (+ 1 2) (+ 4 1))
--> (* (+ 1 2) 5)
--> (* 3 5)
--> 15
```

You may not be surprised to discover that we got the same result in each case.
But it turns out that we can't guarantee that in all programming languages.
(We can't even guarantee it in Scheme, but we can guarantee it for most of the programs we write.)
Nonetheless, for the time being, you can assume that the order in which we evaluate arguments does not matter, provided you evaluate arguments before you apply a procedure.
And, even though the order does not matter, we will generally evaluate arguments left to right.

## Definitions

We have a starting point.
We know how to evaluate expressions.
But expressions often involve identifiers (names).
In Scheme, we bind values to identifiers using `define` statements.
How should we mentally model `define` statements and the names they define?

One easy way to think about them is in terms of a table that tells us what value to use for each name.
When we see a `define` statement, we first evaluate the expression and then we put the name and the value in the table.
We tend to write that as `name:value`.

```
    ; Table: []
    (define x 5)
    ; Table: [x:5]
    (define y 17)
    ; Table: [x:5, y:17]
    (define z (* 2 3))
--> (define z 6)
    ; Table: [x:5, y:17, z:6]
```

What good is the table?
The table informs how we evaluate expressions that consist only of variables (named values).
When evaluating an expression, when the next expression to evaluate is a variable, we look in the table to find the value associated with the variables.

```
    ; Table: []
    (define x 10)
    ; Table: [x:10]
    (define y 2)
    ; Table: [x:10, y:2]
    (+ (* x 4) y))
    ; We need to evaluate the (* x 4) before we add
    ; We need to evaluate the x before we multiply.
    ; We look x up in the table
--> (+ (* 10 4) y)
    ; We need to evaluate the (* 10 x) before we add
--> (+ 40 y)
    ; We need to evaluate the y before we add
    ; We look y up in the table
--> (+ 40 2)
--> 42
```

Seems pretty straightforward.  Right?
What happens if we write an expression that involves a variable not in the table?

```
    ; Table: [x:10]
    (+ (* x 4) y))
--> (+ (* 10 4) y)
--> (+ 40 y)
    ; y is not in the table
    y: undefined
```

Note that these tables are mostly a notational convenience, designed to make it easier for us to figure out the value of expressions when we're tracing.
However, most programming languages, including Scheme, also have a hidden form of table which basically does the same thing (that is, that associates values with variables names).

## Procedures and the substitutive model

When we evaluate procedures, we have implicitly "carried out the behavior of the procedures" in our head and replaced the procedure call with the value.
For example

```
    (+ 1 1)
--> 2
```

We know how addition works, so we can treat the evaluation of `+` as a single step.
Of course, if the arguments to `+` required evaluation first, we would need to carry that out according to our evaluation rules:

```
    (+ (+ 1 1) 8)
--> (+    2    8)
--> 10
```

The step-by-step evaluation of an expression to a final value is called the *execution trace* or just *trace* of a particular expression.

However, what happens when our procedures are those we have defined ourselves?
For example, something simple like `double`:

```racket
(define double
  (lambda (n) 
    (* 2 n)))
```

How does an expression like `(double (/ 6 3))` evaluate?
As a first order of business, we should evaluate its argument to a value.

```
    (double (/ 10 2))
--> (double 5)
```

Good!
Now how does `(double 5)` evaluate?
We proceed as follows:

1.  We *substitute* the *body* of the procedure for the procedure call in question.
    The body of `double` is `(* 2 n)` so we would replace `(double 5)` with `(* 2 n)`.
2.  Note that, on its own, the parameter `n` is not defined!
    To patch this up, we also substitute each argument for its associated parameter in the body of the procedure.
    We pass `5` for `n` so we ultimately replace `(double 5)` with `(* 2 5)`.

All of this occurs in one step of evaluation and afterwards, we continue evaluation of the expression as normal.
So the complete evaluation of our original expression is:

```
    (double (/ 10 2))
--> (double    5)
--> (* 2 5)
--> 10
```

While this rule is simple, it covers almost *all occurrences* of procedures we'll see in Scheme!
This is the beauty of a programming language at its core: a small set of rules governs a near, unimaginable set of behavior we can author in a computer program!

## Definitions, tables, and procedures

We've separately considered models for the definitions that let us evaluate variables for procedures.
Let's also consider them together.
We know that `(define var exp)` evaluates the expression and the pairs it with the variable in a table.
So what happens when we write `(define var (lambda (params) body))`?

It turns out that Scheme does something a bit special with lambda expressions (expressions that begin with lambda).
Instead of evaluating them further, Scheme stops evaluating until you need to apply the lambda expression.
Then, and only then, does it do what we described above: We substitute it in for the name and then replace its named parameters (the "formals", in CS parlance) with the values of the corresponding arguments (the "actuals", in CS parlance).

It turns out that these model of operation means we can use lambdas without defining them.
We'll leave that issue for a bit later in your education.

## Self-checks

### Check 1: Code tracing (‡)

Assume the existence of the following Scheme definitions:

```racket
(define add-3
  (lambda (x y z)
    (+ (+ x y) z)))

(define triple
  (lambda (n)
    (add-3 n n n)))
```

With these definitions, give the step-by-step evaluation (*i.e.*, evaluation traces) for each of the following expressions.
Please do this by hand; don't rely on the tools that might be part of your Scheme interpreter.
Make sure to write down *all* steps of evaluation as required by our substitutive model of computation!

{:type="a"}
1.  `(+ 3 (* 5 (/ 2 (- 10 5))))`
2.  `(add-3 (* 2 3) (+ 8 3) (/ 1 2))`
3.  `(triple (+ 5 0.25))`

Make sure to check your work by entering these expressions into your Scheme interpreter!

## Appendices

### Appendix A: `eff` and `gee`

What should we get for `(eff 10)`?  Presumably, `x` gets the value `10`, we add the two `10` values together, and end up with `20`.

Let's check.

```
> (eff 10)
20
```

But what happens when we try `(gee 10)`?  In that case, `y` gets the value 10.  What value does `x` have?  Unless we've defined `x` with `define`, it has no value.  Perhaps we'll get an error.

```
> (gee 10)
. . x: undefined;
 cannot reference an identifier before its definition
```