---
title: Testing your procedures with RackUnit
summary: |
  As you develop procedures and collections of procedures, you have a
  responsibility to make sure that they work correctly. One mechanism for
  checking your procedures is a comprehensive suite of tests. In this
  reading, we consider the design and use of tests. We also consider
  RackUnit, the testing framework that comes with DrRacket.
---

## Introduction

Most computer programmers strive to write clear, efficient, and correct
code. It is (usually) easy to determine whether code is clear. With
some practice and knowledge of the correct tools, one can determine how
efficient code is. However, believe it or not, it is often difficult to
determine whether code is correct.

The gold standard of correctness is a formal proof that the procedure or
program is correct. However, in order to prove a program or procedure
correct, one must develop a rich mathematical toolkit and devote
significant effort to writing the proof. Such effort is worth it for
life-critical applications. However, for many programs, the effort and
time required for a formal proof are often more than can be reasonably
expected.

There is also a disadvantage of formal proof: Code often changes and the
proof must therefore also change. Why does code change? At times, the
requirements of the code change (e.g., a procedure that was to do three
related things is now expected to do four related things). At other times,
with experience, programmers realize that they can improve the code by
making a few changes. If we require that all code be proven correct,
and if changing code means rewriting the proof, then we discourage
programmers from changing their code.

Hence, we need other ways to have some confidence that our code is
correct. A typical mechanism is a *test suite*, a collection of tests that
are unlikely to all succeed if the code being tested is erroneous. One
nice aspect of a test suite is that when you make changes, you can simply
re-run the test suite and see if all the tests succeed. To many, test
suites encourage programmers to experiment with improving their code,
since good suites will tell them immediately whether or not the changes
they have made are successful.

But when and how do you develop tests? These questions are the subject
of this reading.

## What is a test?

As the introduction suggested, you should write tests when you write
code. But what is a test? Put simply, a test is a bit of code that
reveals something about the correctness of a procedure or a set of
procedures. Most typically, we express tests in terms of expressions
and their expected values.

For example, suppose we've written a procedure, `remove-negatives`, that 
removes negative numbers from a list and keeps the remainder of the values
in the same order,

* `(remove-negatives (list))` is the empty list.
* `(remove-negatives (list 3))` is equal to `(list 3)`
* `(remove-negatives (list 3 7 11))` is equal to `(list 3 7 11)`
* `(remove-negatives (list -1 3 7 11))` is equal to `(list 3 7 11)`
* `(remove-negatives (list -1 3 -2 7 -3 11))` is equal to `(list 3 7 11)`
* `(remove-negatives (list -1 -2 -3))` is the empty list.

