---
title: Mental Models of Scheme Programs
summary: |
  In this laboratory, we will further develop our mental model of computation of Scheme programs by considering how `define` statements introduce identifiers into our programs.
---

In the reading, we developed an initial mental model of computation for Scheme programs by examining how expressions compute.
In today's lab, we'll gain practice using that model to predict the behavior of simple Scheme programs.
We'll then enhance that model with the `define` construct that we have seen throughout our readings.

# Logistics and Turn-in

For our labs, you will keep the same partner throughout the week so that you can coordinate your lab turn-ins with them.
Recall that labs for the week are all due on _Saturday_, so make sure to talk with your partner about setting aside time outside of class to finish up labs, if needed!

Each lab will have an entry on Gradescope.
Some labs will require you to turn in one or more source files that you develop.
Other labs, such as this one, will have you work primarily on paper and then turn in an image or scan of your work.
Note that even though this is a computer programming course, writing on paper is a powerful tool to foster creative thought!
We encourage you to sketch out ideas, take notes, or otherwise brainstorm on paper whenever possible.

Finally, like our first lab, we will have distinguished driver/navigator roles where:

+   The driver is the person "at the keyboard."
    In the context of a paper-based assignment, they should be the one writing down a final solution.
+   The navigator is the person guiding the navigator and checking their work.

Each problem will designate person A or person B to be the driver, so make sure to choose who is person A and person B in your group!

# Problem 1: From Math to Scheme

**For this problem, alternate drivers between each expression.**

Consider the following arithmetic expressions.

{:type="a"}
1.  $$3 * (4 - \frac{1}{7})$$.
2.  $$(3 + 5)^\frac{1}{2}$$.
3.  $$1 + (-2 + (3 + (4 + -5)))$$.
4.  $$8 + 3 * 2 - \frac{1}{5}$$.

(Recall that the function `(expt a b)` computes $$a^b$$.)

For each of these arithmetic expressions:

1.  Translate the expression into an equivalent Scheme expression.
2.  Give the step-by-step evaluation of that Scheme expression to a final value.
    We call such a step-by-step evaluation an _evaluation trace_.
3.  Check your work by entering your Scheme expressions into a `.scm` file and using the explorations panel of Scamper to step through evaluation of each expression.

# Problem 2: Parts of Expressions

**For this problem, alternate drivers between each expression.**

In the reading, we introduced the _syntax of expressions_.
It is easy to think of program constructs as fixed elements that must appear exactly as-presented in our programs.
However, these program constructs are far more like _highly-composable building blocks_ that, provided we understand how they connect, we can put together however we would like in order to express our computations.

In this problem, we'll take a look at identifying the various parts of expressions of significant complexity.
For each of the following expressions, identify:

+   The sub-expressions of the overall expression.
+   The identifiers of the overall expression.
+   All of the numbers of the overall expression.
+   All of the strings of the overall expression.

In addition to this information, try to "read" the expression and in a sentence, describe what you believe the expression evaluates to.
Check your work in Scamper.

~~~racket
(import image)

; (a)
(string-length
  (string-append "hello"
                 " "
                 "world!"))

; (b)
(+ 32 (* 8 60) (* (/ 1 2) 4 (expt 60 2)))


; (c)
(odd? (length (string-split "4,9,10,11,2,3" ",")))

; (d)
(define width 100)
(define height 100)
(define alpha 0.5)

(overlay
  (beside
    (rectangle width height "solid" (color 255 0 0 alpha))
    (rectangle (* width 0.75) (* height 0.75) "solid" (color 0 255 0 (* alpha 0.75)))
    (rectangle (* width 0.5) (* height 0.5) "solid" (color 0 0 255 (* alpha 0.5)))
    (rectangle (* width 0.25) (* height 0.25) "solid" (color 0 0 0 (* alpha 0.25))))
  (beside
    (rectangle (* width 0.25) (* height 0.25) "solid" (color 0 0 0 (* alpha 0.25)))
    (rectangle (* width 0.5) (* height 0.5) "solid" (color 0 0 255 (* alpha 0.5)))
    (rectangle (* width 0.75) (* height 0.75) "solid" (color 0 255 0 (* alpha 0.75)))
    (rectangle width height "solid" (color 255 0 0 alpha))))

~~~

Finally, with your partner, review your results for parts (a) and (c) and consider this statement:

> When reading Scheme expressions, read them "inside-out" or "right-to-left."

Explain why this statement makes sense given what you know about how expressions evaluate and how they are syntactically formed.

# Problem 3: Making a Statement

In previous readings, we introduced `define` as a construct that allowed us to introduce _variables_ or _identifiers_ into our programs:

~~~racket
> (define x 10)
[[ x bound ]]
> (+ x 1)
11
~~~

Let's go through the process of trying to understanding how `define` in Scheme programs.
Along the way we'll update our mental model of computation to account for what we observe in our experimentation.
Note that this problem is a microcosm of the language-learning experience.
As you learn new constructs and techniques, you'll find that your current understanding of how program works does not account for these things, and you will evolve your learning.
Usually this evolution amounts to _abstracting_ your understanding so that it applies to more scenarios than before!

