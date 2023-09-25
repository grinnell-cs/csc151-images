---
title: Anonymous procedures
summary: |
  While lambda expressions are the most common way to write procedures,
  there are also a variety of others.  We consider how to use composition
  and sectioning to build new procedures from old.
prereqs: |
  [An abbreviated introduction to Racket](../readings/racket-intro).
  [Data types](../readings/data-types).
  [Writing your own procedures](../readings/procedures).
  [Lists and map](../readings/list-map).
---
## Introduction

You've learned the most common approach we will use to defining procedures. To define a procedure, you use a form like the following.

```drracket
(define procedure-name
  (lambda (formal-parameters)
    body))
```

If we wanted to define a procedure, `add`, that adds two values, we might write something like the following.

```drracket
(define add
  (lambda (x y)
    (+ x y)))
```

However, you've likely seen another way to define a procedure.  Instead of the `lambda` expression, you can use `define` to give another name to a procedure that already exists.  For example,

```drracket
(define add +)
```

How are these two definitions similar?  Both use the `define` keyword to associate a name (`add`) with something that defines a procedure. In the first case, it's a lambda expression.  In the second, it's an existing procedure.  Perhaps that's not surprising.  We can also define numeric values using expressions or constants.

```drracket
(define x (+ 1 5))
(define x 6)
```

The Lisp family of languages (including Scheme and Racket) set themselves apart from many programming languages by permitting you to use a variety of kinds of expressions to define procedures.  You've already seen two: lambda expressions and existing procedures.  In this reading, we'll explore two more: composition and partial expressions.  Just as an arithmetic operation, like `+`, creates a numeric value, the composition and partial-expression operations create a procedural value.

## Building new procedures through composition

You may have already seen composition in your study of mathematics. The composition of two functions, _f_ and _g_, is written _f_∘_g_ and represents a function that first applies _g_ and then _f_.  That is, (_f_∘_g_)(_x_) = _f_(_g_(_x_)).

In the CSC 151 Racket library, we use `o` to represent function composition.  Let's start by composing a few procedures with themselves.

```drracket
> (sqr 3)
9
> (define quad (o sqr sqr))
> quad
#<procedure:quad>
> (quad 3)
81
> (add1 3)
4
> (define add2 (o add1 add1))
> add2
#<procedure:add2>
> (add2 3)
5
```

As these examples suggest, both `quad` and `add2` are procedures.  We've created these procedures in a new way, without a `lambda`.  The `quad` procedure squares its parameter and then squares it again (3x3 is 9, 9x9 is 81).  The `add2` procedure adds one to its parameter and then adds another one.

What happens if we compose two different procedures?  Let's check.

```drracket
> (define f1 (o sqr add1))
> (f1 4)
25
> (define f2 (o add1 sqr))
> (f2 4)
17
```

As these examples suggest, the composed procedure applies the other procedures from right to left.  That is, `f1` adds one to its parameter and then squares its result, and `f2` squares is parameter and then adds 1\.  If we wanted to make it perfectly clear what we want each procedure to do, we could name them as follows.

```drracket
> (define add1-then-square (o sqr add1))
> (add1-then-sqr 4)
25
> (define square-then-add1 (o add1 sqr))
> (square-then-add1 4)
17
```

Some programmers find this right-to-left behavior perfectly natural since it mimics both mathematics and the way we write things in Racket.  That is, if we want to add1 and then square, we write `(sqr (add1 5))`, with the first operation on the right. Others find the right-to-left behavior backwards, since we speak of the operations from left to write ("add then square").  For now, we'll stick with the right-to-left behavior.  Later in the semester, we may explore some variants of the composition operation.

You can also compose more than two procedures.  For example, we might write the following silly procedure.

```drracket
> (define fun (o add1 sqr add1))
> (fun 5)
37
> (fun 0)
2
```

Composition can be quite useful.  One day, I discovered that there was no `string-reverse` in Racket, even though I had assumed there was.  But reversing a string is a straightforward operation: Convert to a list, reverse the list, convert back to a string.  So I can just write,

```drracket
(define string-reverse (o list->string reverse string->list))
```

## Cutting expressions

