---
title: Hash tables
summary: |
  In this laboratory, we explore the use of hash tables to store 
  information.
admin: I think this should work in an hour; it did not work in 30 min.
---
## Important syntax and procedures

`'#hash(("Key1" . "Value1") ("Key2" . "Value2") ...)` --- How Racket 
prints hash tables.  Also how you create a new immutable hash table.

`(make-hash)` --- create a new mutable hash table.

`(hash-ref hash key)` --- Look up a value in a hash table.

`(hash-set! hash key value)` --- Change the value associated with
a key in a mutable hash table.

`(hash-remove! hash key)` --- Remove a key/value pair from a mutable hash table.

`(hash-has-key? hash key)` --- Determine if a key appears in a hash table.

### Additional procedures introduced in this lab

`(hash-set immutable-hash key value)` --- Like `hash-set!`, but for
immutable hash tables.

`(hash-remove immutable-hash key)` --- Like `hash-remove!`, but for
immutable hash tables.

`(hash-keys hash)` --- Get a list of keys from the hash table.

`(for-each proc! lst)` --- Somewhat like `map`; apply `proc!` to each
element of the list, throwing away the result of `proc!`.

## Preparation

a. Have the traditional start-of-lab conversation.

b. The person closest to the board is Side A.  The other person is side
B.

c. Grab the code files

* [hash-tables.rkt](../code/labs/hash-tables.rkt)

d. Review any provided code at the top of the file.

## Acknowledgements

This lab was (mostly) newly written in spring 2019.  

The cartoon sidekicks example was drawn from a lab written by
Benjamin Gum in the early 2000's.  Samuel A. Rebelsky likely added
Asterix and Obelix and almost certainly added Strong Bad and his
cohort.

_Jane Eyre_ is by Charlotte Bronte.

