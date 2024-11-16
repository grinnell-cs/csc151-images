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
link: true
---

At this point in your career, you have already used a wide variety of
types, including characters, strings, symbols, numbers (all sorts of
numbers), and images.  You've also learned a few mechanisms for grouping
data together, including lists, maps, vectors, and files.

As you may have realized, you've reached the point that you can
probably write your own data types, or at least something like your
own data types.  That is, you can find ways to structure data in
a clear and coherent way and provide access to those data.

Let's explore some ways to do so.

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

What might we do with names? We should be able to

* Construct them from the component parts.
* Extract the component parts.
* Convert them into a string for output.
* Compare two of them for sorting or similar activities.
* Determine if a value is a name.

That seems like a good starting point.  Let's write the documentation
for each of these.

We'll start with the basic constructor.

<pre class="scamper source-only">
;;; (name prefix given middle family suffix) -> name?
;;;   prefix : string? or #f
;;;   given : string?
;;;   middle : string? or #f
;;;   family : string? or #f
;;;   suffix : string? or #f
</pre>

Why did we say "or #f"?  Because the prefix, middle name, family name,
and suffix are all optional.  (All of them?  Yes.  There are people
with only one name, including Madonna, Prince, and the computer scientist
Simon.)

What should we do next?  Let's see ... document, then write tests.  Can
we write tests for `name`?  Probably not until we've described a
few more procedures, but we can at least try some based on the output
type.  We'll want to create a variety of forms of names.

