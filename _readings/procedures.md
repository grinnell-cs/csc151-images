---
title: Writing your own procedures
summary: |
  We explore why and how to define your own procedures in Scheme.
preimg: true
---

# Writing your own procedures

In today's reading, we explore why and how to define your own procedures in Scheme.

## Introduction

As you may recall from the introduction to algorithms, the ability to write subroutines is one of the key components of algorithm design.
Subroutines typically have a _name_ that we use to refer to the subroutine, zero or more _parameters_ that provide the input to the subroutine, and a set of _instructions_ (an expression in Scheme) for doing the computation.
That is, a subroutine is just an algorithm that has been named and "parameterized".

For example, we might want to define a procedure, `square`, that takes as input a number and computes the square of that number.

<pre class="scamper-output output-prog">
(square 5)
(square 1.5)
(square 0.333)
(+ (square 0.5) (square 0.333))
(square (square 2))
</pre>

As you may have noted, `square` can have multiple meanings.  If
we're making drawings, it could also mean "make a square".  Let's
consider an example.

<pre class="scamper-output output-prog">
(import image)

(square 50 "solid" "red")
(square 25 "solid" "blue")
(above (square 60 "solid" "red")
       (beside (square 40 "solid" "blue")
               (square 40 "solid" "purple")))
</pre>

As you may recall, the `image` library already defines a `square` procedure, so it's unlikely to be a good idea for us to define our own `square` procedure, whether for numbers or images.
More generally, when we choose names in Scheme, we should try not to conflict with existing names.
Sometimes Scheme will stop us from reusing a name; other times it will blithely move along, letting us break things through such reuse.

So, how do we define these procedures?  Read on and see.

## Defining procedures with `lambda`

Scheme provides a variety of mechanisms for defining procedures.
We will start with the most general, which uses the keyword `lambda`, which means "procedure".
The lambda mechanism is relatively straightforward.

As you may recall, we typically think of a procedure as having three main aspects: The _name_ we use to refer to the procedure, the names of the _parameters_ (inputs) to the procedure, and the _instructions_ the procedure executes.

Here is the general form of procedure definitions in Scheme, at least as we will use them in this class.
Scheme does not require the indentation, but it makes it much easier to read and we will require it in this course.

```racket
(define <identifier>
  (lambda (<parameters>)
    <expression>))
```

You've already seen the `define`; we use `define` to name things.
In this case, we're naming a procedure, rather than a value.

The `<identifier>` part is straightforward; it's the name we will use to refer to the procedure.
The "`lambda`" is a special keyword in Scheme to indicate that "_Hey! This is a procedure!_".
Lambda has a special place in the history of mathematical logic and programming language design and has meant "function" or "procedure" since the early days of formal logic.
Lambda is special enough that the designers of Scamper chose it for the icon.)

The `<parameters>` are the names that we give to the inputs.
For example, we might use the names `side-length` and `color` for the inputs to our "make a square of s certain color" procedure.  Similarly, we might use the name `x` for the input to the "square a number" procedure.

Finally, the `<expr>` is a Scheme expression that is the computation that the function performs when called.

Let's look at a simple example, that of squaring a number.

<pre class="scamper-output output-prog">
(define square-number
  (lambda (x)
    (* x x)))
</pre>

Mentally, most Scheme programmers read this as something like

> `square-number` names a procedure that takes one input, `x`, and computes its result by multiplying `x` by itself.

Let's also look at some examples of using our new procedure.

<pre class="scamper-output output-prog">
(define square-number
    (lambda (x)
      (* x x)))
(square-number 5)
(square-number 0.5)
(square-number (square-number 2))
square-number
</pre>

You may note in the last line that when we asked Scamper for the "value" of `square-number`, it told us that it's a function.
Compare that to other values we might define.

<pre class="scamper-output output-prog">
(import image)
(define x 5)
x
(define phrase "All mimsy were the borogoves")
phrase
(define red-square (rectangle 75 75 "solid" "red"))
red-square
(define multiply * )
multiply
</pre>

In every case, Scamper is showing us the _value_ associated with the name.
In some cases, it's a number.
In some cases, it's a string.
In some cases, it's an image.
And, in some cases, it's a procedure.

How does the procedure we've just defined work?
Here's one way to think about it: When you call a procedure you've defined with `lambda`, Scamper substitutes in the arguments in the procedure call for the corresponding parameters within the instructions.
After substituting, it evaluates the updated instructions.

