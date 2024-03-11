#lang racket

; CSC 151-NN (TERM)
; Lab: Decomposition 
; Authors: YOUR NAMES HERE
; Date: THE DATE HERE
; Acknowledgements: 
;   ACKNOWLEDGEMENTS HERE

; +-----------+------------------------------------------------------
; | Libraries |
; +-----------+

(require csc151)

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|

1. Introduce yourself to your partner.  You may want to discuss
any questions you had on the readings and/or review any additional
comments on the readings.

2. Update the CSC151 libraries.  That is, open DrRacket, select
"Install Pckage..." or "Package Manager..." from the "File" menu, 
enter

    https://github.com/grinnell-cs/csc151.git#main

click "Update", wait for a bit, click "Close" or "Close Output", and then 
close the Package manager if necessary.
|#

#| A |#

; +---------------------+--------------------------------------------
; | Exercise 1: A party |
; +---------------------+

#|
a. As the A above suggests, Partner A should drive on this exercise and
Partner B should navigate.  If all goes well, this exercise should 
take you about ten minutes.

Define an image called `party-people` that looks like the image in
the lab instructions.

To draw equilateral triangles, you should use the `solid-equilateral-triangle` function, 
e.g.,
|#

; Creates an equilateral triangle with sides of length
; 10 (in pixels) that is solid and green.
(define little-green-triangle
  (solid-equilateral-triangle 10 "green"))

#|
As the reading suggests, you should use the technique of *algorithmic
decomposition* to break down the image into smaller parts that are
simpler to implement.  Your code should use `define` commands to
explicitly name these smaller parts so that your code reflects that
decomposition you identified.
|#

(define party-people 
  ???)

#|
b. If you have not done so already, ensure that your image has an
appropriate *short* description. For example,

     > (describe-image party-people)
     "five stick-figure people with party hats arranged side-by-side"

|#

#| B |#

; +-------------------------+----------------------------------------
; | Exercise 2: A landscape |
; +-------------------------+

#|
a. Now, switch roles!  The navigator of the previous problem should
become the driver.

Now, try building a program that defines `landscape` as the image
that appears in the lab handout.  (Two trees, a cottage, and two
more trees.)

Once again, use algorithmic decomposition to break down this image
into smaller parts, using `define`s to explicitly name the smaller
parts you identified.
|#

(define landscape
  ???)

#|
b. In case you've forgotten, make sure to add descriptions to both
the landscape and the components thereof. For example.

    (define small-tree
      (solid-isosceles-triangle 20 50 "darkgreen"
       "a small tree"))

|#

#| A |#

; +------------------------------+-----------------------------------
; | Exercise 3: Falling dominoes |
; +------------------------------+

#|
Switch roles yet again!  This exercise is another one that should
take fifteen minutes or so.

For this exercise, we'll introduce two new drawing functions:

* `(rotate img deg)` produces a copy of the image `img`, but rotated 
  `deg` degrees counter-clockwise.
* `(beside/align yalign img1 img2 ...)` places the images `img1`, `img2`, 
  ..., side-by-side as with `beside`.  However the are aligned relative 
  to `yalign` which can be one of the following strings:
    * `"top"`
    * `"center"`
    * `"bottom"`
  The images are aligned according to this policy, *e.g.*, `beside/align`
  behaves like `beside` if it is passed `center`.
* Coincidentally, `above/align` also exists with options to align
  `"left"`, `"center"`, and `"right"`.

Use these functions to define an image, `falling-dominoes`, that
looks like the one in the lab handout.

We recommend that before tackling this problem you *experiment*
with `rotate` and `beside/align` to get a feel for how they work.

Again, use functional decomposition and name the components of your
image appropriately with `define`s.
|#

(define falling-dominoes 
  ???)

#| AB |#

; +---------------------+--------------------------------------------
; | Submitting your lab |
; +---------------------+

#|
Yay!  You're done!  Well, you are almost done.  You still need
to submit the lab and make sure it passes the autograder.

Once you have all the exercises in your file, `decomposition.rkt`,
it is now complete!  Finally, **_one_ member of your group** can
upload the completed `decomposition.rkt` file to Gradescope for
this lab.  Make sure that you upload you work as a group assignment
and that you include your partner in the submission!  

Don't forget to check the autograder results.  Note that the
autograder gives 0.999 rather than 1 if you get everything 
correct.

If you get errors from the autograder, you should discuss them with
one of the class staff (or you can try to resolve them yourself).

You should also check to make sure that the file looks readable.
(It usually does, but there are times that Racket does strange
things to your file.  In such cases, ask the class staff for help.)

Finally, we would also recommend that you use Teams or email to
exchange files or portions thereof. (You should also be able to
download the code from Teams.)
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you should attempt the 
following exercises.  You need not turn them in.
|#

#| B |#

; +------------------------+-----------------------------------------
; | Extra 1: Sun triangles |
; +------------------------+

#|
Switch roles one last time!  This is perhaps the longest of the
exercises, which is why we've made it optional.  Even if you don't
do this exercise, you should read the material below and, if possible,
play with the procedures a bit.

Here's one more function for this exercise:

`(overlay img1 img2 ...)` creates a new image that appears as if
the images were overlaid on top of each other (not above, but
"nearer" in the third dimension.  

In addition, when you specify the color of an image, you can add
an alpha value to the color, provided you give it in RGBA form.
That number, which must be in the range 0-255, is interpreted
as the opacity of the color. For example, `(rgb 255 0 0 100)` is
a semi-transparent red.

Use these functions to define an image, `sun-triangles`, that looks
like the one in the lab handout.

The image is a collection of transparent yellow triangles with black
outlines on top of an orange circle.

This image is a bit trickier than the previous ones, and there is
a few ways you might approach it.  Not all approaches will result
in the exact same image, so we aren't looking for your result to
be identical, but it is possible, and we encourage you to think
carefully about your decomposition to get that result.

At the very least, you will need to draw yellow triangles with
outlines.  To achieve this effect, you should use `overlay` and two
triangles with a combination of `"solid"` and `"outline"` fills.
|#

(define sun-triangles 
  ???)

#| AB |#

; +------------------------------------+-----------------------------
; | Extra 2: Expanding prior exercises |
; +------------------------------------+

#|
Expand one of the ideas from a prior exercise.  Perhaps you'll add
a door to the house, or some fruit to the trees, or bowties to the
party people.  Have fun!
|#
