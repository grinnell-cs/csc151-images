---
title: Mini-Project 5
subtitle: Combining images
summary: |
  In this assignment, we will consider ways to build more complex
  images by combining the elements in lists of images. In contrast
  to the previous assignment, which also used lists of shapes, we
  will process these lists of shapes using recursion.
collaboration: |
  Each student should submit their own responses to this project. You may
  consult other students in the class as you develop your solution.  If you
  receive help from anyone, make sure to cite them in your responses. 
link: true
preimg: true
---
Please start with the [template code](../code/mps/combining-images.rkt).

Please save all of your work as `combining-images.rkt`.

## Introduction

_Disclaimer: This contextual narrative is fictional._

The other day, as some CSC-151 students were showing their work to the local artists' collective, those artists found themselves particularly engaged by the somewhat Warholian grids of images you made. As you may recall, you built complex nested lists of images and then processed lists by alternating stacking and sequencing of images. Although those lists were relatively complex, you were able to process them in a relatively straightforward way by using `map`, `apply`, `reduce`, and perhaps even `filter`.

The collective believe that the code you're writing may help them in a project in which they are combining slightly-modified versions of images as a reflection on how shifting perspectives and presentations of images can lead to a loss of certainty. For example, they've created the following version of our favorite cat as a sketch of a work about felininity.

![Multiple pictures of a cat, overlaid on each other, shifted slightly](../images/mps/combining-images/uncertain-kitten.png)

As you may note, the slight shifts and resizing lead to questions of focus and blur our understanding of the kitten.

Unfortunately, the collective have not yet taken CSC-151 and have asked for your help.

Now that you've learned a bit of recursion, you can start to consider other ways to process lists of images, including, perhaps, supporting the collective in the _Loss of Certainty_ series. For example, you might provide tools to automatically build a sequence of variants of an image (just one level of depth) and, perhaps, combine those in different ways.

## Part 1: Combining elements in multiple ways

As you likely discovered, you can put all of the images in a list beside each other with a procedure like the following.

```
;;; (arrange-horizontally images) -> image?
;;;   images : (list-of image?)
;;; Arrange all of the images in `images` in a row, beside each other.
(define arrange-horizontally
  (lambda (images)
    (cond
      [(null? images)
       (solid-rectangle 0 0 (rgb 0 0 0 0))]
      [(null? (cdr images))
       (car images)]
      [else
       (apply beside images)])))
```

But what if we want to vary what we're doing, perhaps alternating between putting things beside each other and above each other. We might do so by writing something not quite like reduce.

a. Document, write at least three tests for, and write a procedure, `(pair-horizontally images)`, that takes a list of images as a parameter and returns a new list of approximately half the length in which each element is created by putting two elements of the first list next to each other.

[IMAGE FORTHCOMING]

Pretend letters are images in the following.

```
> (pair-horizontally (list "A" "B" "C" "D"))
(list "AB" "CD")
> (pair-horizontally (list "A" "B" "C" "D" "E" "F" "G"))
(list "AB" "CD" "EF" "G")
> (pair-horizontally (list)
'()
> (pair-horizontally (list "A"))
"A"
```

b. Document, write at least three tests for, and write a procedure, `(pair-vertically images)`, that behaves much like `pair-horizontally`, but puts the two images above each other.

[IMAGE FORTHCOMING]

c. Document the following procedures. Also add a note in your code explaining how this works.

```
(define gridify-hv
  (lambda (images)
    (cond
      [(null? images)
       (transparent-rectangle 0 0)]
      [(null? (cdr images))
       (car images)]
      [else
       (gridify-vh (pair-horizontally images))])))

(define gridify-vh
  (lambda (images)
    (cond
      [(null? images)
       (transparent-rectangle 0 0)]
      [(null? (cdr images))
       (car images)]
      [else
       (gridify-hv (pair-vertically images))])))
```