For example, when you call `(square-number 5)`, Scamper substitutes `5` for `x` in `(* x x)`, giving `(* 5 5)`.
It then evaluates the `(* 5 5)`, computing 25.

What about a nested call, such as `(square-number (square-number 2))`?
As you may recall, Scheme evaluates nested expressions from the inside out.
So, it first computes `(square-number 2)`.
Substituting `2` in for `x`, it arrives at `(* 2 2)`.
The multiplication gives a value of `4`.  The `(square-number 2)` is then replaced by `4`.
Scamper is then left to evaluate `(square-number 4)`.
This time, it substitutes `4` in for the `x`, giving it `(* 4 4)`.
It does the multiplication to arrive at a result of `16`.

We might show the steps as follows, with the `-->` symbol representing
the conversion that happens at each step.

```racket
    (square-number (square-number 2))
--> (square-number (* 2 2))
--> (square-number 4)
--> (* 4 4)
--> 16
```

What about the colored squares?

If we want a procedure to make squares, we'll just call the `rectangle` procedure, using the same value for the width and height.

<pre class="scamper-output output-prog">
(import image)

(define color-square
  (lambda (side color)
    (rectangle side side "solid" color)))
</pre>

What happens if we call `color-square` on inputs of `50` and `"red"`?
Scheme substitutes `50` for `side` and `"red"` for color, giving us `(rectangle 50 50 "solid" "red")`.  
And, as we saw in the examples above, that's a red square of side-length 50.

<pre class="scamper-output output-prog">
(import image)

(define color-square
  (lambda (side color)
    (rectangle side side "solid" color)))

(color-square 50 "red")
</pre>

## Another example

The square is a relatively simple example.  Consider, for example, the
following definition of a simple drawing of a house.

<pre class="scamper-output output-prog">
(import image)

(overlay/align "middle" "bottom"
             (overlay/align "left" "center"
                            (circle 3 "solid" "yellow")
                            (rectangle 15 25 "solid" "brown"))
             (above (triangle 50 "solid" "red")
                    (rectangle 40 50 "solid" "black")))
</pre>

What if we want to make houses with different sizes or colors?
We could copy and paste the code.
However, if we changed our mind about how to structure our houses, we'd then have to update every copy.
We'd be better off writing a procedure that takes the size and color
as parameters.

How would we write `house`?
That's a question for another day.
Or perhaps for the lab.

For now, let's consider a simpler version, one that does not include the door.
Remember: Decomposition is your friend!
If we did not care about resizing the house, we might just write an expression like the following.

<pre class="scamper-output output-prog">
(import image)

(above (triangle 50 "solid" "red")
       (rectangle 40 50 "solid" "black"))
</pre>

But we'd like to "parameterize" the code to take the size as an input.
Let's say that the size corresponds to the side-length of the triangle (or the height of the main body of the house).
We will replace each `50` by `size` and replace `40` by `(* 4/5 size)`.
Let's see how that works.

<pre class="scamper-output output-prog">
(import image)

(define simple-house
  (lambda (size)
    (above (triangle size "solid" "red")
           (rectangle (* 0.80 size) size "solid" "black"))))
(simple-house 20)

(simple-house 30)
</pre>

The next step might be to add parameters for the color of the body and the color of the roof.

## Zero-parameter procedures

We've written procedures so that they take one or more parameters.
However, there are also advantages to writing procedures that take no parameters.
For now, just remember it's a possibility.
In the future, you'll see what it's useful.

## Some benefits of procedures

As you may have figured out by now, there are many benefits to defining your own procedures.
One of the most important is _clarity_ or _readability_.
Another programmer will likely spend less effort understanding `(simple-house 20)` than they will trying to understand the more complex `above` expression involving triangles and rectangles.
The should be able to see that the first is intended to be a house.
The second could be anything, at least until you see it.
(As you may recall from the [decomposition lab](../labs/decomposition.html), the code to make a simple tree and the code to make a simple house look very similar.)

As importantly, the other programmer may also find it easier to _write_ programs using `simple-house` than the much longer series of expressions.

