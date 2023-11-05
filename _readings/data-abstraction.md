---
title: Data abstraction
summary: |
  As you may have noted by now, we are often able to use data without
  understanding how those data are represented.  You've now reached
  the stage in your programming career in which you can represent
  certain kinds of data, like names or trees, in multiple ways.
  In doing so, you will likely separate *what* you can do with the
  data from *how* you organize the data.  In this reading, we
  consider this separation, which we traditionally refer to as
  *data abstraction*.
---
At this point in your career, you have already used a wide variety of
types, including characters, strings, symbols, numbers (all sorts of
numbers), and images.  You've also learned a few mechanisms for grouping
data together, including lists, vectors, hash tables, and files.

As you may have realized, you've reached the point that you can
probably write your own data types, or at least something like your
own data types.  That is, you can find ways to structure data in
a clear and coherent way and provide access to those data.

Let's explore some of the ways to do so.

## A sample data type: Names

Well start with might seem like a comparatively simple starting point: 
names.  In the US, most names traditionally have three basic components:
a given name (also known as a first name), a middle name, and a family
name (also known as a surname or last name).  Some names also have
a suffix, such as "Jr." or "III".  A few names have prefixes, such as
"King" or "Pope".  (Interestingly, names with prefixes often lack
middle and last names, although they may have suffixes.)  

As we said, these are *comparatively* simple.  As you design data types,
you'll find that each has some complexity.

What might we do with names?   We should be able to

* Construct them from the component parts.
* Extract the component parts.
* Convert them into a string for output.
* Compare two of them for sorting or similar activities.
* Determine if a value is a name.

That seems like a good starting point.  Let's write the documentation
for each of these.

We'll start with the basic constructor.

```
;;; (name prefix given middle family suffix) -> name?
;;;   prefix : string? or #f
;;;   given : string?
;;;   middle : string? or #f
;;;   family : string? or #f
;;;   suffix : string? or #f
;;; Create a new name.
```

Why did we say "or #f"?  Because the prefix, middle name, family name,
and suffix are all optional.  (All of them?  Yes.  There are people
with only one name, including Madonna, Prince, and the computer scientist
Simon.)

What should we do next?  Let's see ... document, then write tests.  Can
we write tests for `name`?  Probably not until we've described a
few more procedures, but we can at least try some based on the output
type.  We'll want to create a variet of forms of names.

```
(define ada (name "Countess" "Ada" "Augusta" "Byron" #f))
  ; Perhaps "Lady Ada August King, Countess Lovelace"
  ; Our name model is insufficiently deep.
(define babbage (name #f "Charles" #f "Babbage" #f))
(define clay (name #f "Roy" #f "Clay" "Sr"))
(define hopper (name #f "Grace" "Murray" "Hopper" #f))
  ; We don't normally include titles for Americans.
(define qe2 (name "Queen" "Elizabeth" #f #f "II"))
(define simon (name #f "Simon" #f #f #f))

(test-true "Admiral Grace Murray Hopper" (name? hopper))
(test-true "Charles Babbage" (name? babbage))
(test-true "Countess Ada Augusta Byron" (name? ada))
(test-true "QEII" (name? qe2))
(test-true "Roy Clay Sr." (name? clay))
(test-true "Simon" (name? simon))
```

As long as we've referenced the `name?` predicate, we should document
it.

```
;;; (name? val) -> boolean?
;;;   val : any?
;;; Determine if val is a name.
```

What about the tests for the `name?` predicate?  We've effectively written 
those above.

Okay, let's think about the components.  We should be able to
extract each of the components.

```
;;; (name-prefix name) -> string? or #f
;;;   name : name?
;;; Get the prefix of a name.  Returns #f if the name has no prefix.

;;; (name-given name) -> string?
;;;   name : name?
;;; Get the given name from a name.

;;; (name-middle name) -> string? or #f
;;;   name : name?
;;; Get the middle name from a name.  Returns #f if the name does
;;; not contain a middle name.

;;; (name-family name) -> string? or #f
;;;   name : name?
;;; Get the family name from a name.  Returns #f if the name lacks
;;; a family name.

;;; (name-suffix name) -> string? or #f
;;;   name : name?
;;; Get the suffix from a name.  Returns #f if the name lacks a 
;;; suffix.
```

And some tests!

