---
title: List recursion, revisited
summary: |
  We've learned a number of basic techniques for writing
  recursive functions over lists, including the a pattern of recursion. But
  these techniques aren't always the clearest or most elegant for every
  case. Here, we extend your recursion toolbox to include a few more
  techniques, particularly the identification of special base cases and
  ways to write recursive predicates.
---

## Singleton base cases

Sometimes the problem that we need an algorithm for doesn't apply to
the empty list, even in a vacuous or trivial way, and the base case
for a direct recursion instead involves *singleton lists* -- that is,
lists with only one element. For instance, suppose that we want an
algorithm that finds the string that contains the most vowels in a 
list of strings.  (The list must be non-empty because there is no "most
vowels string" in an empty list of strings.)

The assumption that the list is not empty is a *precondition* for the
meaningful use of this procedure, just as a call to Scheme's built-in
`quotient` procedure requires that the second argument, the divisor,
be non-zero. A precondition is a requirement that must be met in order
for your procedure to work correctly. You should have already formed a
habit of figuring out when such preconditions are appropriate. With the
6P technique for documenting procedures, you have likely made it a 
habit to document such preconditions as you write the initial comment
for a procedure:

```
;;; Procedure:
;;;   most-vowels
;;; Parameters:
;;;   words, a list of strings
;;; Purpose:
;;;   Find the string with the most vowels
;;; Produces:
;;;   vowel-laden, a string
;;; Preconditions:
;;;   * words is nonempty.
;;;   * All the entries in words are strings.
;;; Postconditions:
;;;   * vowel-laden is an element of words 
;;;   * For each string, str, in words, vowel-laden has at least as
;;;     many vowels as str.
```

Alternately, we can make the structure of the list part of the specification of the parameters (and therefore an implicit precondition).

```
;;; Parameters:
;;;   words, a nonempty list of strings.
```

Whether you specify the precondition in the parameters or the
preconditions section is often a matter of personal taste. What is most
important is that you specify it *somewhere*.

Now that we've documented the procedure, let's think about how to
implement it. If a list of strings contains only one element, the
answer is trivial -- its only element has the most vowels. Otherwise,
we can take the list apart into its car and its cdr, invoke the
procedure recursively to find the most-vowel-laden string of the
cdr, and then try to figure out which has more vowels. How do we
figure whether or not one string has more vowels?  We extract the
vowels and compare them.

Let's use a helper procedure to compare the two strings and return
the one with the most vowels. (This is not a recursive helper
procedure. Rather, like the built-in `max`, it is a relatively
straightforward procedure that simplifies our recursive definitions.)

```
;;; Procedure:
;;;   more-vowels
;;; Parameters:
;;;   str1, a string
;;;   str2, a string
;;; Purpose:
;;;   Determine which of str1 and str2 has more vowels, and return it
;;; Produces:
;;;   str, a string
;;; Preconditions:
;;;   [No additional]
;;; Postconditions:
;;;   * str is either str1 or str2.
;;;   * the number of vowels in str is at least the number of vowels
;;;     in str1.
;;;   * the number of vowels in str is at least the number of vowels
;;;     in str2
;;; Problems:
;;;   Takes an American-centric view of "vowel".
(define more-vowels
  (lambda (str1 str2)
    (if (> (length (regexp-match* #px"[AEIOUaeiou]" str1))
           (length (regexp-match* #px"[AEIOUaeiou]" str2)))
        str1
        str2)))
```

We can test whether the given list has a single element by checking
whether its cdr is an empty list. The value of the expression `(null? (cdr
string))` is `#t` if `strings` has a single element and `#f` if `strings`
has two or more elements. (It gives an error if `strings` has zero
elements.)

Here, then, is the procedure definition:

```
(define most-vowels
  (lambda (words)
    (if (null? (cdr words))
        (car words)
        (more-vowels (car words) (most-vowels (cdr words))))))
```

If someone who uses this procedure happens to violate its precondition,
applying the procedure to the empty list, the Scheme interpreter notices
the error and prints out a diagnostic message:

```
> (most-vowels null)
cdr: expects argument of type <pair>; given ()
```

## Singleton values and difference

If you think back to the tail-recursive version of `difference`, you may
note another time that we had a special singleton case. When we compute
`v`<sub>1</sub> - `v`<sub>2</sub> - `v`<sub>3</sub> - `v`<sub>k</sub>,
the base case is not “we have nothing to subtract”, but rather “we
have nothing to subtract from `v`<sub>1</sub>”.

We didn't note the need for a singleton base case until we tried to
write a tail-recursive version, but the need was there. Of course, that
means that we might consider rewriting the non-tail-recursive version,
but that version gave us the wrong answer, anyway.

## Some common forms of recursive procedures

If you consider the examples you've studied over the past few days,
you will see that there is a common form for most of the procedures. The
form goes something like this:

```
(define recursive-proc
  (lambda (val)
    (if (base-case-check? val)
        (base-case-computation val)
        (combine (partof val)
                 (recursive-proc (simplify val))))))
```

For example, for the `most-vowels` procedure,

-   The *recursive-proc* is `most-vowels`.
-   The *val* is *`words`*, our list of strings.
-   The *base-case-check* is `(null? (cdr words))`, which checks whether `words` has only one element.
-   The *base-case-computation* is `car`, which extracts the one string left in *`words`*.
-   The *partof* procedure is also `car`, which extracts the first entry in *`words`*.
-   The *simplify* procedure is `cdr`, which drops the first element, thereby giving us a simpler (well, less long) list.
-   Finally, the *combine* procedure is `more-vowels`.

Similarly, consider the first complete version of `sum`.

```
;;; Procedure:
;;;   sum
;;; Parameters:
;;;   numbers, a list of numbers.
;;; Purpose:
;;;   Find the sum of the elements of a given list of numbers
;;; Produces:
;;;   total, a number.
;;; Preconditions:
;;;   All the elements of numbers must be numbers.
;;; Postcondition:
;;;   total is the result of adding together all of the elements of numbers.
;;;   If all the values in numbers are exact, total is exact.
;;;   If any values in numbers are inexact, total is inexact.
(define sum
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (car numbers) (sum (cdr numbers))))))
```

In the `sum` procedure,

-   The *recursive-proc* is `sum`.
-   The *val* is *`numbers`*, a list of numbers.
-   The *base-case-check* is `(null? numbers)`, which checks if we have no numbers.
-   The *base-case-computation* is `0`. (This computation does not quite match the form above, since we don't apply the 0 to *`numbers`*. As this example suggests, sometimes the base case does not involve the parameter.)
-   The *partof* procedure is `car`, which extracts the first value in *`numbers`*.
-   The *simplify* procedure is `cdr`, which drops the the first element.

When you write your own recursive procedures, it's often useful to
start with the general structure and then to fill in the pieces. When
you are recursing over lists (as you have in our first explorations of
recursion), *partof* is almost always `car` and *simplify* is almost
always `cdr`. There's a bit more to the *base-case-test*, since we've
used both `(null? ___)` and `(null? (cdr? ___))`. We may also find
other techniques.

However, when you work with other kinds of information (as you will
do soon), you'll have different techniques for extracting a piece
of information, for simplifying the argument, and for deciding when
you're done.

Note, also, that examples like filtering suggest a similar, but more
complex structure for recursive procedures.

```
(define recursive-proc
  (lambda (val)
    (cond
      [(one-base-case-test?) 
       (one-base-case-computation val)]
      [(another-base-case-test?) 
       (another-base-case-computation val)]
      ...
      [(special-recursive-case-test-1?)
       (combine-1 (partof-1 val)
                  (recursive-proc (simplify-1 val)))]
      [(special-recursive-case-test-2?)
       (combine-2 (partof-2 val)
                  (recursive-proc (simplify-2 val)))]
      ...
      [else
       (combine (partof val)
                (recursive-proc (simplify val)))])))
```

However, in practice you will find that you rarely have more than two
base-case tests (mostly one) and rarely more than two recursive cases.

When we write tail-recursive procedures, we simply use the result of the
recursive call, and don't combine it with anything. Here's a simple tail
recursive pattern.

```
(define procedure
  (lambda (val)
     (procedure-helper initial-result initial-remaining)))
(define procedure-helper
  (lambda (so-far remaining)
    (if (base-case-test? remaining)
        (final-computation so-far)
        (procedure-helper (combine (part-of remaining) so-far)
                          (simplify remaining)))))
```

## Using `and` and `or`

Of course, these common forms are not the only way to define recursive
procedures. In particular, when we define a predicate that uses direct
recursion on a given list, the definition is usually a little simpler
if we use `and`- and `or`-expressions rather than `if`-expressions. For
instance, consider a predicate `all-numbers?` that takes a given
list of values and determines whether all of them are numbers. As usual,
we consider the cases of the empty list and non-empty lists separately:

-  Since the empty list has no elements, it is (as mathematicians
say) "vacuously true" that all of its elements are numbers -- there is
certainly no counterexample that one could use to refute the assertion. So
`all-numbers?` should return `#t` when given the empty list.

-  For a non-empty list, we separate the car and the cdr. If the list
is to count as all numbers, the car must clearly be a number, and in
addition the cdr must be a list of only numbers. We can use a recursive
call to determine whether the cdr is all numbers, and we can combine the
expressions that test the car and cdr conditions with `and` to make sure
that they are both satisfied.

Thus, `all-numbers?` should return `#t` when the given list either is empty or has a number as its first element and all numbers after that. This yields the following definition:

```
;;; Procedure:
;;;   all-numbers?
;;; Parameters: 
;;;   values, a list of Scheme values
;;; Purpose: 
;;;   Determine whether all of the elements of a list are numbers.
;;; Produces:
;;;   allnum?, a Boolean.
;;; Preconditions:
;;;   [No additional]
;;; Postconditions:
;;;   allnum? is #t if all of the elements of values are numbers.
;;;   allnum? is #f if at least one element is not a number.
(define all-numbers?
  (lambda (values)
    (or (null? values)
        (and (number? (car values))
             (all-numbers? (cdr values))))))
```

When `values` is the empty list, `all-numbers?` applies the first test
in the `or`-expression, finds that it succeeds, and stops, returning
`#t`. In any other case, the first test fails, so `all-numbers?` proceeds
to evaluate the first test in the `and`-expression. If the first element
of `values` is not a number, the test fails, so `all-numbers?` stops,
returning `#f`. However, if the first element of `numbers` is a number,
the test succeeds, so `all-numbers?` goes on to the recursive procedure
call, which checks whether all of the remaining elements are numbers, and
returns the result of this recursive call, however that result turns out.

Here's a template for that solution.

```
(define all-____?
  (lambda (lst)
    (or (null? lst)
        (and (____? (car lst))
             (all-____? (cdr lst))))))
```

We can use a similar technique to ask if *any* value in a list is a number. In this case, if there are no values in the list, we know that no values are numbers. Otherwise, we check if the first value is a number. If it is, then some value must be a number.

The complicated part is getting the base case right (particularly if we
want to avoid using `if`). The standard technique is to require that
the list not be null (using `not` and `and`). If the list is null,
`(not (null? lst))` returns `#f`. And, since `(and #f ...)` is `#f`,
we get false back for the empty list, just as we wanted.

```
;;; Procedure:
;;;   any-numbers?
;;; Parameters: 
;;;   numbers, a list of Scheme values
;;; Purpose: 
;;;   Determine whether any of the elements of a list is a number.
;;; Produces:
;;;   anynum?, a Boolean.
;;; Preconditions:
;;;   [No additional]
;;; Postconditions:
;;;   anynum? is #t if at least one of the elements of values is a number.
;;;   anynum? is #f if all of the elements are not numbers.
(define any-numbers?
  (lambda (values)
    (and (not (null? values))
         (or (number? (car values))
             (any-numbers? (cdr values))))))
```

And, once again, we can generalize.

```
(define any-____?
  (lambda (lst)
    (and (not (null? lst))
         (or (____? (car lst))
             (any-____? (cdr lst))))))
```

## Recursion vs. built-in procedures

You may find yourself wondering why we are writing these recursive
procedures.  After all, for `most-vowels`, we could probably write
`(reduce more-vowels words)` and for `any-numbers?` we could write
`(any number? values)`.  There are a few reasons.

First, getting practice with recursion in situations that you already
understand well will help you develop recursion in more complex or
unfamiliar situations.

Second, once you're found the "pattern" for a type of recursion, you will
be able to write procedures like `reduce` and `any`.  (In fact, I expect
some of you reading this can now write your own versions of these
procedures, using patterns much like those above.)

## Self checks

### Check 1: Basic form identification

Consider the following procedure, which finds the value in a list
of real numbers with the largest absolute value.

```
(define furthest-from-zero
  (lambda (numbers)
    (if (null? (cdr numbers))
        (car numbers)
        (further-from-zero (car numbers)
                           (furthest-from-zero (cdr numbers))))))
```

Using the common form for recursive procedures given above applied to `furthest-from-zero`, fill in the blanks:

-   The *recursive-proc* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *val* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *base-case-test* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which checks whether \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *base-case-computation* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *partof* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
-   The *simplify* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, thereby giving us a "simpler value."
-   Finally, the *combine* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.

### Check 2: Tail-recursive form identification

Consider this alternate approach for the same procedure.

```
(define furthest-from-zero
  (lambda (numbers)
    (furthest-from-zero-helper (car numbers) (cdr numbers))))
(define furthest-from-zero-helper
  (lambda (furthest-so-far numbers-remaining)
    (if (null? numbers-remaining)
        furthest-so-far
        (furthest-from-zero-helper
         (further-from-zero furthest-so-far (car numbers-remaining))
         (cdr remaining-numbers)))))
```

Using the common form for tail recursive procedures given above applied to this version of `furthest-from-zero`, fill in the blanks:

- The *procedure* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ and *procedure-helper* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
- The *initial-result* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
- The *initial-remaining* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
- The *base-case-test* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which checks whether \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
- The *final-computation* is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
- The *partof* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.
- The *simplify* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, thereby giving us a "simpler value."
- Finally, the *combine* procedure is \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, which \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_.


