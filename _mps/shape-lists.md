---
title: Mini-Project 4
subtitle: Exploring lists of shapes (and lists of lists of shapes)
summary: |
  As the subtitle suggests, in this assignment we will consider
  techniques for building complex images based on lists of shapes.
  Along the way, we will explore uses of "the big three" list
  procedures.
collaboration: |
  Each student should submit their own responses to this project. You may
  consult other students in the class as you develop your solution.  If you
  receive help from anyone, make sure to cite them in your responses. 
link: false
preimg: true
---
Please save all of your work as `shape-lists.rkt`.

## Introduction

By this point, you've considered a variety of procedures for making and manipulating some basic shapes, such as circles and squares (or, more generally, ellipses and rectangles). As you may have discovered, we can use the characteristics of one shape to make another shape.

Suppose we start with a few rectangles. We've tried to name them in such a way that describes their general characteristics.

```
(define red-narrow
  (solid-rectangle 10 20 "red"))

(define red-medium
  (solid-rectangle 20 20 "red"))

(define red-wide
  (solid-rectangle 30 20 "red"))

(define blue-narrow
  (image-recolor red-narrow "blue"))

(define blue-medium
  (image-recolor red-medium "blue"))

(define blue-wide
  (image-recolor red-wide "blue"))

(define purple-narrow
  (image-recolor red-narrow "purple"))

(define purple-medium
  (image-recolor red-medium "purple"))

(define purple-wide
  (image-recolor red-wide "purple"))
```

Now, let's write a procedure that converts almost any shape to an ellipse.

```
(define shape->ellipse
  (lambda (shape)
    (solid-ellipse (image-width shape) 
                   (image-height shape) 
                   (image-color shape))))
```

Using `map`, we can quickly make lists of shapes and convert them.

```
> narrow-shapes
'(![a solid red 10-by-20 rectangle](../images/mps/shape-lists/solid-red-10x20-rectangle.png) ![a solid blue 10-by-20 rectangle](../images/mps/shape-lists/solid-blue-10x20-rectangle.png) ![a solid purple 10-by-20 rectangle](../images/mps/shape-lists/solid-purple-10x20-rectangle.png))
> (map shape->ellipse narrow-shapes)
'(![a solid red 10-by-20 ellipse](../images/mps/shape-lists/solid-red-ellipse-10x20.png) ![a solid blue 10-by-20 ellipse](../images/mps/shape-lists/solid-blue-ellipse-10x20.png) ![a solid purple 10-by-20 ellipse](../images/mps/shape-lists/solid-purple-ellipse-10x20.png))
> (apply beside (map shape->ellipse narrow-shapes))
![a center-aligned sequence of images (a solid red 10-by-20 ellipse beside a solid blue 10-by-20 ellipse beside a solid purple 10-by-20 ellipse)](../images/mps/shape-lists/image001.png)
```

We can even make somewhat slightly more complex shapes using that information.

```
(define thickly-outlined-ellipse
  (lambda (width height color)
    (overlay (outlined-ellipse width height "black" 10)
             (solid-ellipse width height color))))

(define shape->thickly-outlined-ellipse
  (lambda (shape)
    (thickly-outlined-ellipse (image-width shape)
                              (image-height shape)
                              (image-color shape))))
```

```
> (apply beside (map shape->thickly-outlined-ellipse narrow-shapes))
![three thickly-outlined narrow ellipses in a row](../images/mps/shape-lists/image002.png)
```

To make this a bit easier, we're going to write another helper procedure, `shape-params`, which grabs the width, height, and color from an image and puts them in a list.

```
;;; (shape-params shape) -> list?
;;;   shape : basic-image?
;;; Create a list of the width, height, and color of the image.
(define shape-params
  (lambda (img)
    (list (image-width img) (image-height img) (image-color img))))
```

What does that let us do? Well, here's one example.

```
(define something (o (cut (apply solid-isosceles-triangle <>)) shape-params))
```

Can you tell what that does, as strange as it is?

Try it out.

```
> (map something (list purple-narrow purple-medium purple-wide))
intentionally left for you to try
```

Of course, rather than creating lists like these on our own, we can write procedures that do so.  Here's one that takes a shape and creates five variants of varying widths and "shades". 

