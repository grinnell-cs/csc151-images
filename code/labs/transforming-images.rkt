#lang racket

(require csc151)
(require rackunit)

;; CSC 151-NN (TERM)
;; Lab: Transforming Images
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#| AB |#

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#| 
a. Introduce yourself to your partner.

b. Discuss any issues that will contribute to a more successful 
   partnership.

c. Load the lab and readings pages in your Web browser so that you
   have them available for reference.
   
d. Before beginning this lab, please update your csc151 library.

    * From the "File" menu in DrRacket, select "Install package..."

    * In the window that appears, enter 
        https://github.com/grinnell-cs/csc151.git#main
      Make sure to include the `#main`.  Please don't include any spaces.

    * Click on "Install" or "Update".

    * Wait a minute or so.

    * When it is finished installing or updating, a "Close" button should be
      available.  Press it.

e. The person closer to the board is A.  The person further from the 
   board is B.

|#

#| A |#

; +----------------------------+-------------------------------------
; | Exercise 1: Loading images |
; +----------------------------+

#|
There is nothing to submit for this exercise. Rather, the primary
point of this exercise is to practice with some basic operations.
|#

#|
a. If you haven't already done so, find an image you like, such as your campus directory picture (or President Harris' directory picture, or your instructor's directory picture) and save it to the same folder as this `.rkt` file.

[ ] Done
|#

#|
b. Verify that you can load that image into DrRacket using `image-load`.

[ ] Done
|#

#|
c. Verify that you can make the loaded image a bit bluer using `pixel-map` and `rgb-bluer`.

[ ] Done
|#

