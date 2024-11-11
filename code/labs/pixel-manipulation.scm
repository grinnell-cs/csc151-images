;; CSC 151 (SEMESTER)
;; Lab: Pixel Manipulation
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import image)
(import lab)
(import test)

(title "Pixel Manipulation")

;; -----------------------------------------------------------------------------
(part "Provided Definitions")

;;; (with-kitten func) -> any?
;;;   func: function? that takes an image as input.
;;; Outputs the result of calling func with our canonical kitten.jpg file.
(define with-kitten
  (lambda (func)
    (with-image-from-url
      "https://scamper.cs.grinnell.edu/images/kitten.jpg"
      func)))

;;; (identity x) -> any?
;;;   x: any?
;;; The identity function: returns its argument unmodified
(define identity
  (lambda (x) x))

(description "The identity kitten.")

; N.B., when using with-kitten, you should provide your own image-manipulating
; function instead of the identity function!
(display
  (with-kitten identity))

;; -----------------------------------------------------------------------------
(part "Part 1. Images as Vectors of Pixels")

;; In a previous assessment, we manipulated images by uniformally transforming
;; each pixel via the pixel-map function. With vectors, we can achieve the same
;; effect but because of the random-access nature of vectors, we can also
;; perform computation on different parts of the image or computation that
;; relies on more than just the pixel we're manipulating!

;; In this first part, let's replicate an effect we achieved with pixel-map,
;; brightening an image, but using vector-manipulation functions. The key to
;; our new workflow is a pair of functions which allows us to translate between
;; an image and a vector of pixels:
;;
;; + (image->pixels img) returns a vector of rgb values representing the
;;   pixels of the image.
;; + (pixels->image pixels width height) returns an image constructed from
;;   the given vector of pixels with the provided width and height.
;;
;; Our workflow will look as follows:
;;
;; 1. Retrieve the pixels of the given image as a vector.
;; 2. Perform a computation over the vector.
;; 3. Create a new image with the modified vector.
;;
;; The new image will be of the same dimenions as the old image. We can
;; retrieve the dimensions of the original image using the (image-width img)
;; and (image-height img) functions.

;; With these things in mind, implement (image-brighten image) below which
;; takes an image as input and returns the original image, but brighter.
;; To achieve this effect, apply the rgb-lighter function three times to
;; each pixel of the image.
;;
;; (Hint: use vector-map! and compose (o) to easily apply rgb-lighter
;; three times once you have a handle on the pixels of the image.)

(define image-brighten
  (lambda (image)
    ; TODO: implement me!
    (identity image)))

(description "A brightened kitten.")

(display
  (with-kitten image-brighten))

;; -----------------------------------------------------------------------------
(part "Part 2. Flattening images to vectors")

;; In the previous part, you may have noticed that we took a two-dimensional
;; image and "collapsed" it into a one-dimensional vector. What gives!? It turns
;; out that given the width and height of the image, we can translate between
;; the two-dimensional and one-dimensional representations quite easily!
;;
;; For example, consider the following diagram outlining the pixels of a 6x4
;; pixel image, We'll denote each pixel by its (x,y) location in the image
;; where (0,0) is in the top-left.
;;
;; p00 p10 p20 p30 p40 p50
;; p01 p11 p21 p31 p41 p51
;; p02 p12 p22 p32 p42 p52
;; p03 p13 p23 p33 p43 p53
;;
;; How can we place these pixels into a linear vector? A simple strategy, the
;; one that our image library uses, is to place each row into the vector, one
;; after the other. This is called a row-major representation of the image:
;;
;; p00 p10 p20 p30 p40 p50 p01 p11 p21 p31 p41 p51 p02 p12 p22...

(problem "Problem 2a: coord-index translation")

;; Suppose that we want to retrieve a pixel at a particular position in the
;; image. Let's write a pair of functions that allow us to convert between the
;; two representations. Use the concrete example above to derive formulae
;; to convert between the two. One test case is provided for you below; try to
;; write at least two more to make sure your functions work!

;;; (coord->index x y width height) -> number?
;;;   x: number? a valid x-position in a width x height image
;;;   y: number? a valid y-position in a width x height image
;;;   width: number? a valid image size
;;;   height: number? a valid image size
;;; Returns the index of (x, y) in the image of size width x height.
(define coord->index
  (lambda (x y width height)
    ; TODO: implement me!
    {??}))

;;; (index->coord idx width height) -> pair?
;;;   idx: number? a valid index into a vector of pixels for an image
;;;     of size width x height.
;;;   width: number? a valid image size
;;;   height: number? a valid image size
;;; Returns a pair of coordinates corresponding to index idx of a vector
;;; of pixels for an image of size width x height.
(define index->coord
  (lambda (idx width height)
    ; TODO: implement me!
    {??}))

(test-case "coord->index (2,1) for 6x4"
  equal? 8
  (lambda ()
    (coord->index 2 1 6 4)))

(test-case "index->coord 8 for 6x4"
  equal? (pair 2 1)
  (lambda ()
    (index->coord 8 6 4)))

(test-case "roundtrip coord-index (2,1) for 6x4"
  equal? (pair 2 1)
  (lambda ()
    (index->coord (coord->index 2 1 6 4) 6 4)))

(problem "Problem 2b: row filling")