```
;;; (five-variants shape) -> (list-of basic-image?)
;;;   shape : basic-image?
;;; Create a list of five shapes based on the original shape.
;;;
;;; * The first shape is 1/3 the width and much darker.
;;; * The second shape is 1/3 the width and slightly darker.
;;; * The third shape is the same.
;;; * The fourth shape is 4/3 the width and slightly lighter.
;;; * The fifth shape is 5/3 the width and much lighter.
(define five-variants
  (lambda (shape)
    (apply five-variants/helper (shape-params shape))))

;;; (five-variants/helper width height color) -> (list-of shape?)
;;;   width : nonnegative-integer?
;;;   height : nonnegative-integer?
;;;   color : rgb?
;;; Create a list of five shapes based on `width`, `height`, and
;;; `color`. See `five-variants` for the details.
(define five-variants/helper
  (lambda (width height color)
    (list (solid-rectangle (* 1/3 width) height (rgb-darker (rgb-darker color)))
          (solid-rectangle (* 2/3 width) height (rgb-darker color))
          (solid-rectangle width height color)
          (solid-rectangle (* 4/3 width) height (rgb-lighter color))
          (solid-rectangle (* 5/3 width) height (rgb-lighter (rgb-lighter color))))))
```

We can quickly make lists of variants.

```
> (five-variants (solid-rectangle 10 20 "orange"))
'(![a solid darkorange 10/3-by-20 rectangle](../images/mps/shape-lists/solid-darkorange-3x20-rectangle.png) ![a solid darkorange 20/3-by-20 rectangle](../images/mps/shape-lists/solid-darkorange-7x20-rectangle.png) ![a solid orange 10-by-20 rectangle](../images/mps/shape-lists/solid-orange-10x20-rectangle.png) ![a solid orange 40/3-by-20 rectangle](../images/mps/shape-lists/solid-orange-13x20-rectangle.png) ![a solid gold 50/3-by-20 rectangle](../images/mps/shape-lists/solid-gold-17x20-rectangle.png))
```

And, with the procedures we've been writing, we can make them different shapes.

```
> (map shape->ellipse (five-variants (solid-rectangle 10 20 "orange")))
'(![a solid darkorange 3-by-20 ellipse](../images/mps/shape-lists/solid-darkorange-ellipse-3x20.png) ![a solid darkorange 7-by-20 ellipse](../images/mps/shape-lists/solid-darkorange-ellipse-7x20.png) ![a solid orange 10-by-20 ellipse](../images/mps/shape-lists/solid-orange-ellipse-10x20.png) ![a solid orange 13-by-20 ellipse](../images/mps/shape-lists/solid-orange-ellipse-13x20.png) ![a solid gold 17-by-20 ellipse](../images/mps/shape-lists/solid-gold-ellipse-17x20.png))
> (apply overlay (map shape->ellipse (five-variants (solid-rectangle 10 20 "orange"))))
![something that looks a bit like a sideways hamburger](../images/mps/shape-lists/image003.png)
```

As we've already learned, there's power in repeating actions.  So we could turn those five shapes descriptions into twenty-five with a call to map.

```
> (define twenty-five-things (map five-variants (five-variants (solid-rectangle 20 20 (rgb 128 64 192)))))
> twenty-five-things
'((![a solid indigo 7/3-by-20 rectangle](../images/mps/shape-lists/solid-indigo-2x20-rectangle.png) ![a solid indigo 14/3-by-20 rectangle](../images/mps/shape-lists/solid-indigo-5x20-rectangle.png) ![a solid dark slate blue 7-by-20 rectangle](../images/mps/shape-lists/solid-dark slate blue-7x20-rectangle.png) ![a solid dark orchid 28/3-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-9x20-rectangle.png) ![a solid dark orchid 35/3-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-12x20-rectangle.png))
  (![a solid indigo 13/3-by-20 rectangle](../images/mps/shape-lists/solid-indigo-4x20-rectangle.png) ![a solid dark slate blue 26/3-by-20 rectangle](../images/mps/shape-lists/solid-dark slate blue-9x20-rectangle.png) ![a solid dark orchid 13-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-13x20-rectangle.png) ![a solid dark orchid 52/3-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-17x20-rectangle.png) ![a solid dark orchid 65/3-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-22x20-rectangle.png))
  (![a solid dark slate blue 20/3-by-20 rectangle](../images/mps/shape-lists/solid-dark slate blue-7x20-rectangle.png) ![a solid dark orchid 40/3-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-13x20-rectangle.png) ![a solid dark orchid 20-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-20x20-rectangle.png) ![a solid dark orchid 80/3-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-27x20-rectangle.png) ![a solid mediumpurple 100/3-by-20 rectangle](../images/mps/shape-lists/solid-mediumpurple-33x20-rectangle.png))
  (![a solid dark orchid 9-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-9x20-rectangle.png) ![a solid dark orchid 18-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-18x20-rectangle.png) ![a solid dark orchid 27-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-27x20-rectangle.png) ![a solid mediumpurple 36-by-20 rectangle](../images/mps/shape-lists/solid-mediumpurple-36x20-rectangle.png) ![a solid mediumpurple 45-by-20 rectangle](../images/mps/shape-lists/solid-mediumpurple-45x20-rectangle.png))
  (![a solid dark orchid 11-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-11x20-rectangle.png) ![a solid dark orchid 22-by-20 rectangle](../images/mps/shape-lists/solid-dark orchid-22x20-rectangle.png) ![a solid mediumpurple 33-by-20 rectangle](../images/mps/shape-lists/solid-mediumpurple-33x20-rectangle.png) ![a solid mediumpurple 44-by-20 rectangle](../images/mps/shape-lists/solid-mediumpurple-44x20-rectangle.png) ![a solid violet 55-by-20 rectangle](../images/mps/shape-lists/solid-violet-55x20-rectangle.png)))
```

