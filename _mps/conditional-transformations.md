---
title: Mini-Project 4
subtitle: Conditional transformations
summary: |
  In this mini-project, you will continue your exploration of image
  transformations, writing some transformations that take advantage
  of conditional behavior based on color or position.  It will give you 
  the opportunity to practice with conditionals and color representations. 
collaboration: |
  Each student should submit their own responses to this project. You may
  consult other students in the class as you develop your solution.  If you
  receive help from anyone, make sure to cite them in your responses. 
link: true
preimg: true
---
_Warning! The `csc151` library has been updated for this mini-project. Make sure that you have the latest version._

_Warning! This mini-project was newly created in Spring 2025. There will likely be infelicities. (Please let Sam know if there are confusing parts or if any part seems to be taking a long time.)_

You will create only one file for this mini-project, [`conditional-transformations.rkt`](../code/mps/conditional-transformations.rkt). You should begin your project with [this starter code](../code/mps/conditional-transformations.rkt).

You will submit that file along with some image from part four.

Background
----------

As you may recall from the last mini-project, we can create basic image transformations (image filters, in the parlance of most image-editing programs) by applying a color transformation at each pixel. We do that with `(pixel-map color-transformation image)`.

In that project, we focused on mathematical approaches to transforming pixels. However, we can also take advantage of conditionals for transformations. Here's one approach, taken from a recent lab.

```racket
;;; (rgb->4gray c) -> rgb?
;;;   c : rgb?
;;; Convert c to black, white, or a gray.
;;; * Returns `gray0` if the brightness of `c` is less than 25;
;;; * Returns `gray1` if the brightness of `c` is at least 25 but less than 50;
;;; * Returns `gray2` if the brightness of `c` is at least 50 but less than 75;
;;; * Returns `gray3` if the brightness of `c` is at least 75.
(define rgb->4gray
  (lambda (c)
    (brightness->4gray (rgb-brightness c))))

;;; (brightness->4gray b) -> rgb?
;;;   b : real? (between 0 and 100)
;;; Convert b to black, white, or a gray.
;;; * Returns `gray0` if `b` is less than 25;
;;; * Returns `gray1` if `b` is at least 25 but less than 50;
;;; * Returns `gray2` if `b` is at least 50 but less than 75;
;;; * Returns `gray3` if `b` is at least 75.
(define brightness->4gray
  (lambda (b)
    (cond
      [(< b 25)
       gray0]
      [(< b 50)
       gray1]
      [(< b 75)
       gray2]
      [else
       gray3])))
```

Here's what we get when we use `rgb->4gray` with `pixel-map` and our standard kitten image.

![An image of a kitten, rendered in large splatches of white, light gray, dark gray, and black](../images/mps/conditional-transformations/kitten-4gray.jpg)

In part one of this assignment, you'll consider other conditional color transformations and their use in building image filters.

But what if we want to consider more than just the individual pixels. What if we care about what part of the image we're working with?

The `image-compute` procedure focuses only on positions of pixels, and provides an alternate mechanism for building images. Here's the documentation for that procedure.

```racket
;;; (image-compute pos2color width height description) -> image?
;;;   pos2color : procedure?
;;;   width : exact-positive-integer?
;;;   height : exact-positive-integer?
;;;   description : string?
;;; Creates a new `width`-by-`height` bitmap by applying `pos2color` to
;;; each (col,row) coordinate to determine the color at that position.
```

What should `pos2color` look like? It's a procedure that takes two integers (in the range 0 to `(- width 1)` and 0 to `(- height 1)`, respectively) and generates an RGB color from that pair of numbers. Here's one such procedure.

```racket
;;; (sample-pos2color-01 x y) -> rgb?
;;;   x : exact-nonnegative-integer?
;;;   y : exact-nonnegative-integer?
;;; Compute a color based on x and y.
(define sample-pos2color-01
  (lambda (x y)
    (cond
      [(< x 50)
       (rgb 0 0 255)]
      [(< y 25)
       (rgb 0 0 255)]
      [(>= x 100)
       (rgb 0 0 255)]
      [(>= y 75)
       (rgb 0 0 255)]
      [else
       (rgb 255 0 0)])))
```

Here's a sample call to `image-compute` with that procedure.

