---
title: Mental models of Scheme programs
summary: |
  In this laboratory, we will further develop our mental model of computation of Scheme programs by considering how `define` statements introduce identifiers into our programs.
---

In the reading, we developed an initial mental model of computation for Scheme programs by examining how expressions compute.
In today's lab, we'll gain practice using that model to predict the behavior of simple Scheme programs.
We'll then enhance that model with the `define` construct that we have seen throughout our readings.

## Logistics

You will do most labs on the computer.  You will submit those labs on Gradescope.  In most cases, we will ask you to upload a file or to copy a procedure you've written.  _It is fine if the code does not work perfectly (or at all).  Just let us know that you're aware of the problems._  Most of the time, you will only turn in a few of the exercises.

Other labs, such as this one, you will do some/most of your work on paper and submit the paper.

Whether electronic or paper, labs are due before the next class.  You can use a token to submit a lab late, but it must be in before before the subsequent class.

While we would prefer that you finish the lab with your partner, if you decide to finish th elab separately, you may do so.  Please make sure to cite your partner when submitting the lab.

In most labs, we will have distinguished driver/navigator roles where:

+   The driver is the person "at the keyboard."
    In the context of a paper-based assignment, they should be the one writing down a final solution.
+   The navigator is the person guiding the navigator and checking their work.

Each exercise will designate person A or person B to be the driver.  Person A should be the person closest to the board.

## Preparation

a. Introduce yourself to your partner.

b. Grab a piece of paper from the back of of the room.  If you don't have your own pen, feel free to grab a pen, too.

c. One partner should log in to the computer and start DrRacket.

d. Update the CSC151 library using the following steps.

* Go to `File` → `Package Manager...` in the menu.
* Enter the following URL into the "Package Source" textbox: <https://github.com/grinnell-cs/csc151.git#main>
* If you see "Install", click that button.
* If you see "Update", click that button.
* Wait for the package to install or update.  You can tell that it's done when 
  the "Close" button becomes available.
* Click the "Close" button.

## Exercises

### Exercise 1: Tracing Scheme expressions (A drives, B navigates)

Consider the following Scheme expression.

```
(* (+ 1 2) (- (* 3 4) (* 2 (+ 1 1 1))))
```

a. Write down a step-by-step evaluation of this expression (we call
this a _trace_ or _evaluation trace_).  If you're not sure what
we're asking for, grab one of the course staff (professor or mentors).

