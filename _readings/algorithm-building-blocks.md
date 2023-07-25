---
title: Algorithm building blocks
summary: |
  We consider the structures you will use as you build algorithms.
---

## Introduction

An _algorithm_ is a set of instructions to
accomplish a problem.  As you might expect, the way we express an
algorithm depends, in large part, on the audience for the algorithm.
Consider the problem of making a set of chocolate chip cookies. For
a beginning cook, we would have to carefully explain what it means
to sift flour, the steps involved in creaming together butter and
sugar, how to determine whether a cookie is done, and such. For
an intermediate cook, we might not need to provide those details,
but we would likely need to give an order in which ingredients are
combined.  For an expert cook, we might only list the ingredients
and the recommended oven temperature and could assume that they
would be able to figure out the rest.

Despite the wide variety of audiences and kinds of algorithms, you
will find that there are a few basic "building blocks" that you will use
as you construct algorithms, whether in a natural language or in a
programming language.  As you learn a new programming language, make
sure to pay attention to how you express these blocks.

In this section, we will introduce these blocks conceptually.  We'll spend the remainder of the course exploring how to realize these ideas in a computer program.

## Basic building blocks (Predefined values and operations)

Even when you are writing an algorithm for a novice, you have to build
upon some basic assumptions.  In teaching someone to make a cookie, you
can assume that they know what the different ingredients are (e.g.,
flour, sugar) and that they know some basic actions to do with those
ingredients (e.g., stir).  In teaching someone how to compute a square
root, you assume that they know about numbers (including, for example,
zero and one) and that they know how to work with those numbers (e.g.,
add, multiply).  In teaching someone how to analyze a text
computationally, you might assume that they know the parts of speech
and, perhaps, how to parse a sentence.

Behind the scenes, computers "know" very little.  But most programming
languages and environments provide a rich infrastructure of values and
operations on those values.  We call these the predefined values and
operations.

In most programming languages, you will be able to work not only
with numbers, but also strings (sequences of characters), files,
images, ordered collections of values, and much more.  Of course,
not all operations apply to all kinds of values: You would not
expect to sift water or to compute the square root of a word. Hence,
we often group similar kinds of values into what computer scientists
refer to as a _type_, a collection of values and valid operations
on those values.

## Sequencing: ordering the operations

Most algorithms involve multiple steps.  As you might expect, the order
in which we perform steps can have a significant impact on the outcome
of our algorithm.  If we bake the ingredients of a cookie before mixing
them together then we are likely to get something much less satisfactory
than what we get when we mix before baking. Hence, a core aspect of most
algorithms is the way we _sequence_ the steps in the algorithm.

In some cases, you will find that you explicitly sequence the steps,
telling the reader (often, the computer) to do one task, then the
next, then the next.  For example, you might tell a baker to shift
together the dry ingredients before adding them to the liquid
ingredients.

In other cases, you will express the order implicitly.  For example, if
you ask someone to compute 3+4x5, they should know to multiply 4x5
before adding three, even if you don't make that explicit.  (Common
practice suggests that on computers, we'll generally write "\*" rather 
than "x" for the multiplication operation.)

You will discover that most programming languages have multiple ways to
express both explicit and implicit ordering.  Frequently, you make
ordering explicit by placing the instructions in order; the computer
executes them from first to last.  In other cases, the ordering will be
implicit, as in the computation of 3+4\*5.

## Variables: naming values

As you write algorithms, you will find it convenient to name things. In
natural language algorithms, names are often implicit, such as "the dry
ingredients" in a baking recipe.  In computer languages, you will find
that you more frequently need to explicitly name things, as in "let 'dry
ingredients' refer to the combination of flour, baking soda, and salt".
And, just as we care about the _type_ of the built-in values, we might
also specify the type of variables, using some variables to represent
numbers and others to represent strings.

Computer scientists tend to refer to named values as _variables_, even
though they don't always vary.  We try to choose descriptive names for
our variables to help the human reader of our programs understand their
purpose.  For example, a reader might be momentarily confused if we used
`my-name` to refer to the number 5 or if we tried to multiple `my-name`
by 2.

## Subroutines: naming helper algorithms

In writing longer algorithms, you will often find that you have to
explain similar processes again and again.  For example, to teach
someone how to make a nut-butter and preserve sandwich, you might need
to explain how to open a jar twice, once for the nut butter and once for
the jar of preserves.  Rather than repeating the instructions, we will
find it helpful to make a separate algorithm that we can refer to in our
main algorithm.  For that particular example, we might have an "open
jar" subroutine that we can use in our sandwich algorithm.

