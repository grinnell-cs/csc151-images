---
title: An abbreviated introduction to Scheme
summary: |
  We begin to explore the Scheme programming language and some
  of the capabilities of that language.  We consider some basic issues of
  the structure of expressions in Scheme, the syntax of the
  language.
preimg: true
---

## Introduction: Algorithms and programming languages

While our main goals in this course are for you to develop your skills in "algorithmic thinking" and apply algorithmic techniques to problems, you will find it equally useful to learn how to direct computers to perform these algorithms.  _Programming languages_ provide a formal notation for expressing algorithms that can be read by both humans and computers.  We will use the Scheme programming language, itself a dialect of the Lisp programming language, one of the first important programming languages. More specifically, we'll use _Racket_, a derivative of Scheme, but we'll frequently use "Scheme" and "Racket" interchangeably throughout the course.

One thing that sets these languages apart from most other languages is a
simple, but non-traditional, syntax.  To tell the computer to apply a
procedure (subroutine, function) to some arguments, you write an open
parenthesis, the name of the procedure, the arguments separated by
spaces, and a close parenthesis.  For example, here's how you add 2 and
3.

```racket
> (+ 2 3)
5
```

One advantage of this parenthesized notation is that it eliminates the
need for the reader or the computer to know a set of precedence rules
for operations.  Consider, for example, the expression `2+3x5`. Do you
add first or multiply first?  Different programming languages may
interpret it differently.  On the other hand, we have to explicitly
state the order, writing either `(+ 2 (* 3 5))` or
`(* (+ 2 3) 5)`, using `*` as the multiplication symbol.

```racket
> (+ 2 (* 3 5))
17
> (* (+ 2 3) 5)
25
```

As this example suggests, we have already started to explore both basic
operations (addition and multiplication) and sequencing (through
nesting) in Scheme.  You should keep three points in mind when writing
and reading Scheme expressions.

* _Parenthesize all non-trivial expressions_.  Parentheses tell Scheme
  that you want to apply a procedure to some values.
* _Do not parenthesize basic values_.  Since there's no procedure call
  involved with a basic value, we do not write parentheses.
* _Write expressions in prefix order_.  That is, you write the procedure
  (function, operation, subroutine) before the arguments, even if it's
  something like `+` that you would normally put between arguments.
* _Sequence computations by nesting._  If you have intermediate
  computations that you need to do, you can parenthesize them and put
  them within another expression.

## Beyond numeric expressions

Of course, you can use Scheme for more than arithmetic computations.
Here are some examples of computations with involve text.

We can find the length of a string.

```racket
> (string-length "Jabberwocky")
11
```

We can break a string apart into a list of strings.

```racket
> (string-split "Twas brillig and the slithy toves" " ")
'("Twas" "brillig" "and" "the" "slithy" "toves")
```

We can find out how many words there are once we've split it apart.

```racket
> (length (string-split "Twas brillig and the slithy toves" " "))
6
```

This operation returned a _list_, an ordered collection of values.
Note that, like expressions, lists are surrounded by parentheses.
Scheme distinguishes lists, which should not be evaluated, from
expressions, which should be evaluated, by including a tick mark,
`'`, before the parenthesis in most lists.

Once we have a list of words, we can find out how long each word is.

```racket
> (map string-length
       (string-split "Twas brillig and the slithy toves" " "))
'(4 7 3 3 6 5)
```

## Computing with images

You've already seen a few of Scheme's basic types. Racket supports
numbers, strings (text), and lists of values.  Of course, these are
not the only types it supports.  Some additional types are available
through separate libraries.  For example, it is comparatively
straightforward to get Scheme to draw simple shapes if you
add `(require csc151)` to the top of the interactions pane.

```racket
> (require csc151)
> (solid-circle 30 "blue")
![a solid blue circle with diameter 30](../images/solid-blue-circle-30.png)
> (outlined-circle 20 "red" 5)
![an outlined red circle with diameter 20](../images/outlined-5-red-circle-20.png)
```

