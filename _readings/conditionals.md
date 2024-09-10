---
title: Conditional evaluation in Scheme
summary: |
  Many programs need to make choices. In this reading, we
  consider Scheme's *conditional expressions*, expressions that allow
  programs to behave differently in different situations.
---

## Introduction

When Scheme encounters a procedure call, it looks at all of the
subexpressions within the parentheses and evaluates each one.
Sometimes, however, the programmer wants Scheme to exercise more
discretion. Specifically, the programmer wants to select just one
subexpression for evaluation from two or more alternatives. In such
cases, one uses a *conditional expression*, an expression that
checks whether some condition is met and selects the subexpression
to evaluate on the basis of the outcome of that condition.  (We
will sometimes refer to these conditions as "tests".  The tests
(conditions) in conditionals are a question about the state of input
or the system that let us make a decision.)

For instance, suppose we want to explicitly classify a city as "North" if
its latitude is at least 39.72 and "South" if its latitude is less than
39.72.  To write a procedure that like this, we benefit from a mechanism
that allows us to explicitly tell Scheme how to choose which expression
to evaluate. Such mechanisms are the primary subject of this reading.

## If expressions

The simplest conditional expression in Scheme is an *`if` expression*. An
if expression typically has three components:

1.  A condition or guard.
2.  A consequent or if-branch.
3.  An alternative or else-branch.

It selects one or the other of these expressions, depending on the outcome of the guard.
The general form is

```racket
(if <expr1> <expr2> <expr3>)
```

Where the guard, if-branch, and else-branch correspond to `<expr1>`, `<expr2>`, and `<expr3>`, respectively.

We will return to the particular details in a moment.
For now, let us consider the conditional we might write for the procedure to determine whether a location is in the North or South of the US.
(We would not normally include comments; the code should be self-explanatory.)

```racket
(if (>= latitude 39.72) ; If the latitude is at least 39.72
    "North"             ; Classify it as North
    "South")            ; Otherwise, classify it as "South"
```

To turn this expression into a procedure, we need to add the `define`
keyword, a name (such as `categorize-city`), a lambda expression,
and such. We also want to give appropriate documentation and a bit of
cleanup to the results.

Here, then, is the complete definition of the `categorize-city` procedure:

```
;;; (categorize-city latitude) -> string?
;;;   latitude : real?
;;; Categorize a city as "North" or "South" based on its latitude.
(define categorize-city
  (lambda (latitude)
    (if (>= latitude 39.72) ; If the latitude is at least 39.72
        "North"             ; Classify it as North
        "South")))          ; Otherwise, classify it as S"South"
```

In an `if`-expression of the form `(if <expr1> <expr2> <expr3>)`{:.signature}:

+ `<expr1>` is an expression that evaluates to a boolean value, *i.e.*, to either `#t` or `#f`.
  We call this the *condition* or *guard expression* (or shorter, "guard") of the conditional.
+ `<expr2>` is an expression that is evaluated only when the guard evaluates to `#t`.
  We call this the *consequent* or *if-branch* of the conditional.
+ `<expr3>` is an expression that is evaluated only when the guard evaluates to `#f`.
  We call this the *alternative* or *else-branch* of the conditional.

Note that a boolean value can only evaluate to exactly *one* of `#t` and `#f`.
Therefore, we expect that exactly *one* of the `consequent` and `alternative` will be evaluated when evaluating a conditional.

How does this play out in our mental model of computation?
Let's consider a call to `categorize-city` and see how it evaluates:

~~~racket
    (categorize-city 30.0)
--> (if (>= 30.0 39.72)
        "North"
        "South")
--> (if #f
        "North"
        "South")
--> "South"
~~~

Note in this example how we first evaluate the condition to `#f` and then *substitute* the `alternative` expression for the overall conditional expression.
If we had, instead evaluated the condition to `#t`, then we would have substituted the `consequent` expression in the place of the overall expression.

## The semantics of conditionals

How do conditional work with our mental model of computation?
At a high-level, a conditional proceeds as follows:

1. We first evaluate the guard to a value and that value must be of boolean type.
2. If the guard evaluates to true, then we substitute the if-branch for the overall conditional and continue evaluation.
   Otherwise, the guard must have evaluated to false.
   We then substitute the else-branch for the overall conditional and continue evaluation.

These rules can be captured by the following *evaluation skeletons* where `e1`, `e2`, and `e3` are arbitrary expressions:

~~~racket
1.  (if e1 e2 e3) --> (if e1' e2 e3)    [whenever e1 --> e1']

