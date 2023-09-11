#lang racket

(require csc151)
(require 2htdp/image)
(require rackunit)

;; CSC 151-NN (TERM)
;; Lab: RGB Colors
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-----------------------------+------------------------------------
; | Procedures from the reading |
; +-----------------------------+

;;; (color-pseudo-complement c) -> color?
;;;   c : color?
;;; Compute the pseudo-complement of a color
(define color-pseudo-complement
  (lambda (c)
    (rgb (- 255 (color-red c))
         (- 255 (color-green c))
         (- 255 (color-blue c)))))

;;; (color-merge-red-green c) -> color?
;;;   c : color?
;;; Make both the red and green components closer to the average of the
;;; two components.
(define color-merge-red-green
  (lambda (c)
    (rgb (quotient (+ (color-red c) (color-red c) (color-green c)) 3)
         (quotient (+ (color-red c) (color-green c) (color-green c)) 3)
         (color-blue c))))


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

f. Make sure that you can load the kitten image.  (We won't be using it
   explicitly in the lab, but it never hurts to try.)

     > (define kitten (image-load "kitten.jpg"))
     > kitten
     +------+
     | meow |
     +------+
|#

#| A |#

; +-----------------------------------------+------------------------
; | Exercise 1: Previewing groups of colors |
; +-----------------------------------------+

#|
As you've likely noted, when exploring RGB colors, it's helpful to 
be able to quickly move from the numeric description to a picture
that shows the colors.
|#

#|
a. Write a procedure, `(color-palette c1 c2 c3)`, that takes
three colors as parameters and creates an image with a 20x40
rectangle for each color and the three rectangles side-by-side

+---+---+---+
|c1 |c2 |c3 |
+---+---+---+
|#

;;; (color-palette c1 c2 c3) -> image?
;;;   c1 : color?
;;;   c2 : color?
;;;   c3 : color?
;;; Create an image that permits us to preview the three colors.
(define color-palette
  (lambda (c1 c2 c3)
    ???))

#|
b. Predict the approximate colors you will get for each of the
following RGB combinations, preview them with `color-palette`,
and then add any notes you have.

i. (rgb 200 100 50)
ii. (rgb 100 50 200)
iii. (rgb 50 200 100)
|#

#|
c. Define the value palette-pvr-sb-s as a palette made from the
colors `"palevioletred"`, `"steelblue"`, and `"salmon"`.
|#

;;; palette-pvr-sb-s : image?
(define palette-pvr-sb-s ???)

; +-----------------------------+------------------------------------
; | Exercise 2: Choosing colors |
; +-----------------------------+

#|
a. As you've noted, we regularly suggest colors for you to use.  Of
course, you should not be limited by our suggestions for possible
colors.  Write down the names of five of your favorite colors.

i.

ii.

iii.

iv.

v.
|#

#|
b. Check to see if any of them are defined using `(colors-find name)`.
This procedure returns a list of all color names that contain `name`.

For example, if one of my favorite colors is a kind of pink (say,
hot pink), I might write,

    > (colors-find "pink")
    '("deeppink" "hotpink" "lightpink" "pink")

There is nothing to submit for this sub-exercise.
|#

#|
c. Define `fave1`, `fave2`, and `fave3` to be RGB colors that correspond
to three colors you've identified.  For example,

    (define fave0 (color-name->rgb "hotpink"))
|#

(define fave1 ???)

(define fave2 ???)

(define fave3 ???)

#|
d. Create a palette of these three colors.
|#

(define faves ???)

#| B |#

; +--------------------------------------+---------------------------
; | Exercise 3: Concentric color circles |
; +--------------------------------------+

#|
a. Write a procedure, `(ccc c1 c2 c3)`, that takes three colors as
parameters and creates an image with three concentric circles, each
on top of the next.  The largest/bottom circle should be colored
c3 and have radius 30.  The middle circle should be colored c2 and
have radius 20.  The smallest/top circle should be colored c2 and
have radius 10.
|#