You might even expect to see the first as a postcondition of
`remove-negatives`.  You might also expect to see the others as
postconditions (i.e. "if none of the elements in lst are negative,
then result is lst").  You'll find that we often base our tests 
on the postconditions.

We could express those expectations in a variety of ways. The simplest
strategy is to execute each expression, in turn, and see if the result is
what we expected. You may have be using this form of testing regularly
in your coding. (We often call this "experimenting with your code"
to distinguish it from the kinds of testing we introduce in this reading.)

```
> (remove-negatives (list))
'()
> (remove-negatives (list 3))
'(3)
> (remove-negatives (list 3 7 11))
'(3 7 11)
> (remove-negatives (list -1 3 7 11))
'(3 7 11)
> (remove-negatives (list -1 3 -2 7 -3 11))
'(3 7 11)
> (remove-negatives (list -1 -2 -3))
```

One disadvantage of this kind of testing is that you have to manually
look at the results to make sure that they are correct. You also have
to know what the correct answers should be. But reading isn't always a
good strategy. There's some evidence that you don't always catch errors
when you have to do this comparison, particularly when you have a lot
of tests. We know that we've certainly missed a number of errors this
way. [An appendix to this document](#anchor-appendix-anecdote) presents
an interesting historical anecdote about the dangers of writing a test
suite in which you must manually read all of the results.

Since reading the results is tedious and perhaps even dangerous, it is
often useful to have the computer do the comparison for you. For example,
we might write a procedure, `check`, that checks to make sure that two
expressions are equal. <!-- (This procedure uses `if`, which you have not
learned yet. But you should be able understand the general approach.) -->

```
(define check
  (lambda (exp1 exp2)
     (if (equal? exp1 exp2)
         'OK
         'FAILED)))
```

We can then use this procedure for the tests above, as follows.

```
> (check (remove-negatives (list)) 
         (list))
'OK
> (check (remove-negatives (list 3))
         (list 3))
'OK
> (check (remove-negatives (list 3 7 11))
         (list 3 7 11))
'OK
> (check (remove-negatives (list -1 3 7 11))
         (list 3 7 11))
'OK
> (check (remove-negatives (list -1 3 -2 7 -3 11))
         (list 3 7 11))
'OK
> (check (remove-negatives (list -1 3 2 7 - 113))
         (list 3 7 11))
'FAILED
> (check (remove-negatives (list -1 -2 -3))
         (list))
'OK
```

Note that in the penultimate test, the test itself, rather than
`remove-negatives`, was incorrect.

Confirming that our code is correct is now simply a matter of scanning
through the results and seeing if any say `"FAILED"`. And, as importantly,
we've specified the expected result along with each expression, so we
don't need to look it up manually.

Of course, there are still some disadvantages with this strategy. For
example, if we put the tests in a file to execute one by one, it may
be difficult to tell which ones failed. Also, for a large set of tests,
it seems a bit excessive to print OK every time. Finally, we get neither
`OK` nor `FAILED` when there's an error in the original expression.

In fact, if an error occurs in the middle of a group of tests, the whole
thing may come to a screeching halt.

```
> (check (remove-negatives 5) (list 1 2 3))
. . car: contract violation
  expected: pair?
    given: 5
```

## Testing frameworks

To handle these and other issues, many program development environments
now include some form of testing framework. And even when they don't,
languages often have accompanying testing frameworks. While testing
frameworks differ, they tend to share some commonalities.

First, most testing frameworks provide a way for you to *check expected
results*. That's a lot like our `check` procedure above. That is, we have
a value we expect and an expression; we evaluate the expression; and we
compare the result to the expected value. We will refer to procedures
used to check expected results as "checks".

Second, most testing frameworks provide a way to group checks into
*test cases*. Why would we need more than one check in a test case
? Sometimes, it's because we need to check multiple things about a
result. For example, if we want to make sure that `(median lst)`
has the right value, we might want to check that (a) the return
value is a real number, (b) half the numbers in the list are less
than the return value, and (c) half the numbers in the list are
greater than the return value.  But other times, the tester feels
it's natural to put a lot of related checks into a single test
case---if any of them fail, the whole test case fails. How do you
divide checks into tests? In some sense, it's a matter of taste.
Some testers like just a few checks per test case. Others like a
lot.

Finally, most testing frameworks provide a way to group individual
test cases into *test suites*. Why do we need groups of tests?
Because we often have multiple procedures to test, both individually
and in groups, and we want to run all of the tests to ensure that
everything works together. For example, we might provide a library
of a variety of related functions and want to test the whole library
_en masse_.

So, when you first encounter a new testing framework, you should
ask yourself three questions: How do you check for expected results?
How do you group checks into test cases? And how do you group test
cases into suites? (You should also ask a few related questions,
such as how you run the tests.)

## RackUnit: A testing framework for Racket

The designers of the Racket programming language designed a
testing framework to go with the language. They call this framework
"RackUnit". As you might expect, RackUnit framework is well integrated
in DrRacket.

By default, RackUnit is not available to your program. (Why not? Because
there are many libraries that Racket programmers might use, and the
designers of Racket decided that the default should be to only include
those that the programmer deems necessary.) To load RackUnit, add the
following to the top of the definitions pane.

```
(require rackunit)
```

RackUnit provides a variety of procedures that we can use to check
results. Most of them take an expected result, an input expression,
and an optional message.

`(test-= message expression expected epsilon)`{:.signature} [*requires `rackunit`*]
  : Evaluate `expression` and `expected` and then compare them for
  numeric equality (within `epsilon`). If they are equal,
  do nothing. If they are not equal, print an error message. 

`(test-equal? message expression expected)`{:.signature} [*requires `rackunit`*]
  : Evaluate `expression` and `expected` and then compare them for
  equality. If they are equal, do nothing. If they are not equal, print
  an error message. 

`(test-not-equal? message expression expected)`{:.signature} [*requires `rackunit`*]
  : Evaluate `expression`and `expected` and then compare them. If they
  are not equal, do nothing. If they are equal, print an error message. 

Although we will typically put checks into tests, we can run them on
their own. When they succeed, they print no result. When they fail,
they print an error message. For example,

```
> (test-= "exact equality of 4" 4 4 0)
> (test-= "two times two is four" 4 (* 2 2) 0 
> (test-= "sqrt 2 squared, approximately" 2 (* (sqrt 2) (sqrt 2)) 0.00001)
> (test-= "sqrt 2 squared, exactly" 2 (* (sqrt 2) (sqrt 2)) 0)
--------------------
sqrt 2 squared, exactly
. FAILURE
name:       check-=
location:   16-interactions from an unsaved editor:8:2
params:     '(2 2.0000000000000004 0)
--------------------
```

Let's return to our procedure to remove negative values and consider
how we might put together our simple checks. Here's one approach: We
can just type them directly.

```
> (test-equal? "empty list" 
               (remove-negatives (list)) 
               (list))
> (test-equal? "singleton list, no negatives"
               (remove-negatives (list 3))
               (list 3))
> (test-equal? "multiple elements, no negatives"
               (remove-negatives (list 3 7 11))
               (list 3 7 11))
> (test-equal? "negative at front of list"
               (remove-negatives (list -1 3 7 11))
               (list 3 7 11))
> (test-equal? "mixed list"
               (remove-negatives (list -1 3 -2 7 -3 11))
               (list 3 7 11))
> (test-equal? "all negative"
               (remove-negatives (list -1 -2 -3))
               (list))
```

## When to write tests

To many programmers, testing is much like documentation. That is, it's
something you add after you've written the majority of the code. However,
testing, like documentation, can make it much easier to write the code
in the first place.

As we suggested in the [reading on
documentation]({{ "/readings/documenting-your-code.html" | relative_url}}), by writing documentation
first, you develop a clearer sense of what you want your procedures to
accomplish. Taking the time to write documentation can also help you
think through the special cases. For some programmers, writing the formal
postconditions can give them an idea of how to solve the problem.

If you design your tests first, you can accomplish similar goals. For
example, if you think carefully about what tests might fail, you make
sure the special cases are handled. Also, a good set of tests of the
form "this expression should have this value" can serve as a form
of documentation for the reader, explaining through example what the
procedure is to do. There is even a popular style of software engineering,
called *test-driven development* (TDD), in which you always write the
tests first. Test-driven development is a key part of a variety of
so-called "agile software development strategies".

## Edge cases and corner cases

Although most of our tests will be for "normal" inputs, it can also
be useful to ensure that your procedure works correctly for values
at the "edge" of legality.  

* If a procedure on lists should work correctly with the empty list, 
  make sure that you have a test that uses the empty list.  
* If a procedure is looking in a list for a particular kind of value, 
  make sure to include a test which has that kind of value at the front 
  of the list, a test that has that kind of value at the back of the list,
  and another that has it at both back and front.  
* If a procedure is supposed to work with real numbers, make sure you check
  both exact and inexact numbers.  Check zero.  Check a really small
  number.  Check a really large number.  
* If a procedure is supposed to work with strings, make sure you try 
  the empty strings.

Often, it's these "edge cases" that help us find the most subtle bugs
in a procedure.  So we always try to include some.

## Self checks

Start DrRacket and add `(require rackunit)` to your definitions pane
and then click **Run**.

### Check 1: RackUnit experiments

RackUnit provides a variety of procedures to help you write tests.  They
are described above.

In the Interactions pane, try each of the operations (`test-=`, 
`test-equal?`, `test-not-equal?`, `test-true`, and `test-false`) a
few times to make sure that you understand their operation.  You
should also look for both matching and non-matching expression and
expected.  And you should see what happens when you include and do
not include the message.

Is this check vague?  Yes.  That's intentional.  We're at the point in
the course when you should make it a matter of course (no pun intended)
to try different inputs to see what happens.

### Check 2: Checking `test-=`

Explain, in your own words, what purpose the last parameter to
`test-=` serves.  (If you can't, you may want to conduct some
more experiments.)

### Check 3: Testing `bound-grade` (‡)

Sketch a set of tests for the `bound-grade` procedure, which takes a real
number as input and outputs

* That number, if it is between 0 and 100, inclusive.
* Zero, if it is less than 0.
* 100, if it is greater than 100.

By "sketch", we mean "list the tests you'd write".

## Appendix: An historical tale {#anchor-appendix-anecdote}

Many of us are reminded of the need for unit testing by the following
story by Doug McIlroy, posted to *The Risks Digest: Forum on Risks to
the Public in Computers and Related Systems*:

>  Sometime around 1961, a customer of the Bell Labs computing center
questioned a value returned by the sine routine. The cause was simple:
a card had dropped out of the assembly language source. Bob Morris pinned
down the exact date by checking the dutifully filed reversions tests for
system builds. Each time test values of the sine routine (and the rest of
the library) had been printed out. Essentially the acceptance criterion
was that the printout was the right thickness; the important point was
that the tests ran to conclusion, not that they gave right answers. The
trouble persisted through several deployed generations of the system.

> McIlroy, Doug (2006). Trig routine risk: An Oldie. _Risks Digest_
24(49), December 2006.

If Bell Labs had arranged for a count of successes and a list of failures---rather than a thick printout---they (and their customers) would have have
been in much better shape.

