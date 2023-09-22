---
title: Anonymous procedures
summary: |
  We consider ways to write procedures without naming them.
---

## Useful procedures and notation

`(lambda (params) body)` - a procedure in the standard form.  When
applied to some values (arguments), substitutes the arguments for
the parameters in the body and evaluates the new expression.  For
example, `(lambda (x) (+ x 5))` adds 5 to `x`.

`(o f1 f2 f3 ... fn)` - a procedure that takes one value and
applies `fn` to that value, then `fn-1` to that result, ... then `
`f3` to that result, then `f2` to that result, and finally `f1`
to the result, returning the output of f1.  For example,
`(o add1 square)` is a procedure that squares its parameter
and then adds 1.

`(cut expression)` - a procedure that takes one parameter for
each "hole" `<>`.  For example, `(cut (* <> 5))` is a procedure
that divides its parameter by 5.

## Preparation

a. Review the mechanisms for building procedures.

b. If you have not done so already, you may want to open a separate tab or window in your browser for [the reading on anonyous procedures](../readings/anonymous-procedures).

c. Load the lab.  Remember that the person closer to the board is Side A and the person further fro the board is Side B.

* [anonymous-procedures.rkt](../code/labs/anonymous-procedures.rkt)

d. Get started!