;;; (cc c1 c2 c3) -> image?
;;;   c1 : color?
;;;   c2 : color?
;;;   c3 : color?
;;; Create an image that permits us to preview the three colors as
;;; concentric circles.
(define ccc
  (lambda (c1 c2 c3)
    ???))

#|
b. Using your procedure, create an image, `concentric-faves`, that
has three concentric circles, one each from `fave1`, `fave2, and
`fave3`.
|#
(define concentric-faves ???)

; +-------------------------+----------------------------------------
; | Exercise 4: Secondaries |
; +-------------------------+

#|
As you may recall from the reading on design and color, in
subtractive color, the secondary colors are created by combining
any two primaries.  Let's try the same with RGB colors.  That
is, we'll create "additive primaries" by setting two of the
components to 255.
|#

#|
b. What color do you expect to get if you mix red and blue?
(That is, what color do you expect for `(rgb 255 0 255)`?)

<ENTER YOUR ANSWER HERE>
|#

#|
c. Check your answer by creating a set of concentric circles
of red, the red-blue mix, and blue.
|#
(define red-blue-mix ???)

#|
d. What color do you expect to get if you mix red and green?
(That is, what color do you expect for `(rgb 255 255 0)`?)

<ENTER YOUR ANSWER HERE>
|#

#|
e. Check your answer by creating a set of concentric circles
of green, the red-green mix, and red.
|#
(define red-green-mix ???)

#|
f. What color do you expect to get if you mix blue and green?
(That is, what color do you expect for `(rgb 0 255 255)`?)

<ENTER YOUR ANSWER HERE>
|#

#|
g. Check your answer by creating a set of concentric circles
of blue, the blue-green mix, and blue.
|#
(define blue-green-mix ???)

#| A |#

; +--------------------------------+---------------------------------
; | Exercise 5: Reduced components |
; +--------------------------------+

#|
a. What colors do you expect for each of the following?

(rgb 128 0 0): <ENTER YOUR ANSWER HERE>

(rgb 0 128 0): <ENTER YOUR ANSWER HERE>

(rgb 0 0 128): <ENTER YOUR ANSWER HERE>
|#

#|
b. Check your answer experimentally by creating an appropriate
color palette or set of concentric circles.
|#
(define half-primaries ???)

#|
c. What colors do you expect for each of the following?

(rgb 128 128 0): <ENTER YOUR ANSWER HERE>

(rgb 0 128 128): <ENTER YOUR ANSWER HERE>

(rgb 128 0 128): <ENTER YOUR ANSWER HERE>
|#

#|
d. Check your answer experimentally by creating an appropriate
color palette or set of concentric circles.
|#
(define half-secondaries ???)

; +-----------------------------+------------------------------------
; | Exercise 6: Darker versions |
; +-----------------------------+

#|
As you learned in the prior exercise (or perhaps the reading), we can
get a darker version of a color by using lower number for each of the
components.
|#

#|
a. Write a procedure, `(color-darker c)`, that produces a darker version
of `c` by reducing each component by 32, stopping at 0 when subtracting
32 would drop the component by 0.  (Fortunately, `rgb` does that last
bit for you.)
|#

;;; (color-darker c) -> color?
;;;   c : color?
;;; Create a darker version of 
(define color-darker
  (lambda (c)
    ???))

#|
b. Verify that it seems to work appropriately by creating a darker
version of the kitten.

    > (image-map color-darker kitten)

|#

#| B |#

; +---------------------------------------+--------------------------
; | Exercise 7: Exploring transformations |
; +---------------------------------------+

#|
a. Write a procedure, `(darker-versions c)`, that takes a color as
a parameter and produces an image that contains (a) concentric
circles of `c`, `(color-darker c)`, and `(color-darker (color-darker c))
and (b) a color palette of those same three colors, stacked on
top of each other.
|#

;;; (darker-versions c) -> image?
;;;   c : color?
;;; Create an image that shows c along with two darker versions of c.
(define darker-versions
  (lambda (c)
    ???))

#|
b. Write a procedure, `(red-green-merged-versions c)`, that takes a
color as a parameter and does the same thing as `darker-versions`,
except that it uses `color-merge-red-green` rather than `color-darker`.
|#