## Part A: Category

**Driver: A**

At first glance the `define` construct above looks similar to the operator form or _function call_ form of expressions we identified in the reading:

~~~racket
(<identifier> <expr1> ... <exprk>)
~~~

If this was the case, this implies that we can use `define` anywhere an expression is considered.
For example, perhaps we can get the same effect as the code above by _inlining_ the `define` into the addition:

~~~racket
> (+ (define x 10) 1)
~~~

{:type="i"}
1.  Try this example out in Scamper.
    What is the output that you receive or what errors are produced if the code is invalid?
2.  Develop _two_ other examples of trying to use `define` as an expression, similar to the give example case.
    For inspiration, try replacing a value in an expression you've written already with `(define x <value>)`.
3.  Write down the output or errors that you get in each case.
4.  Answer the following question based on your experience: is the `define` form an expression?

## Part B: Syntax

**Driver: B**

From the previous part, you should have concluded that `define` is _not_ an expression!
We certainly do not seem to be able to put a `define` form anywhere an expression is expected.
Consequently, we must ask ourselves: what syntactic category is a `define` and how does it relate to expressions?

It turns out that `define` is an example of a syntactic category distinct from expressions; it is a statement!

> A _statement_ is a construct that produces an _effect_ in our program.

We'll have more to say about "effects" in our programs later in the course.
For now, we'll say that the "effect" of a `define` statement is simple: it binds a value to an identifier.
In the example that started this problem, we bound `10` to the identifier `x`.
Consequently, whenever we mention `x` in our program, we really mean the value that is bound to that identifier, `10` in this case.

First let's address the syntax of a `define`.
So we far, we have seen that `define` takes the following form:

~~~racket
(define <??> <??>)
~~~

Where we haven't quite defined what goes in the `<??>` yet.
We assumed that a `define` statements binds an identifier, so it stands to reason that the first placeholder should be an identifier:

~~~racket
(define <identifier> <??>)
~~~

With your partner, try out `define` statements with different constructs in the last position.
You should try out various constructs that you've learned in the reading so far, in particular, the different forms of expressions.
From your experimentation, describe in a sentence what can appear in the final position of a `define` statement and complete the syntax rule with the syntactic category allowed in that position.

## Part C: Corners

**Driver A**

Now let's think about how `define` statements execute.
In short, we execute statements in our program in top-down fashion.
However, subtleties arise in this execution model that we should consider.

For each of the following programs:

+   Write down how the following programs evaluate, step-by-step.
+   Test your results in Scamper.
+   In a sentence or two, describe how the program executes and why the program ultimately behaves in the way that it does.

Note that some of these programs produce errors; that is intentional!

~~~racket
; (i)
(define x 5)
(define y (* 5 8))
(define z (+ 1 1))

(+ x y z)
~~~

~~~racket
; (ii)
(define x 20)
(define y (* x 20))
(define z (* y y))

(+ x y z)
~~~

~~~racket
; (iii)
(define x 10)
(define y (+ x z))
(define z (* x 2))

(+ x y z)
~~~

~~~racket
; (iv)
(define x 10)
(define y (+ x 1))
(define x (* y 2))

(+ x y)
~~~

## Part D: Summary of Syntax

**Driver B**

Finally, with statements and their operations crystallized, let's try to summarize everything we've learned between the reading and lab for today.
We have a number of syntactic constructs and categories:

+   Numbers,
+   Strings,
+   Identifiers,
+   Function calls/operations,
+   `define`, identifier binding,
+   Expressions, and
+   Statements

First, write down the rules for well-formed expressions and well-formed statements.
Recall, we wrote down the definition of well-formed expressions as follows:

<div style="border-style: solid; padding: 1em; margin: 1em; background-color: rgb(235, 235, 255);" markdown=1>
**Definition (Well-formed Expressions)**: a _well-formed Scheme expression_ is either:

+   A number,
+   A string of the form `"<text>"`, or
+   A function call of the form `(<identifier> <expr1> ... <exprk>)`.
</div>

Update this definition in light of your experimentation with `define` statements.
Are there any other constructs from the list that we should allow as expressions?

Next, we'll summarize what a well-formed Scheme program is:

<div style="border-style: solid; padding: 1em; margin: 1em; background-color: rgb(235, 235, 255);" markdown=1>
**Definition (Well-formed Program)**: a _well-formed Scheme program_ is a collection of statements.
</div>

With this definition, we just need to define what are the allowable forms for a statement.
Complete this definition based on your experimentation:

<div style="border-style: solid; padding: 1em; margin: 1em; background-color: rgb(235, 235, 255);" markdown=1>
**Definition (Well-formed Statements)**: a _well-formed Scheme statement_ is ... .
</div>

Note that we have actually seen _two_ statement forms in Scheme!
Think about what our programs looked like before we introduced `define` statements.
What other syntactic category is considered a statement in Scheme?

Finally, for this additional statement form, write down what the _effect_ that is produces when it is evaluated.
The effect that a `define` produces is "create an identifier for subsequent use in the program."
What do you observe in the output window when you evaluate this statement form?