As you might guess, there are some things we cannot easily do with composition.  For example, suppose we want to write a procedure, `half`, that takes a number as input and divides that input by two.  In this case, we don't have anything to build upon, other than division, and division is traditionally a binary procedure.  We could use `lambda` to write something like the following.

```drracket
(define half
  (lambda (x)
    (/ x 2)))
```

However, that seems like a lot of work.  If we were describing `half` to another person, we might say something like "The `half` procedure divides by 2" or, if we were a little bit more formal, "The `half` procedure is division with a divisor of 2".

If we tried to rexpress that in Racket, we might try to write something like the following expression, where the `?` is intended to represent the dividend.

```drracket
> (define half (/ ? 2))
```

Unfortunately, we can't write that expression because as soon as DrRacket sees `(/ ...)`, it says to itself "I'm supposed to do division right now.  So I need to divide `?` by `2` and, um, I don't know what `?` represents." What we're really trying to do is tell Racket "We want *a procedure* that divides something by 2."

The `csc151` library, which we designed for this course, provides a procedure called `cut` that lets you build a new procedure by filling in *some* of the parameters in an expression.  (Like `define` and some other keywords, it's a special form that does not immediately evaluate it's arguments.)  Instead of writing `(/ ? 2)`, we write `(cut (/ <> 2))`.  In effect, we're cutting a hole in the expression, leaving a paraemter.

As you might have guessed, the `<>`, which we tend to call "diamond", is supposed to represent "here's the input to our function"; we think it was originally designed to represent an empty space in a clearer way than `_`.

Let's try it.

```drracket
> (define half (cut (/ <> 2)))
> (half 10)
5
> (half 7)
3 1/2
> (half 8.4)
4.2
> (half 4+5i)
2+5/2i
> (half 0+6i)
0+3i
```

That looks pretty good, doesn't it?  Note, however, that the placement of the `<>` is important.  Since `(/ a b)` computes `a` divided by `b`, and we want to divide by 2, the `<>` comes immediately after the `/`.  We call that the "left section" of a binary procedure.

What happens if we make the `<>` the second parameter of `/`?  Let's see

```drracket
> (define flah (cut (/ 2 <>)))
> (flah 7)
2/7
> (flah 10)
1/5
> (flah 0+6i)
0-1/3i
> (flah 0)
. . /: division by zero
```

As these examples suggest, `flah` divides 2 by whatever number you give it.

We can also use multiple `<>`'s in a `section` when we have a procedure that takes more than two parameters.

```racket
> (define this-and-that (cut (string-append <> " and " <>)))
> (this-and-that "ham" "eggs")                                    
"ham and eggs"                                                    
> (this-and-that "self gov" "the individually advised curriculum")
"self gov and the individually advised curriculum"                
> (this-and-that "Lyle's" "Bob's")                                
"Lyle's and Bob's"                                                
> (this-and-that "Bob's" "Roberts'")                                
"Bob's and Roberts'"                                                
> (this-and-that "gyre" "gimble")
"gyre and gimble"
```

Unfortunately, the design of `cut` only permits holes at the top level. 

```
> (define fun (cut (+ 1 (* 2 <>))))
> (fun 3)
. . fun: arity mismatch;
 the expected number of arguments does not match the given number
  expected: 0
  given: 1
```

Perhaps someday someone will rewrite `cut` to permit deeper holes.

## Combining cutting and composition

Composition and partial functions provide concise sysntax for defining certain kinds of procedures.  However, composition works only for one-parameter procedurs and partial-functions only work when you're filling in some parameters of a multi-parameter procedure.  What if you want to do both?  For example, consider the problem of counting the number of words in a string.  While we haven't explored all of hte component parts in close details, we have seen all of them.

You may recall from early examples that `string-split` converts a string into a list by dividing the string at a particular character sequence.

```drracket
> (string-split "Jack and Jill went up the hill" " ")
'("Jack" "and" "Jill" "went" "up" "the" "hill")
> (string-split "Beware the Jabberwock, my son!" " ")
'("Beware" "the" "Jabberwock," "my" "son!")
```

The `length` procedure tells us how many elements there are in a list.

```drracket
> (length (list 4 8 11))
3
> (length (list "Jack" "and" "Jill" "bewared" "the" "Jabberwock"))
6
```

So, to count the number of words in a string, we might split that string into a list and then count the number of elements in that list.  We could write that with `lambda` as follows.

