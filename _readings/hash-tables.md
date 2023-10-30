---
title: Dictionaries, maps, and hash tables
summary: |
  We consider the _dictionary_ data type, which provides a way to
  associate information with words.  We then explore Racket's _hash
  tables_, which provide one implementation of dictionaries.
---

## Introduction

As you've seen, we often find it useful to collect data into
structures.  We've collected values in _lists_, which are useful
for processing sequentially. We've collected text in _files_.  We
will soon explore _vectors_, an alternative to lists for linear
data, and _trees_, which are useful for processing hierarchically.
Since different structures might support different kinds of operations,
the design of structured types like lists and trees is a core part
of algorithm design. Computer scientists have defined a wide range
of data types designed to collect data.

Consider, for example, the problem of representing a simple phone book.
A phone book associates phone numbers with names.  When you look up a
name in a phone book, you should either get the corresponding phone
number or a warning that no phone number is available for that name.
There are many other instances in which you want to associate
information with a "name" or something equivalent.  For example, a
physical dictionary associates definitions with words.

In referring to these kinds of structures, computer scientists often
call the thing used to look up information the _key_ and the associated
information the _value_.  In a phone book, the name is the key and the
phone number is a value.  In a traditional dictionary, the word is the
key and the definition is the value. 

Computer scientists use a variety of names for structures that
associate keys and values, including _Dictionary_, _Map_, _Keyed
Table_, and even _Hash_ (no, not the `#` symbol).  Generally, you
can think of these structures as collections of key/value pairs
that make it easy to reference values by key.  What operations would
you expect such structures to provide?  It should be easy to _create_
a new structure, to _add_ or _update_ a key/value pair, and to _look
up_ a value by key.   It might also be useful to _remove_ a key/value
pair and to _check_ whether a key is in the structure.

Over the years, computer scientists have come up with a large number of
ways to represent dictionaries, including association lists, binary
search trees, skip lists, and hash tables.  Don't worry; you don't need
to know the underlying details of any of them, at least not at this
stage of your career.  You do, however, need to understand how and why
to use such structures.

