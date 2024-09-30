---
title: An abbreviated introduction to Scamper
summary: |
  We begin to explore the Scamper programming language and some
  of the capabilities of that language.  We consider some basic issues of
  the structure of expressions in Scamper, the syntax of the language.
preimg: true
---

## Introduction: Algorithms and programming languages

While our main goals in this course are for you to develop your skills in
"algorithmic thinking" and apply algorithmic techniques to problems in the
digital humanities, you will find it equally useful to learn how to direct
computers to perform these algorithms. _Programming languages_ provide a formal
notation for expressing algorithms that can be read by both humans and
computers.  We will use the Scheme programming language, itself a dialect of
the Lisp programming language, one of the first important programming
languages. More specifically, we'll use _Scamper_, a derivative of Scheme
custom-built for CSC 151, but we'll frequently use "Scheme" and "Scamper"
interchangeably throughout the course.

One thing that sets these languages apart from most other languages is a
simple, but non-traditional, syntax.  To tell the computer to apply a
procedure (subroutine, function) to some arguments, you write an open
parenthesis, the name of the procedure, the arguments separated by
spaces, and a close parenthesis.  For example, here's how you add 2 and
3.

<pre class="scamper source">
(+ 2 3)
</pre>

One advantage of this parenthesized notation is that it eliminates the
need for the reader or the computer to know a set of precedence rules
for operations.  Consider, for example, the expression `2+3x5`. Do you
add first or multiply first?  Different programming languages may
interpret it differently.  On the other hand, we have to explicitly
state the order, writing either `(+ 2 (* 3 5))` or
`(* (+ 2 3) 5)`, using `*` as the multiplication symbol.

<pre class="scamper source">
(+ 2 (* 3 5))

(* (+ 2 3) 5)
</pre>

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

<pre class="scamper source">
(string-length "Jabberwocky")
</pre>

We can break a string apart into a list of strings.

<pre class="scamper source">
(string-split "Twas brillig and the slithy toves" " ")
</pre>

We can find out how many words there are once we've split it apart.

<pre class="scamper source">
(length (string-split "Twas brillig and the slithy toves" " "))
</pre>

This operation returned a _list_, an ordered collection of values.
In line with the parenthesized nature of the language, list values
have the form `(list ...)` where the values of the list appear,
in order, separated by spaces.

Once we have a list of words, we can find out how long each word is.

<pre class="scamper source">
(map string-length
     (string-split "Twas brillig and the slithy toves" " "))
</pre>

## Computing with images

You've already seen a few of Scheme's basic types. Scamper supports
numbers, strings (text), and lists of values.  Of course, these are
not the only types it supports.  Some additional types are available
through separate libraries.  For example, it is comparatively
straightforward to get Scheme to draw simple shapes if you
add `(import image)` to the top of your program.

<pre class="scamper source">
(import image)

(circle 60 "outline" "blue")

(circle 40 "solid" "red")
</pre>

We can also combine shapes by putting them above or beside each other.

<pre class="scamper source">
(import image)
(above (circle 40 "outline" "blue")
       (circle 60 "outline" "red"))
(beside (circle 40 "solid" "blue")
       (circle 40 "outline" "blue"))
(above (rectangle 60 40 "solid" "red")
        (beside (rectangle 60 40 "solid" "blue")
                (rectangle 60 40 "solid" "black")))
</pre>

As you may have discovered in your youth, there are a wide variety of
interesting images we can make by just combining simple colored shapes.
You'll have an opportunity to do so in the corresponding lab.

## "Scheme" versus "Racket" versus "Scamper"

You may hear about another programming language, _Racket_, from peers who have taken prior versions of CSC 151 or from the various course readings and labs.
Racket is a _dialect_ of Scheme.
That is, it is a language derived from Scheme that shares many of the same language constructs and libraries, but also improves on the language in various ways.

In the past, CSC 151 has used Racket as it is a modern, full-featured take on Scheme.
However, in order to support the themes of the course, we developed our own implementation of Scheme, _Scamper_.
In many ways, Scamper draws on modern Racket-isms, but it isn't truly a descendent of Racket as it tries to retain the simplicity of Scheme and thus doesn't adhere precisely to Racket's language standard.

For our intents and purposes as beginning programmers, Scheme, Racket, and Scamper, are all interchangeable names describing the same "functional language with parentheses" that we use in this course.
So don't fret too much if you hear a different name from a peer or see a different name in a reading!
However, if want to be precise, we are using:

> A dialect of Scheme, custom-built for CSC 151, called Scamper.

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
(circle 10 'solid "teal")
```

### Check 3: Precedence (‡)

Consider the expression `3 - 4 × 5 - 6`{:.language-text}.

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
expression.

4. Express those other two orders in Scheme.
