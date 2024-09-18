;; CSC 151-NN (TERM)
;; Lab: RGB Colors
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import image)
(import lab)
(import test)

; +-----------------------------+------------------------------------
; | Procedures from the reading |
; +-----------------------------+

;;; (rgb-pseudo-complement c) -> rgb?
;;;   c : rgb?
;;; Compute the pseudo-complement of a rgb color (already defined
;;; in the image library!)
; (define rgb-pseudo-complement
;   (lambda (c)
;     (rgb (- 255 (rgb-red c))
;          (- 255 (rgb-green c))
;          (- 255 (rgb-blue c)))))

;;; (rgb-merge-red-green c) -> rgb?
;;;   c : rgb?
;;; Make both the red and green components closer to the average of the
;;; two components.
(define rgb-merge-red-green
  (lambda (c)
    (rgb (quotient (+ (rgb-red c) (rgb-red c) (rgb-green c)) 3)
         (quotient (+ (rgb-red c) (rgb-green c) (rgb-green c)) 3)
         (rgb-blue c))))

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

; a. Introduce yourself to your partner.

; b. Discuss any issues that will contribute to a more successful 
;    partnership.

; c. Load the lab and readings pages in your Web browser so that you
;    have them available for reference.

; -------------------------------------------------------------------

(problem "Exercise 1: Previewing groups of colors")
; (Side A drives!)

; As you've likely noted, when exploring RGB colors, it's helpful to 
; be able to quickly move from the numeric description to a picture
; that shows the colors.
;
; a. Write a procedure, `(color-palette c1 c2 c3)`, that takes
; three colors as parameters and creates an image with a 20x40
; rectangle for each color and the three rectangles side-by-side
;
; +---+---+---+
; |c1 |c2 |c3 |
; +---+---+---+
;
; Note: to pass an rgb color to one of our shape-drawing functions,
; we will need to convert it to an appropriate string. The function
; (rgb->string r) serves this purpose.


;;; (rgb-palette r1 r2 r3) -> drawing?
;;;   r1 : rgb?
;;;   r2 : rgb?
;;;   r3 : rgb?
;;; Create an image that permits us to preview the three colors.
(define rgb-palette
  (lambda (r1 r2 r3)
    "TODO: implement me!"))

; b. Predict the approximate colors you will get for each of the
; following RGB combinations, preview them with `color-palette`,
; and then add any notes you have.

; i. (rgb 200 100 50)
; ii. (rgb 100 50 200)
; iii. (rgb 50 200 100)

; c. Define the value palette-pvr-sb-s as a palette made from the
; colors `"palevioletred"`, `"steelblue"`, and `"salmon"`. The
; function (color-name->rgb str) will be useful for this purpose.

;;; palette-pvr-sb-s : image?
(define palette-pvr-sb-s "TODO: implement me!")

(description "The pvr-sb-s palette")
(display palette-pvr-sb-s)

; -------------------------------------------------------------------

(problem "Exercise 2: Choosing colors")

; a. As you've noted, we regularly suggest colors for you to use.  Of
; course, you should not be limited by our suggestions for possible
; colors.  Write down the names of five of your favorite colors.
;
; i.
;
; ii.
;
; iii.
;
; iv.
;
; v.

; b. Check to see if any of them are defined using `(find-colors name)`.
; This procedure returns a list of all color names that contain `name`.
;
; For example, if one of my favorite colors is a kind of pink (say,
; hot pink), I might write,
;
;     > (find-colors "pink")
;     '("deeppink" "hotpink" "lightpink" "pink")
;
; There is nothing to submit for this sub-exercise.

; c. Define `fave1`, `fave2`, and `fave3` to be RGB colors that correspond
; to three colors you've identified.  For example,
;
;     (define fave0 (color-name->rgb "hotpink"))

(define fave1 "TODO: implement me!")

(define fave2 "TODO: implement me!")

(define fave3 "TODO: implement me!")

; d. Create a palette of these three colors.

(define faves "TODO: implement me!")

(description "Our favorite colors")
(display faves)

; -------------------------------------------------------------------

(problem "Exercise 3: Concentric color circles")
; (Side B drives!)

; a. Write a procedure, `(ccc r1 r2 r3)`, that takes three colors as
; parameters and creates an image with three concentric circles, each
; on top of the next.  The largest/back circle should be colored
; r3 and have radius 30.  The middle circle should be colored r2 and
; have radius 20.  The smallest/front circle should be colored r1 and
; have radius 10.

