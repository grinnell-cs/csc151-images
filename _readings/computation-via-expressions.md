---
title: Computation via expressions
summary: |
  In this reading, we develop a basic mental model of computation for Scheme programs.
---

As we've learned (or may have learned), computer scientists not only write and analyze algorithms and data structures, they also translate these algorithms and data structures into program code that a computer can process.  To express algorithms and data structures as programs, we use a _programming language_.  We're using a variant of the programming language Scheme in this course.

Many people "learn" programming languages by trying a variety of ideas and building intuition.  However, doing so can be dangerous.  Unfortunately, our intiution may fail us.  Hence, it becomes important to develop models of

1.  The _structure_ of the code we are writing and
2.  _How_ the computer executes our programs.

This work in building a _mental model of computation_ of how Scheme programs operate will pay dividends as we ramp up the complexity of our programs as well as begin transitioning to other languages at the end of the course. 

We'll be using a simple model of Scheme programs this semester; it won't cover every program, but it will cover most.

# Syntax and grammar

Consider the following two sequences of English words.

* The rain in Spain falls mainly on the plains.
* In on the the falls plains rain mainly Spain.

Which of these sequences do you more easily understand?  Why?

The sequences both contain the same words, just in different orders.  However, we recognize the first sequence as a valid _sentence_ in the English language, whereas the second sequence seems to be purely random.  Because the first sequence is a sentence, we can figure out the _meaning_ of the collection of words by the rules of sentence formation in English:

* Generally speaking, the subject of the sentence comes before the action that the subject performs.
   Thus, it is the "rain" that "falls" and not the other way around.
* We modify the subject and action with other fragments such as prepositional phrases ("in Spain") and adverbs ("mainly").

When words don't appear in the appropriate order, then it is at best, difficult, and at worst, impossible, to derive the intended meaning of the words.

The _syntax_ of a language is its rules that govern whether a sequence of words is well-formed.  You may have learned the syntax of English explicitly sometime during your prior education, or you may have picked it up experientially by observing others.  Regardless, you adhere to the syntax of English so that others understand what you are saying.

# The syntax of Scheme programs

While the second sequence of words above was in random order, you may have been able to understand the meaning of the words to some degree.  This is because you are equipped with all sorts of cues and heuristics for infusing such sequences with meaning.  Unfortunately, as we saw during our first day of class, computers are not natively equipped with such skills.

Recall that Computers will do _exactly_ what you tell them to do and nothing more!

Thus, we don't have the luxury of being lax in how we form programs.  Our programs _must_ adhere to the syntax of the programming language we are writing precisely!

This might be an impossible task in English because of the complexity and ambiguity of the language.  Luckily, Scheme's syntax is much more compact and concise than English.  So with some attention to detail, we can quickly learn how to form syntactically valid Scheme programs!

## Expressions

The main syntactic form of Scheme programs is the _expression_.

**Definition (Expression)**: An _expression_ is a program fragment that evaluates to a value.

**Definition (Value)**: A _value_ is an expression that no longer takes steps of evaluation.

You have encountered expressions before when studying elementary math: arithmetic features _numeric expressions_ that evaluate to _numeric values_.  For example:

* $$1 + 1$$ is a numeric expression that evaluates to the value $$2$$.
* $$3 \times (5 - 2 + 1)$$ is a numeric expression that evaluates to the value $$12$$.
* $$32$$ is a numeric expression that is, itself, a value.
* If $$x$$ has the value 5, $$2 \times x$$ has the value 10.

What is the syntax of an arithmetic expression?  Well, numbers, themselves, are valid arithmetic expressions such as $$32$$.  And we can "join" together two numbers together with an operator, _e.g._, $$1 + 1$$.  But we're not constrained to numbers---we can take any pair of arithmetic expressions and join them with an operator to form a larger expression.  For example, $$1 + 1$$ and $$3 - 2$$ are both valid expressions, so $$1 + 1 - 3 - 2$$ is also valid!  

In general, we can write down the rules of valid arithmetic expressions concisely.  An arithmetic expression is:

* A _number_,
* Two arithmetic expressions joined by an arithmetic operator in the middle ($$+$$, $$-$$, $$\times$$, and $$\div$$), or
* A arithmetic expression with parentheses around it.

