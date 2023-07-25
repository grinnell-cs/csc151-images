---
title: Sample Learning Assessments Problem (LAP 1)
---
# {{ page.title }}

These are sample individual learning assessments of the approximate type 
and difficulty that you will encounter.
They represent the LAs for the first LA period.

_Note: These problems are from the Fall 2020 Term 2 section of CSC-151,
which had slightly different learning goals._
_Expect these to change as we get closer to the first SoLA_.

---

## Decomposition

_Decompose a computational problem into smaller sub-problems amendable to implementation with functions._

Consider the following image that contains three "squared circles".

![See description below](../images/three-circles.png)

Each white circle is in a 100x100 grey box with a black outline.  There
are two grey boxes in the bottom row and one in the top row, centered above
the other two.

Make sure to use decomposition to break down this image into meaningful sub-images.  Your code should reflect the structure of this image.

_Hint_: to achieve the outline effect, overlay two squares, one with `'outline` and the other with `'solid`.

Make sure to check the results in DrRacket!

---

## Procedural abtraction

_Take a concrete implementation in Racket and create a new function that generalizes the behavior._

As you may recall in building snowmen, we found it useful to be able
to create hats for the snowmen.  A hat consists of three parts: a box,
a brim, and a ribbon.  The brim is at the bottom.  The ribbon appears
to be on the box, directly above the brim, although we will create it
by stacking a rectangle over the box.

We've decided on a 50x50 grey hat with a purple ribbon.  We've
decided that brims will always be 5 units high and that ribbons
will take 1/5 the height of the box.  Rather than doing the
calculations by hand, we'll make Racket do the computations.

```racket
(above (rectangle (* 50 1/2) (* (- 50 5) 4/5) "solid" "grey")
       (rectangle (* 50 1/2) (* (- 50 5) 1/5) 192 "purple")
       (rectangle 50 5 "solid" "grey"))
```

Write a procedure, `colorful-hat`, that generalizes this approach
by taking the width, height, hat color, and ribbon color as parameters
and producing an appropriate image as output.

---

## Tracing

_Trace the execution of a Racket program using a substitutive model of computation._

Consider the following procedure definitions.

```racket
(define f 
  (lambda (x y)
    (string-append x "-" (string-reverse x))))

(define g
  (lambda (x y)
    (string-append (f x x) " " (f y x)))))

(define h 
  (lambda (x y)
    (string-append (g x y) "&" (g y x))))
```

Using our mental/substitutive model of computation for Racket programs,
give a step-by-step evaluation of the following Racket expression.

```racket
(h "foo" "bar")
```

Note: You may want to confirm your answer in DrRacket.  

Note: Some of you may find that Dr.Racket lacks a `string-reverse`.
Here's an implementation: `(define string-reverse (lambda (str)
(list->string (reverse (string->list str)))))`.  You do *not* need
to trace the running of `string-reverse`.

---

## Primitive types

_Express basic computations over primitive values and their associated standard library functions._

As you may recall, Racket uses the Unicode collating sequence to assign
a number to each character (or vice versa).  Fortunately, Unicode puts
the standard American letters (A, B, C, ..., Z) in order, perhaps
because it draws about the ASCII standard.

Write two procedures, `uc->num` and `num->uc` that convert uppercase
letters to numbers and back again.  Both should use the "standard"
numbering system for letters  in which "A" is letter number 1, "B"
is letter number 2, ... "Z" is letter number 26.  That is, they should
not use the collating sequence number.

You should be able to write both procedures without knowing the
collating sequence number for `#\A`.  (You can, of course, write
code that asks for it.)

You may assume that the inputs are "correct".  That is, `uc->num` will
only receive uppercase letters and `num->uc` will only receive numbers
in the range 1 through 26, inclusive.

```drracket
> (uc->num #\A)
1
> (uc->num #\E)
5
> (uc->num #\I)
9
> (uc->num #\O)
15
> (uc->num #\U)
21
```

```drracket
> (num->uc 5)
#\E
> (num->uc 10)
#\J
> (num->uc 15)
#\O
> (num->uc 20)
#\T
> (num->uc 25)
#\Y
```

---

## Conditionals

_Utilize boolean expressions and values in a program to produce conditional behavior._

As you know, we often associate words with students' standing in
college.  At Smileyville College, Those who have completed fewer
than four terms are "freshlings", those who have completed between
four and seven terms (inclusive) are "wise fools", those who have
completed between eight and eleven terms (inclusive) are "subordinates",
and those who have completed at least twelve terms are "elders".

Write a procedure, `(status terms)`, that, given the number of
terms a student has completed as input, produces a string that
describes the student using the terms above.

---

## Lists

_Manipulate lists with fundamental higher-order list functions._

Write a procedure, `(acronym string-of-words)`, that takes as input
a string of words separated by spaces and produces as output an
acronym that consists of the first letter of each word.

```racket
> (acronym "International Business Machines")
"IBM"
> (acronym "Grinnell's Underground Magazine")
"GUM"
> (acronym "Sam's Assorted Musings and Rants")
"SAMaR"
```

You may rely on this following helper function.

```racket
;;; (first-char str) -> character
;;;   str: A non-empty string
;;; Extracts the first character of a string
(define first-char
  (lambda (str)
    (string-ref str 0)))
```

```racket
> (first-char "hello")
#\h
> (first-char "International")
#\I
```

---

## Collaboration

_Explain best practices for solving problems in a collaborative setting._

Consider the following dialogue between driver and navigator.

Driver: I'm not quite sure what to do here.  What do you think?

Navigator: Really?  It's easy.  You just need a call to map.  Type
"map square list 1 2 3". 

Driver: Ok.  Like this?

Navigator: No!  You need a paren before map.  And just type the
single quote for the list.  You spell it "sqr" not "square".

Navigator: Don't put another single quote at the end of the list!

Navigator: Let's start again.  Open parenthesis.  The word "map".  A space.
The word "ess queue are".  Another space.  A tick mark.  Another open
parenthesis.  The numeral 1.  A space.  The numeral 2.  A space.  The
numeral 3.  A close parenthesis.  Another close parenthesis.

Driver: What else do you think we should do?

Navigator: Press the return key.  Duh.

a. What went well in this conversation?

b. What went poorly?

c. How could the navigator have been a better partner?