We can also combine shapes by putting them above or beside each other.

```racket
> (above (outlined-circle 30 "blue" 5)
         (outlined-circle 40 "red" 10))
![Two circles stacked on top of each other.  The top one, which is smaller, is outlined in blue.  The bottom one is outlined in red.]({{ "/images/blue-over-red.png" | relative_url }})
> (beside (solid-circle 40 "blue")
          (outlined-circle 30 "blue" 5))
![Two identical-size circles next to each other.  The first is a solid blue disc.  The second is a transparent circle outlined in blue.]({{ "/images/blue-solid-outlined.png" | relative_url }})
> (above (solid-rectangle 30 20 "red")
         (beside (solid-rectangle 30 20 "blue")
                 (solid-rectangle 30 20 "black")))
![Three rectangles in a pyramid.  The top rectangle is red.  The lower-left one is blue.  The lower-right one is black.  The red rectangle is centered over the other two rectangles.]({{ "/images/rectangle-pyramid.png" | relative_url }})
```

We can also ask Racket to describe images or provide our own descriptions. These are useful (perhaps essential) for those with vision impairments.

```
> (image-description (solid-circle 40 "blue"))
"a solid blue circle with diameter 40"
> (image-description (solid-circle 40 "blue" "a small blue disc"))
"a small blue disc"
```

As you may have discovered in your youth, there are a wide variety of
interesting images we can make by just combining simple colored shapes.
You'll have an opportunity to do so in the corresponding lab.

## "Scheme" versus "Racket" versus "Scamper"

Officially, we teach CSC-151 in Scheme.  But there are lots of versions of Scheme.

In our section, we will be using the DrRacket interactive development environment and the Racket programming language.
Racket is a _dialect_ of Scheme.
That is, it is a language derived from Scheme that shares many of the same language constructs and libraries, but also improves on the language in various ways.

Interestingly, Scheme is, itself, a dialect of a much older language, LISP.

In the past, all sections of CSC-151 used Racket as it is a modern, full-featured take on Scheme.
However, some Grinnell faculty decided that we needed our own version of Scheme to make it more easily extensible (and to better support the use of sound) and developed a langauge called _Scamper_.
In many ways, Scamper draws on modern Racket-isms, but it isn't truly a descendent of Racket as it tries to retain the simplicity of Scheme and thus doesn't adhere precisely to Racket's language standard.

For our intents and purposes as beginning programmers, Scheme, Racket, and Scamper are all interchangeable names describing the same "functional language with parentheses" that we use in this course.
So don't fret too much if you hear a different name from a peer or see a different name in a reading!

## Self Checks

### Check 1: Reflect on procedures (‡)

Make a list of five or so procedures you've encountered in this reading, the number of parameters, the types of those parameters (e.g., do they require numbers or strings), and their behavior.

For example, 

> The `length` procedure takes one parameter, which must be a list, and returns the number of elements in the list.

### Check 2: Some other examples (‡)

Predict the output for each of the following expressions.
Be prepared to discuss them in class.
Do not try them on your own.

```racket
(* (+ 4 2) 2)
(- 1 (/ 1 2))
(string-length "Snicker snack")
(string-split "Snicker snack" "ck")
(solid-circle 10 "teal")
```

### Check 3: Precedence (‡)

Consider the expression $$3 - 4 × 5 - 6$$.

If we did not have rules for order of evaluation, one possible way to
evaluate the expression would be to subtract six from five (giving us
negative one), then subtract four from three (giving us negative
one), and then multiply those two numbers together (giving us one).
We'd express that in Scheme as 

```racket
(* (- 3 4) (- 5 6))
```

{:type="a"}
1. What is the "official" way to evaluate that expression?

2. How would you express that in Scheme?

3. Come up with at least two other orders in which to evaluate that
expression (assuming that we don't use the standard rules of precedence).

4. Express those other two orders in Scheme.