By using a name for a set of code, we are employing the concept of _abstraction_.
That is, because the person calling the procedure knows _what_ the procedure does rather than _how_ it achieves that result, we have abstracted away some of the details.
Of course, for someone to know what the procedure does, you need to choose a good name.
`img1` tells us very little, other than that it's an image.
`house` or `tree` gives us much more of a sense of what the procedure does.
Be thoughtful in your choice of procedure names.
(Also be thoughtful in your choice of parameter names---and any names, for that matter.)

There are benefits to abstraction and the use of procedures other than readability.
For example, it may be that you discover a more efficient way to do a computation.
If you've written the same code for the computation throughout your program, you'll have a lot of code to update.
But if you've created a procedure, you need only update one place in your code, the place you've defined the procedure.

There are other ways in which procedures make us more efficient.  For example, if we decide to change what our houses are like---say, by making the roof wider than the body of the house---we only have one place in our program to update.

As these examples suggest, using procedures to parameterize and name sections of code provides us with a variety of advantages.
First, we can more easily _reuse_ code in different places. Rather than copying, pasting, and changing, we can simply call the procedure with new
parameters.
Second, others can more easily _read_ the code we have written, at least if we've chosen good names.
Third, we can more easily _update_ the procedures we've written, either to make them more efficient or to change behavior universally.

## Using `lambda` without `define`

Scheme and related languages differentiate themselves from most other languages in that you can use `lambda` (or, more generally, subroutines) to define a procedure without bothering to name the procedure.
Recall, for example, that `(lambda (x) (* x x))` represents "a procedure that takes one input, `x`, and computes `x` times `x`".
Since that's a procedure, Scheme permits us to write it in the "procedure slot" in an expression, as in

```racket
    ((lambda (x) (* x x)) 5)
```

What does that mean?
It means "take a procedure that takes one input, `x`, and computes `x` times `x` and apply it to `5`, substituting the `5` for the `x`.

```racket
    ((lambda (x) (* x x)) 5)
--> ((lambda (x) (* x x)) 5)
--> (* 5 5)
--> 25
```

That doesn't seem very useful, does it?
And it's *much* harder to read, at least for now.
But it's worth it.
The power comes in when we use these "anonymous" procedures along with other tools.
For example, the `map` procedure which we covered briefly and will return to applies a procedure to each element of a list.

```racket
    (map (lambda (x) (* 3 x)) (list 1 2 3))
--> (list ((lambda (x) (* 3 x)) 1)
          ((lambda (x) (* 3 x)) 2)
          ((lambda (x) (* 3 x)) 3))
--> (list (* 3 1)
          (* 3 2)
          (* 3 3))
--> (list 3 6 9)
--> '(3 6 9)
```

Don't worry if you don't quite get this section!
We'll return to the concepts in a week or two.

## Self Checks

### Check 1: A simple procedure

Write a procedure, `(subtract2 val)`, that takes a number as input and
subtracts 2 from that number.

```racket
> (subtract2 5)
3
> (subtract2 3.25)
1.25
> (subtract2 "hello")
-:  Runtime error:
    A number? was expected, but a str was found
    In program: "hello"
```

### Check 2: Building blocks (‡)

Write a procedure, `(block color)`, that takes a color as input and builds a 40x20 "block" of the given color (a solid rectangle).

### Check 3: Exploring steps

Show the steps involved in computing `(square (subtract2 5))` and
`(subtract2 (square 5))`.



## Q&A

_These are questions gathered from previous reading responses._

Do we have to use they keyword `lambda` every time we want a procedure that takes in a parameter?

> Yes.  In fact, you have to use `lambda` if you want a
procedure with no parameters.

What would be the difference between a zero parameter procedure and defined variable?

> Right now, the biggest difference between a zero-parameter procedure and a defined variable are that you use them differently.  The variable you use with its name; the procedure you put in parentheses.

> Later in the semester, we'll see some differences.  One difference is when the associated code is executed.

## Acknowledgements

This section draws upon [a reading entitled "Defining your own
procedures"](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/readings/procedures)
and [an earlier reading entitled "Writing your own
procedures"](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2017S/readings/procedures-rgb-reading.html)
from Grinnell College's CSC 151.

It was updated in Spring 2022 to remove much of the discussion of zero-parameter procedures and to add a short section on anonymous procedures.

The house drawing was inspired by a more sophisticated house drawing
from the [Scheme Image
Guide](https://docs.racket-lang.org/teachpack/2htdpimage-guide.html).