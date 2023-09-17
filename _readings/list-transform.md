---
title: Transforming lists
summary: |
  We investigate a particular form of decomposition relevant in computing in which transformations over a collection of values are really transformations of the individual elements of the collection.

prereqs: |
  [List Basics]({{ "/readings/data-types.html" | relative-url }}).
preimg: true
---

Imagine representing the collection of yearly salaries found at a startup using a simple list, for example:

```
(define salaries (list 100000 100000 50000 75000 500000))
```

And now imagine computing everyone's updated salary after a standard [cost-of-living ajustment](https://www.investopedia.com/terms/c/cola.asp) (COLA).
We might decompose this problem into the problem of computing *one* person's updated salary.
Let's take the first person whom makes `100000` (units deliberately unspecified) as an example.
The Social Security COLA for 2020 was [%1.6](https://www.ssa.gov/OACT/COLA/colasummary.html), so we can calculate the updated salary using arithmetic:

```racket
> (+ 100000 (* 100000 0.016))
101600.0
```

And we can abstract this into a function that computes the updated salary when given a salary:

```racket
;;; Procedure:
;;;   compute-cola-salary
;;; Parameters:
;;;   salary, a Number
;;; Purpose:
;;;   Computes the cost-of-living-adjusted salary for an individual.
;;; Produces:
;;;   the updated salary, a Number
;;; Preconditions:
;;;   salary is a valid monetary amount (i.e., non-negative)
;;; Postconditions:
;;;   (compute-cola salary salary) is the COLA salary.
(define compute-cola-salary
  (lambda (salary) 
    (+ salary (* salary 0.016))))
```

Good!
We can now calculate the updated salary for any person.
However, how do we do this for a *collection* of salaries, a collection represented as a list?

Note that the calculation of each salary is *independent* of the other salaries.
That is, someone's adjusted salary only depends on their salary and not other salaries.
In this situation, we simply want to apply our solution for a single person, `compute-cola-salary`, to every element of the list.
We say that we want to *lift* the function `compute-cola-salary` from operating on a single salary to a list of salaries.

In Racket, we realize the behavior of *lifting a function to a list of values* with the `map` function:

```racket
> (map compute-cola-salary salaries)
'(101600.0
  1016000.0
  50800.0
  76200.0
  5080000.0)
```

Note that the `map` procedure does not affect the original list.

```racket
> salaries 
'(100000 100000 50000 75000 500000)
```

## The `map` procedure

`map` is a powerful procedure!
It allows to concisely describe how to transform the values of a list in terms of an operation over a single element of the list.
Let's break down how you use `map`.

`map` itself is a function of two arguments as seen in our above example.

+   The first argument is a function that transforms a single element of the list.
    By "transform", we mean the function:

    -   Takes as an input an element of the list.
    -   Produces as an output the result of transforming that element.

    In our above example, `compute-cola-salary` is a function that transforms an old salary into a new, adjusted salary.

+   The second argument is a list that contains the elements that we wish to transform.

Any transformation function over salaries can be passed in to our call to `map`, for example, the startup might have [gone public](https://www.investopedia.com/ask/answers/what-does-going-public-mean/) so everyone gets their salary doubled:

```racket
> (define double-salary 
    (lambda (salary) 
      (* salary 2)))
> (map double-salary salaries)
'(200000 200000 100000 150000 1000000)
```

The startup might have hit a downturn and needs to reduce their salaries:

```racket
> (define downsize 
    (lambda (salary) 
      (/ salary 2)))
> (map downsize salaries)
'(50000 50000 25000 37500 250000)
```

Or worse yet, the downturn might be so bad that the startup needs to do the right thing and let go of its higher-earning employees to stay under budget:

```racket
> (define should-keep 
    (lambda (salary) 
      (< salary 75000)))
> (map should-keep salaries)
'(#f #f #t #f #f)
```

This last example shows off a new type that we just encountered, the *boolean type*, which captures values that are either true or false.
In Racket, we write true as `#t` and false as `#f`.
(Note that this is different from the single characters 't' and 'f' which are written as `#\t` and `#\f`, respectively.)
The `<` operator behaves like you expect---it is checking whether the given salary is less than `75000`.
Therefore, the resulting list contains a `#t` entry if the salary is less than `75000` and `#f` otherwise!
We'll have more to say about using booleans to control the flow of our programs soon.

## Transforming collections of data with `map`.

This last example alludes to the idea that `map` isn't constrained to keep the type of the elements of the resulting list the same as the old list.
Indeed, the power of the `map` is we can transform the list in arbitrary ways as long as those transformations are independent between list elements.
As long as we can recognize the "collection" being transformed in our problem, we can write solutions in surprisingly elegant ways.

As an example, consider the problem of drawing the following image:

![Five green circles side-by-side of increasing and then decreasing size.]({{ "/images/list-map-circles.png" | relative_url }})

Using decomposition, we might recognize this image as a bunch of green circles of different sizes.
We could write a function that captures a single green circle parameterized by size:

```racket
(define green-circle
  (lambda (radius) 
    (circle radius 'solid "green")))
```

And we can use `green-circle` to better capture the structure of the image in code:

```racket
> (beside (green-circle 20)
          (green-circle 40)
          (green-circle 60)
          (green-circle 40)
          (green-circle 20))
![Five green circles side-by-side of increasing and then decreasing size.]({{ "/images/list-map-circles.png" | relative_url }})
```

But look at that redundancy!
Calling `green-circle` many times is undesirable: it takes time and effort to read and write the code.
Furthermore, the "repetitive" nature of the image isn't truly captured in the code.
This keeps us from generalizing the function further, *e.g.*, varying the numbers of `green-circles` in the figure.

However, if we instead decompose the problem as a *transformation over lists* instead, we'll arrive at a better solution.
But where is the list in this code?
While there isn't a list anywhere in the code for us to immediately `map` over, we do note that the image can be thought of as a collection of circles.

With this in mind, we can decompose the problem of generating a collection of circles into creating a single circle.
The way we do this is with `green-circle`, passing in its size.
The size is therefore the element we are transforming!
We're transforming a size into a circle by way of the `green-circle` function.
We can then transform a *collection of sizes* into a *collection of circles* by lifting `green-circle` using `map`:

```racket
> (define circles (map green-circle (list 20 40 60 40 20)))
> circles
![A list of five green circles side-by-side of increasing and then decreasing size.]({{ "/images/list-map-circles-list.png" | relative_url }})
```

(*Note*: We can't easily reproduce the layout of the images inlined with the text in HTML, so the output from the last `map` call is a screenshot of the output on one of the instructor's computers.)

## Working with lists of values

We aren't done yet!
This isn't a single image composed of a bunch of green circles.
This is a *list* of green circles of different sizes (note the `(list ... )` surrounding the circles).

As with the original version of the code, we need to use `beside` to combine the circles.
However, if we simply pass this expression to `beside`, we get an error:

```racket
> (beside circles)
 .../lang/prim.rkt:24:44: beside: arity mismatch;
 the expected number of arguments does not match the given number
   expected: at least 2
    given: 1
    arguments...:
```

Why does this error occur?
Let's think carefully about the types of the values involved:

+ `beside` is a function that takes a collection of images, one per argument, *e.g.*, `(beside image1 image2 image3 image4 image5)`.  Each argument is a single image.
+ `circles` is defined to be `(map green-circle (list 20 40 60 40 20))` which is a *list* of images.

Finally, consider the complete expression `(besides circles)`.
Each argument to `besides` should be a *single* image but `circles` is a *list of images* instead.
That's where our error arises!

Ultimately, we have to someone pass in each image in the list `circles` to each argument position of `besides`.
How do we do this?
It turns out we have to employ an additional standard library function of Racket to do this, `apply`.

```
> (apply beside circles)
![Five green circles side-by-side of increasing and then decreasing size.]({{ "/images/list-map-circles.png" | relative_url }})
```

More generally, `apply` is a helpful standard library function when working with lists of arguments.
`apply` takes two arguments:

+   A function to run or *apply* on a collection of arguments.
+   The collection of arguments to apply to the function, stored in a list.

As a simpler example of `apply`, consider the simple `(+)` function which can take any number of arguments:

```racket
> (+ 1 2 3 4 5)
15
```

While `(+)` takes any number of arguments, it cannot take a *single list* as an argument:

```racket
> (+ (list 1 2 3 4 5))
+: contract violation
  expected: number?
  given: '(1 2 3 4 5)
```

To pass this list of numbers to `(+)`, we can use the `apply` function:

```racket
> (apply + (list 1 2 3 4 5))
15
```

## Pause for reflection

So let's summarize the image code we've written:

```racket
(define green-circle
  (lambda (radius) 
    (circle radius 'solid "green")))

(define circles
  (map green-circle (list 20 40 60 40 20)))

(define circles-besides
  (apply beside circles))

> circles-besides
![Five green circles side-by-side of increasing and then decreasing size.]({{ "/images/list-map-circles.png" | relative_url }})
```

We've decomposed the problem of drawing the circles not as a series of repeated calls to `green-circles` but as a *collection* that is the result of *transforming* the sizes of the circles into green circles.  While this interpretation may have come less naturally to you, I would argue that once you understand transformations with `map` that this is a more readable and concise solution to the problem.

As a final note, I'll mention that it is more flexible, too.  For example, there's nothing special about the fact that we wanted the circles besides each other.  The following modified code leverages our abstractions to get a different effect with minimal results:

```racket
> (apply above circles)
![Five stacked green circles of increasing and then decreasing size.]({{ "/images/list-map-circles-above.png" | relative_url }})
```

This is the power of decomposition in action!  In particular, if we use appropriate *abstractions*, we can create highly reusable code that both captures our intent but can be used in other contexts with minimal modification.

## Thinking with types

As you've likely discovered already, it is important that we use the correct types when
we run our procedures.  With both `map` and `apply`, we have to think a bit more deeply
about types.

What are the types of the inputs to `map`?

That's a real question.  Take a minute and think about it.

We mean it.

Hopefully, you said something like 

> `map` takes two inputs.  The first is a procedure.  The second is a list of values.

But there's more to it than that.  There's a relationship between the procedure and
the list of values.  In particular, *the procedure much be applicable to each value
in the list*.  Let's consider two simple examples.

You may remember that `sqr` computes the square of a number and `string-upcase` converts
a string to upper case.  

```racket
> (sqr 5)
25
> (string-upcase "quiet")
"QUIET"
```

If we're using `map`, we should use `sqr` with lists of numbers and `string-upcase` with
lists of numbers.

```racket
> (range 2 6)
'(2 3 4 5)
> (map sqr (range 2 6))
'(4 9 16 25)
> (string-split "please be quiet not loud" " ")
'("please" "be" "quiet" "not" "loud")
> (map string-upcase (string-split "please be quiet not loud" " "))
'("PLEASE" "BE" "QUIET" "NOT" "LOUD")
```

But what happens if we don't match types?  Let's see.

```racket
> (map sqr (string-split "please be quite not loud" " "))
. . sqr: contract violation
  expected: number?
  given: "please"
> (map string-upcase (range 2 6))
. . string-upcase: contract violation
  expected: string?
  given: 2
```

You'll note that we get errors.  Are they the errors you expected?  It might be
nicer if DrRacket more explicitly told us that the elements of the list were not 
the correct types for the procedure.  But it's done that in its own way.

What if we do something even stranger, such as writing something other than a
procedure in the procedure position, or something other than a list in the
list position?  Let's try.

```racket
> (map 5 (list 1 2 3))
. . map: contract violation
  expected: procedure?
  given: 5
> (map sqr 5)
. . map: contract violation
  expected: list?
  given: 5
```

It's good to see that these error messages are clear.  Let's do our best to remember
those so that when we see them, we know what's gone wrong.

Next, let's move on to `apply`.  Like `map`, `apply` takes a procedure and a list
as parameters.  While `map` applies the procedure element by element, `apply`
applies the procedure to the elements _en masse_, as it were.

```racket
> (apply * (list 2 3 4))
24
> (apply string-append (list "this" "and" "that"))
"thisandthat"
```

Once again, we should see what happens if we give incorrect types.

```racket
> (apply * (list 2 3 4))
24
> (apply string-append (list "this" "and" "that"))
"thisandthat"

> (apply * (list "this" "and" "that"))
. . *: contract violation
  expected: number?
  given: "this"
  argument position: 1st
  other arguments...:

> (apply * (list 2 3 "four"))
. . *: contract violation
  expected: number?
  given: "four"
  argument position: 3rd
  other arguments...:

> (apply string-append (list 2 3 4))
. . string-append: contract violation
  expected: string?
  given: 2
  argument position: 1st
  other arguments...:

> (apply 2 (list 2 3 4))
. . application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
  arguments...:

> (apply 2 3)
. . apply: contract violation
  expected: procedure?
  given: 2
  argument position: 1st
  other arguments...:

> (apply + 2 3 4)
. . apply: contract violation
  expected: list?
  given: 4
  argument position: 4th
  other arguments...:
```

We will need to practice reading error messages like those.  But each is saying, in
essence, "you got the types wrong".

## Extending `map`

We've explored `map` with one-parameter procedures and a single list.  But `map` can
also use multi-parameter procedures and multiple lists.  In that case, it takes
corresponding elements of each list.  Let's explore a quick example, which we may
return to in the lab.

```racket
> (define sized-circle
    (lambda (radius)
      (circle radius 255 "blue")))
> (range 10 30 5)
'(10 15 20 25)
> (map sized-circle (range 10 30 5))
; Output left to reader's imagination or experimentation

> (define shaded-circle
    (lambda (shade)
      (circle 20 shade "blue")))
> (range 50 251 50)
'(50 100 150 200 250)
> (map shaded-circle (range 50 251 50))
; Output to left reader's imagination or experimentation

> (define blue-circle
    (lambda (radius shade)
      (circle radius shade "blue")))
> (map blue-circle (range 10 31 5) (range 50 251 50))
; Output to left reader's imagination or experimentation
```

And, as we've just seen, it's probably worth looking at some different kinds of errors.

```racket
> (map blue-circle (list 10 20) (list 50 100 150))
. . map: all lists must have same size
  first list length: 2
  other list length: 3
  procedure: #<procedure:blue-circle>

> (map blue-circle (list 10 20))
. . map: argument mismatch;
 the given procedure's expected number of arguments does not match the given number of lists
  given procedure: blue-circle
  expected: 2
  given: 1
  argument lists...: 
   '(10 20)

> (map blue-circle (list 10 20 30) (list 50 30 "pink"))
. . .../lang/prim.rkt:24:44: circle: expects a mode as second argument, given "pink"
```

Yeah, that last one isn't all that helpful.

## Mental models: Tracing `map` and `apply`

As we've seen, it's useful to be able to trace our Racket code by hand to consider
what the Racket evaluator is doing (or at least what we think it's doing) and, therefore,
why we get the results or errors that we do.  And you already know many aspects of
the mental model for doing so, particularly the rule that you evaluate arguments
before applying a procedure and that you use substitution for user-defined procedures.

For `map`, we use the rule "Replace `(map PROC (list VAL0 VAL1 ...))` with 
`(list (PROC VAL0) (PROC VAL1) ...)`."  (There's a similar rule for the multi-parameter
`map`.

For `apply`, we use the rule "Replace `(apply PROC (list VAL0 VAL1 ...))` with
`(PROC VAL0 VAL1 ...)`.

So let's try an example.

```racket
(define dub
  (lambda (x)
    (* 2 x)))

;     (apply + (map dub (range 3 8 2)))
; --> (apply + (map dub (list 3 5 7)))
; --> (apply + (list (dub 3) (dub 5) (dub 7)))
; --> (apply + (list 6 (dub 5) (dub 7)))
; --> (apply + (list 6 10 (dub 7)))
; --> (apply + (list 6 10 14))
; --> (+ 6 10 14)
; --> 30

```

Note that when we're working with lists, it's helpful to explicitly write `(list ...)`, which
reminds us that we're dealing with a list and not an expression to further evaluate.

Here's an example with the multi-list `map`.

```
;     (apply * (map - (list 5 10 15) (list 2 3 4)))
; --> (apply * (list (- 5 2) (- 10 3) (- 15 4)))
; --> (apply * (list 3 (- 10 3) (- 15 4)))
; --> (apply * (list 3 7 (- 15 4)))
; --> (apply * (list 3 7 11))
; --> (* 3 7 11)
; --> (* 3 7 11)
; --> 231
```

While we'll rarely write out all of these steps, it helps to keep them in mind as
we think about what `map` and `apply` are doing.  And we will, on occasion, pull
out a piece of paper (or an electronic document) to think through part of the
steps of an evaluation.

## Self-checks

### Self-check 1 (Differences) (‡)

Write a function `decrement` that takes an integer as input and returns an integer *one less* than the input.

Now use `decrement` and `map` to write an expression that `decrements` the contents of the following list *three times*:

```racket
(define example-list (list 10 20 30 40 50))
```