;;; (cc r1 r2 r3) -> image?
;;;   r1 : color?
;;;   r2 : color?
;;;   r3 : color?
;;; Create an image that permits us to preview the three colors as
;;; concentric circles.
(define ccc
  (lambda (r1 r2 r3)
    "TODO: implement me!"))

; b. Using your procedure, create an image, `concentric-faves`, that
; has three concentric circles, one each from `fave1`, `fave2, and
; `fave3`.

(define concentric-faves "TODO: implement me!")

(description "Our concentric favorites")
(display concentric-faves)

; -------------------------------------------------------------------

(problem "Exercise 4: Secondaries")

; As you may recall from the reading on design and color, in
; subtractive color, the secondary colors are created by combining
; any two primaries.  Let's try the same with RGB colors.  That
; is, we'll create "additive primaries" by setting two of the
; components to 255.

; b. What color do you expect to get if you mix red and blue?
; (That is, what color do you expect for `(rgb 255 0 255)`?)

; <ENTER YOUR ANSWER HERE>

; c. Check your answer by creating a set of concentric circles
; of red, the red-blue mix, and blue.

(define red-blue-mix "TODO: implement me!")

(description "The red-blue mix")
(display red-blue-mix)
  
; d. What color do you expect to get if you mix red and green?
; (That is, what color do you expect for `(rgb 255 255 0)`?)

; <ENTER YOUR ANSWER HERE>

; e. Check your answer by creating a set of concentric circles
; of green, the red-green mix, and red.

(define red-green-mix "TODO: implement me!")

(description "The red-green mix")
(display red-green-mix)


; f. What color do you expect to get if you mix blue and green?
; (That is, what color do you expect for `(rgb 0 255 255)`?)

; <ENTER YOUR ANSWER HERE>

; g. Check your answer by creating a set of concentric circles
; of blue, the blue-green mix, and green.

(define blue-green-mix "TODO: implement me!")

(description "The blue-green mix")
(display blue-green-mix)

; -------------------------------------------------------------------

(problem "Exercise 5: Reduced components")
; (Side A drives!)

; a. What colors do you expect for each of the following?

; (rgb 128 0 0): <ENTER YOUR ANSWER HERE>
; (rgb 0 128 0): <ENTER YOUR ANSWER HERE>
; (rgb 0 0 128): <ENTER YOUR ANSWER HERE>

; b. Check your answer experimentally by creating an appropriate
; color palette or set of concentric circles.

(define half-primaries "TODO: implement me!")

(description "Half primaries")
(display half-primaries)

; c. What colors do you expect for each of the following?

; (rgb 128 128 0): <ENTER YOUR ANSWER HERE>
; (rgb 0 128 128): <ENTER YOUR ANSWER HERE>
; (rgb 128 0 128): <ENTER YOUR ANSWER HERE>

; d. Check your answer experimentally by creating an appropriate
; color palette or set of concentric circles.

(define half-secondaries "TODO: implement me!")

(description "Half secondaries")
(display half-secondaries)

; -------------------------------------------------------------------

(problem "Exercise 6: Darker versions")

; As you learned in the prior exercise (or perhaps the reading), we can
; get a darker version of a color by using lower number for each of the
; components.

; a. Write a procedure, `(color-darker c)`, that produces a darker version
; of `c` by reducing each component by 32, stopping at 0 when subtracting
; 32 would drop the component by 0.

;;; (color-darker r) -> color?
;;;   r : rgb?
;;; Create a darker version of r
(define color-darker
  (lambda (r)
    "TODO: implement me!"))

; b. Verify that it seems to work appropriately by creating a darker
; version of the kitten.

(with-image-file
  (lambda (img)
    (pixel-map color-darker kitten)))

; -------------------------------------------------------------------

(problem "Exercise 7: Exploring transformations")
; (Side B drives!)

; a. Write a procedure, `(darker-versions r)`, that takes a rgb color as
; a parameter and produces an image that contains (a) concentric
; circles of `r`, `(color-darker r)`, and `(color-darker (color-darker r))
; and (b) a color palette of those same three colors, stacked on
; top of each other.

;;; (darker-versions r) -> image?
;;;   r : rgb?
;;; Create an image that shows r along with two darker versions of r.
(define darker-versions
  (lambda (c)
    "TODO: implement me!"))

; b. Write a procedure, `(red-green-merged-versions r)`, that takes a
; rgb color as a parameter and does the same thing as `darker-versions`,
; except that it uses `rgb-merge-red-green` rather than `color-darker`.