Computer scientists use a wide variety of names for these helper
algorithms.  Some just call them algorithms.  Many refer to them as
_subroutines_ to emphasize that they are subordinate to the primary
algorithm.  In programming languages, we usually call them _procedures_
or _functions_.

Like the functions you've encountered in your study of mathematics,
subroutines often take inputs (e.g., a closed jar) and return a newly
computed value (e.g., an open jar).  We tend to refer to those inputs
as _parameters_ or _arguments_.

Some computer scientists are careful to distinguish between functions
(whose primary purpose is to compute a value) and procedures (whose
primary purpose is something other than computing a value) and between
parameters (what we call the inputs to a subroutine when we define the
subroutine) and arguments (what we call the inputs to a subroutine
when we use the subroutine).  We will be a bit more casual in our
usage.

## Conditionals: making decisions

We've considered four basic components of algorithms: the built-in
operations, sequencing, named values, and subroutines.  By themselves,
those three components let you write some algorithms, but only fairly
straightforward algorithms.  To write more complex algorithms, you need
more complex algorithm structures.  One of the most important kinds of
structures is the _conditional_, which lets you make decisions based on
some condition.  For example, if we are writing a program that generates
sentences, even after choosing the verb, we'll have to use a different
form of that verb depending on whether the subject is singular or
plural.  Those of a more mathematical mindset might consider the problem
of computing the absolute value of a number: If the number is negative,
we return negative one times the number.  If the number is not negative,
we just return the number.

Most conditionals take one of two forms.  The most basic conditional
performs an action only if a condition holds.

```text
if <some condition> holds then
  perform some actions        
```

For example,

```text
if your baking powder is old then                 
  double the amount of baking powder in the recipe
```

More frequently, though, we use the conditional to choose between one of
two options.

```text
if <some condition> holds then      
  perform some actions              
otherwise                           
  perform a different set of actions
```

For example,

```text
if you are at an elevation below 3000 feet then     
  set the oven temperature to 325 degrees Fahrenheit
otherwise                                           
  set the oven temperature to 350 degrees Fahrenheit
```

or

```text
To compute the absolute value of a real number, n
  if n < 0 then                                  
    return -1*n                                  
  otherwise                                      
    return n                                     
```

Once in a while, you'll find that you want to decide between more than
two possibilities.  In those situations, we often organize those into a
sequence of conditions, which we often refer to as _guards_.

Scheme has a variety of conditionals that we will explore once we have
mastered the basics.

## Repetition: repeating tasks

We've seen that subroutines provide one mechanism for repeating a series
of actions.  If you want to do the same thing again, but with a
different input, you just call the subroutine again.  However, we
frequently find that we want to repeat actions a large number of times
and would find it inconvenient, at best, to write the call to the
subroutine again and again and again.  For situations like this, most
programming languages provide structures that let us concisely write
algorithms that perform a task multiple times.

* We might do work until we reach a desired state.  For example, in
  baking, we often stir solids and liquids together until the solids are
  fully dissolved.  And, in teaching me to make bagels, my mother taught
  me to knead the dough until it reaches a consistency close to that of
  an earlobe.  Many computer scientists refer to these as _while loops_.

* We might do work for a specified number of repetitions.  For example,
  some recipes call for you to beat for 100 strokes.  Many computer
  scientists refer to these as _for loops_.

* We might do work for each element in a collection.  For example, many
  text analysis routines process each word in a text in turn.  Many
  computer scientists refer to these as _for-each loops_.  Others refer
  to the process of doing something to each element in a collection as
  _mapping_.

You'll discover that there are multiple ways to express each kind of
repetition, as well as some more general forms of repetition.

## Input and output: communicating with others

Finally, we need a way for our program to communicate with the outside
world.  Programs may take input from a variety of places (e.g., the
keyboard, a file, a network connection) and may provide output
(results) somewhere else (e.g., the screen, a file, a network
connection).

Some programming systems, including Scamper, let us run programs
interactively, typing expressions and seeing the results.  But others
will explicitly prompt for input and explicitly generate output.  You
will find reasons to use both the "interactive computing" mode that
Scamper provides and the more general mechanisms for input and output.

## Self Checks

### Check 1: Reflecting on basic algorithms

Pick a non-trivial algorithm, such as a recipe for making chocolate chip
cookies, and identify examples from that algorithm for each of the
different algorithmic building blocks.  If you wrote an algorithm on the
first day of class, use that algorithm.

### Check 2: Conditionals, subroutines, and repetition

Suppose we want to have the computer "read" a text and decide whether it
expresses a positive or negative worldview.  In what ways would
conditionals, subroutines, and repetition help with this task?

