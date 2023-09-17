---
title: More list operations
summary: |
  We continue our exploration Racket's _list_ data type, focusing on
  other important list processing operations, including `sort`,
  `tally`, `andmap`, and `ormap`.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Data types](../readings/data-types).
  [Writing your own procedures](../readings/procedures).
  [Lists and map](../readings/list-map).
  [Anonymous procedures](../readings/anonymous-procedures).
---

_This page is ready for public consumption._

You've already seen a variety of procedures that process lists.  You are likely finding yourself thinking of clever ways to use those procedures.  But you're also finding yourself wondering why other procedures for manipulating lists don't exist.  In a few weeks, you'll have the skills to write your own procedures that process lists item by item (although not to write parallel versions of them).  For now, you'll benefit from having a few more list-processing procedures in your toolkit.  Like many of the other procedures you've seen, most are "higher-order" procedures in that they take other procedures as pameters.

## Putting lists in order

Many implementations of Scheme comes with another useful procedure, `(sort lst compare?)`, that puts the elements of a list in an order you specify.  The difficulty, of course, is how to specify the order.  For now, we'll use four basic orderings.

* `(sort nums <)` sorts a list of real numbers from smallest to largest.
* `(sort nums >)` sorts a list of real numbers from largest to smallest.
* `(sort strings string-ci<?)` sorts a list of strings from
  alphabetically first to alphabetically last.
* `(sort strings string-ci>?)` sorts a list of strings from
  alphabetically last to alphabetically first.

For example,

```drracket
> (sort (list 5 1 4 2 3) <)
'(1 2 3 4 5)
> (sort (list 5 1 4 2 3) >)
'(5 4 3 2 1)
> (sort (list "Computers" "are" "sentient" "and" "malicious") string-ci<?)
'("and" "are" "Computers" "malicious" "sentient")
> (sort (list "Computers" "are" "sentient" "and" "malicious") string-ci>?)
'("sentient" "malicious" "Computers" "are" "and")
```

## Counting values

There's one more important set of list procedures for us to consider as we explore the utility of lists.  You've seen that the `length` procedure tells us how many values appear in a list.  But what if we only want to count some of the values in a list?  We can use the `(tally-value lst val)` procedure.

```drracket
> (tally-value (list "one" "and" "two" "and" "three") "and")
2
> (tally-value (list "one" "and" "two" "and" "three") "three")
1
> (tally-value (list "one" "and" "two" "and" "three") "five")
0
```

There's also a procedure, `(tally pred? lst)`, that takes a predicate (a procedure that returns true/false) as its first parameter and counts how many values meet that procedure.

```drracket
> (tally odd? (list 3 1 4 1 5 9 2))
5
> (tally even? (list 3 1 4 1 5 9 2))
2
> (tally integer? (list 3 1 "four" "one" 5 9 2))
5
> (tally string? (list 3 1 "four" "one" 5 9 2))
2
```

As you might guess, we can write `tally-value` in terms of the more general `tally`.

```drracket
(define tally-value
  (lambda (lst val)
    (tally (cut (equal? <> val)) lst)))
```

Note that the predicate must be something we can apply to all elements of the list.

```drracket
> (tally odd? (list 3 1 "four" "one" 5 9 2))
Error! odd?: contract violation
Error!  expected: integer
Error!  given: "four"
```

### Extending predicates to lists

Many of you have been looking for a way to extend predicates to lists.
For example, you may have wanted to check if a string contains only
digits and decided to try something like the following.

```drracket
> (reduce and (map char-numeric? (string->list str)))
```

It looks good, doesn't it?  Except there's one problem.  `reduce` expects a procedure as its first parameter and `and` is a *keyword* rather than a procedure.  (Yup, there's a difference.)  

```drracket
> (reduce and (map char-numeric? (string->list "926")))
. and: bad syntax in: and
```

Nope.  What can you do?  There are a variety of possibilities.

First, you could write a binary procedure that gives the same result as `and` if not the same evaluation strategy.

```drracket
(define my-and
  (lambda (x y)
    (and x y)))
> (define my-and
    (lambda (x y)
      (and x y)))
> (my-and #t #f)
#f
> (my-and #t #t)
#t
> (my-and #f #t)
#f
> (my-and #f #f)
#f
> (my-and #f (error "Whoops"))
. . Whoops
> (and #f (error "Whoops"))
#f
```

That's right; it doesn't do the short-circuit evaluation strategy that `and` uses.  But that's okay, we don't need short-circuit evaluation here, since we're planning on evaluating all of the list elements.  So let's try reducing using it.

```drracket
> (reduce my-and (map char-numeric? (string->list "926")))
#t
> (reduce my-and (map char-numeric? (string->list "926x")))
#f
> (reduce my-and (map char-numeric? (string->list "1")))
#t
> (reduce my-and (map char-numeric? (string->list "")))
. . ../Library/Racket/7.7/pkgs/csc151/lists.rkt:143:14: cdr: contract violation
  expected: pair?
  given: '()
> (reduce my-and (map char-numeric? (string->list "a926")))
#f
```

Okay.  That works.  What else could we do?  Well, we could could rely on the built-in (or at least standard) `(string->number str)` procedure, which returns false if `str` does not represent a number.

```drracket
> (string->number "926")
926
> (string->number "926a")
#f
> (string->number "")
#f
> (string->number "1")
1
> (string->number "a926")
#f
```

Of course, we need to do a bit more than that.  Why?  Because `string->number` also works with negative numbers, decimal numbers, and complex numbers, all of which contain non-digits.

```drracket
> (string->number "-52")
-52
> (string->number "3.1415")
3.1415
> (string->number "+11")
11
> (string->number "4+2i")
4+2i
> (string->number "7/11")
7/11
```

We'll leave dealing with those issues as an exercise for the reader, not least because they may be part of a recent assignment.

## Extending predicates to lists, revisited

That gives us a few ways to deal with the problem at hand.  But the more general problem (extending a predicate to a list) seems general enough that we should have a general solution.  And, fortunately, there is one.  (Or at least many versions of Scheme include one.)  The `(andmap pred? lst)` procedure determines if a predicate holds for all of the elements of a list.

```drracket
> (andmap char-numeric? (string->list "213"))
#t
> (andmap char-numeric? (string->list "213x"))
#f
> (andmap char-numeric? (string->list "3.14"))
#f
```

In effect, `andmap` is a bit like `and`, although with lists and with a particular test.  So maybe it's not like `and`, except that it only returns `#t` when the predicate holds on all of the elements of the list, just as `and` only returns `#t` when all of its parameters hold.

If we have a list-based relative of `and`, we probably want want a list-based relative of `or`, too.  As you might expect, `(ormap pred? lst)` holds when the predicate holds on *any* element of the list.

```drracket
> (ormap char-numeric? (string->list "213x"))
#t
> (ormap char-numeric? (string->list "abcd"))
#f
> (ormap char-numeric? (string->list "abcde1"))
#t
```

## Self-checks

### Check 1: Special cases

a. What do you expect the value of `(andmap char-numeric? (string->list ""))`
to give?

b. Check your answer experimentally.

c. Give a rationale for that result.

d. What do you expect the value of `(ormap char-numeric? (string->list ""))`
to give?

e. Check your answer experimentally.

f. Give a rationale for that result.