Unfortunately, we can't convert those to images quite as easily.

```
> (map shape->ellipse twenty-five-things)
. . some error message
```

Our goal in this assignment is to write procedures that will help us deal with these nested (perhaps deeply nested) lists of shapes.

## Part 1: Making lists of shape parameters

Our `five-variants` procedure is nice, but it's a bit cumbersome to apply.  For example, what if we already have a nested list of `shape-params?` and we want to make five variants of each shape?  We can't just call `five-variants`; you may recall that in our example above, we had to use `map` once we had a list.  But if we have nested lists, `map` won't even work.

We'll do this with a sequence of steps.

First, let's start with a procedure that makes a different set of variants.

a. Document, create at least three tests for, and write a procedure, `(color-variants-0 shape)`, that takes a shape and makes a list of four shapes. (It's fine if you use rectangles for the shapes; they make a good starting point.)

* The first should be the original shape.
* The second should be a redder version of the original shape.
* The third should be a greener version of the original shape.
* The fourth should be a bluer version of the original shape.

You can use `rgb-redder`, `rgb-greener`, and `rgb-bluer` to make those variants.

```
(test-equal? "color-variants-0: Middle grey"
             (color-variants-0 (solid-rectangle 30 30 (rgb 128 128 128)))
             (list (solid-rectangle 30 30 (rgb 128 128 128))
                   (solid-rectangle 30 30 (color-redder (rgb 128 128 128)))
                   (solid-rectangle 30 30 (color-greener (rgb 128 128 128)))
                   (solid-rectangle 30 30 (color-bluer (rgb 128 128 128)))))
```

b. Write a procedure, `(color-variants-1 stuff)`, that takes a list of shapes as a parameter and applies `color-variants-0` to each of them.

```
;;; (color-variants-1 stuff) -> (list-of (list-of basic-image?))
;;;   stuff : (list-of basic-image?)
;;; Apply `color-variants-0` to each element of stuff.
```

_Hint_: Use `map`.

c. Write a procedure `(color-variants-1a stuff)`, that takes either a shape or a list of shapes as a parameter. If it receives a shape, it should return the result of applying `color-variants-0` to the shape. If it receives a list of shapes, it should apply `color-varants-1` to that list.

d. Write a procedure, `(color-variants-2 lst)`, that takes a slightly nested list of shapes as a parameter and applies `color-variants-1a` to each element.

By "slightly nested list of `shape-params?` values", we mean a list that contains only

* `shape-params?` values or
* lists of `shape-params?` values.

Since we have only two options, you may assume that anything that isn't a `shape-params?` value must be a list of `shape-params?` values.

_Note_: Here and elsewhere, you may assume that procedures are given correct inputs.  For example, you won't get an integer or a list that contains other values as input to `color-variants-1`.

SAM GO THIS FAR IN THE DRAFT

d. Write a procedure, `(color-variants-2 stuff)`, that takes a potentially doubly-nested list of `shape-params?` values as a parameter and applies `color-variants` to any `shape-params?` values that appear within the list.

By "potentially doubly-nested list of `shape-params?` values, we mean one in which each element is either

* A `shape-params?` value or
* A slightly-nested list of `shape-params?` values.

Since we only have two options, you may assume that anything that isn't a `shape-params?` value must be a slightly-nested list of `shape-params?` values, which means that you can apply `color-variants-1` to that list.

_Hint_: Write a helper procedure that checks whether its parameter is a `shape-params?" or not.  If it is, apply `color-variant`.  If not, apply `color-variants-1`. 

e. Have you noticed a pattern here?  Let's write a general version of these procedures.  Write a procedure `(color-variants-all stuff)`, that takes an _arbitrarily nested_ list of `shape-params?` values as a parameter and applies `color-variants` to each `shape-params?` value, no matter how deeply nested it is.

Note that each element of an "_arbitrarily nested_ list of `shape-params?` values is either:

* a `shape-params?` value or
* a simpler arbitrarily nested list of `shape-params?` values.

Since we only have two options, you may assume that anything that isn't a `shape-params?` value must be a simpler nested list of `shape-params?` values.

Sorry, you don't get a hint for this one.

_This procedure is not necessary for an **M**, only for an **E**._

## Part 3: From lists to shapes

_Estimated time: 30 minutes._

a. Document and write a procedure, `(solid-ellipses-0 list-of-params)`, that takes a list of shape parameters as input and returns a list of solid ellipses determined by the corresponding parameters.

Here and elsewhere, you may assume that the procedure is only given correct inputs.

```
> (define red-params (list red-narrow red-medium red-wide))
> (solid-ellipses-0 red-params)
(list . . .) 
; Image forthcoming: A list of a narrow red ellipse, a red circle,
; and a wide red ellipse.
```

Hint: Use `map`.

b. Document and write a procedure, `(solid-ellipses-1 stuff)`, that takes as a parameter a list that consists of both shape parameters _and_ lists of shape parameters and turns each individual shape parameter (whether nested or not) into an ellipse.

Here and elsewhere, you may assume that the procedure is only given correct inputs.

```
> (define red-params (list red-narrow red-medium red-wide))
> (define blue-params (list blue-narrow blue-medium blue-wide))
> (solid-ellipses-1 (list red-params
                          purple-medium
                          blue-params))
(list (list . . .) . (list . . .)) ; Image forthcoming.
```

Hint: Write a helper procedure that checks whether its parameter is a set of shape paramerters.  If so, use `solid-ellipse`.  If not, it must be a list, so use `solid-ellipses-0`.

c. Document and write a procedure, `(solid-ellipses-2 stuff)`, that takes as a parameter a list that consists of

* Individual shape parameters
* Lists of either (i) individual shape parameters or (ii) lists of shape parameters.

```
> (define red-params (list red-narrow red-medium red-wide))
> (solid-ellipses-2 (list (list red-params (reverse red-params) red-params)
                          red-params
                          red-medium))
(list (list (list . . .) (list . . .) (list . . .)) (list . . .) .)
```

Hint: Write a helper procedure that checks whether its parameter is a set of `shape-params?` values.  If so, use `solid-ellipse`.  If not, it must be a list, so use `solid-ellipses-1`.

d. It feels like it's time to generalize, doesn't it?  Write a procedure, `(solid-ellipses stuff)`, that takes an _arbitrarily nested_ list of color-parameters and turns each into the corresponding ellipse.

```
> (solid-ellipses (list (list red-params (reverse red-params) red-params)
                        (list red-medium (list red-params red-medium))
                        red-medium))

(list (list (list . . .) (list . . .) (list . . .)) (list . (list (list . . .) .)) .)
```

_This procedure is only necessary for an E._

e. Now that we've written `solid-ellipses`, it feels like we should be able to write similar procedures for the other shapes. 

i. Write a procedure, `(solid-right-triangles stuff)`, that takes an _arbitrarily nested_ list of color-parameters and turns each into the corresponding right triangle.

ii. Write a procedure, `(boxed-solid-ellipses stuff)`, that takes an _arbitrarily nested_ list of color-parameters and turns each into the corresponding boxed solid ellipse.

iii. Write a procedure, `(outlined-solid-rectangles stuff)`, that takes an _arbitrarily nested_ list of color-parameters and turns each into the corresponding outlined solid rectangle.

_These procedures are only necessary for an E._

## Part 4: Combining images

_Estimated time: 30 minutes._

We can now build complex nested lists of images.  As you might expect, we'd like to be able to convert these nested lists to a single image.

a. Write a procedure, `(stack images)`, that takes a list of images as a parameter and returns a single image in which each image in the list is placed above the next.  In this case, your input list is not nested; it is the output from a procedure like `solid-ellipses-0`.

b. Write a procedure, `(sequence images)`, that takes a list of images as a parameter and returns a single image in which each image in the list is placed next to the subsequent images.  Once again, in this case, your input list is not nested.

c. Write a procedure, `(stack-then-sequence stuff)`, that takes a singly nested list of images as a parameter and returns an image in which each sublist is stacked and then the stacks are placed next to each other.  You can assume that your input to this is something like the output from `solid-ellipses-1`.  

Note that, as in the case of `solid-ellipses-1`, you will likely want to write a helper procedure.  In this case, it should check whether the parameter is an image or not.  If it's an image, you can leave it as is.  If it's a list, you probably want to stack it.  After applying that helper to each element of `stuff`, you can put them beside each other.

d. Write a procedure, `(sequence-then-stack stuff)`, that takes a singly nested list of images as a parameter and returns an image in which each sublist is stacked and then the stacks are placed next to each other.  You can assume that your input to this is something like the output from `solid-ellipses-1`.  

e. Write a procedure, `(sequence-then-stack-then-sequence stuff)`, that takes a doubly-nested list as input.  You should be able to guess what it should do.

f. Write a procedure, `(stack-then-sequence-then-stack stuff)`, that takeks a doubly-nested list as input.  You should be able to guess what it should do.

g. It's time to generalize.  Write procedures `(stacked-ss stuff)` and `(sequenced-ss stuff)`, that take arbitrarily nested lists of images as input and either (a) sequence then stack then ... then stack the images (for `stacked-ss`) or (b) stack then sequence then .. then sequence the images (for `sequenced-ss`).  _This procedure is only necessary for an E._

Note that, in contrast to the prior procedures, the names of the procedures indicate what we do at the "top level".

_Hint_: You should consider using `sequenced-ss` as a helper for `stacked-ss` and vice versa.  This technique is called "mutual recursion".

## Part 5: Freestyle

_Estimated time: 15--30 minutes._

Using these procedures and any others you write, create an interesting image which you should call `freestyle`.

```
(define freestyle (stacked-ss ...))
```

To earn an E, you will need to write your own variants of the procedures in parts 2, 3, and 4.

Grading rubric
--------------

### Redo or above

Submissions that lack any of these characteristics will get an I.

```
[ ] Passes all of the one-star autograder tests.
[ ] Includes the specified file, `similar-shapes.rkt`.
[ ] Includes an appropriate header on the file that indicates the
    course, author, etc.
[ ] Acknowledges appropriately.
[ ] Code runs in DrRacket.
[ ] Most procedures are documented in some form.
```

### Meets expectations or above

Submissions that lack any of these characteristics but have all of the
prior characteristics will get an R.

```
[ ] Passes all of the two-star autograder tests.  For example,
    [ ] Correctly mplements `shape-params?`.
    [ ] Correctly implements `solid-ellipses-0`.
    [ ] Correctly implements `solid-ellipses-1`.
    [ ] Correctly implements `solid-ellipses-2`.
    [ ] Correctly implements `stack`.
    [ ] Correctly implements `sequence`.
    [ ] Correctly implements `stack-then-sequence`.
    [ ] Correctly implements `sequence-then-stack`.
    [ ] Correctly implements `stack-then-sequence`.
    [ ] Correctly implements `sequence-then-stack-then-sequence`.
    [ ] Correctly implements `stack-then-sequence-then-stack`.
[ ] Code is well-formatted with appropriate names and indentation.
[ ] Code has been reformatted with Ctrl-I before submitting.
[ ] Code generally follows style guidelines.
[ ] Documentation for all core procedures is correct / has the correct form.
[ ] Creates an image called `freestyle`.
```

### Exemplary / Exceeds expectations

Submissions that lack any of these characteristics but have all of the
prior characteristics will get an M.

```
[ ] Passes all of the three-star autograder tests.  For example,
    [ ] Correclty implements `color-variants-all`.
    [ ] Correctly implements `solid-ellipses`.
    [ ] Correctly implements `solid-right-triangles`.
    [ ] Correctly implements `boxed-solid-ellpises`.
    [ ] Correctly implements `outlined-solid-rectangles`.
    [ ] Correctly implements `stacked-ss`.
    [ ] Correctly implements `sequenced-ss`.
[ ] Adds a new procedure akin to `color-variants`.  That is, adds a 
    procedure that takes a `shape-params?` as a parameter and creates
    a list of `shape-params?` (or list of lists of ....)`.
[ ] Adds a new procedure akin to `solid-ellipse`, `solid-right-triangle`, etc.
    That is, adds a procedure that takes a nested list of `color-params?`
    as a parameter and creates a list of similar shapes.
[ ] Adds a new procedure akin to `stacked-ss` or `sequenced-ss` (e.g.,
    overlaying or combining diagonally).  That is, adds a procedure that
    takes a nested-list of shapes as a parameter and builds an image
    from them (other than by using `stacked-ss` or `sequenced-ss`).
[ ] Style is impeccable (or nearly so).
[ ] Avoids repeated work.
[ ] Documentation for all procedures is correct / has the correct form.
```

## Q&A

_Forthcoming._
