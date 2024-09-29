---
title: Transforming lists
summary: |
  We investigate a particular form of decomposition relevant in computing in which transformations over a collection of values are really transformations of the individual elements of the collection.

preimg: true
---

Imagine representing the collection of yearly salaries found at a startup using a simple list, for example:

<pre class="scamper source">
(define salaries (list 100000 100000 50000 75000 500000))
</pre>

And now imagine computing everyone's updated salary after a standard [cost-of-living adjustment](https://www.investopedia.com/terms/c/cola.asp) (COLA).
We might decompose this problem into the problem of computing *one* person's updated salary.
Let's take the first person whom makes `100000` (units deliberately unspecified) as an example.
The Social Security COLA for 2020 was [%1.6](https://www.ssa.gov/OACT/COLA/colasummary.html), so we can calculate the updated salary using arithmetic:

<pre class="scamper source">
(+ 100000 (* 100000 0.016))
</pre>

And we can abstract this into a function that computes the updated salary when given a salary:

<pre class="scamper source">
;;; (compute-cola-salary salary) -> number?
;;;   salary : number?, non-negative
;;; Returns the given salary, updated for cost-of-living.
(define compute-cola-salary
  (lambda (salary) 
    (+ salary (* salary 0.016))))
</pre>

Good!
We can now calculate the updated salary for any person.
However, how do we do this for a *collection* of salaries, a collection represented as a list?

Note that the calculation of each salary is *independent* of the other salaries.
That is, someone's adjusted salary only depends on their salary and not other salaries.
In this situation, we simply want to apply our solution for a single person, `compute-cola-salary`, to every element of the list.
We say that we want to *lift* the function `compute-cola-salary` from operating on a single salary to a list of salaries.

In Scheme, we realize the behavior of *lifting a function to a list of values* with the `map` function:

<pre class="scamper source">
(define salaries (list 100000 100000 50000 75000 500000))

(define compute-cola-salary
  (lambda (salary)
    (+ salary (* salary 0.016))))

(map compute-cola-salary salaries)

salaries
</pre>

Note that the `map` procedure does not affect the original list.

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

<pre class="scamper source">
(define salaries (list 100000 100000 50000 75000 500000))

(define double-salary
  (lambda (salary)
    (* salary 2)))

(map double-salary salaries)
</pre>

The startup might have hit a downturn and needs to reduce their salaries:

<pre class="scamper source">
(define salaries (list 100000 100000 50000 75000 500000))

(define downsize
  (lambda (salary)
    (/ salary 2)))

(map downsize salaries)
</pre>

Or worse yet, the downturn might be so bad that the startup needs to do the right thing and let go of its higher-earning employees to stay under budget:

<pre class="scamper source">
(define salaries (list 100000 100000 50000 75000 500000))

(define should-keep
  (lambda (salary)
    (< salary 75000)))

(map should-keep salaries)
</pre>

Observe that we have transformed our list of salaries into a list of booleans indicating whether we should keep the employee with that salary.

## Transforming collections of data with `map`.

This last example alludes to the idea that `map` isn't constrained to keep the type of the elements of the resulting list the same as the old list.
Indeed, the power of the `map` is we can transform the list in arbitrary ways as long as those transformations are independent between list elements.
As long as we can recognize the "collection" being transformed in our problem, we can write solutions in surprisingly elegant ways.

As an example, consider the following code that draws a collection of green circles beside each other:

<pre class="scamper source">
(import image)

(define green-circle
  (lambda (radius)
    (circle radius "solid" "green")))

(beside (green-circle 20)
        (green-circle 40)
        (green-circle 60)
        (green-circle 40)
        (green-circle 20))
</pre>

Using decomposition, we have organized this image as a bunch of green circles of different sizes.
But look at that redundancy!
Calling `green-circle` many times is undesirable: it takes time and effort to read and write the code.
Furthermore, the "repetitive" nature of the image isn't truly captured in the code.
This keeps us from generalizing the function further, *e.g.*, varying the numbers of `green-circles` in the figure.

However, if we instead decompose the problem as a *transformation over lists*, we'll arrive at a better solution.
But where is the list in this code?
While there isn't a list anywhere in the code for us to immediately `map` over, we do note that the image can be thought of as a _collection of circles_.

With this in mind, we can decompose the problem of generating a collection of circles into creating a single circle.
The way we do this is with the `green-circle` function, passing in the desired size for one of the circles.
The _size_ is therefore the element we are transforming!
We're transforming a size into a circle by way of the `green-circle` function.
We can then transform a _collection of sizes_ into a _collection of circles_ by lifting `green-circle` using `map`:

<pre class="scamper source">
(import image)

(define green-circle
  (lambda (radius)
    (circle radius "solid" "green")))

(define circles (map green-circle (list 20 40 60 40 20)))

circles
</pre>

## Working with lists of values

We aren't done yet!
This isn't a single image composed of a bunch of green circles.
This is a *list* of green circles of different sizes (note the `(list ... )` surrounding the circles).

As with the original version of the code, we need to use `beside` to combine the circles.
However, if we simply pass this expression to `beside`, we get an error:

<pre class="scamper source">
(import image)

(define green-circle
  (lambda (radius)
    (circle radius "solid" "green")))

(define circles (map green-circle (list 20 40 60 40 20)))

(beside circles)
</pre>

Why does this error occur?
Let's think carefully about the types of the values involved:

+ `beside` is a function that takes a collection of images, one per argument, *e.g.*, `(beside image1 image2 image3 image4 image5)`.  Each argument is a single image.
+ `circles` is defined to be `(map green-circle (list 20 40 60 40 20))` which is a *list* of images.

Finally, consider the complete expression `(besides circles)`.
Each argument to `besides` should be a *single* image but `circles` is a *list of images* instead.
That's where our error arises!

Ultimately, we have to, somehow, pass in each image in the list `circles` to each argument position of `besides`.
How do we do this?
It turns out we have to employ an additional standard library function of Scheme to do this, `apply`.

<pre class="scamper source">
(import image)

(define green-circle
  (lambda (radius)
    (circle radius "solid" "green")))

(define circles (map green-circle (list 20 40 60 40 20)))

(apply beside circles)
</pre>

More generally, `apply` is a helpful standard library function when working with lists of arguments.
`apply` takes two arguments:

+   A function to run or *apply* on a collection of arguments.
+   The collection of arguments to apply to the function, stored in a list.

As a simpler example of `apply`, consider the simple `(+)` function which can take any number of arguments:

<pre class="scamper source">
(+ 1 2 3 4 5)
</pre>

While `(+)` takes any number of arguments, it cannot take a *single list* as an argument:

<pre class="scamper source">
(+ (list 1 2 3 4 5))
</pre>

To pass this list of numbers to `(+)`, we can use the `apply` function:

<pre class="scamper source">
(apply + (list 1 2 3 4 5))
</pre>

## Pause for reflection

So let's summarize the image code we've written:

<pre class="scamper source">
(import image)

(define green-circle
  (lambda (radius) 
    (circle radius "solid" "green")))

(define circles
  (map green-circle (list 20 40 60 40 20)))

(define circles-besides
  (apply beside circles))

circles-besides
</pre>

We've decomposed the problem of drawing the circles not as a series of repeated calls to `green-circles` but as a *collection* that is the result of *transforming* the sizes of the circles into green circles.
While this interpretation may have come less naturally to you, I would argue that once you understand transformations with `map` that this is a more readable and concise solution to the problem.

As a final note, I'll mention that it is more flexible, too.
For example, there's nothing special about the fact that we wanted the circles besides each other.
The following modified code leverages our abstractions to get a different effect with minimal effort:

<pre class="scamper source">
(import image)

(define green-circle
  (lambda (radius) 
    (circle radius "solid" "green")))

(define circles
  (map green-circle (list 20 40 60 40 20)))

(apply above circles)
</pre>

This is the power of decomposition in action!
In particular, if we use appropriate *abstractions*, we can create highly reusable code that both captures our intent but can be used in other contexts with minimal modification.

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

You may remember that `square` computes the square of a number and `string-upcase` converts
a string to upper case.  

<pre class="scamper source">
(square 5)
(string-upcase "quiet")
</pre>

If we're using `map`, we should use `square` with lists of numbers and `string-upcase` with
lists of numbers.

<pre class="scamper source">
(range 6)
(map square (range 6))
(string-split "please be quiet not loud" " ")
(map string-upcase (string-split "please be quiet not loud" " "))
</pre>

But what happens if we don't match types?  Let's see.

<pre class="scamper source">
(map square (string-split "please be quite not loud" " "))
(map string-upcase (range 6))
</pre>

You'll note that we get errors.  Are they the errors you expected?  It might be
nicer if Scamper more explicitly told us that the elements of the list were not 
the correct types for the procedure.  But it's done that in its own way.

What if we do something even stranger, such as writing something other than a
procedure in the procedure position, or something other than a list in the
list position?  Let's try.

<pre class="scamper source">
(map 5 (list 1 2 3))
(map square 5)
</pre>

It's good to see that these error messages are clear.  Let's do our best to remember
those so that when we see them, we know what's gone wrong.

Next, let's move on to `apply`.  Like `map`, `apply` takes a procedure and a list
as parameters.  While `map` applies the procedure element by element, `apply`
applies the procedure to the elements _en masse_, as it were.

<pre class="scamper source">
(apply * (list 2 3 4))
(apply string-append (list "this" "and" "that"))
</pre>

Once again, we should see what happens if we give incorrect types.

<pre class="scamper source">
(apply * (list 2 3 4))
(apply string-append (list "this" "and" "that"))
(apply * (list "this" "and" "that"))
(apply * (list 2 3 "four"))
(apply string-append (list 2 3 4))
(apply 2 (list 2 3 4))
(apply 2 3)
(apply + 2 3 4)
</pre>

We will need to practice reading error messages like those.  But each is saying, in
essence, "you got the types wrong".

## Mental models: Tracing `map` and `apply`

As we've seen, it's useful to be able to trace our Scheme code by hand to consider
what Scheme is doing (or at least what we think it's doing) and, therefore,
why we get the results or errors that we do.  And you already know many aspects of
the mental model for doing so, particularly the rule that you evaluate arguments
before applying a procedure and that you use substitution for user-defined procedures.

+   Evaluating `(map f (list v1 v2 ... vk))` is equivalent to evaluating `(list (f v1) (f v2) ... (f vk))`.
+   Evaluating `(apply f (list v1 v2 ... vk))` is equivalent to evaluating `(f v1 v2 ... vk)`

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