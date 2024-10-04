---
title: Code Formatting and Style
---

We systematically decompose problems into sub-problems so that _our programs should look like the solutions we have in mind_.
However, decomposition is not our only tool to achieve this important effect!
Our choice of code formatting and style also greatly affects the readability of our programs.
In this reading, we introduce a style guide for the Scheme code we write for the remainder of the semester.

## A caution: "when in Rome..."

The phrase [When in Rome, do as the Romans do](https://en.wikipedia.org/wiki/When_in_Rome,_do_as_the_Romans_do), attributed to Saint Ambrose, means that it is "best to follow the traditions or customs of a place being visited."
In many cases, creating friction with others over differences that are not truly meaningful causes more pain to everyone than simply going with the flow, even though the norm is not optimal.
This idea also applies to formatting and style in a programming language!

Like natural language, programming languages have histories and legacies that beget certain kinds of code styles specific to families of languages.
For example, languages that derive from C, a low-level programming language, you indent code using 4 spaces:

~~~java
public static void main(String[] args) {
    System.out.println("Hello world!");
}
~~~

In contrast, in languages that derive from Lisp—which includes Scheme, Scamper, and Racket—we're a bit more varied in our indentation.
Sometimes we indent 2 spaces (as with `define` and `lambda`) and sometimes we line up sub-expressions of a form (as with `if`):

<pre class="scamper source-only">
(define list-length
  (lambda (l)
    (if (null? l)
        0
        (+ 1 (list-length (cdr l)))))
</pre>

Is either style "better" than the other?
It is tempting to have a favorite code style and write code in that style, independent of language.
However, rather than quibbling over these differences, what is more important for us is to "do as the Romans do," and get used to the idea of writing in the style appropriate for the language at hand.

## A style guide for Scheme

When we talk about code style, we usually mean four elements:

+   The **layout** of our code is how we choose to write source code "on the page."
    Appropriate layout allows us to interpret the structure of the program, _e.g._, which sub-expressions belong to which form, with minimal effort.
+   **Naming conventions** for the various identifiers in our program allow us to use names to convey information, e.g., types, and intended uses, without being overly verbose.
+   **Commenting conventions** dictate when it is appropriate to write comments so that we minimize the time spent writing comments while achieving maximum effectiveness in documenting code.
+   **Design conventions** tell us what patterns of code in a language are common and preferable, so that we do not surprise anyone with how we employ a language's constructs to solve a problem.

### Layout

#### Indent to show nesting

Indentation is our most powerful tool to show how different constructs in our program relate to each other.
We frequently place sub-components of a construct on a new line to avoid making a line too long.
We'll employ two kinds of indentation in our code:

+   **We'll indent "one level" or 2 spaces to the previous part of the construct** whenever going to a new line.
+   **We'll align subsequent sub-components of a construct relative to the first part of the construct.**
 
For example, below, we indent the bodies of the `define` and `lambda` one-level relative to their respective declarations.
Furthermore, we'll align the three components of an `if`-expression at the same level to denote that they all belong to the `if`.
    
<pre class="scamper source-only">
(define example-func)
  (lambda (n)
    (if (< n 0)
        0
        (* n 2))))
</pre>

#### Avoid too-long lines

If there's a lot of text on one line, the reader will have to spend time
trying to pull the line apart.
Separating things makes it easier for the reader to find the parts of the expression.
You should introduce **line breaks for any line greater than 100 characters**.
You should certainly feel free to introduce line breaks earlier if there are logical places to do so, _e.g._, between the parameters and body of a `lambda`.

#### Separate statements (top-level constructs) with a blank line

A Scheme program is a collection of top-level statements, _e.g._, `define`, `struct` declarations, and expressions-to-be-displayed, executed sequentially.
To capture this structure, you should leave a single blank line between each top-level statement:

<pre class="scamper source-only">
(define x 0)

(define y 0)

(display (+ x y))
</pre>

#### Use (a single space) between sub-expressions (and no more)!

In theory, one can "squish" together multiple parenthesized expressions:

<pre class="scamper source-only">
(display (- (+ 1 1)(* 2 2)(/ 4 2)))
</pre>

However, this is (a) not asthetically pleasing and (b) less readable, especially in the presence of many sub-expressions.
**Always separate subexpressions with a single space (if they are not already separated with a newline).**

<pre class="scamper source-only">
(display (- (+ 1 1) (* 2 2) (/ 4 2)))
</pre>

Furthermore, **don't introduce _excessive space_ between or around constructs beyond what our rules prescribe**!
Excessive spacing is also aesthetically unpleasing and makes code more difficult to read.

#### Don't leave right parentheses on a line by themselves

That's a long-standing custom.
Programmers in other languages, like C,
find it odd because they make it a regular practice to have closing braces on lines by themselves to check nesting.
But Scheme programmers like to save vertical space.
A closing parenthesis by itself also conveys little meaning.

We do, on occasion, include closing parentheses on separate lines in code templates we give you to finish.
Please move those when you are finished to adhere to this custom.

#### Layout constructs according to standard practice

Each construct of Scamper has a standard layout that you should follow in most cases.

**`define`**

Unless the body of a `define` is short, place the body of the `define` on a separate line, indented one level in.

<pre class="scamper source-only">
(define origin (pair 0 0))

(define normalize-name
  (lambda (name)
    (string-downcase name)))
</pre>

**`lambda`**

Always place the body of a `lambda` on a separate line, indented one level in.

<pre class="scamper source-only">
(map (lambda (n)
       (* n 2))
     (range 0 10)) 
</pre>

**Function application**

For short function applications, _e.g._, `(+ 1 1)`, the entire construct can appear on the same line.

For situations where the function application is too long, either:

+   Place the function on one line, then place successive arguments on new lines, indented one level in.
+   Place the function and the first argument on one line, then place successive arguments on new lines, indented to the same level as the first argument.

In either case, it is ok to group successive arguments if they are short.

<pre class="scamper source-only">
; "One-level in" indentation
(test-case "Is 1+1 equal to 2?"
  equal? 2
  (lambda ()
    (+ 1 1)))

; "Argument-aligned" indentation
(test-case "is 1*1 equal to 1?")
           equal? 1
           (lambda ()
             (* 1 1)))