<pre class="scamper source-only">
(define ada (name "Countess" "Ada" "Augusta" "Byron" #f))
  ; Perhaps "Lady Ada August King, Countess Lovelace"
  ; Our name model is insufficiently deep.
(define babbage (name #f "Charles" #f "Babbage" #f))
(define clay (name #f "Roy" #f "Clay" "Sr"))
(define hopper (name #f "Grace" "Murray" "Hopper" #f))
  ; We don't normally include titles for Americans.
(define qe2 (name "Queen" "Elizabeth" #f #f "II"))
(define simon (name #f "Simon" #f #f #f))

(test-case "Admiral Grace Murray Hopper"
  equal? #t
  (lambda () (name? hopper)))
(test-case "Charles Babbage"
  equal? #t
  (lambda () (name? babbage)))
(test-case "Countess Ada Augusta Byron"
  equal? #t
  (lambda () (name? ada)))
(test-case "QEII"
  equal? #t
  (lambda () (name? qe2)))
(test-case "Roy Clay Sr."
  equal? #t
  (lambda () (name? clay)))
(test-case "Simon"
  equal? #t
  (lambda () (name? simon)))
</pre>

As long as we've referenced the `name?` predicate, we should document
it.

<pre class="scamper source-only">
;;; (name? val) -> boolean?
;;;   val : any?
;;; Determine if val is a name.
</pre>

What about the tests for the `name?` predicate?  We've effectively written 
those above.

Okay, let's think about the components.  We should be able to
extract each of the components.

<pre class="scamper source-only">
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
</pre>

And some tests!

<pre class="scamper source-only">
(test-case "ada/prefix"
  equal? "Countess"
  (lambda () (name-prefix ada)))
(test-case "ada/given"
  equal? "Ada"
  (lambda () (name-given ada)))
(test-case "ada/middle"
  equal? "Augusta"
  (lambda () (name-middle ada)))
(test-case "ada/family"
  equal? "Byron"
  (lambda () (name-family ada)))
(test-case "ada/suffix"
  equal? #f
  (lambda () (name-suffix ada)))

; ...
</pre>

You get the idea.

At this point, you're probably saying "**But where's the implementation?**"
I'd prefer to document the remaining procedures, but I suppose we
can move on to the implementation.

## Implementing names

But how should we implement names?  There are so many options.  We
could use five-element lists.  We could use five-element vectors.
We could use dictionaries indexed by the strings `"prefix"`, `"given"`,
`"middle"`, `"family"`, and `"suffix"`.  We could use strings with the
elements separated by commas or tildes or vertical bars or something
else.  We could use Scheme's `struct`s, but we don't know those
yet.  So many options!

Let's choose the "obvious" one: Lists.  After all, it's what we would
have used a week or two ago.

Let's go!

<pre class="scamper source">
(define name
  (lambda (prefix given middle family last)
    (list prefix given middle family last)))
</pre>

Wasn't that fun?  I suppose we could also have written the following
since it accomplishes the same thing.

<pre class="scamper source">
(define name list)
</pre>

However, the first version ensures that `name` is always called with
five parameters.

If we're ensuring the correct number of inputs, we could also ensure 
that those parameters are of the correct type.

<pre class="scamper source">
(define name
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (equal? val #f)))])
    (lambda (prefix given middle family suffix)
      (cond
        [(not (string-or-false? prefix))
         (error (string-append "name: Invalid prefix: " prefix))]
        [(not (string? given))
         (error (string-append "name: Invalid given name: " given))]
        [(not (string-or-false? middle))
         (error (string-append "name: Invalid middle: " middle))]
        [(not (string-or-false? family))
         (error (string-append "name: Invalid family: " family))]
        [(not (string-or-false? suffix))
         (error (string-append "name: Invalid suffix: " suffix))]
        [else
         (list prefix given middle family suffix)]))))
</pre>

Whoops.  Perhaps that was too much.  Oh well.  It's a good strategy.
And it will help us move on to the `name?` predicate.

<pre class="scamper source">
(define name?
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (equal? val #f)))])
    (lambda (val)
      (and (list? val)
           (= 5 (length val))
           (string-or-false? (list-ref val 0))
           (string? (list-ref val 1))
           (string-or-false? (list-ref val 2))
           (string-or-false? (list-ref val 3))
           (string-or-false? (list-ref val 4))))))
</pre>

And yes, `name` and `name?` together pass all the tests.

On to the other procedures.  They are comparatively easy to define.

<pre class="scamper source">
(define name-prefix (lambda (n) (list-ref n 0)))
(define name-given (lambda (n) (list-ref n 1)))
(define name-middle (lambda (n) (list-ref n 2)))
(define name-family (lambda (n) (list-ref n 3)))
(define name-suffix (lambda (n) (list-ref n 4)))
</pre>

These also pass our tests.

## Changing our implementation

I don't know about you, but at some point, I worry about all of those
`list-ref`s and such.  They aren't *that* inefficient, but they do require
a bit of extra work.  Maybe we should use a vector.

Let's see ... The `name` procedure won't be much different.

<pre class="scamper source">
(define name
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (equal? val #f)))])
    (lambda (prefix given middle family suffix)
      (cond
        [(not (string-or-false? prefix))
         (error (string-append "name: Invalid prefix: " prefix))]
        [(not (string? given))
         (error (string-append "name: Invalid given name: " given))]
        [(not (string-or-false? middle))
         (error (string-append "name: Invalid middle: " middle))]
        [(not (string-or-false? family))
         (error (string-append "name: Invalid family: " family))]
        [(not (string-or-false? suffix))
         (error (string-append "name: Invalid suffix: " suffix))]
        [else
         (vector prefix given middle family suffix)]))))
</pre>

Nor will the `name?` procedure.  In fact, we can even take advantage
of the other procedures we would write.

<pre class="scamper source">
(define name-prefix (lambda (v) (vector-ref v 0)))
(define name-given (lambda (v) (vector-ref v 1)))
(define name-middle (lambda (v) (vector-ref v 2)))
(define name-family (lambda (v) (vector-ref v 3)))
(define name-suffix (lambda (v) (vector-ref v 4)))

(define name?
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (equal? val #t)))])
    (lambda (val)
      (and (vector? val)
           (= 5 (vector-length val))
           (string-or-false? (name-prefix val))
           (string? (name-given val))
           (string-or-false? (name-middle val))
           (string-or-false? (name-family val))
           (string-or-false? (name-suffix val))))))
</pre>

And yes, this implementation passes all the tests.  At least it
did once I fixed some bugs.

## Never satisfied: Yet another implementation

Are we done yet?  No.  We might decide that we want some practice with
maps and want to implement names with an association list.  As
noted earlier, we can use strings such as `"prefix"` and `"middle"` for the keys.  Let's see
what we might do.  I'd suggest only putting part of the name in the
association list if it's not false.

In this case, we're not checking all the preconditions; we'll
just assume the person who calls our procedure meets the requirements.
To make this a bit more readable, we'll use a helper function that will
insert into an association list as long as the value is not `#f`.

<pre class="scamper source-only">
(define assoc-set-if-present
  (lambda (k v lst)
    (if (not (equal? v #f))
        (assoc-set k v lst)
        lst)))

(define name
  (lambda (prefix given middle family suffix)
    (|> (list)
        (lambda (lst) (assoc-set-if-present "prefix" prefix lst))
        (lambda (lst) (assoc-set-if-present "middle" middle lst))
        (lambda (lst) (assoc-set "given" given lst))
        (lambda (lst) (assoc-set-if-present "family" family lst))
        (lambda (lst) (assoc-set-if-present "suffix" suffix lst)))))
</pre>

When is something this kind of name?  When it's an association list with the
appropriate keys.

<pre class="scamper source-only">
(define name?
  (lambda (val)
    (let ([string-or-false?
           (lambda (val)
             (or (string? val) (equal? val #t)))])
    (and (list? val)
         (assoc-key? "prefix" val)
         (assoc-key? "middle" val)
         (assoc-key? "given" val)
         (assoc-key? "family" val)
         (assoc-key? "suffix" val)
         (string-or-false? (assoc-ref "prefix" val))
         (string-or-false? (assoc-ref "middle" val))
         (string? (assoc-ref "given" val))
         (string-or-false? (assoc-ref "family" val))
         (string-or-false? (assoc-ref "suffix" val))))))
</pre>

Do these pass our tests?  They do.  (Well, they did once we corrected some
errors the tests revealed.  Tests are our friends.)

On to extracting the fields.  Ah, the joy of `assoc-ref`.

<pre class="scamper source-only">
(define name-prefix (lambda (lst) (assoc-ref "prefix" lst)))
(define name-given (lambda (lst) (assoc-ref "given" lst)))
(define name-middle (lambda (lst) (assoc-ref "middle" lst)))
(define name-family (lambda (lst) (assoc-ref "family" lst)))
(define name-suffix (lambda (lst) (assoc-ref "suffix" lst)))
</pre>

And yes, these pass all the tests we wrote.

## What's the point?

At this point, you're probably asking yourself, "What's the point of all
this?"  There are multiple points.

_You can define your own types_ (or at least things like types).
To those using your new "name" type, names are no different then
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
knowing that.)  You are now experiencing the ideas of "*data abstraction*";
we can use a representation of data without knowing the underlying
representation.

## Self-Checks

### Self-check 1: Printing names (‡)

Write a procedure, `(name->string name)`, that takes a name
and converts it to the appropriate string.  `name->string` should
work no matter what representation we use, even if we use a
representation we have not yet covered.

<pre class="scamper source-only">
> (name->string qe2)
"Queen Elizabeth II"
> (name->string clay)
"Roy Clay Sr"
</pre>

### Self-check 2: Yet another representation

Suppose we were planning to represent names as strings with the
components separated by vertical bars.  For example,
`"|Barack|Hussein|Obama|II"` or `"Queen|Elizabeth|||II"`.  Sketch
how you would write procedures like `name-given` and `name-family`
that extract the various parts of the name.  You might, for example,
use `string-split`.