b. The `csc151` library has a simple tool that permits you to trace some
kinds of code.  (It's new for 2023Fa, so there may be bugs.)  Let's try
it.  In DrRacket, 

i. Add `(require csc151/trace)` to the definitions pane.

ii. Click "Run"

iii. In the interactions pane, type

```
> (trace (* (+ 1 2) (- (* 3 4) (* 2 (+ 1 1 1)))))
```

You should see something like

```
Use (step) to step through the trace.

    (*
      (+ 1 2)
      (- (* 3 4) (* 2 (+ 1 1 1))))
```

iv. As the instructions suggest, you can use `(step)` to step through the trace.
Try doing so.

### Exercise 2: From Math to Scheme (alternating drivers)

**For this exercise, alternate drivers between each expression.**

Consider the following arithmetic expressions.

{:type="a"}
1.  $$3 * (4 - \frac{1}{7})$$. (Driver A)
2.  $$1 + (-2 + (3 + (4 + -5)))$$. (Driver B)

(Recall that the function `(expt a b)` computes $$a^b$$.)

For each of these arithmetic expressions.

a. Translate the expression into an equivalent Scheme expression.

b. Give the step-by-step evaluation of that Scheme expression to a final value.

c. Check your work by entering in DrRacket.

### Exercise 3: Parts of Expressions

**For this problem, alternate drivers between each expression.**

In the reading, we introduced the _syntax of expressions_.
It is easy to think of program constructs as fixed elements that must appear exactly as-presented in our programs.
However, these program constructs are far more like _highly-composable building blocks_ that, provided we understand how they connect, we can put together however we would like in order to express our computations.

In this problem, we'll take a look at identifying the various parts of expressions of significant complexity.
For each of the following expressions, identify:

+ The non-trivial sub-expressions of the overall expression.
+ The identifiers of the overall expression.
+ All of the numbers of the overall expression.
+ All of the strings of the overall expression.

In addition to this information, try to "read" the expression and in a sentence, describe what you believe the expression evaluates to.
Check your work in DrRacket.

```racket
; (a) (Driver B)
(string-length
  (string-append "hello"
                 " "
                 "world!"))
```

```racket
; (b) (Driver A)
(+ 32 (* 8 60) (* (/ 1 2) 4 (expt 60 2)))
```

```
; (c) (Driver B)
(odd? (length (string-split "4,9,10,11,2,3" ",")))
```

Finally, with your partner, review your results for parts (a) and (c) and consider this statement:

> When reading Scheme expressions, read them "inside-out" or "right-to-left."

Explain why this statement makes sense given what you know about how expressions evaluate and how they are syntactically formed.

### Exercise 4: Making a Statement (Driver A)

In our first Scheme work, we learned that `define` is a construct that allowed us to introduce _identifiers_ or _named values_ into our programs.  Each identifier/name is associated with ("bound to") a value.  (Some people call these "variables"; since they don't vary, we will try to avoid that name.)

```racket
> (define x 10) ; binds the identifier/name x to the value 10
> (+ x 1)
11
```

Let's go through the process of trying to understanding how `define` in Scheme programs.
Along the way we'll update our mental model of computation to account for what we observe in our experimentation.
Note that this problem is a microcosm of the language-learning experience.
As you learn new constructs and techniques, you'll find that your current understanding of how program works does not account for these things, and you will evolve your learning.
Usually this evolution amounts to _abstracting_ your understanding so that it applies to more scenarios than before!

At first glance the `define` construct above looks similar to the operator form or _function call_ form of expressions we identified in the reading:

```racket
(<identifier> <expr1> ... <exprk>)
```

If this was the case, this implies that we can use `define` anywhere an expression is considered.
For example, perhaps we can get the same effect as the code above by _inlining_ the `define` into the addition:

```racket
> (+ (define x 10) 1)
```

{:type="i"}
1.  Try this example out in DrRacket.
    What is the output that you receive or what errors are produced if the code is invalid?
2.  Develop _two_ other examples of trying to use `define` as an expression, similar to the give example case.  (You should write these down on the piece of paper.)
    For inspiration, try replacing a value in an expression you've written already with `(define x <value>)`.
3.  Write down the output or errors that you get in each case.
4.  Answer the following question based on your experience: **Is the `define` form an expression?**

### Exercise 5: The syntax of `define` (Driver B)

From the previous exercise , you should have concluded that `define` is _not_ an expression!
We certainly do not seem to be able to put a `define` form anywhere an expression is expected.
Consequently, we must ask ourselves: what syntactic category is a `define` and how does it relate to expressions?

It turns out that `define` is an example of a syntactic category distinct from expressions; it is a _statement_!

> A _statement_ is a construct that produces an _effect_ in our program.

We'll have more to say about "effects" in our programs later in the course.
For now, we'll say that the "effect" of a `define` statement is simple: it binds a value to an identifier.
In the example that started this problem, we bound `10` to the identifier `x`.
Consequently, whenever we mention `x` in our program, we really mean the value that is bound to that identifier, `10` in this case.

First let's address the syntax of a `define`.
So we far, we have seen that `define` takes the following form:

```racket
(define <??> <??>)
```

Where we haven't quite defined what goes in either `<??>` yet.
We assumed that a `define` statements binds an identifier, so it stands to reason that the first placeholder should be an identifier:

```racket
(define <identifier> <??>)
```

With your partner, try out `define` statements with different potential identifiers and different things in the last position.
You should try out various constructs that you've learned in the reading so far, in particular, the different forms of expressions.
From your experimentation, describe in a sentence what can appear in the final position of a `define` statement and complete the syntax rule with the syntactic category allowed in that position.

### Exercise 6: Potential complexities (alternating Drivers)

Now let's think about how `define` statements execute.
In short, we execute statements in our program in sequential fashion.
However, subtleties may arise in this execution model that we should consider.

For each of the following programs:

* Write down how you expect the following programs evaluate, step-by-step.
* Test your answers in DrRacket.
* In a sentence or two, describe how the program executes and why the program ultimately behaves in the way that it does.

Note that some of these programs produce errors; that is intentional!

```racket
; (i) (Driver A)
(define x 5)
(define y (* 5 8))
(define z (+ 1 1))

(+ x y z)
```

```racket
; (ii) (Driver B)
(define x 20)
(define y (* x 20))
(define z (* y y))

(+ x y z)
```

```racket
; (iii) (Driver A)
(define x 10)
(define y (+ x z))
(define z (* x 2))

(+ x y z)
```

```racket
; (iv) (Driver B)
(define x 10)
(define y (+ x 1))
(define x (* y 2))

(+ x y)
```

### Exercise 7: Explaining `define`

In your own words, explain how our Scheme interpreter deals with a sequence of (interleaved expressions and define statements).  
That is, what does the Scheme interpreter do if you write some define statements and some expressions and some more define statements and some more expressions and so on and so forth?

For example, consider what it does with the following.

```racket
(define x 10)   ; define statement
(+ x x)         ; expression
(define y 11)   ; define statement
(sqr y)         ; expression
(sqr x)         ; expression
(define z 12)   ; define statement
(define a 1)    ; define statement
(+ x y z)       ; expression
```

## Submitting your work

Write your names at the top of the page.

Hand the page to one of the course staff.

