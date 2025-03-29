---
title: SamR's Style Guide for Racket
---
# {{ page.title }}

When we write in natural language, we employ a variety of conventions
to help ensure that our audience can more easily read what we write.
We put spaces between words.  We put spaces between sentences.  (These
spaces are supposed to be larger in typeset text.  In the days of
typewriters, we used two spaces between sentences.)  We put blank lines
between paragraphs or indent the first line of a paragraph.  We indent
long pieces of quoted text.

Following conventions in programming languages also helps our
readers.  In some cases, failing to follow conventions makes our
code significantly harder to read.  You will find that different
programmers and different programming teams have different conventions,
just as different teachers have different expectations for how you
separate paragraphs.

Here are some conventions we generally expect you to follow in writing
Racket.  These follow the biases of SamR.  You may also find that some
involve things you have not yet learned in Racket.  Feel free to
ignore those.

## Language-agnostic concentions

These are conventions that you should follow no matter what language
you use.

### Choose meaningful names

The name of a procedure, parameter, or variable should tell the reader
something about the procedure, parameter, or variable.  Sometimes it
describes the type, as in when we name a parameter `str` or `lst`.
Sometimes it describes the purpose, as in `sum-of-numbers`.  But
it should convey something meaningful.

It should also convey the right meaning.  Don't use `str` to name
a list or `lst` to name an integer.  You've added to your cognitive
load, made the world feel to your reader like the evil color test.

### Avoid repeated code

There are many problems with repeated code.  Repeated code often
causes the computer to do extra work, which slows down your program.
Repeated code is also harder to change; if you realize that the code
you repeated needs to change, you need to make the change in
multiple places.

How do you avoid repeated code?  Early in the semester, you had
only one approach: You write helper procedures that encapsulate
portions of the program. By the middle of the semester, you should
have seen another approach: You can use a `let` (or `let*`) to name
a value you are using multiple times.

### Avoid unnecessary work

For a variety of reasons, some programmers tend to add unnecessary
work to their program. They might multiply something by one or add
zero to the same thing. In both cases, you end up with the same thing.
They might put things into a list and then immediately decompose
the list. That, too, adds work. Try to avoid such situations.

### Decompose your procedures

Decomposition is not just a stylistic issue; it's also a key aspect
of computational thinking. If you're doing a complex computation,
you should break it into smaller computations.  If you're solving
a complex problem, you should break it into smaller problems.

## Basic Scheme conventions

### Indent to show nesting

Fortunately, DrRacket will do this for you if you hit Ctrl-I.  Properly
indented nested code makes it much easier to follow the logical flow.

### Place all the arguments to a procedure (a) on the same line or (b) stacked on separate lines

Write

```drracket
(fun a b c)
```

or

```drracket
(fun a
     b
     c)
```

*Doing so makes it easier for your reader to find all of the parameters.*

Rarely should you use any other form.

### When multiple parameters appear on the same line, separate them with spaces

For example, make sure to include the spaces in the following.

```
(+ (exp) (exp) (exp))
```

Once again, *doing so makes it easier for your reader to find all of the
parameters*.  To many readers, it's as natural to expect to see parameters
separated by spaces in code as it is to see words separated by spaces
in text.

### Whenever possible, place the first parameter to a procedure on the same line, separated by a space from the procedure

Write

```drracket
(fun a
     b
     c)
```

which is much easier to read than

```drracket
(fun
 a
 b
 c)
```

_There may still be times that the latter form is the only way to fit
things within 80 characters._

### Don't leave right parentheses on a line by themselves

That's a long-standing custom.  Programmers in other languages, like C,
find it odd because they make it a regular practice to have right braces
on lines by themselves to check nesting.  But Scheme programmers like to
save vertical space.  The right parens by themselves also convey little
meaning.

We do, on occasion, include right parens on separate lines in code
templates we give you to finish.  Please move those when you are finished.

### Avoid too-long lines

If there's a lot of text on one line, the reader will have to spend time
trying to pull the line apart.  By separating things, you make it easier
for the reader to find the parts of the expression.  I generally try to
ensure that no text goes beyond the 80th column.  I also try to use
no more than six or so "words" on a line.

## Lambda procedures

### When defining a procedure with `define` and `lambda`, put the name on one line, the `lambda` and parameters on the next line, and the body after that.

```drracket
(define NAME
  (lambda (PARAMS)
    BODY))
```

There are a few reasons we use this strategy.  First, *it ensures that the
body is not indented very far*.  That's particularly important when we are
dealing with larger or more complex bodies.  Second *it makes it easier
to find the parts*.  Uniform formatting means that we can easily find the
parameter names and the procedure names.

## Conditionals

### Place the guard on the same line as the `if`; place the consequent and alternate on separate lines

