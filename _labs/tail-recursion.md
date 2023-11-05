---
title: Tail and helper recursion
summary: |
  In this laboratory, you will explore recursive procedures
  in which we pass along intermediate computations, most typically
  using a *recursive helper procedure*.  When this technique is used in
  conjunction with a program structure in which the recursive result
  is returned directly (without accumulated actions to perform), this
  technique supports *tail recursion*.
todo: |  
  Consider rewriting the maxima problem to use strings.
---

In this lab, we'll further expand our understanding of recursion, considering how patterns (both pattern matching and patterns of recursion) and helper procedures improve our ability to recurse.

## Preparation

a. Introduce yourself to your partner, discuss strengths and weaknesses, work work procedures, and such.

b. Go over your answers to the self checks.

c. Grab the code.

* [tail-recursion.rkt](../code/labs/tail-recursion.rkt)

d. Review the provided procedures.

## Acknowledgements

This lab was rewritten in Fall 2021.  It is based relatively closely
on [a similar lab from Spring 2019](https://rebelsky.cs.grinnell.edu/~rebelsky/Courses/CSC151/2019S/labs/helper-recursion.html).  It looks like
that one was based on a long series of earlier labs.
