---
title: Terminology
section: handouts
author: Samuel A. Rebelskyg
---
# {{ page.title }}

**Integer**
  : A number with no fractional part.  A number that can be obtained by repeatedly adding 1 to 0 or repeatedly subtracting 1 from 0.  For example, 5 is an integer because 5 = 0 + 1 + 1 + 1 + 1 + 1.

**Identifier**
  : A nonempty sequence of letters, digits, and symbols that does not take the form of a number.  For example, `hello` and `a3+x` are both identifiers.  In Scheme, identifiers are usually bound to values.

**Value**
  : A basic entity that can be manipulated by the program.  Examples include numbers, 
    strings, and images.

**Expression**
  : Initially, either a value or the application of a function to
    a sequence of expressions.  That application is written with
    an open parenthesis, the function (often represented by an
    identifier), the sequence of expressions (often called arguments)
    separated by spaces, and a close parenthesis.  For example `(+ 2 3)`
    or `(string-length (string-append "hello" "scheme"))`.

**Nontrivial expression**
  : Any expression that is not a value.  `(+ 2 3)` is a nontrivial
  expression.  `2` is a trivial expression.

**Immediate subexpression**
  : Any in the sequence of expressions in a function application.
    In `(+ 2 (* 3 4) (- 5 6))`, `2`, `(* 3 4)`, and `(- 5 6)` are
    the immediate subexpressions.  Of those, `(* 3 4)` and
    `(- 5 6)` are the nontrivial immediate subexpressions.

**Subexpression**
  : An immediate subexpression or any subexpression of an immediate
    subexpression.  (If we think about family trees, immediate
    subexpressions are like children and subexpressions are like
    descendants.)
    In `(+ 2 (* 3 (+ 4 5)) (- 7 7))`
