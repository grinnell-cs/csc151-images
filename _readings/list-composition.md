---
title: Composing and decomposing lists
---
*Summary:* We delve more deeply into Scheme's list data type. We consider,
in particular, how we work with the individual elements of lists and not
just with the list as a whole.

## Introduction: Representing data

As we've said, computer scientists study both the *algorithms* we write to
manipulate information and the ways in which we *represent* information.
We've looked at one way of representing collections so far, lists.
As we've explored lists, we've focused on lists that contain all the
same kinds of values, mostly lists of numbers.  We call such lists
"homogeneous lists".  But lists can contain mixtures of kinds of values.
We call lists with mixtures of kinds of values "heterogeneous lists".

## An Example: UFO sightings

Here's one example of a heterogeneous list.  Consider the list of UFO sightings available at <http://www.ufocasebook.com/casefiles.html>.  For each sighting we have a year, a name, a date (or date-like description), a location (mostly a country), a Yes/No for effect, media, contact, and abduction.  (You can look at the page for what each of those mean.)  We might therefore represent each entry as an eight element list.

* Element 0 is the *year*, which we will represent as an integer.
* Element 1 is the *name*, which we will represent as a string.
* Element 2 is the *date*, which we will represent as a string.
  (We generally prefer year, month, day for dates.  But those are
  not available in this case.)
* Element 3 is the *location*, which we will represent as a string.
* Element 4 indicates whether or not there was a physical *effect*;
  we will represent it as a Boolean value (`#t` or `#f`).
* Element 5 indicates whether or not there are associated *media*;
  once again, we will represent it as a Boolean value.
* Element 6 indicates that contact was made; yet again, we will use
  a Boolean value.
* Element 7 indicates that someone was abducted; as you might guess,
  we'll use a Boolean value.

For example, here's what we might see for one entry.

```
'(1969 "The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia" #t #t #t #f)
```

Why did we start with zero, rather than one?  Because lists, like strings, are "zero indexed".  The index represents the number of items that come before the element.

While most of the list procedures we've examined so far---procedures like `reduce`, `map`, and `filter`---work on the list as a whole, if we're using lists for this kind of prupose, we want to work with the individual elements of the list.

How do we extract the different elements from the list, either to display them or compare them?  The most straightforward is to use `list-ref`, a two-parameter procedure that takes a list and an index as inputs and returns the item at that index.

```
> (define sverdlovsky
    '(1969 "The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia" #t #t #t #f))
> (list-ref sverdlovsky 0)
1969
> (list-ref sverdlovsky 1)
"The Russian Crash - Sverdlovsky"
> (list-ref sverdlovsky 2)
"Mar, 1969"
> (list-ref sverdlovsky 3)
"Russia"
> (list-ref sverdlovsky 4)
#t
```

Scheme also provides two other operations to extract values from lists: `car` extracts the first element (element zero) and `cdr` returns a list containing all but the first element.

```
> (car sverdlovsky)
1969
> (cdr sverdlovsky)
'("The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia" #t #t #t #f)
> (car (cdr sverdlovsky))
"The Russian Crash - Sverdlovsky"
```

## Building lists

We've been building new lists using `list`, `make-list`, or the quote operation.
But what if we have an existing list and we want to add an element to the front?  Say, suppose we want to add a unique identifier to each sighting, such as `'ufo023`.  Scheme provides an operation called `cons` that builds a *new* list by adding a value to the front of the list.

```
> (cons 'ufo023 sverdlovsky)
'(ufo023 1969 "The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia" #t #t #t #f)
> (car sverdlovsky)
1969
> sverdlovsky
'(1969 "The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia" #t #t #t #f)
> (define sample (cons 'ufo023 sverdlovsky))
> sample
'(ufo023 1969 "The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia" #t #t #t #f)
> (car sample)
'ufo023
```