```drracket
(if GUARD
    CONSEQUENT
    ALTERNATE)
```

As in the case of procedures above, *it makes it easy for us to find the three
parts*.  In conjunction with DrRacket's auto-indent feature, it also helps
us *identify incorrectly parenthesized code*.

### Place guards and consequents in `cond` statements on separate lines

```drracket
(cond
  [GUARD1
   CONSEQUENT1a
   CONSEQUENT1b
   ...]
  [GUARD2
   CONSEQUENT2a
   CONSEQUENT2b
   ...]
  ...
  [else
   ALTERNATEa
   ALTERNATEb
   ...])
```

By now, you can guess why.  This makes it easier to find the guards
and the consequents and it also make it easier to find errors by
re-indenting.

### Place the `cond` on a line by itself

See the example above.  We mostly do that to ensure that the body of the
conditional is not indented too far.

### Follow the Zen of Booleans

Read [the Zen of Booleans](../handouts/zen-of-booleans) for more details.

### When using `match`, follow similar conventions to `cond`

_Note that not all sections of CSC-151 use `match`._

That is, a typical `match` expression should look something like the
following.

```drracket
(match EXP
  [PATTERN1
   CONSEQUENT1a
   CONSEQUENT1b
   ...]
  [PATTERN2
   CONSEQUENT2a
   CONSEQUENT2b
   ...]
  [default
   ...])
```

You don't really need the `default`.  The Grinnell CS faculty are mixed
on whether or not it's necessary.  But if you don't include a default,
you'll get a matching error.  (Because `default` is a variable name, it
matches anything.)

## General clarity

### Document all of your procedures, placing the documentation before the procedure

We place the documentation before the procedure because that's the part
that most people want to read first (or the only part people want to read
at all).  They care what your procedure does (or is supposed to do).

```drracket
;;; (proc PARAM1 PARAM2 ... PARAMn) -> TYPE?
;;;   PARAM1 : TYPE?
;;;   PARAM2 : TYPE?
;;;    ...
;;;   PARAMn : TYPE?
;;; EXPLANATION
(define proc
  (lambda (PARAM1 PARAM2 ... PARAMn)
    BODY))
```

### Place blank lines between procedures

We place blank lines between procedures for the same reason that we
often place blank lines between paragraphs in an essay; it makes it
easier to tell where one procedure ends and the next begins.

### Don't add extra spaces

Just as you would not want &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
extra &nbsp;&nbsp;&nbsp;&nbsp; spaces &nbsp;&nbsp;&nbsp;&nbsp; in
the middle of a sentence, please don't put them in the middle of
your code.  And just as you would not put spaces after a parenthetical
( &nbsp;like this one&nbsp; ) , please don't put them after your
open parens or before your close parens.

### Don't nest tick marks

We use tick marks to indicate symbols and certain lists.  Remember that
the tick mark represents "take this verbatim".  When you put a tick
mark within something that already has a tick mark, you confuse DrRacket.
(Well, you don't really confuse DrRacket, but you create a structure
that will confuse you.)

You'll note that DrRacket only uses one tick mark when it returns
a nested list.

```drracket
> (list (list 1 2 3) null (list 'a 'b))
'((1 2 3) () (a b))
```

Even though `'a` and `'b` are symbols, DrRacket doesn't put tick marks
immediately before them.  Even though `(1 2 3)` is not intended as
a procedure call, DrRacket doesn't put a tick mark immediately before
it.  That outermost tick mark handles everything.

Like DrRacket, you should use only one tick mark per expression.

## Good programming habits

### Document, test, design, implement

When you sit down with a problem, it's always tempting to start writing
code.  But writing code should be your last step.  If you think of the
problem in terms of the procedure you will write to solve it, there are
a few steps you should take before writing code.  

First, you should make sure you understand the goal of the procedure
and what the inputs and outputs will look like.  The best way to
do that is to write documentation.  When you document a procedure,
you clarify the procedure for yourself.  You also clarify it for anyone
who might be helping you develop it.

You gain further understanding of what you want the procedure to
do by writing tests for the procedure.  What should it do on this
input?  How about this one?  What are cases that might cause problems?

As you've learned by now, having a big picture view of the approach
you will use to implement a procedure helps you write more correct
code the first time.  So a high-level design helps.

Only then should you begin to implement the procedure.

You may note that more experienced programmers (e.g., your faculty)
seem to be skipping some of these steps.  That's because they are doing
much of that work in their head.  That is, they've thought about input
and output types, about edge cases and normal cases, about how they
might structure their code.  You just don't see all that work.  But if
you ask them, they'll likely be able to talk about all of those issues.

## Some negative examples

*Forthcoming.*

## Frequently asked questions

*Forthcoming.*