;; Now, let's use these functions to get a neat effect: scanlines!
;; Scanlines are a graphical artifact from the old days of CRT
;; televisions that operated by applying a electron gun to
;; a phospherous screen. The alternating black lines between lines
;; of image were an artifact of this process.
;;
;; To do this, first write the key function, fill-row, which
;; fills in a complete row of an image's pixels with a given color.

;;; (fill-row pixels y width height color) -> void
;;;   pixels: vector? of pixels of an image of size width x height
;;;   y: number? a valid y-coordinate of the image
;;;   width: number? a valid image size
;;;   height: number? a valid image size
;;;   color: rgb?
;;; Fills the yth row of the image with the given color.
(define fill-row
  (lambda (pixels y width height color)
    (vector-for-each
      (lambda (x)
        (vector-set! pixels (+ (* y width) x) color))
      (vector-range 0 width))))

;; Next, write a function image-fill-row that takes an image, row,
;; and color, and produces that image, but with the given row
;; filled in with that color.

;;; (image-fill-row image y color) -> image?
;;;   image: image?
;;;   y: number? a valid y-coordinate of the image
;;;   color: rgb?
;;; Returns a new image that is the result of filling the yth row
;;; of the input image with the provided color.
(define image-fill-row
  (lambda (image y color)
    ; TODO: fill me in
    image))

(description "A kitten with the 32th row blacked out")

(display
  (with-kitten
    (lambda (img) (image-fill-row img 32 (rgb 0 0 0)))))

(problem "Problem 2c: scanlines")

;;; (image-horizontal-scanlines image) -> image?
;;;   image: image?
;;; Returns a new image that is the result of filling every other
;;; row of the input image with black pixels.
(define image-horizontal-scanlines
  (lambda (image)
    ; TODO: fill me in
    image))

(description "A kitten with horizontal scanlines")

(display
  (with-kitten image-horizontal-scanlines))

;; -----------------------------------------------------------------------------
(part "Part 3. Shapes Revisited")

;; Since we can write to arbitrary pixels of an image, we no longer need a
;; genuine image file to make an image; we can do it ourselves! For example,
;; here is a simple black square. (Quick check: why does the vector have size
;; 4096. Where does that come from?)

(define black-square
  (pixels->image (make-vector 4096 (rgb 0 0 0)) 64 64))

(description "A handmade black square.")

(display black-square)

(problem "3a. draw-rectangle")

;; Write a function (draw-rectangle image x y width height color) which draws
;; a 1-pixel wide outline of a rectangle of size width x height with its
;; upper-right corner at position (x,y).

(define draw-rectangle
  (lambda (image x y width height color)
    ;; TODO: implement me!
    image))

;; TODO: include a call to your draw-rectangle function along with a
;;       description to demonstrate that it works!

(problem "3b. draw-x")

;; Write a function (draw-x image x y size color) which draws a 1-pixel "X",
;; i.e., two diagonal lines of size (size x size), in the given color. The
;; upper-left corner of the X is given by (x,y).

(define draw-x
  (lambda (image x y size color)
    ;; TODO: implement me!
    image))

;; -----------------------------------------------------------------------------
(part "Part 4. Scaling")

(problem "Problem 4a: image-scale-double")

;; Another transformation we can consider over an image is changing its size
;; in a uniform manner, i.e., scaling. There are many ways to scale an image;
;; for this problem, we'll consider simply doubling the size of an image. Let's
;; go back to our 2d schematic of an 6x4 image:
;;
;; p00 p10 p20 p30 p40 p50
;; p01 p11 p21 p31 p41 p51
;; p02 p12 p22 p32 p42 p52
;; p03 p13 p23 p33 p43 p53
;;
;; A simple way to scale this image is to make each 1x1 pixel into an effective
;; 2x2 pixel:
;;
;; p00 p00 p10 p10 p20 p20 p30 p30 p40 p40 p50 p50
;; p00 p00 p10 p10 p20 p20 p30 p30 p40 p40 p50 p50
;; p01 p01 p11 p11 p21 p21 p31 p31 p41 p41 p51 p51
;; p01 p01 p11 p11 p21 p21 p31 p31 p41 p41 p51 p51
;; p02 p02 p12 p12 p22 p22 p32 p32 p42 p42 p52 p52
;; p02 p02 p12 p12 p22 p22 p32 p32 p42 p42 p52 p52
;; p03 p03 p13 p13 p23 p23 p33 p33 p43 p43 p53 p53
;; p03 p03 p13 p13 p23 p23 p33 p33 p43 p43 p53 p53
;;
;; With this in mind, write a function (image-scale-double image) that returns
;; a new image that is scaled-up version of the input image that is double the
;; width and height of the original.

(define image-scale-double
  (lambda (image)
    ; TODO: implement me!
    image))

(description "A double-sized kitten.")

(display
  (with-kitten image-scale-double))

(problem "Problem 4b: image-scale-up (optional)")

;; If you have time, feel free to generalize image-scale-double so that it
;; takes an additional parameter: the factor by which to scale! Factor is
;; assumed to be a natural number so that you increasing the size of the image
;; by 1x, 2x, 3x, etc.
;;
;; For even more of a challenge, accept _any_ number greater than equal to 1,
;; i.e., any growth factor. Note that if we accept a number between 0 and 1,
;; we'll shrink the image and our simple algorithm won't apply! We'll need to
;; think of something else... perhaps in a future assessment!

(define image-scale
  (lambda (image factor)
    ; TODO: implement me
    image))

(description "A triple-sized kitten.")

(display
  (with-kitten (lambda (img) (image-scale img 3))))