```drracket
> (define numwords
    (lambda (str)
      (length (string-split str " "))))
> (numwords "Jack and Jill went up the hill")
7
```

However, we can also use composition and sectioning to define it
somewhat more concisely.

```drracket
> (define numwords (o length (cut (string-split <> " "))))
> (numwords "Jack and Jill went up the hill")
7
```

What are the advantages of the latter definition?  It fits on one line.  However, we could probably put the `lambda` expression on one line.  It cuts a few characters (eight, if we count correctly), but that's not a big difference.  Rather, we choose the latter definition because many people find it clearer.  What does
`numwords` do?  It splits a string at space and then takes the length.

## Composition, cutting, and mapping

Composition becomes even more useful (powerful?) when you combine it with other tools, particularly with procedures like `map`.  (We know that you haven't learned many such procedures, but you'll learn more soon.)  Consider, for example, the problem of adding two to each number in a list.

Before this reading, you might have written something like the following.

```drracket
(define addtwo
  (lambda (x)
    (+ 2 x)))
(map addtwo (list ...))
```

After what you've seen in this reading, you might now be tempted to write something like this, which is shorter (and perhaps simpler).

```drracket
(define addtwo (cut (+ <> 2)))
(map addtwo (list ...))
```

But you can do something even shorter!  As you may recall, the Racket evaluator, upon encountering a named value, substitutes the value for the name.  So it converts the second of the prior two expressions to

```drracket
(map (cut (+ <> 2)) (list ...))
```

There's no reason you can't do the same.  Here are a few examples.

```drracket
> (map (cut (+ <> 2)) (list 3 1 4 1 5 9))
'(5 3 6 3 7 11)
> (map (cut (+ <> 4)) (list 3 1 4 1 5 9))
'(7 5 8 5 9 13)
> (map (o list->string reverse string->list)
       (string-split "Once upon a time" " "))
'("ecnO" "nopu" "a" "emit")
```

That's right.  We've created new procedures---one that adds two, one that adds four, one that reverses a string--without naming them.  Many computer scientists, computer programmers, and software engineers find the use of such "_anonymous procedures_" to be particularly useful; after all, if you're only going to use a procedure once, why go to the bother of naming it?

You'll find that you use anonymous procedures regularly throughout this course (and whenever you use languages that permit them).  As these examples suggest, they go particularly well with the procedures used with lsits.

You can also create anonymous procedures in other ways.  You've seen that the compose operation (`o`) and `cut` create procedures.  What else does?  That's right.  `lambda`!  We can build anonymous procedures with `lambda`, too.

```drracket
> (map (lambda (x) (+ 1 (sqr x))) 
       (list 1 2 3 4 5))
'(2 5 10 17 26)
```

You can read this as "map (a function that takes one parameter, x, squares x and then adds 1) to the list ...".  What's the name of that function?  It doesn't have one.  it's _anonymous_.

## Sectioning: An alternative to cutting

Some readers find it confusing to see something like `(cut (+ 3 <>))`.  After all, aren't we supposed to evaluate the parameters to our procedures?  Shouldn't we evaluate the `(+ 3 <>)`?  As we noted, `cut` is a syntactic form that embraces a different evaluation strategy.

For those who prefer a different approach, the csc151 library also includes a procedure, `(section proc params-or-diamonds)`, that works much like `cut`, but without the inner parentheses.  Instead of writing `(cut (+ 3 <>))`, one can write `(section + 3 <>)`.  We will generally use `cut`, rather than `section`, because most readers find it clearer.

Note that the `cut` form is a relatively new addition to the csc151 libary, added in Fall 2023.  It was added because students in prior semesters suggested that they found the `reduce` form a bit confusing.

## Self checks

### Check 1: Subtracting three (‡)

Give three ways to define a procedure, `subtract3`, that takes a number as input and subtracts 3 from that number.

* Using the composition operation, `o`. Note that you can use `sub1`,
  which subtracts one from its parameter.
* Using `cut`.
* Using `lambda`.

Which of the three do you prefer?  Why?

## Acknowledgements

This reading is closely based on an earlier one on higher-order procedures.  I've added a section on anonymous procedures.  It was updated for 2023 Fall with a bit of cleanup and replacing `section` with the new `cut` procedure.