2.  (if #t e2 e3) --> e2

    (if #f e2 e3) --> e3
~~~

Note that we *do not evaluate `e2` and `e3`* until after `e1` is fully evaluated to a boolean value.
On top this we only evaluate *exactly one* of `e2` and `e3` depending on whether `e1` evaluates to `#t` or `#f`.

In our example evaluation above:

~~~racket
    (categorize-city 30.0)
--> (if (>= 30.0 39.72)
        "North"
        "South")
--> (if #f
        "North"
        "South")
--> "South"
~~~

We first evaluated the expression `(>= 30.0 39.72)` to a value.
That value was `#f`.
As a result, the conditional evaluates to the else-branch which contains the expression `"South"`.
`"South"` itself is a string value, so we are done evaluating at this point!

## Supporting multiple alternatives with `cond`

Suppose that we wanted to write a conditional expression that consisted of more than two possibilities.
For example, how would I write a conditional that tested whether a number was negative, positive, or zero?
Because an `if`-expression is an expression and the branches of an `if`-expression are themselves expressions, we can *nest* `if`-expressions to achieve this effect:

~~~racket
(if (n < 0)
    "lower"           ; n < 0
    (if (equal? n 0)
        "zero"        ; n = 0
        "higher"))    ; n > 0
~~~

We can see this works with our mental model of evaluation, *e.g.*, if `n = 0`:

~~~racket
    (if (0 < 0)
        "lower"
        (if (equal? 0 0)
            "zero"
            "higher"))
    ; Evaluate the guard
--> (if #f
        "lower"
        (if (equal? 0 0)
            "zero"
            "higher"))
    ; The guard is false; use the alterante
--> (if (equal? 0 0)
        "zero"
        "higher")
    ; Evaluate the guard
--> (if #t
        "zero"
        "higher")
    ; The guard is true; use the consequent
--> "zero"
~~~

While nesting `if`-expressions in this matter works, it is far from convenient.
As you have experienced, writing nested expressions in Scheme can be tedious and error-prone because of the need to correctly match and nest parentheses.
Because of this, Scheme provides an alternative to the `if`-expression, the `cond`-expression, that captures this pattern more concisely.

```
(cond
  [guard-0
   consequent-0]
  ...
  [guard-n
   consequent-n]
  [else
   alternate])
```

(Note that like `if`, `cond` is also a keyword.
Recall that keywords differ from procedures in that the order of evaluation of the parameters may differ.)

The first expression within a `cond` clause is a guard, similar to the
condition in an `if` expression. When the value of such a guard is found to be
`#f`, the subexpression that follows the guard is ignored and Scheme proceeds
to the guard at the beginning of the next `cond` clause. But when a guard is
evaluated and the value turns out to be true, the consequent for that guard is
evaluated and its value is the value of the whole cond expression. Only one
guard/consequent clause is used: subsequent `cond` clauses are completely
ignored.

In other words, when Scheme encounters a `cond` expression, it works its
way through the `cond` clauses, evaluating the guard at the beginning of
each one, until it reaches a guard that *succeeds* (one that does not have
`#f` as its value). It then makes a ninety-degree turn and evaluates
any consequents in the selected `cond` clause, retaining the value of
the last consequent.  (If there are no consequents, it uses the value
of the guard.)

If all of the guards in a `cond` expression are found to be false,
the value of the `cond` expression is unspecified (that is, it might
be anything!). To prevent the surprising results that can ensue when
one computes with unspecified values, good programmers customarily end
every `cond` expression with a `cond` clause in which the keyword `else`
appears in place of a guard. Scheme treats such a `cond` clause as if it
had a guard that always succeeded. If it is reached, the subexpressions
following `else` are evaluated, and the value of the last one is the
value of the whole `cond` expression.

For example, here is a `cond` expression that attempts to figure out
what the type of `datum` is and gives back a string that represents
that type.

```
(define type-of
  (lambda (datum)
    (cond
      [(number? datum) 
       "number"]
      [(string? datum)
       "string"]
      [else
       "some-other-type"])))
```

The expression has four `cond` clauses. In the first, the guard is `(number?
datum)`.  If `datum` is a number, the expression produces the string
`"number"`.  If not, we proceed on to the second `cond` clause. Its guard is
`(string? datum)`.  If datum is a string, the expression produces the string
`"string"` and nothing else.  Finally, if none of those cases hold, the `else`
clause produces the value `"some-other-type"`.

In our mental model of computation, `cond` behaves identically to the nested `if`-expression we originally designed.
We evaluate each of the conditions in top-down order until we arrive at a condition that evaluates to `#t`.
The entire `cond` then evaluates to the consequent associated with that guard.
For example, let's call `type-of` on a string and see what we get:

~~~racket
    (type-of "my-symbol")
--> (cond 
      [(number? "my-symbol")
       "number"]
      [(string? "my-symbol")
       "string"]
      [else
       "some-other-type"]
    ; Evaluate the first guard
--> (cond 
      [#f
       "number"]
      [(string? "my-symbol")
       "string"]
      [else
       "some-other-type"]
    ; The first guard is false; drop the first clause
--> (cond 
      [(string? "my-symbol")
       "string"]
      [else
       "some-other-type"]
    ; Evaluate the second guard
--> (cond 
      [#t
       "string"]
      [else
       "some-other-type"]
    ; The first guard is true; evaluate to its body
--> "string"
~~~

In our mental model, we can imagine "peeling" away the conditionals one at a time in a top-bottom fashion until we arrive at a true one.
If all of them evaluate to `#f` then the `else` clause fires.

### A caution: Watch your parens!

As you may have noted from our discussion of `cond`, `cond` expressions
can use square brackets rather than parenthesis to indicate structure.
That is, they do not surround an expression to evaluate (a procedure
followed by its parameters). Instead, they serve only to group things. In
this case, the parentheses group the guard and consequents for each
`cond` clause. The square brackets are just a notational convenience;
parenthesis will work just as well, and you'll see a lot of Scheme code
that uses parentheses rather than square brackets. Scheme, like most
modern Scheme implementations, allows both because the square brackets
add a bit of clarity.

When writing `cond` clauses, you should take the time to verify that
you've used the right number of parentheses and square brackets. Each
clause has its own open and close square brackets (or open and close
parenthesis). Typically, the guard has parentheses, unless it's the
`else` clause. Make sure to include both sets.

## Expressing conditional computation with `and` and `or`

As we saw in [the reading on Boolean values](../readings/boolean), both
`and` and `or` provide a type of conditional behavior. In particular,
`and` evaluates each argument in turn until it hits a value that is
`#f` and then returns `#f` (or returns the last value if none return
`#f`). Similarly, `or` evaluates each argument in turn until it finds
one that is not `#f`, in which case it returns that value, or until it
runs out of values, in which case it returns `#f`.

That is, `(or exp0 exp1 ... expn)`{:.signature} behaves much like the
following `cond` expression, except that the `or` version evaluates each
expression once, rather than twice.

```
(cond
  [exp0 
   exp0]
  [exp1 
   exp1]
  ...
  [expn 
   expn]
  [else 
   #f])
```

Similarly, `(and exp0 exp1 ... expn)`{:.signature} behaves much like
the following `cond` expression.

```
(cond
  [(not exp0) 
   #f]
  [(not exp1) 
   #f]
  ...  [(not expn) #f] [else expn]) 
```

Most beginning programmers find the `cond` versions much more
understandable, but some advanced Scheme programmers use the `and`
and `or` forms because they find them clearer. Certainly, the `cond`
equivalents for both `or` and `and` are quite repetitious.

## Reference

`(if <expr1> <expr2> <expr3>)`{:.signature} *Standard keyword.*
:   Evaluate *`<expr1>`*. If its value is true, substitute and evaluate *`<expr2>`* and return its value. If the value of the condition is false (\#f), substitute and evaluate *`<expr3>`*.

`(cond [guard-1 consequents-1] [guard-2 consequents-2] ... [guard-n consequents-n] [else alternative])`{:.signature} *Standard keyword.*
  : Evaluate each guard in turn until one is true. It then evaluates the
    corresponding sequence of consequent expressions and returns the value
    of the last consequent. If none of the guards is true, evaluates the
    alternative and returns its value.

`(and <expr1> ... <exprk>)`{:.signature} *Standard keyword.*
  : Evaluate each expression in turn. If any of those values is false, 
    return false. Otherwise, return the value of the last expression.

`(or <expr1> ... <exprk>)`{:.signature} *Standard keyword.*
  : Evaluate each expression in turn. If any of those values is true, 
    return the first true value. Otherwise, return false.

## Self checks

### Check 1: Basics (‡)

a. Assuming `num` is defined as an integer, write an `if` expression
that produces double the value of `num` if it is odd, and half the
value otherwise.

b. Write a `cond` expression that takes a real number, `num`, as
input and produces the symbol `positive` if `num` is greater than
zero, the symbol `negative` if `num` is less than zero, and the
symbol `neither` otherwise.

### Check 2: Choosing a kind of conditional

a. Why might you choose `if` rather then `cond`?

b. Why might you choose `cond` rather than `if`?