;;; (red-green-merged-versions c) -> image?
;;;   c : color?
;;; Create an image that shows c along with two versions of c in which
;;; the red and green components are somewhat merged.
(define red-green-merged-versions
  ???)

#|
c. Write a procedure, `(complemented-versions c)`, that takes a
color as a parameter and does something similar to the last two
procedures, using `color-pseudo-complement`.
|#

;;; (complemented-versions c) -> image?
;;;   c : color?
;;; Create an image that shows c along with a complemented version of
;;; c and a complemented version of the complemented version of c.
(define complemented-versions
  ???)

; +---------------------------------------+--------------------------
; | Exercise 8: Exploring transformations |
; +---------------------------------------+

#|
a. Write a procedure, `(color-restrict c)`, that produces a new version
of `c` in which each component is restricted to the range [64..92],
with components above 192 dropped to 192 and components below 64 raised
to 64.  Note that clever application of `min` and `max` should help 
you with this.
|#

;;; (color-restrict c) -> color?
;;;   c : color?
;;; Produce a new color in which the components are like those of c,
;;; but restricted to no more than 192 and no less than 64.
(define color-restrict
  (lambda (c)
    ???))

#|
You can run the following tests on the procedure by removing the comment
block symbols (#| and |#) around them.
|#

#|
(test-equal? "Color-restrict white" 
             (color-restrict (rgb 255 255 255))
             (rgb 192 192 192))
(test-equal? "Color-restrict black"
             (color-restrict (rgb 0 0 0))
             (rgb 64 64 64))
(test-equal? "Color-restrict grey"
             (color-restrict (rgb 128 128 128))
             (rgb 128 128 128))
(test-equal? "Color-restrict mixed-values (128/30/200)"
             (color-restrict (rgb 128 30 200))
             (rgb 128 64 192))
(test-equal? "Color-restrict red"
             (color-restrict (rgb 255 0 0))
             (rgb 192 0 0))
|#

#|
b. Verify that it seems to work appropriately by creating a restricted
version of the kitten.

    > (image-map color-restrict kitten)

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
b. Make sure that this file is named `rgb-colors.rkt`.
c. Submit this final file to Gradescope.  Make sure to submit your work 
   as a group submission and include your partner in the submission.
d. Wait for the autograder results to make sure that you met the
   basic goals.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you should try one or more of
the following exercises.  
|#

; +---------------------------------------+--------------------------
; | Extra 1: Pseudo-complements revisited |
; +---------------------------------------+

#|
As you may recall from the discussion of pseudo-complements, there
are many ways to think about a pseudo-complement for RGB colors.  In
addition to the way we've used (subtracting each component from 255),
we might instead subtract each component from the maximum component
or do some other computation.

Write a procedure, `(color-pseudo-complement-alt c)`, that computes
a new color by subtracting each component from the maximum of the
three components.
|#

;;; (color-pseudo-complement-alt c) -> color?
;;;   c : color?
;;; Yet another pseudo complement procedure.
(define color-pseudo-complement-alt
  (lambda (c)
    ???))

; +------------------------+-----------------------------------------
; | Extra 2: Redder images |
; +------------------------+

#|
There are (at least) two ways to make a color appear redder: You can
add to the red component or you can subtract from the green and the
blue components.  (The latter may not work so well if you have no
red to start with.)
|#

#|
a. Write a procedure, `(color-redder-a c)`, that produces a redder
version of `c` by adding 64 to the red component.
|#

#|
b. Write a procedure, `(color-redder-b c)`, that produces a redder
version of `c` by subtracting 64 from the green and blue components.
|#

#|
c. Write a procedure, `(color-rdder-c c)`, that produces a redder
version of `c` by adding 32 to the red component and subtracting 32
from each of the green and blue components.
|#

#|
d. Try each procedure on the kitten to see which version you find
most successful.

    > (image-map color-redder-a kitten)
    > (image-map color-redder-b kitten)
    > (image-map color-redder-c kitten)
|#