For now, we will focus on how you use one of the most common
implementations of dictionaries, known as _Hash Tables_.  In many
situations, hash tables are one of the most efficient implementations
of dictionaries.  Most modern languages include hash tables as a
basic type.  And, because hash tables are so popular, many programmers
don't distinguish hash tables from the broader concept of dictionaries.
(That's why some people refer to the general concept as a "hash".)
But you should remember that hash tables are just one way to implement
dictionaries.  We may explore others this semester.

## Getting started with hash tables

We're exploring a new type.  Some of us make it a point to ask five
or so questions when we encounter a new type: What is its _name_?
What is its _purpose_?  How do I _express_ values in the type?  How
does DrRacket _display_ values in the type?  What _procedures_ are
available for working with the type?

We've already answered the first two questions: The type is named
"hash table" and its purpose is to store key/value pairs.  We rarely
write hash tables directly and we rarely ask DrRacket to display
them (they are often fairly large), so we'll leave those questions
to after our coverage of the procedures associated with hash tables.

You may recall that we said that there are three basic operations we use
with hash tables: we create them, we add key/value pairs, and we look up
values by keys.

You create a new hash table with `(make-hash)`.  You look up a value in
a hash table with `(hash-ref` `table` `key)`.  You add a key/value pair
to the table with `(hash-set!` `table` `key` `value)`. Note that
`hash-set!` ends with an exclamation point.  That reminds us that the
procedure modifies the underlying hash table.  As is the case with
`vector-set!`,  `hash-set!` returns nothing.

Let's explore those basic operations, creating a map of book titles to
authors.  For now, we'll assume that each book has a single author; in a
subsequent section, we'll consider how to deal with multiple authors.

```drracket
> (define book-authors (make-hash))
> (hash-set! book-authors "The Princess Bride" "William Goldman")
> (hash-set! book-authors "Homegoing" "Yaa Gasi")
> (hash-set! book-authors "Moo" "Jane Smiley")
> (hash-set! book-authors "Moo, Baa, La La La!" "Sanda Boynton")
> (hash-ref book-authors "Homegoing")
"Yaa Gasi"
> (hash-ref book-authors "Moo")
"Jane Smiley"
```

What happens when the book title is not in the table?  Let's check.

```drracket
> (hash-ref book-authors "FunDHum")
hash-ref: no value found for key
  key: "FunDHum"
```

It appears that the hash table issues an error.  That seems like a
reasonable choice.  Racket needs to signal to the user that the value is
not available. But an error message is not something many of us want to
have happen in the middle of our program.  Hence, the Racket hash
library also provides a `(hash-has-key?` `table` `key)` procedure that
checks whether the hash table contains a particular key.

```drracket
> (hash-has-key? book-authors "Homegoing")
#t
> (hash-has-key? book-authors "MediaScheme")
#f
```

It turns out that there are times in which it is helpful to get back
some "default value" if the key isn't there.  For that purpose, there's
a variant of `hash-ref` that takes an extra parameter, representing
the default value.

```
> (hash-ref book-authors "MediaScheme" "I have no freakin' idea")
"I have no freakin' idea"
```

At times, you may realize that you want to update a key/value pair that
you have stored in the hash table.  You can use the `hash-set!`
operation to update the table.

```drracket
> (hash-ref book-authors "The Princess Bride")
"William Goldman"
> (hash-set! book-authors "The Princess Bride" "S. Morgenstern")
> (hash-ref book-authors "The Princess Bride")
"S. Morgenstern"
```

You've learned four basic hash table operations: `make-hash`,
`hash-set!`, `hash-ref`, and `hash-has-key?`.  Or maybe you've 
learned five, if we count the two versions of `hash-ref`.  While
the Racket hash table implementation provides a host of other
operations, those basic operations should be all that you need
at this point.  In the next few sections, we'll explore some other
design issues in making and using hash tables.

## Displaying hash tables

As hash tables exist primarily for you to use to extract information,
You will rarely ask DrRacket to display hash tables.  Also, hash tables
are generally large enough that you won't want to see all of the
information on your screen.  But DrRacket will display a hash table if
you ask it nicely.

```drracket
> book-authors
'#hash(("Homegoing" . "Yaa Gasi") ("Moo, Baa, La La La!" . "Sanda
Boynton") ("The Princess Bride" . "S. Morgenstern") ("Moo" . "Jane
Smiley"))
```

Not very pretty, is it?  But, if we look carefully, it's fairly
straightforward.  It begins with a tick, an octothorpe, and the word
`hash`.  Following that is a list of key/value pairs.  And they are
_literally_ pairs, as indicated by the dot between the two values.
(You should remember the dot from your study of pairs and pair
structures.)

Can we create a hash in the same way?  Let's try.

```drracket
> (define animals '#hash(("A" . "Aaardvark")
                         ("B" . "Badger")
                         ("C" . "Chinchilla")
                         ("D" . "Dingo")
                         ("E" . "Emu")
                         ("F" . "Fennec Fox")))
> animals
'#hash(("B" . "Badger") ("F" . "Fennec Fox") ("D" . "Dingo") ("A" .
"Aaardvark") ("E" . "Emu") ("C" . "Chinchilla"))
> (hash-ref animals "B")
"Badger"
> (hash-has-key? animals "Z")
#f
```

It looks like this does give us a hash table, but with the key/value
pairs in a slightly different order than we started with.  That's okay:
We should not care about the ordering because our focus is on using hash
tables rather than understanding the underlying technology.  (It turns
out that the ordering is one of the things that helps keep hash tables
efficient.  You'll study how to construct hash tables in a subsequent
course.)  Let's add something to the hash table.

```drracket
> (hash-set! animals "Z" "Zebra")
hash-set!: contract violation
  expected: (and/c hash? (not/c immutable?))
  given: '#hash(("A" . "Aaardvark") ("B" . "Badger") ("C" .
"Chinchilla") ("D" . "Dingo") ("E" . "Emu") ("F" . "Fennec
Fox"))
  argument position: 1st
  other arguments...:
   "Z"
   "Zebra"
```

Hmmm.  That didn't work.  Why not?  When we present a hash table to
Racket using the `'#hash` notation, it treats is as an _immutable_
table.  That means that you can use it, but you cannot modify it.
That makes sense for some cases.  For example, you might have
assumptions about the contents of the hash table and you would not
want another part of the program (perhaps written by another
programmer who did not understand those expectations) to "mess with"
the table.

But what if you want to create a hash table with a sequence of key/value
pairs _and_ you want it to be mutable?  In that case, you can use a
variant of the `make-hash` operation in which you present it with a list
of key/value pairs.

```drracket
> (define animals
    (make-hash (list (cons "A" "Anteater")
                     (cons "B" "Baboon")
                     (cons "C" "Civet")
                     (cons "D" "Dormouse")
                     (cons "E" "Echidna")
                     (cons "F" "Flamingo"))))
> animals
'#hash(("B" . "Baboon") ("F" . "Flamingo") ("D" . "Dormouse") ("A" .
"Anteater") ("E" . "Echidna") ("C" . "Civet"))
> (hash-ref animals "B")
"Baboon"
> (hash-has-key? animals "Z")
#f
> (hash-set! animals "Z" "Zebra")
> animals
'#hash(("B" . "Baboon") ("F" . "Flamingo") ("D" . "Dormouse") ("Z" .
"Zebra") ("A" . "Anteater") ("E" . "Echidna") ("C" . "Civet"))
> (hash-ref animals "Z")
"Zebra"
```

## Extending the power of hash tables

_In this section, we explore how we might build something like
a hash table or dictionary, but with slightly different features._

What happens if we try to use something that's close to an existing key,
but not quite the same?  Let's try and find out.

```drracket
> (hash-has-key? book-authors "Homegoing")
#t
> (hash-has-key? book-authors "Home going")
#f
> (hash-has-key? book-authors "homegoing")
#f
```

As these two examples suggest, hash tables are not particularly smart.
They expect _exact_ matches of the hash key.  Programmers who want more
accommodating hash tables may want to write procedures that convert keys
to a common form before hashing.  Let's consider how we might do that
with strings.

First, let's agree on a common form.  Say, for example, that we decide
that the common form should be all lowercase and should contain only
letters and digits.  We can use `string-downcase` to convert the string
to lowercase and some filtering to extract only the letters and digits.

```drracket
;;; (common-form str) -> string?
;;;   str : string?
;;; Convert `str` to a common form for use as, say, a key in
;;; a hash table.
;;;   If provided with a non-string, just returns the value.
(define common-form
  (lambda (str)
    (if (string? str)
        (string-downcase (list->string (filter (lambda (ch)
                                                 (or (char-numeric? ch)
                                                     (char-alphabetic? ch)))
                                               (string->list str))))
        str)))
```

```drracket
> (common-form "Homegoing")
"homegoing"
> (common-form "Home Going")
"homegoing"
> (common-form "Home going!")
"homegoing"
> (common-form "Going home?")
"goinghome"
> (common-form (list "Home" "Going"))
'("Home" "Going")
```

Now that we have this helper procedure, we can write our own versions of
the basic hash table operations.

```drracket
;;; (new-make-hash pairs) -> hash?
;;;   pairs : list-of pair?
;;; Create a hash table that uses the common form of the keys in pairs.
(define new-make-hash
  (lambda (pairs)
    (make-hash (map (lambda (pair)
                      (cons (common-form (car pair))
                            (cdr pair)))
                    pairs))))

;;; (new-hash-set! hash key value) -> void?
;;;   hash : hash?
;;;   key : any?
;;;   value : any?
;;; Sets a value in a hash using the common form of string keys.
(define new-hash-set!
  (lambda (hash key value)
        (hash-set! hash (common-form key) value)))

;;; (new-hash-ref! hash key) -> any?
;;;   hash : hash?
;;;   key : any?
;;; Look up a value using the common form of key.
(define new-hash-ref
  (lambda (hash key)
    (hash-ref hash (common-form key))))

;;; (new-hash-has-key? hash key) -> boolean?
;;;   hash : hash
;;;   key : any?
;;; Determine if hash has the common form of key.
(define new-hash-has-key?
  (lambda (hash key)
    (hash-has-key? hash (common-form key))))
```

```drracket
> (define book-authors
    (new-make-hash
     (list (cons "The Princess Bride" "William Goldman")
           (cons "Homegoing" "Yaa Gasi")
           (cons "Moo" "Jane Smiley")
           (cons "Moo, Baa, La La La!" "Sanda Boynton"))))
> (new-hash-ref book-authors "Homegoing")
"Yaa Gasi"
> (new-hash-ref book-authors "Home Going")
"Yaa Gasi"
> (new-hash-ref book-authors "moo!")
"Jane Smiley"
> (new-hash-set! book-authors "Friday Black" "Nana Kwame Adjei-Brenyah")
> (new-hash-ref book-authors "fri day black")
"Nana Kwame Adjei-Brenyah"
> book-authors
'#hash(("moobaalalala" . "Sanda Boynton") ("homegoing" . "Yaa Gasi")
("theprincessbride" . "William Goldman") ("fridayblack" . "Nana Kwame
Adjei-Brenyah") ("moo" . "Jane Smiley"))
```

What happens if we fail to use our methods?  Let's see.

```drracket
> (hash-ref book-authors "Homegoing")
hash-ref: no value found for key
  key: "Homegoing"
> (hash-set! book-authors "The Princess Bride" "S. Morgenstern")
> (new-hash-ref book-authors "The Princess Bride")
"William Goldman"
> (hash-ref book-authors "The Princess Bride")
"S. Morgenstern"
> book-authors
'#hash(("moobaalalala" . "Sanda Boynton") ("homegoing" . "Yaa Gasi")
("theprincessbride" . "William Goldman") ("The Princess Bride" . "S.
Morgenstern") ("fridayblack" . "Nana Kwame Adjei-Brenyah") ("moo" .
"Jane Smiley"))
```

As these examples suggest, if we decide to use our alternate procedures,
we need to be uniform in our use of those procedures.

## Other hash table functions

You can learn much more about Racket's hash tables in
[the official Racket documentation](https://docs.racket-lang.org/reference/hashtables.html) and [the Racket Guide](https://docs.racket-lang.org/guide/hash-tables.html).  For now, we'll mention a few potentially relevant procedures.

`(hash-map hash proc)` applies `proc` to each key/value pair in
the hash table and accumulates the results into a new list.  As
you might guess, `proc` should be a procedure of two parameters,
one of which is the key and the other of which is the value.

`(hash-keys hash)` gives you a list of all of the keys in the
hash table.

`(hash-values hash)` gives you a list of all of the values in the
hash table.  If two keys have the same value, the value will appear
twice in the list.

`(hash->list hash)` gives you the list of key/value pairs in the
hash.

## Self Checks

### Check 1: Using hash tables (‡)

We've given a few uses of hash tables: dictionaries, phone books,
and information about books.  Come up with two others.

### Check 2: Your own hash table (‡)

Pick one of those two uses and create a *small* hash table (about
five entries) with the information from the table.

## Acknowledgements

In writing this section, we drew upon [the discussion of hash tables in
the Racket language
documentation](https://docs.racket-lang.org/reference/hashtables.html)
and [the discussion of hash tables in the Racket
Guide](https://docs.racket-lang.org/guide/hash-tables.html).

This section also draws upon [a reading entitled "Association
Lists"](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/readings/association-lists)
from an earlier version of Grinnell College's CSC 151.