d. Of course, to achieve the collective's goals, you'll also need a way to overlay semi-transparent versions of images. Fortunately, your instructor has provided you with a useful procedure. (You'll see the helpers in the starter code.)

```
;;; (overlay-alt top-image bottom-image) -> image?
;;;   top-image : image?
;;;   bottom-image : image?
;;; Overlay `top-image` on `bottom-image`, combining the two images
;;; in the positions in which they overlap.
(define overlay-alt
  (lambda (top-image bottom-image)
    (set-transparency (overlay (set-transparency top-image 140)
                               bottom-image)
                      255)))
```

e. Write a procedure, `(overlay-pairs images)`, that behaves much like `pair-horizontally` and `pair-vertically`, except that it uses `overlay-alt` instead of `beside` or `above`.

f. Write a procedure, `(overlaid-grids images)`, that behaves much like `gridify-hv` and `grididfy-vh`, except that it pairs horizontally first, then vertically, and then overlays pairs before going back to horizontal, vertical, overlay, etc.

## Part 2: Making lists of images

We're not quite yet ready to support the collective. We should first gain some practice in automatically building lists of images so that we can do more experiments with the prior procedures.

One technique for building large lists involves treating a list of digits (exact integers between 0 and 9, inclusive) as instructions for creating shapes.

What do we mean by that?

Well, we could treat the first digit in a list as code for what shape we want.  Perhaps 

* 0, 1, and 2 could represent a solid circle of diameter 30;
* 3, 4, and 5 could represent a solid square of side-length 30;
* 6 and 7 could represent a solid diamond of width 30 and height 30; and
* 8 and 9 could represent a solid-equilateral triangle of edge-length 30.

The next digit in the list would then represent the color, using the
following procedure.

```
;;; (digit->color digit) -> rgb?
;;;   digit : (all-of exact-integer? (at-least 0) (at-most 9))
;;; Convert a digit to a color (e.g., when building a list of shapes from
;;; a list of digits).
(define digit->color
  (lambda (digit)
    (list-ref (list (rgb 255 0 0) (rgb 255 255 0) (rgb 0 255 0) (rgb 0 255 255)
                    (rgb 0 0 255) (rgb 255 0 255) (rgb 0 0 0) (rgb 255 255 255)
                    (rgb 85 85 85) (rgb 170 170 170))
              digit)))
```

a. Write at least five tests for, and implement a procedure, `(simple-shape type colornum)`, that takes two digits as parameters and returns the corresponding shape (according to the policies above).

b. Write a procedure, `(simple-shapes digits)`, that takes a list of digits as a parameter and ...

c. Write a procedure, `(more-shapes digits)`, that ....

## Part 3: Lists of transformations

Rather than making lists of shapes, we can make lists of transformations.

a. 

## Part 4: Freestyle

Using these procedures and any others you write, create an interesting image which you should call `freestyle`.

```
(define freestyle (stack-then-sequence-then-stack ...))
```

To earn an E, you will need to write your own variants of the procedures in parts 1, 2, and 3.

Grading rubric
--------------

_Still under development, but nearly complete._

### Redo or above

Submissions that lack any of these characteristics will get an I.

```
[ ] Passes all of the one-star autograder tests.
[ ] Includes the specified file, `shape-lists.rkt`.
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
    [ ] Correctly implements `color-variants-0`.
    [ ] Correctly implements `color-variants-1`.
    [ ] Correctly implements `color-variants-1x`.
    [ ] Correctly implements `color-variants-2`.
    [ ] Correctly implements `shape->solid-isosceles-triangle`.
    [ ] Correctly implements `shapes->solid-isosceles-triangles-0`.
    [ ] Correctly implements `shapes->solid-isosceles-triangles-1`.
    [ ] Correctly implements `stack`.
    [ ] Correctly implements `sequence`.
    [ ] Correctly implements `sequence-then-stack`.
    [ ] Correctly implements `stack-then-sequence`.
[ ] Code is well-formatted with appropriate names and indentation.
[ ] Code has been reformatted with Ctrl-I before submitting.
[ ] Code generally follows style guidelines.
[ ] Documentation for all core procedures is correct / has the correct form.
[ ] Creates an image called `freestyle`.
[ ] Includes all the specified tests.
```

### Exemplary / Exceeds expectations

Submissions that lack any of these characteristics but have all of the
prior characteristics will get an M.

```
[ ] Passes all of the three-star autograder tests. For example,
    [ ] Correctly implements `shapes->solid-isosceles-triangles-2`.
    [ ] Correctly implements `sequence-then-stack-then-sequence`.
    [ ] Correctly implements `stack-then-sequence-then-stack`.
[ ] Adds a new procedure akin to `color-variants`.  That is, adds a 
    procedure that takes a `shape-params?` as a parameter and creates
    a list of `shape-params?` (or list of lists of ....)`.
[ ] Adds a new procedure akin to `shape->solid-isosceles-triangles-1`.
[ ] Adds a new procedure akin to `stack` or `sequence`. That is,
    adds a procedure that combines a list of images into a single image.
    It might combine the images diagonally, or beside but bottom
    aigned, or overlay them, or ...
[ ] Adds a new procedure akin to `stack-then-sequence`, that works
    with a singly nested list.
[ ] Style is impeccable (or nearly so).
[ ] Avoids repeated work.
[ ] Documentation for all procedures is correct / has the correct form.
[ ] Each set of tests includes at least one edge case (e.g., an empty
    list, if appropriate).
```

## Q&A

### Testing

Do we have to write tests for every procedure?

> No. Only those we expicitly ask you to test.

### Miscellaneous

It says we are unlikely to need to use `doubly-nested-shape-list?`. Out of curiosity, what would be an example of a situation where it would be helpful?

> Some of your procedures expect a doubly-nested shape list as a parameter. You might find it useful to verify that the parameter has the correct type.

> I used it in documentation; you might want to, too.