</pre>

**`if`, `cond`, and `let`**

In all three cases, these constructs should obey the "argument alignment" rule.
Place the first branch/binding construct on the same line as the keyword, and place successive branch/binding constructs on new lines, aligned with the first.

<pre class="scamper source-only">
(if (= n 0))
    1
    (* n (fn (- n 1))))))

(cond [(> x y) "gt"]
      [(< x y) "lt"]
      [else    "eq"])

(let* ([x 10]
       [y (+ x 10)]
       [z (* y 10)])
      (+ x y z))
</pre>

In the final case of `let`/`let*` observe how the binding forms are indented at the same level and the subcomponents of the `let*` are indented at the same level!

### Names

The names of identifiers in your program should be evocative of:

+   Their _intended types_.
+   Their _meaning_ or _purpose_, especially in the context of the _program's domain_.

When our functions involve parameters that don't have specific meaning, then we choose names evocative of their types, _e.g._, `str` or `lst`.
When there is no ambiguity, it is acceptable to shorten these names to a single character, _e.g._, `s` or `l`.
When there are several of these kinds of parameters running around in our program, we can use numbers, _e.g._, `s1`, `s2`, as needed.

For `define`d identifiers and domain-specific parameters, we should choose short names evocative of what they represent.
For example, a numeric parameter that represents an exam score should not be named `n` but `exam`, `score`, or `exam-score` instead.

When choosing longer identifier names, our name can include lowercase letters, symbols, numbers, and hyphens that separate words in the identifier, for example `avg-of-speeds3`.
If you choose a longer name, try to be judicious in its length.
Choosing overly verbose names impedes readability, especially in a functional language like Scheme, where we write many short, composable functions.

Additionally, there are several specific naming conventions that Scheme employs that you should adopt:

+   Functions that _convert a value between types_ are usually named in the following form: `from->to`.
    For example, `integer->string` or `picture->bits`
+   Functions that _return a boolean value_, _i.e._, _predicates_, are named as a question ending in a question mark.
    For example, `hungry?` or `flag-toggled?`.

### Comments

We should _always_ document our top-level functions, _i.e._, `define`s of function type, using the documentation style introduced earlier in class.
Most importantly, a function's comment should capture all of its _preconditions_, properties required of parameters, and _postconditions_, guarantees the function makes about its return value and side-effects if the preconditions are met.
This is especially true if the preconditions and postconditions are not evident from the names given to the function and its parameters!

Inline documentation should be used whenever it is necessary to:

+   Explain the meaning of a piece of code where the meaning is not evident from simply understanding the constructs involved.
+   Give rationale for a non-standard design decision in the code.
+   Annotate a specific part of code for later development, _e.g._, a "bug" warning or "note."

One should _not_ use documentation as a crutch for good naming and design.
In other words, recall that _our code should read like the solution to the problem at hand_.
One can better achieve that effect with good design choices rather than a long comment explaining what is happening in the program.

### Design

Finally, there are some general design considerations you should keep in mind when writing your code.

#### Decompose the problem and reduce redundancy

Use the various constructs of the language to break up a bigger problem into smaller problems.
Favor having several functions with more specific, well-defined behavior over a single monolithic function that attempts to do everything itself.
Additionally, as you decompose the problem, look to abstract away repeated code into functions that capture the redundancy.

#### Name local computations

Even if the computation is _not_ repeated, use `let` and `let*` to name the whole "chunks" of your code with specific meaning.
For example, in a multi-step computation, use `let` to name the intermediate portions of the computation.

#### Boolean Zen

If you have a boolean value, favor using the boolean directly over a functionally equivalent conditional.
For example, if `b` is an expression of boolean type, then:

+   `(if b #t #f)` is equivalent to `b`.
+   `(if b #f #t)` is equivalent to `not b`.

#### Favor anonymous function tools over lambdas and nested function application

Whenever possible, use `compose`/`o` and `section` instead of hand-defining functions that closely mimic the behavior of one or more existing functions.
Additionally, when a series of function applications can be thought of a pipeline, _i.e._, the outputs of one function directly go into the inputs of another, use the pipeline `|>` function.

## Reading self-check

### Self-check \#1: Fix-ups (‡)

Consider the following poorly-formatted top-level function:

<pre class="scamper source-only">
;;; (q a t f) -> string?
;;;   a : string? the player's name
;;;   t : number? the player's first score
;;;   f : number? the player's second score
;;; Returns a string that contains a report of the player's
;;; performance in the game.
      (define q
(lambda (a t f)
  (cond [(< (+ t f) 100) (string-append a " did poorly")])
[(= (+ t f) 100) (string-append a " is doing ok")] [else (string-append a " is great!")])))
</pre>

Reformat the function to adhere to the style guidelines outlined in this reading!