Note that there are sequences of numbers and operators that we would not consider valid arithmetic expressions, such as $$2 + \times 3\ 4$$.  The rules above help us determine what is and what is not valid.  They also help us identify how to "group" values for computation.

Note also that parentheses are used help disambuate how the different operators and operands associate.  For example, the expression $$1 + 1 - 3 \times\ 2$$ suggests at least three ways of evaluating, depending on which operation you do first.  (As you know there are additional rules  that help us determine that.)  If we wanted to be explicit, we could write $$(1 + 1) - (3 - 2)$$.

As you saw in the last class's reading, Scheme's expression forms are different than traditional arithmetic expressions.  Rather than writing the operator between expressions in _infix_ style, with the operation in-between the operands, we write the operator for Scheme expressions in _prefix_ style, with the operation before the operands:

+ `(+ 1 1)` is a Scheme expression that computes the same value as the mathematical expression $$1 + 1$$.
+ `(* 3 (+ (- 5 2) 1))` is a Scheme expression that computes the same value as the mathematical expression $$3 \times\ (5 - 2 + 1)$$.
+   `32` is a Scheme expression that computes the same value as the mathematical expression $$32$$.

Note that unlike arithmetic, we _always_ surround our non-number expressions with parentheses.  This is both a blessing and a curse.  It is a blessing because this makes the order operations of a Scheme expression clear.  It is a curse in that we have to write a lot of parentheses!  We'll talk about how we can manage the complexity of nested parentheses with appropriate _style_ choices in our source code in later readings.

This infix versus prefix distinction is the primary difference between Scheme and arithmetic expressions.  The rules or syntax of valid Scheme expressions are as concise as their arithmetic variants.  An arithmetic Scheme expression is either:

* A number or
* An open parenthesis, an arithmetic operator, two (or more) Scheme expressions, and a close parenthesis.

It might be difficult to follow the language of the second bullet precisely, so it is useful to write out a sort of "template" that captures what the rule is conveying:

```racket
(<operator> <expr1> <expr2>)
```

Here, `<operator>` is a placeholder for any arithmetic operator and `<expr1>` and `<expr2>` are placeholders for any Scheme expression.
We call `<expr1>` and `<expr2>` _sub-expressions_ of the overall expression.

## Beyond arithmetic expressions

Of course, our last reading quickly moved from arithmetic to drawings, so we need our rules for Scheme expressions to generalize accordingly.  Let's look at one of these expressions from our previous reading:

```racket
(circle 60 "outline" "blue")
```

What's different between this expression that produces a circle versus the arithmetic Scheme expression we studied earlier?

* The "operator" is no longer a symbol.  Instead, it is a name or _identifier_.
* There are more than two operands to this `circle` operation.
* The operands are no longer just numbers, they also include these words-in-quotes, _strings_.

We'll learn more about strings next week when we look at the primitive types of Scheme.  For now, think of them as another sort of value we can perform computation over.

Given these observations, how can we generalize our rules for Scheme expressions accordingly?  We'll make the following changes:

* We will not restrict ourselves to only arithmetic operations, we will allow _any identifier_ as the operation to be performed!  Not all identifiers will be valid operations when we go to execute our program, but in terms of forming a syntactically valid Scheme expression, we will allow any identfier as the operation.
* We will allow _any_ number of arguments to our operations in a syntactically correct expression. Again, some operations will have restrictions on the number of arguments given to it that we will discover when we execute our program. 

Our template for describing expressions that perform operations now looks like this:

```racket
(<identifier> <expr_1> ... <expr_k>)
```

Where the `<expr1> ... <exprk>` represents a _sequence of sub-expressions_ separated by whitespace.  For example, in the example expression above:

* `circle` is the identifier.
* `60` is the first sub-expression.
* `"outline"` is the second sub-expression.
* `"blue"` is the third sub-expression.

Putting everything together, we can write down the syntax of well-formed Scheme expressions as follows:

**Definition (Well-formed expressions)**: a _well-formed Scheme expression_ is either:

* A number,
* A string of the form `"<text>"`, or
* A compound expression of the form `(<identifier> <expr1> ... <exprk>)`.

