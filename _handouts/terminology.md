---
title: Terminology
section: handouts
author: Samuel A. Rebelskyg
---
# {{ page.title }}

_Sam's quick and dirty attempt to summarize recent vocabulary.  If you find something confusing, please ask me to clarify.  If there are other terms you'd like defined, let me know._

Integer
  : A number with no fractional part.  A number that can be obtained by repeatedly adding 1 to 0 or repeatedly subtracting 1 from 0.  For example, 5 is an integer because 5 = 0 + 1 + 1 + 1 + 1 + 1.

Identifier
  : A nonempty sequence of letters, digits, and symbols that does not take the form of a basic value, such as a number.  For example, `hello` and `a3+x` are both identifiers, but `34` is not (it's an integer).  In Scheme, identifiers usually have associated values.  Some identifiers, such as `define` and `if` are treated as _keywords_ and are (a) not bound to values and (b) result in a different evaluation strategy than we typically use.

Value
  : An entity that can be manipulated by the program.  Alternately, something that cannot be further evaluated.  Examples include numbers, strings, lists, and images.

Basic value
  : A value that does not contain other values.  Examples include numbers, strings, the empty list, and images.

Compound value
  : A value that does contain other values.  Examples include nonempty lists and vectors.

Expression
  : Initially, either (a) a value or (b) the application of a function to a sequence of expressions.  That application is written with an open parenthesis, the function (often represented by an identifier), the sequence of expressions (often called arguments) separated by spaces, and a close parenthesis.  For example `(+ 2 3)` or `(string-length (string-append "hello" "scheme"))`.  Eventually, we'll also see some expressions that start with keywords.

Nontrivial expression
  : Any expression that is not a value.  `(+ 2 3)` is a nontrivial expression.  `2` is a trivial expression.

Immediate subexpression
  : Any in the sequence of expressions in a function application.
    In `(+ 2 (* 3 4) (- 5 6))`, `2`, `(* 3 4)`, and `(- 5 6)` are
    the immediate subexpressions.  Of those, `(* 3 4)` and
    `(- 5 6)` are the nontrivial immediate subexpressions.

Subexpression
  : An immediate subexpression or any subexpression of an immediate subexpression.  (If we think about family trees, immediate subexpressions are like children and subexpressions are like descendants.) In `(+ 2 (* 3 (+ 4 5)) (- 7 7))`, `2`, `(* 3 (+ 4 5))`, `3`, `(+ 4 5)`, `4`, `5`, `(- 7 7)`, `7`, and `7` are the subexpressions and `(* 3 (+ 4 5))`, `(+ 4 5)`, and `(- 7 7)` are the nontrivial subexpressions.

Statement
  : Either a Scheme expression or something that looks remarkably like an application (open paren, keyword, arguments, close paren), except that it starts with one of the statement keywords, such as `define`. The latter kind of statements usually affect the state of the program (e.g., which value is bound to an identifier).  