#|
d. Using `image-save`, save the bluer image as `/home/USERNAME/Desktop/bluer-picture.png`, substituting your own user name. (If you're doing this on a Mac, you may have to use `/Users/USERNAME/Desktop/bluer-picture.png`.)

[ ] Done
|#

#|
e. Verify that you can double click on the image an open it.

[ ] Done
|#

#|
f. Verify that you can load the image again in the interactions pane.

    (image-load "/home/USERNAME/DESKTOP/bluer-picture.png")

[ ] Done
|#

#|
g. You don't need `bluer-picture.png` anymore. Delete it.

[ ] Done
|#

#| B |#

; +---------------------------------------+--------------------------
; | Exercise 2: Exploring transformations |
; +---------------------------------------+

#|
Remind yourself of what some of the basic RGB transformers do by applying 
them to `(rgb 127 128 129)` and any other colors you think will be useful. 
Copy and paste your results from the interactions pane into the comments
below.

Include notes to yourselves as appropriate.

Please use the steps in `rgb-darker` as an example.
|#

#|
a. Preparation

> (rgb 127 128 129)
???
> (rgb->string (rgb 127 128 129))
???
|#

#|
b. `rgb-darker`

Experiments:

> (rgb-darker (rgb 127 128 129))
???
> (rgb->string (rgb-darker (rgb 127 128 129)))
???
> (rgb-darker ...) ; fill in some other color
???
> (rgb->string (rgb-darker ...)
???
> (rgb-darker ...) ; fill in some other color
???
> (rgb->string (rgb-darker ...)
???

Notes:

|#

#|
c. `rgb-lighter

Experiments:

Notes:

|#

#|
d. `rgb-redder`

Experiments:

Notes:

|#

#|
e. `rgb-greener`

Experiments:

Notes:

|#

#|
f. `rgb-bluer`

Experiments:

Notes:

|#


#|
g. `rgb-pseudo-complement`

Experiments:

Notes:

|#

#|
h. `rgb-greyscale`

Experiments:

Notes:

|#

#|
i. `rgb-phaseshift`

Experiments:

Notes:

|#

#| A |#

; +--------------------------------------+---------------------------
; | Exercise 3: Composed transformations |
; +--------------------------------------+

#|
As you may recall, the compose procedure, `o` , joins together multiple
procedures, applying each in sequence from right to left.
|#

#|
a. 
Consider the following definition.
|#

(define rgb-transform-3a 
  (o rgb-redder rgb-pseudo-complement))

#|
i. What color (RGB components) do you expect to get for each of the following?

> (rgb->string (rgb-transform-3a (rgb 127 127 127)))
Your guess:

> (rgb->string (rgb-transform-3a (rgb 255 0 0)))
Your guess:

> (rgb->string (rgb-transform-3a (rgb 0 255 0)))
Your guess:
|#

#|
ii. Check your answers experimentally.

> (rgb->string (rgb-transform-3a (rgb 127 127 127)))

> (rgb->string (rgb-transform-3a (rgb 255 0 0)))

> (rgb->string (rgb-transform-3a (rgb 0 255 0)))

|#

#|
b. 
Consider the following definition.
|#

(define rgb-transform-3b
  (o rgb-pseudo-complement rgb-redder))

#|
i. What color (RGB components) do you expect to get for each of the following?

> (rgb->string (rgb-transform-3b (rgb 127 127 127)))
Your guess:

> (rgb->string (rgb-transform-3b (rgb 255 0 0)))
Your guess:

> (rgb->string (rgb-transform-3b (rgb 0 255 0)))
Your guess:
|#

#|
ii. Check your answers experimentally.

> (rgb->string (rgb-transform-3b (rgb 127 127 127)))

> (rgb->string (rgb-transform-3b (rgb 255 0 0)))

> (rgb->string (rgb-transform-3b (rgb 0 255 0)))

|#

#|
b. 
Consider the following definition.
|#

(define rgb-transform-3c
  (o rgb-redder rgb-redder rgb-bluer rgb-bluer))

#|
i. What color (RGB components) do you expect to get for each of the following?

> (rgb->string (rgb-transform-3c (rgb 127 127 127)))
Your guess:

> (rgb->string (rgb-transform-3c (rgb 255 0 0)))
Your guess:

> (rgb->string (rgb-transform-3c (rgb 0 255 0)))
Your guess:
|#

#|
ii. Check your answers experimentally.

> (rgb->string (rgb-transform-3c (rgb 127 127 127)))

> (rgb->string (rgb-transform-3c (rgb 255 0 0)))

> (rgb->string (rgb-transform-3c (rgb 0 255 0)))

|#

#|
d. Using `pixel-map`, apply `rgb-transform-3a` and `rgb-transform-3b`
to both the kitten image and your sample image and summarize the
differences as best you can.

Your answer:
|#

#|
e. Using `pixel-map`, `rgb-transform-3c` to the kitten image and
your sample image and summarize the differences as best you can.

Your answer: 
|#

#|
f. Using the composition operation, `o`, and the basic rgb transformations,
write a procedure, `rgb-less-red`, that makes its parameter less red.
|#

(define rgb-less-red
  (o ???))

#|
g. In the interactions pane, apply your procedure to one of the images using
a command like the following.

    > (pixel-map rgb-less-red (image-load "kitten.jpg"))
|#

#|
h. Consider the following transformation.
|#

(define rgb-transform-h
  (o rgb-darker rgb-darker rgb-lighter rgb-lighter))

#|
At first glance, `rgb-transform-h` seems to return its input value.

> (rgb->string (rgb-transform-h (rgb 128 128 128)))
"128/128/128"
> (rgb->string (rgb-transform-h (rgb 60 70 80)))
"60/70/80"

i. Are there any colors for which `rgb-transform-h` does *not* return
the same color?

Your answer:

ii. What effect, if any, do you expect `rgb-transform-h` to have
on an image?  (That is, what do you expect for something like
`(pixel-map rgb-transform-h img)`.

Your answer:

|#

#| B |#

; +--------------------------------------------+---------------------
; | Exercise 4: Cutting arithmetic expressions |
; +--------------------------------------------+

#| 
As you may recall from the reading, the `cut` operation creates a
new procedure from an existing procedure by filling in some of the
arguments.

In this lab, we will first consider the effect of `cut` on some basic 
arithmetic operations.

Consider each of the following definitions.
|#

(define add10 (cut (+ 10 <>)))
(define add11 (cut (+ <> 11)))
(define sub5 (cut (- 5 <>)))
(define sub6 (cut (- <> 6)))
(define rem7a (cut (remainder <> 7)))
(define rem7b (cut (remainder 7 <>)))

#|
a. What value do you expect to get if you apply each of these procedures
to the value 12? What about the value 5?

> (add10 12)

> (add10 5)

> (add11 12)

> (add11 5)

> (sub5 12)

> (sub5 5)

> (sub6 12)

> (sub6 5)

> (rem7a 12)

> (rem7a 5)

> (rem7b 12)

> (rem7b 5)

|#

#|
b. Check your answers experimentally, adding notes to yourself where
appropriate.

add10:

add11:

sub5:

sub6:

rem7a:

rem7b:

|#

#|
c. Summarize what your results suggest about the `cut` operation.

You answer:

|#

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 5: Composing cut procedures |
; +--------------------------------------+

#|
Consider the following procedure.
|#

(define proc5
  (o (cut (* 5 <>)) (cut (- <> 2))))

#|
a. In your own words, what should `proc5` do?

Answer:
|#

#|
b. What values do you expect to get when you apply `proc5` to the
inputs 1, 2, 3, 4, and 5?

> (proc5 1)

> (proc5 2)

> (proc5 3)

> (proc5 4)

> (proc5 5)

|#

#|
c. Check your answers experimentally.

> (proc5 1)

> (proc5 2)

> (proc5 3)

> (proc5 4)

> (proc5 5)

|#

#|
d. What does `proc5` do?

Answer:
|#

#|
e. In your own words, explain how the definition achieves that result.

Answer:
|#

#| A |#

; +------------------------------+-----------------------------------
; | Exercise 6: Combining colors |
; +------------------------------+

#|
Determine what each of the following procedures does. You may want to
read documentation (such as it is) and conduct experiments.
|#

#|
a. `(rgb-add c1 c2)`

Answer:
|#

#|
b. `(rgb-subtract c1 c2)`

Answer:
|#

#|
c. `(rgb-average c1 c2)`

Answer:
|#

#| A |#

; +----------------------------------------------+-------------------
; | Exercise 7: Image transformations, revisited |
; +----------------------------------------------+

#|
What does each of the following procedures do? (First hypothesize,
then check in DrRacket.)
|#

(define transform-image-7a
  (lambda (img)
    (pixel-map (lambda (c)
                 (rgb (rgb-red c) 0 (rgb-blue c)))
               img)))

#|
a. Answer for `transform-image-7a` (see above).

|#
(define transform-image-7b
  (lambda (img)
    (pixel-map (o rgb-bluer rgb-redder) img)))

#|
b. Answer for `transform-image-7b` (see above).

|#

(define transform-image-7c
  (lambda (img)
    (pixel-map (o rgb-pseudo-complement rgb-greener rgb-pseudo-complement) img)))

#|
c. Answer for `transform-image-7c` (see above).

|#

(define transform-image-7d
  (lambda (img)
    (pixel-map (cut (image-subtract <> (rgb 100 0 100))) img)))

#|
c. Answer for `transform-image-7d` (see above).

|#

(define transform-image-7e
  (lambda (img)
    (pixel-map (cut (image-subtract (rgb 255 255 255) <>)) img)))

#|
d. Answer for `transform-image-7e` (see above).

|#

#| B |#

; +----------------------------------------------+-------------------
; | Exercise 8: Image transformations, revisited |
; +----------------------------------------------+

#|
What does each of the following procedures do? (First hypothesize,
then check in DrRacket.)
|#

(define transform-image-8a
  (cut (pixel-map rgb-bluer <>)))

#|
a. Answer for `transform-image-8a` (see above).

|#

(define transform-image-8b
  (cut (pixel-map (o rgb-darker rgb-darker rgb-darker) <>)))

#|
b. Answer for `transform-image-8b` (see above).

|#

(define transform-image-8c
  (cut (pixel-map (cut (rgb-add (rgb 64 0 64) <>)) <>)))

#|
c. Answer for `transform-image-8c` (see above).

|#

(define transform-image-8d
  (cut (pixel-map (o rgb-darker
                     rgb-darker
                     (cut (rgb-add (rgb 64 0 64) <>)))
                  <>)))

#|
d. Answer for `transform-image-8d` (see above).

|#

#|
e. Summarize what you've learned from these definitions.

|#

#| AB |#

; +----------------+-------------------------------------------------
; | Submit the lab |
; +----------------+

#|
You're done.  Congratulations!  It's time to submit your lab.  After
doing so, you should review the extra problems below and, as
appropriate, pick one or more to attempt.  We'd suggest that you
start with the first extra problem.

To turn in your work:

a. Ensure that your file runs properly.  (E.g., when we click "Run", it should
   work not produce errors.)
b. Make sure that this file is named `transforming-images.rkt`.
c. If at all possible, make sure that you have no calls to `image-load` in
   your definitions pane.
d. Submit this final file to Gradescope.  If you do have calls to `image-load`
   in your definitions pane, upload the images, too.
e  Make sure to submit your work as a group submission and include your 
   partner in the submission.
f. Wait for the autograder results to make sure that you met the
   basic goals.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, go back and look at some of the
extra exercises on the RGB-colors lab, then think about how you might
write them anonymously.
|#