Why is the operation called `cons` instead of `list-prepend` or something similar?
Well, `cons` is the name John McCarthy, the designer of Lisp, chose about sixty years ago.
"`cons`" is short for *construct*, because `cons` constructs lists.
(The custom of naming procedures with the basic type they operate on, a dash, and the key operation did not start until a few decades later.)
The names `car` and `cdr` were chosen for very specific reasons that will not make sense for a few more weeks.
For now, just accept that you're learning a bit of strange computer-ese.

## Nested lists

What if you want to have more than one list, such as when we want to study all of the UFO sightings?  We can make a list of lists.

## Building lists, revisited

You've now seen a variety of ways to build lists.
You can use the `list` procedure.
You can use the `make-list` procedure.
You can use the quote operation.
You can use `cons` to prepend a value to a list.

Suppose you prefer to build lists with `cons`.
How can you get started, given that `cons` expects a list as one of its parameters?
You start with the empty list.

Scheme's name for the empty list is a pair of parentheses with nothing between them: `'()`.
Most implementations of Scheme permit you to refer to that list as `nil` or `null`.
You can also create it with `(list)`.
All permit you to describe the empty list by putting a single quote before the pair of parentheses.

```
> '()
'()
> nil
'()
> null
'()
> (list)
'()
```

You will find that we prefer to use a name for that list. If sample code
does not work in your version of Scheme, try inserting the following
definitions.

```
(define nil '())
(define null '())
```

Note that by using `cons` and `nil`, we can build up a list of any length by starting with the empty list and repeatedly prepending a value.

```
> (define singleton (cons "Russia" null))
> singleton
'("Russia")
> (define doubleton (cons "Mar, 1969" singleton))
> doubleton
'("Mar, 1969" "Russia")
> (define tripleton (cons "The Russian Crash - Sverdlovsky" doubleton))
> tripleton
'("The Russian Crash - Sverdlovsky" "Mar, 1969" "Russia")
> (cons "senior" (cons "third-year" (cons "second-year" (cons "freshling" null))))
'("senior" "third-year" "second-year" "freshling")
```

You may note that lists built in this way seem a bit "backwards". 
That is, the value we add last appears at the front, rather than at the back. 
However, that's simply the way `cons` works and, as the last example may suggest, in many cases it is a quite sensible thing to do.

## List predicates

Scheme provides two basic predicates for checking whether a value is a list.
The `null?` predicate checks whether a value is the empty list.
The `list?` predicate checks whether a value is a list (empty or nonempty).

```
> (null? null)
#t
> (list? null)
#t
> (null? (list 1 2 3))
#f
> (list? (list 1 2 3))
#t
> (null? 5)
#f
> (list? 5)
#f
```

## Other common list procedures

It turns out that you can build any other list procedure with just `null`, `cons`, `car`, `cdr`, `null?`, and some other programming techniques.
Nonetheless, there are enough common operations that most programmers want to do with lists that Scheme includes them as basic
operations. (That means you don't have to define them yourself.) Here
are a few that programmers frequently use.  You may have seen some
of these before.

### `length`

The `length` procedure takes one parameter, which must be a list, and
computes the number of elements in the list. (An element that happens to
be itself a list nevertheless contributes 1 to the total that `length`
computes, regardless of how many elements it happens to contain.)

```
> (length null)
0
> (length (list 1 2 3))
3
> (length (list (list 1 2 3)))
1
```

### `append`

The `append` procedure takes any number of arguments, each of which is a list, and returns a new list formed by stringing together all of the elements of the argument lists, in order, to form one long list.

```
> (append (list "red" "green") (list "blue" "yellow"))
'("red" "green" "blue" "yellow")
```

The empty list acts as the identity for `append`.

```
> (append null (list "blue" "yellow"))
'("blue" "yellow")
> (append (list "red" "green") null)
'("red" "green")
> (append null null)
'()
```

### `index-of` and `indexes-of`

THe `index-of` procedure takes a list and a value and returns the index of the first instance of the value in the list.
If the value is not in the list, `index-of` returns false.

```
> (index-of (string->list "alphabetical") #\b)
5
> (index-of (string->list "alphabetical") #\a)
0
> (index-of (string->list "alphabetical") #\z)
#f
```

The `indexes-of` procedure (which we think should be called `indices-of`) also takes a list and a value as parameters.
In contrast to `index-of`, `indexes-of` returns a list of all the indices at which the value is found.
If the value does not appear in the list, `indexes-of` returns the empty list.

```
> (indexes-of (string->list "alphabetical") #\b)
'(5)
> (indexes-of (string->list "alphabetical") #\a)
'(0 4 10)
> (indexes-of (string->list "alphabetical") #\z)
'()
```

### `cadr` and company: Combining `car` and `cdr`

To reduce the amount of typing necessary for the programmer, many
implementations of Scheme provide procedures that combine `car` and `cdr`
in various ways. These procedures begin with the letter "c", end with
the letter "r" and have a sequence of "a"'s and "d"'s in
the middle to indicate the sequence of calls to `car` (for an "a")
or `cdr` (for a "d"). For example, `cadr` computes the car of the
cdr of a list (the second element), `cddr` computes the cdr of the cdr
of a list (all but the first two elements), and `caar` computes the car
of the car of a list (applicable only to nested lists).

```
> (define rainbow (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))
> (cadr rainbow)
"orange"
> (cddr rainbow)
'("yellow" "green" "blue" "indigo" "violet")
> (caddr rainbow)
"yellow"
> (cdddr rainbow)
'("green" "blue" "indigo" "violet")
```

## Summary of new list procedures

`null` *Standard list constant.*
:   The empty list.

`(cons value lst)`{:.signature} *Standard List Procedure.*
:   Create a new list by prepending *`value`* to the front of *`lst`*.

`(cdr lst)`{:.signature} *Standard List Procedure.*
:   Get a list the same as *`lst`* but without the first element.

`(car lst)`{:.signature} *Standard List Procedure.*
:   Get the first element of *`lst`*.

`(null? lst)`{:.signature} *Standard list predicate.*
:   Checks if *`lst`* is the empty list.

`(list-ref lst n)`{:.signature} *Standard List Procedure.*
:   Get the *`n`*th element of *`lst`*. Note that elements are numbered starting at 0.

`(length lst)`{:.signature} *Standard List Procedure.*
:   Return the number of elements of list *`lst`*.

`(append lst_0 lst_1 ... lst_n)`{:.signature} *Standard List Procedure.*
:   Create a new list by concatenating the elements of *`lst_0`*, *`lst_1`*, ... *`lst_n`*.

`(index-of lst val)`{:.signature} *Stanrdard List Procedure.*
:   Find the index of `val` in `lst`.  If `val` does not appear in `lst`, returns false (`#f`).

`(indexes-of lst val)`{:.signature} *Stanrdard List Procedure.*
:   Find all the indices of `val` in `lst`.  If `val` does not appear in `lst`, returns the empty list.

`(caar lst)`{:.signature} *Standard List Procedure.*
:   If *`lst`*'s first element is a list, gets the first element of that first element, the the `car` of the `car` of *`lst`*. If *`lst`* is not a list, or its first element is not a list, reports an error.

`(cadr lst)`{:.signature} *Standard List Procedure.*
:   Get the second element of *`lst`*, the `car` of the `cdr` of *`lst`*

`(cddr lst)`{:.signature} *Standard List Procedure.*
:   Get all but the first two elements of *`lst`*, the `cdr` of the `cdr` of *`lst`*

`(caddr lst)`{:.signature} *Standard List Procedure.*
:   Get the third element of *`lst`*, the `car` of the `cdr` of the `cdr` of *`lst`*.

## Self Checks

### Check 1: List procedures

Predict the results of evaluating the following expressions.

```
(cons 2 null)
(cons 1 (cons 2 null))
(cons 5 (list 1 2))
(caddr (range 7))
(list-ref 2 (range 7))
(append (range 2) (range 2))
(list (range 2) (range 2))
(append (range 2) null)
(list (range 2) null)
(cons (range 2) null)
```

You may verify your predictions using DrRacket, but be sure you understand
the results.