```racket
> (image-compute sample-pos2color-01 200 200 "some image")
```

Can you predict what image that will create? Give it a try and see.

Now, let's try a slightly different version of that procedure.

```racket
;;; (sample-pos2color-02 x y) -> rgb?
;;;   x : exact-nonnegative-integer?
;;;   y : exact-nonnegative-integer?
;;; Compute a color based on x and y.
(define sample-pos2color-02
  (lambda (x y)
    (cond
      [(< x 50)
       (rgb 0 0 y)]
      [(< y 25)
       (rgb 0 0 y)]
      [(>= x 125)
       (rgb 0 0 y)]
      [(>= y 100)
       (rgb 0 0 y)]
      [else
       (rgb 255 0 0)])))
```

Can you predict the image you'll get from the following?

```
> (image-compute sample-pos2color-02 256 256 "some image")
```

Try it and see.

Let's try one very different one.

```racket
;;; (sample-pos2color-03 x y) -> rgb?
;;;   x : exact-nonnegative-integer?
;;;   y : exact-nonnegative-integer?
;;; Compute a color based on x and y.
(define sample-pos2color-03
  (lambda (x y)
    (if (< (+ (sqr (- x 100)) (sqr (- y 75))) (sqr 50))
        (rgb (* x 2) (* x 2) 0)
        (rgb 0 0 (- 255 y)))))
```

You can probably guess that we're going to ask you to predict and try one more image.

```drracket
> (image-compute sample-pos2color-03 256 256 "some image")
```

Note that we could also have written this last one as something like the following. That could be helpful if we wanted to write a procedure to make similar images, but vary the values we use (instead of 100, 75, 50, and such).

```racket
(image-compute (lambda (x y)
                 (if (< (+ (sqr (- x 100)) (sqr (- y 75))) (sqr 50))
                     (rgb (* x 2) (* x 2) 0)
                     (rgb 0 0 (- 255 y))))
               256 256
               "some image")
```

Where are we? We know how to transform images by conditionally changing colors . We know how to make somewhat interesting images by considering the position of each pixel. Let's put the two ideas together and consider some instances in which we conditionally transform each pixel based on its color.

How can we do that? We'll use the `pixel-pos-map` procedure.

```racket
;;; (pixel-pos-map transformation img [description]) -> image?
;;;   transformation : procedure?
;;;   img : img?
;;;   description : string?
;;; Create a new image by applying `transformation` at each position
;;; in the image.
;;;
;;; `transformation` should take the following parameters:
;;;   pixel : rgb? (corresponding to the color of the current pixel)
;;;   col : exact-nonnegative-integer? (corresponding to the column
;;;         of the current pixel)
;;;   row : exact-nonnegative-integer? (corresponding to the row
;;;         of the current pixel)
```

For example,

```racket
;;; (four-parts img) -> image?
;;;   img : image?
;;; Create a new version of image by dividing it into four quadrants
;;; and then making the top-left quadrant redder, the top-right
;;; quadrant greener, the bottom-left quadrant bluer, and the bottom-right
;;; quadrant yellower.
(define four-parts
  (lambda (img)
    (pixel-pos-map (lambda (pixel col row)
                     (if (< col (* 1/2 (image-width img)))
                         (if (< row (* 1/2 (image-height img)))
                             (rgb-redder pixel)
                             (rgb-greener pixel))
                         (if (< row (* 1/2 (image-height img)))
                             (rgb-bluer pixel)
                             (rgb-redder (rgb-greener pixel)))))
                   img)))
```

Here's what we get when we apply `four-parts` to our kitten.

![An image of a kitten divided into four quadrants. The top-left quadrant is a bit redder. The top-right quadrant is a bit greener. The bottom-left quadrant is a bit bluer. And the bottom-right quadrant is a bit yellower.](../images/mps/conditional-transformations/kitten-four-parts.jpg)

Part one: Conditional transformations
-------------------------------------

a. Document and write a procedure, `(closest-color color option1 option2 option3 option4)`, that figures out which of the four options `color` is closest to. You can use `(rgb-distance color1 color2)` to figure out the distance between two colors.

b. Document and write a procedure, `(four-color img option1 option2 option3 option4)`, that takes each pixel in `img` and converts it to the closest of the four options, using `closest-color`.

