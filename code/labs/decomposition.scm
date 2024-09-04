; CSC 151-NN (TERM)
; Lab: Decomposition 
; Authors: YOUR NAMES HERE
; Date: THE DATE HERE
; Acknowledgements: 
;   ACKNOWLEDGEMENTS HERE

; +-----------+------------------------------------------------------
; | Libraries |
; +-----------+

(import image)

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

; First, introduce yourself to your partner.  You may want to discuss any
; questions you had on the readings and/or review any additional comments on the
; readings.

; --- ...now partner A drives! ---

; +---------------------+--------------------------------------------
; | Exercise 1: A party |
; +---------------------+

; As the A above suggests, Partner A should drive on this exercise and
; Partner B should navigate.  If all goes well, this exercise should 
; take you about ten minutes.

; Define an image called `party-people` that looks like the image in
; the lab instructions.

; To draw equilateral triangles, you should use the `triangle` function, 
; e.g.,

; ; Creates an equilateral triangle with sides of length
; ; 10 (in pixels) that is solid and green.
; (define little-green-triangle
;   (triangle 10 "solid" "green"))

; As the reading suggests, you should use the technique of *algorithmic
; decomposition* to break down the image into smaller parts that are
; simpler to implement.  Your code should use `define` commands to
; explicitly name these smaller parts so that your code reflects that
; decomposition you identified.

(define party-people
  {??})

; Remember that `define` will define a name for your drawing. For
; the drawing to be produced, you need to evaluate it! Uncomment
; the following reference to your newly defined drawing to see it!

; party-people

; --- ...now partner B drives! ---

; +-------------------------+----------------------------------------
; | Exercise 2: A landscape |
; +-------------------------+

; Now, switch roles!  The navigator of the previous problem should
; become the driver.

; Now, try building a program that defines `landscape` as the image
; that appears in the lab handout.  (Two trees, a cottage, and two
; more trees.)

; Once again, use algorithmic decomposition to break down this image
; into smaller parts, using `define`s to explicitly name the smaller
; parts you identified.

(define landscape
  {??})

; TODO: uncomment once you have begun to fill in the definition above!

; landscape

; --- ...now partner A drives! ---

; +------------------------------+-----------------------------------
; | Exercise 3: Falling dominoes |
; +------------------------------+

; Switch roles yet again!  This exercise is another one that should
; take fifteen minutes or so.

; For this exercise, we'll introduce two new drawing functions:
;
; * `(color r g b a)` produces a string suitable for passing as a color
;   to any one of the drawing functions. The arguments are numbers
;   specifying a color in rgba form.
; * `(overlay/offset dx dy img1 img2)` places the images `img1` and
;   `img2`, on top of each other but with img2 offset by `dx` and `dy`
;   pixels relative to `img1.

; Use these functions to define an image, `the-planets`, that
; looks like the one in the lab handout.

; We recommend first *experimenting* with overlay/offset to get the
; effect of the *drop shadow* in the image. You can also look online
; for a "rgb color picker" that will help you figure out the right
; components for a given color you might have in mind. Your image
; does not need to match exactly, but do your best!

; Again, use functional decomposition and name the components of your
; image appropriately with `define`s.

(define the-planets
  {??})

; TODO: uncomment once you have begun to fill in the definition above!

; the planets

; --- ...now partner B drives! ---

; +--------------------------------+------------------------------------
; | Exercise 4: Powerful Triangles |
; +--------------------------------+

; Switch roles one last time!  This is perhaps the longest of the
; exercises. Even if you don't complete this exercise, you should read the
; material below, put in your best effort, and capture your work below.

; You will find the standard `overlay` function useful for this exercise:

; `(overlay img1 img2 ...)` creates a new image that appears as if
; the images were overlaid on top of each other.

; Use these functions to define an image, `powerful-triangles`, that
; looks like the one in the lab handout.

; The image is a collection of three configuration of triangles---yellow
; outlined in gold---each of which increases in complexity.

; For this problem, focus on decomposition! Once you see a pattern,
; it'll be relatively simple to brute force a solution. However, try
; to use definitions appropriately to decompose each configuration of
; triangles into smaller parts. There are several ways to "see" the
; decomposition! Brainstorm with your partner and pick one that you
; agree on!

; (Hint: At the very least, you will need to draw yellow triangles with
; outlines.  To achieve this effect, you should use `overlay` and two
; triangles with a combination of `"solid"` and `"outline"` fills.)

(define powerful-triangles
  {??})

; +---------------------+--------------------------------------------
; | Submitting your lab |
; +---------------------+

; Yay!  You're done!  Well, you are almost done.  You still need
; to submit the lab and make sure it passes the autograder.

; Once you have all the exercises in your file, `decomposition.scm`,
; it is now complete!  Finally, **_one_ member of your group** can
; upload the completed `decomposition.scm` file to Gradescope for
; this lab.  Make sure that you upload you work as a group assignment
; and that you include your partner in the submission!  

; If you get errors from the autograder, you should discuss them with
; one of the class staff (or you can try to resolve them yourself).

; You should also check to make sure that the file looks readable.
; (It usually does, but there are times that Scheme does strange
; things to your file.  In such cases, ask the class staff for help.)

; Finally, we would also recommend that you use Teams or email to
; exchange files or portions thereof.

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

; If you find that you have extra time, you should attempt the 
; following exercises.  You need not turn them in.

; --- ...either partner can drive for this one! ---

; +------------------------------------+-----------------------------
; | Extra: Expanding prior exercises   |
; +------------------------------------+

; Expand one of the ideas from a prior exercise.  Perhaps you'll add
; a door to the house, or some fruit to the trees, or bowties to the
; party people. You can even try to use transparency and overlay/offset
; to add texture to the planets. Have fun!
