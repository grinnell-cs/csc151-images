#lang racket

(require csc151)

;;; image-transformations.rkt
;;;   A variety of procedures that transform images, created for MP3 in
;;;   CSC-151-XX 2024Sp.
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by SamR and Leah.  That code includes 
;;;   this header, the "provided code" section below, and a bit of
;;;   other material.

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (rgb-swap-rb c) -> rgb?
;;;   c : rgb?
;;; Swap the red and blue components of `c`.
(define rgb-swap-rb
  (lambda (c)
    (rgb (rgb-blue c)
         (rgb-green c)
         (rgb-red c))))

;;; (swap-red-blue img) -> image?
;;;   img : image?
;;; Create a new image by swapping the red and blue components of
;;; each pixel in `img`.
(define swap-red-blue-old
  (lambda (img)
    (pixel-map rgb-swap-rb img)))

(define swap-red-blue
  (lambda (img)
    (pixel-map (lambda (c)
                 (rgb (rgb-blue c)
                      (rgb-green c)
                      (rgb-red c)))
               img)))

;;; (decrease-green img) -> image?
;;;   img : image?
;;; Create a new image by making each pixel of `img` less green (and
;;; a bit more blue and red).
(define decrease-green
  (lambda (img)
    (pixel-map (o rgb-pseudo-complement rgb-greener rgb-pseudo-complement)
               img)))

;;; (cyclic-add-90 n) -> integer?
;;;   n : integer?
;;; Add 90 to `n`, wrapping around when we hit 256.
(define cyclic-add-90
  (lambda (val)
    (remainder (+ val 90) 256)))

; +-------------------------------------+----------------------------
; | Part one: RGB-based transformations |
; +-------------------------------------+

;;; (rgb-extreme color) -> rgb?
;;;   color : rgb?
;;; ???
(define rgb-extreme
  ???)

;;; (extreme img) -> image?
;;;   img : image?
;;; ???
(define extreme
  (cut (pixel-map rgb-extreme <>)))

;;; (rgb-enhance-dominance color) -> rgb?
;;;   color : rgb?
;;; ???
(define rgb-enhance-dominance
  ???)

;;; (enhance-dominance img) -> image?
;;;   img : image?
;;; ???
(define enhance-dominance
  (cut (pixel-map rgb-enhance-dominance <>)))

;;; (image-flatten-32 img) -> image?
;;;   img : image?
;;; ???
(define image-flatten
  ???)

;;; (8bit img) -> image?
;;;   img : image?
;;; ???
(define 8bit
  ???)

;;; (rgb-cyclic-add c1 c2) -> rgb?
;;;   c1 : rgb?
;;;   c2 : rgb?
;;; "Cyclically add" the corresponding components of c1 and c2,
;;; wrapping around to lower values when we reach 256.
(define rgb-cyclic-add
  ???)

;;; (rgb-cyclic-subtract c1 c2) -> rgb?
;;;   c1 : rgb?
;;;   c2 : rgb?
;;; "Cyclically subtract" each component of `c2` from the corresponding 
;;; components of c1, wrapping around to 255 when we go below zero.
(define rgb-cyclic-subtract
  ???)

;;; (gamma-correct-component component gamma) -> nonnegative-integer?
;;;   component : (all-of nonnegative-integer? (less-than 256))
;;;   gamma : non-negative-real?
;;; Gamma correct `component` by `gamma` using the standard formula.
(define gamma-correct-component
  ???)

;;; 
;;; (gamma-correct-color c gamma) -> rgb?
;;;   c : rgb?
;;;   gamma : real?
;;; Gamma correct `c` by `gamma` by gamma correcting each component
;;; by `gamma`.
(define gamma-correct-color
  ????)

;;; (gamma-correct-two img) -> image?
;;;   img : image?
;;; Gamma correct `img` by correcting each pixel by 2.
(define gamma-correct-color-two
  ???)

;;; (gamma-correct-half img) -> image?
;;;   img : image?
;;; Gamma correct `c` by correcting each component by 1/2.
(define gamma-correct-half
  ???)

; +-------------------------------------+----------------------------
; | Part two: HSV-based transformations |
; +-------------------------------------+

;;; (hsv->string c) -> string?
;;;   c : hsv?
;;; Convert `c` to a string of the form `"hue-saturation-value-alpha"`.
(define hsv->string
  (lambda (c)
    (param-check! hsv->string 1 hsv? c)
    "300-100-100-255")) ; STUB

; +-----------------------+------------------------------------------
; | Part three: Freestyle |
; +-----------------------+