c. As you may recall, we did some fancy math in the prior mini-project in order to enhance dominant components. Let's try again, this time taking advantage of Document and write a procedure, `(rgb-enhance-dominant color)`, that takes an RGB color as a parameter, determines which of the components is largest, multiplies that component by 1.1, and multiplies the other components by .9. For example,

```drracket
> (rgb->string (rgb-enhance-dominant (rgb 100 90 90)))
"110/81/81"
> (rgb->string (rgb-enhance-dominant (rgb 200 10 200)))
"220/9/220"
```

d. Document and write a procedure, `(enhance-dominant img)`, that applies `rgb-enhance-dominant` to each pixel in `img`.

Part two: Position-based images
-------------------------------

a. As you saw in the background section, it's fairly straightforward to use `image-compute` to make a rectangular image. Document and write a procedure, `(make-rectangle left top width height image-width image-height color background-color)`, that makes the given rectangle.

Note that you should generate an appropriate description of the image.

b. As you saw in the background section, it's only slightly more complicated `image-compute` to make a circle. Document and write a procedure, `(make-circle center-x center-y radius image-width image-height color background-color)`, that makes a circle of the specified radius centered at the given position

Although we used color blends in the example, you should just use solid colors for the circle and the background.

Note that you should generate an appropriate description of the image.

Part three: Position-based color transformations
------------------------------------------------

a. In our sample position-based color transformation, we broke the image into four quadrants. Of course, there are many other ways to segment an image. Write a procedure, `(concentric-rectangles img)`, that breaks an image into four concentric rectangles (the innermost one is 1/4 the width and height of the original, the next one is 1/2 the width and height, the next is 3/4 the width and height, and the last is the width and height of the original). Set the hue of all the pixels in the center rectangle to 0, the hue of the pixels in the next rectangle to 90, the next to 180, and the outermost to 270.

[Image forthcoming.]

b. We can also use color-based transformations to emphasize part of an image. 
Document and write a procedure, `(emphasize-circle img x y radius)`, that leaves the circular region centered at (`x`,`y`) and of radius `radius` "as is" and truns the rest to grayscale.

[Images forthcoming.]

Part four: Freestyle
---------------------

a. Document and write a procedure that uses `pixel-pos-map` to do something "interesting" to an image, ideally using conditionals based on both the position and the color.

b. Pick an existing image (preferably one that has a license that permits you to use it) and create three variants of the image using your procedure. Include the instructions for loading the image and making the variants _in a comment_.

What to submit
--------------

Submit `conditional-transformations.rkt`, the original `image`, and your three variants on Gradescope.

Please do not include a call to `image-load` in your `.rkt` file. Any instructions to load a file should be in a comment.

Grading rubric
--------------

### Redo or above

Submissions that lack any of these characteristics will get an I.

```
[ ] Passes all of the **R** autograder tests.
[ ] Includes the specified file, `conditional-transformations.rkt`.
[ ] Includes an appropriate header on the file that indicates the
    course, author, etc.
[ ] Acknowledges appropriately.
[ ] Code runs in DrRacket.
[ ] The question marks in the documentation have been filled in.
```

### Meets expectations or above

Submissions that lack any of these characteristics but have all of the
prior characteristics will get an R.

```
[ ] Passes all of the **M** autograder tests.
[ ] Code is well-formatted with appropriate names and indentation.
[ ] Code has been reformatted with Ctrl-I before submitting.
[ ] Code generally follows style guidelines, including limiting the
    length of lines to about 80 characters.
[ ] Documentation for all core procedures is correct / has the correct form.
[ ] Includes all the images.
```

### Exemplary / Exceeds expectations

Submissions that lack any of these characteristics but have all of the
prior characteristics will get an M.

```
[ ] Passes all of the **E** autograder tests.
[ ] Style is impeccable (or nearly so).
[ ] No `define` expressions within procedures.
[ ] All helper procedures are documented.
[ ] Avoids repeated work.
[ ] Uses `cut` and composition when appropriate.
[ ] The freestyle procedure has at least one conditional that depends 
    on the position of the pixel.
[ ] The freestyle procedure has at least one conditional that depends
    on the color of the pixel.
```

Q&A
---

### General

### Part one

### Part two

### Part three

### Part four