```
(test-equal? "ada/prefix" (name-prefix ada) "Countess")
(test-equal? "ada/given" (name-given ada) "Ada")
(test-equal? "ada/middle" (name-middle ada) "Augusta")
(test-equal? "ada/family" (name-family ada) "Byron")
(test-false "ada/suffix" (name-suffix ada))

(test-false "babbage/prefix" (name-prefix babbage))
(test-equal? "babbage/given" (name-given babbage) "Charles")
(test-false "babbage/middle" (name-middle babbage))
(test-equal? "babbage/family" (name-family babbage) "Babbage")
(test-false "babbage/suffix" (name-suffix babbage))

(test-false "clay/prefix" (name-prefix clay))
(test-equal? "clay/given" (name-given clay) "Roy")
(test-false "clay/middle" (name-middle clay))
(test-equal? "clay/family" (name-family clay) "Clay")
(test-equal? "clay/suffix" (name-suffix clay) "Sr")
```

You get the idea.

At this point, you're probably saying "**But where's the implementation?**"
I'd prefer to document the remaining procedures, but I suppose we
can move on to the implementation.

## Implementing names

How should we implement names?  There are so many options.  We
could use five-element lists.  We could use five-element vectors.
We could use hash tables indexed by the symbols `'prefix`, `'given`,
`'middle`, `'family`, and `'suffix`.  We could use strings with the
elements separated by commas or tildes or vertical bars or something
else.  We could use Racket's "structs', but we don't know those
yet.  So many options!

Let's choose the "obvious" one: Lists.  After all, it's what we would
have used a week or two ago.

Let's go!

```
(define name
  (lambda (prefix given middle family last)
    (list prefix given middle family last)))
```

Wasn't that fun?  I suppose we could also have written the following
since it accomplishes the same thing.

```
(define name list)
```

However, the first version ensures that `name` is always called with
five parameters.

If we're ensuring the correct number of inputs, we could also ensure 
that those parameters are of the correct type.

```racket
(define name
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))])
    (lambda (prefix given middle family suffix)
      (cond
        [(not (string-or-false? prefix))
         (error "name: Invalid prefix:" prefix)]
        [(not (string? given))
         (error "name: Invalid given name:" given)]
        [(not (string-or-false? middle))
         (error "name: Invalid middle:" middle)]
        [(not (string-or-false? family))
         (error "name: Invalid family:" family)]
        [(not (string-or-false? suffix))
         (error "name: Invalid suffix:" suffix)]
        [else
         (list prefix given middle family suffix)]))))
```

Whoops.  Perhaps that was too much.  Oh well.  It's a good strategy.
And it will help us move on to the `name?` predicate.

```racket
(define name?
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))])
    (lambda (val)
      (and (list? val)
           (= 5 (length val))
           (string-or-false? (car val))
           (string? (cadr val))
           (string-or-false? (caddr val))
           (string-or-false? (cadddr val)) ; is this legal?
           (string-or-false? (caddddr val)))))) ; is this legal?
```

Unfortunately, that last line isn't quite legal.  So let's use `list-ref`.

```racket
(define name?
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))])
    (lambda (val)
      (and (list? val)
           (= 5 (length val))
           (string-or-false? (car val))
           (string? (cadr val))
           (string-or-false? (caddr val))
           (string-or-false? (cadddr val))
           (string-or-false? (list-ref val 4))))))
```

And yes, `name` and `name?` together pass all of the tests.

On to the other procedures.  They are comparatively easy to define.

```
(define name-prefix car)
(define name-given cadr)
(define name-middle caddr)
(define name-family cadddr)
(define name-suffix (section list-ref <> 4))
```

These also pass our tests.

## Changing our implementation

I don't know about you, but at some point, I worry about all of those
`caddr`s and such.  They aren't *that* inefficient, but they do require
a bit of extra work.  Maybe we should use a vector.

Let's see ... The `name` procedure won't be much different.

```racket
(define name
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))])
    (lambda (prefix given middle family suffix)
      (cond
        [(not (string-or-false? prefix))
         (error "name: Invalid prefix:" prefix)]
        [(not (string? given))
         (error "name: Invalid given name:" given)]
        [(not (string-or-false? middle))
         (error "name: Invalid middle:" middle)]
        [(not (string-or-false? family))
         (error "name: Invalid family:" family)]
        [(not (string-or-false? suffix))
         (error "name: Invalid suffix:" suffix)]
        [else
         (vector prefix given middle family suffix)]))))
```

