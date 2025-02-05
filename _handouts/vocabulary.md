---
title: Vocabulary
section: Handouts
summary: Some important terms
---
# {{ page.title }}

_We use a lot of new vocabulary (or perhaps old vocabulary with new meanings) in CSC151. This handout attempts to provide definitions for some important terms. If you'd like to see more terms defined, let your instructor know and they'll work on updating the list._

compound expression
  : An expression built from other expressions.
  : Nontrivial expressions in Scheme generally take the form of an open
    parentheses, a sequence of expressions separated by spaces, and then
    a close parentheses.
  : `(+ 2 3)` is a non-trivial expression.
  : `(+ (* 2 3) (* 4 5))` is also a non-trivial expression, itself composed
    of one trivial expression (`+`) and two non-trivial expressions.
  : We may sometimes refer to non-trivial expressions as compound expressions.

compound value
  : A value that is built from other values and can therefore be decomposed.
    Lists (which are built from any values) and strings (which are built from
    characters) are examples of compound values. We think of some images
    as compound values (e.g., those built with `above`) and others as
    primitive (e.g., a single circle).

expression
  : Something we write in Scheme that the Scheme interpreter can turn into a value.
  : A nontrivial expression is built from other expressions. In contrast, a
    trivial expression is not built from other expressions.
  : You can generally identify nontrivial expressions in Scheme because they
    are surrounded by parentheses.

identifier
  : A sequence of letters, numbers, and symbols used to identify something
    (e.g., a primitive value or a procedure). We generally use `define` to
    associate identifiers with values, although identifiers are also
    associated with values in other ways, such is through procedure calls
    (in which each argument in the procedure call is associated with a
    parameter in the procedure definition). `hello`, `sqr`, and `+` are
    all identifiers.

keyword
  : An identifier that is predefined to have a particular grammatical role
    in Scheme. Identifiers include `define`, `lambda`, and `if`.
  : Keywords are also called "reserved word".

non-trivial expression
  : Another name for compound-expression

primitive value
  : A value that is not built from other values and therefore cannot be further 
    decomposed. Primitive values include characters and most numbers. For
    example, `3`, `4.5`, and `#\x` are all primitive values.

subexpression
  : Part of a compound expression.
  : The compound expression `(+ (* 2 3) (/ 4 5))` has the following subexpressions: `+`, `(* 2 3)`, `*`, `2`, `3`, `(/ 4 5)`, `/`, `4`, and `5`.
  : We may, on occasion, write "sub-expression" rather than "subexpression".

trivial expression
  : An expression that is not built from other expressions.  Values (primitive
    and compound) and identifiers are the primary trivial expressions.

value
  : A string, number, color, image or other type of thing that can be computed.
  : Also an expression that requires no further evaluation.
  : Values can be "primitive" or "compound". A primitive value is one
    that cannot be further divided. A compound value is one that can be
    further divided.
