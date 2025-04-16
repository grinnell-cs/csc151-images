---
title: Using Racket's structured types
summary: |
  We consider how and why to use structured data in Racket.
prereqs: |
  [Precondition checking](../readings/preconditions).
  [Hash tables](../readings/hash-tables).
todo:
  - Consider mutating structs
---
## Important syntax and procedures

`(struct name (field1 field2 ...))` - Creates a new structured type,
with methods named `name`, `name?` `name-field1`, `name-field2`,
and so on and so forth.

## Preparation

a. Start DrRacket.

b. Grab the code for this lab.

* [structs.rkt](../code/labs/structs.rkt)

c. Grab an additional code file for the lab.

* [date.rkt](../code/labs/date.rkt)

d. Do the lab.

## Acknowledgements

This lab was (mostly) newly written in spring 2019.  The code was
extracted to a separate file in Fall 2021.  Fall 2021 saw the
arrival of a new problem (`chirps-by` and `chirps-tagged-with`),
the de-emphasizing of the hash table problem, and the addition
of a few new extras (ordering of dates, selecting chirps by
date).  Spring 2022 saw the addition of the `date.rkt` file.