Nor will the `name?` procedure.  In fact, we can even take advantage
of the other procedures we expect to write.

```racket
(define name?
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))])
    (lambda (val)
      (and (vector? val)
           (= 5 (vector-length val))
           (string-or-false? (name-prefix val))
           (string? (name-given val))
           (string-or-false? (name-middle val))
           (string-or-false? (name-family val))
           (string-or-false? (name-suffix val))))))
```

Those last few procedures aren't all that hard either.

```racket
(define name-prefix (section vector-ref <> 0))
(define name-given (section vector-ref <> 1))
(define name-middle (section vector-ref <> 2))
(define name-family (section vector-ref <> 3))
(define name-suffix (section vector-ref <> 4))
```

And yes, this implementation passes all of the tests.  At least it 
did once I fixed some bugs.

## Never satisfied: Yet another implementation

Are we done yet?  No.  We might decide that we want some practice with
some hash tables and want to implement names with hash tables.  As
noted earlier, we can use `'prefix` and such as the keys.  Let's see
what we might do.  I'd suggest only putting part of the name in the
hash table if it's not false.

In this case, we're not checking all of the preconditions; we'll
just assume the person who calls our procedure meets the requirements.

```racket
(define name
  (lambda (prefix given middle family suffix)
    (let ([n (make-hash)])
      (when prefix
        (hash-set! n 'prefix prefix))
      (hash-set! n 'given given)
      (when middle
        (hash-set! n 'middle middle))
      (when family
        (hash-set! n 'family family))
      (when suffix
        (hash-set! n 'suffix suffix))
      n)))
```

When is something this kind of name?  When it's a hash table with the
appropriate keys.

```racket
(define name?
  (let ([ok-key?
         (lambda (key hash)
           (string? (hash-ref hash key "")))])
    (lambda (val)
      (and (hash? val)
           (ok-key? 'prefix val)
           (string? (hash-ref val 'given))
           (ok-key? 'middle val)
           (ok-key? 'family val)
           (ok-key? 'suffix val)))))
```

Do these pass our tests?  They do.  (Well, they did once we corrected some
errors the tests revealed.  Tests are our friends.)

On to extracting the fields.  Ah, the joy of `hash-ref`.

```racket
(define name-prefix (section hash-ref <> 'prefix #f))
(define name-given (section hash-ref <> 'given))
(define name-middle (section hash-ref <> 'middle #f))
(define name-family (section hash-ref <> 'family #f))
(define name-suffix (section hash-ref <> 'suffix #f))
```

And yes, these pass all of the tests we wrote.

## What's the point?

At this point, you're probably asking yourself, "What's the point of all
this?"  There are multiple points.

_You can define your own types_ (or at least things like types).
To those using your new "name" type, names are no different than
images or strings or characters.  That is, they can create them and
use them without completely understanding how they are represented.
(The representation is a little easier to see, but we'll ignore
that issue for the time being.)

_If you separate **what** you can do with a type from **how** you
do so, it's easy to switch implementations._  A program that uses
only the primary `name` procedures won't care whether we use lists
or hash tables or vectors or strings or something else.

This second point is one of the reasons we encourage you to always
start with documentation and then tests.  Those should apply no matter
how you implement things.

This separation of *what* from *how* is a key part of computational
thinking.  We call this separation "*abstraction*".  You've already
become accustomed to "*procedural abstraction*"; you can use `reduce`
or `map `because you know what it does, even if you don't know how.
(Well, at this point, you may know how, too.  But you used it before
knowing that.)  You are now experiencing the ideas of "*data abstaction*";
we can use a representation of data without knowing the underlying
representation.

## Self-Checks

### Self-check 1: Printing names (‡)

Write a procedure, `(name->string name)`, that takes a name 
and converts it to the appropriate string.  `name->string` should
work no matter what representation we use, even if we use a
representation we have not yet covered.

```racket
> (name->string qe2)
"Queen Elizabeth II"
> (name->string clay)
"Roy Clay Sr"
```

### Self-check 2: Yet another representation (‡)

Suppose we were planning to represent names as strings with the
components separated by vertical bars.  For example,
`"|Barack|Hussein|Obama|II"` or `"Queen|Elizabeth|||II"`.  Sketch
how you would write procedures like `name-given` and `name-family`
that extract the various parts of the name.  You might, for example,
use `string-split`.