;;; (red-green-merged-versions r) -> image?
;;;   r : rgb?
;;; Create an image that shows r along with two versions of r in which
;;; the red and green components are somewhat merged.
(define red-green-merged-versions
  "TODO: implement me!")

; c. Write a procedure, `(complemented-versions r)`, that takes a
; rgb color as a parameter and does something similar to the last two
; procedures, using `rgb-pseudo-complement`.

;;; (complemented-versions r) -> image?
;;;   r : color?
;;; Create an image that shows r along with a complemented version of
;;; r and a complemented version of the complemented version of r.
(define complemented-versions
  "TODO: implement me!")

; -------------------------------------------------------------------

(problem "Exercise 8: Exploring transformations")

; a. Write a procedure, `(rgb-restrict r)`, that produces a new version
; of `r` in which each component is restricted to the range [64..192],
; with components above 192 dropped to 192 and components below 64 raised
; to 64.  Note that clever application of `min` and `max` should help 
; you with this.

;;; (rgb-restrict r) -> rgb?
;;;   r : rgb?
;;; Produce a new color in which the components are like those of r,
;;; but restricted to no more than 192 and no less than 64.
(define rgb-restrict
  (lambda (r)
    "TODO: implement me!"))

(test-case "Color-restrict white"
  equal? (rgb 192 192 192)
  (lambda () (rgb-restrict (rgb 255 255 255))))

(test-case "Color-restrict black"
  equal? (rgb 64 64 64)
  (lambda () (rgb-restrict (rgb 0 0 0))))

(test-case "Color-restrict grey"
  equal? (rgb 128 128 128)
  (lambda () (rgb-restrict (rgb 128 128 128))))

(test-case "Color-restrict mixed-values (128/30/200)"
  equal? (rgb 128 64 192)
  (lambda () (rgb-restrict (rgb 128 30 200))))

(test-case "Color-restrict red"
  equal? (rgb 192 64 64)
  (lambda () (rgb-restrict (rgb 255 0 0))))

; Verify that it seems to work appropriately by creating a restricted
; version of the kitten.

(description "Color-restricted image")

(with-image-file
  (lambda (img) 
    (pixel-map color-restrict img)))

; +----------------+-------------------------------------------------
; | Submit the lab |
; +----------------+

; You're done.  Congratulations!  It's time to submit your lab.  After
; doing so, you should review the extra problems below and, as
; appropriate, pick one or more to attempt.  We'd suggest that you
; start with the first extra problem.

; To turn in your work:

; a. Ensure that your file runs properly.  (E.g., when we click "Run", it should
;    work not produce errors.)
; b. Make sure that this file is named `rgb-colors.scm`.
; c. Submit this final file to Gradescope.  Make sure to submit your work 
;    as a group submission and include your partner in the submission.

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

; If you find that you have extra time, you should try one or more of
; the following exercises.  

; -------------------------------------------------------------------

(problem "Extra 1: Pseudo-complements revisited")

; As you may recall from the discussion of pseudo-complements, there
; are many ways to think about a pseudo-complement for RGB colors.  In
; addition to the way we've used (subtracting each component from 255),
; we might instead subtract each component from the maximum component
; or do some other computation.

; Write a procedure, `(color-pseudo-complement-alt c)`, that computes
; a new color by subtracting each component from the maximum of the
; three components.

;;; (color-pseudo-complement-alt c) -> rgb?
;;;   c : rgb?
;;; Yet another pseudo complement procedure.
(define color-pseudo-complement-alt
  (lambda (c)
    "TODO: implement me!"))

; -------------------------------------------------------------------
    
(problem "Extra 2: Redder images")

; There are (at least) two ways to make a color appear redder: You can
; add to the red component or you can subtract from the green and the
; blue components.  (The latter may not work so well if you have no
; red to start with.)

; a. Write a procedure, `(color-redder-a c)`, that produces a redder
; version of `c` by adding 64 to the red component.

; b. Write a procedure, `(color-redder-b c)`, that produces a redder
; version of `c` by subtracting 64 from the green and blue components.

; c. Write a procedure, `(color-redder-c c)`, that produces a redder
; version of `c` by adding 32 to the red component and subtracting 32
; from each of the green and blue components.

; d. Try each procedure on the kitten to see which version you find
; most successful (or most appropriate).

(description "Various redder images")

(with-image-file
  (lambda (img)
    (list
      (pixel-map color-redder-a img)
      (pixel-map color-redder-b img)
      (pixel-map color-redder-c img))))