While those three rules are all we'll cover right now, they are not all there is to well-formed Scheme expressions.  We have much more to learn about Scheme, and we will revisit this definition and add and modify it as needed.

# A mental model of computation for Scheme expression

It is one thing to form a syntactically valid English sentence.  It is another thing to form a coherent, meaningful sentence!
For example, the sentence:

> I hefted the dishes below the hippo's qubits.

Is grammatically correct but non-sensible.  For example, "hefting" (or lifting) dishes _below_ something is odd.  Furthermore, hippos don't have qubits to the best of our knowledge!

Alongside our knowledge of English syntax, we also have a sense of how to extract _meaning_ out of grammatically correct sentences.  Likewise, knowing the syntax of Scheme expressions is not enough.  We must also know the "meaning" of expressions, _i.e._, how they compute.

Returning to arithmetic, we know from elementary mathematics how arithmetic expressions compute via _repeated evaluation_.  For example, consider the expression $$3 \times (5 - 2 + 1)$$.
According to the [order of operations](https://en.wikipedia.org/wiki/Order_of_operations) of arithmetic, we know that:

* $$5 - 2$$ evaluates first to $$3$$ because it is inside of parentheses and $$-$$ and $$+$$ have the same _precedence_, so we evaluate them in left-to-right order.
* Next, we evaluate $$3 + 1$$ to $$4$$.
* Finally, we evaluate $$3 \times 4$$ to $$12$$.

We can write this sequence of steps more concisely as follows:

\begin{align}
&\; 3 \times (5 - 2 + 1) \\\\\\
\longrightarrow &\; 3 \times (3 + 1) \\\\\\
\longrightarrow &\; 3 \times 4 \\\\\\
\longrightarrow &\; 12.
\end{align}

Observe that our procedure for evaluating an arithmetic expression is:

1.  _Find_ the next subexpression to evaluate according to the order of operation rules.
2.  _Evaluate_ that subexpression to a value.
3.  _Substitute_ the value for the subexpression that produced it in the overall expression.

These three steps taken together form a _single step of evaluation_.  We repeatedly take steps of evaluation until the overall expression is a value.  This model of arithmetic computation is also called a _substitutive model of evaluation_ due to the last step where substitute value for subexpression.

Scheme expressions generall operate in the same way as arithmetic expressions.  However, as mentioned above, Scheme's unique syntax makes evaluation easier: because everything is parenthesized, there is no ambiguity as to which subexpression evaluates next.  We just find the leftmost innermost parenthesized expression and evaluate it!  Let's see how the equivalent Scheme expression evaluates:

```racket
    (* 3 (+ (- 5 2) 1))
            ^^^^^^^
--> (* 3 (+ 3 1))
         ^^^^^^^
--> (* 3 4)
    ^^^^^^^
--> 12
```

Substitutive evaluation is our _mental model of computation_ for Scheme expressions!  

In summary:

**Definition (Substitute evaluation for Scheme expressions)**: Scheme expressions take _repeated steps of evaluation_ until they evaluate to a final value.
A step of evaluation consists of:

1. _Finding_ the next subexpression to evaluate.  The next subexpression is the leftmost, innermost parenthesized expression.
2. _Evaluating_ that subexpression to a value.
3. _Substituting_ the value for the subexpression that produced it in the overall expression.

# Self-Checks

## Check 1: Syntax (‡)

Consider the following expression that produces a drawing:

```racket
(above (rectangle 60 40 "solid" "red")
       (beside (rectangle 60 40 "solid" "blue")
               (rectangle 60 40 "solid" "black")))
```

Write down a list of:

+   The sub-expressions of the overall expression.
+   All the identifiers in the expression.
+   All of the numbers in the expression.
+   All of the strings in the expression.

## Check 2: Semantics (‡)

Write down the step-by-step evaluation of the following Scheme expression.

```racket
(+ (- (* 3 5)
      (/ 20 2))
   (- (+ 2 8)
      6))
```

Your answer should begin something like the following

```
    (+ (- (* 3 5) (/ 20 2)) (- (+ 2 8) 6))
--> (+ (- 15 (/ 20 2)) (- (+ 2 8) 6))
```
