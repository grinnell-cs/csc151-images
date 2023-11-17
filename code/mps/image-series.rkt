#lang racket

(require csc151)
(require 2htdp/image)
(require rackunit)

;;; image-series.rkt
;;;   The final project for CSC-151-01 2023Fa
;;;
;;; Authors:
;;;   Person One
;;;   Person Two
;;;   Person Three
;;;
;;; Date: YYYY-MM-DD
;;;
;;; Acknowledgements
;;; 
;;; * The project template comes from SamR.

; +----------+-------------------------------------------------------
; | Time log |
; +----------+

#|
NAME    YYYY-MM-DD HH:MM-HH:MM  NN min  ACTIVITY
NAME    YYYY-MM-DD HH:MM-HH:MM  NN min  ACTIVITY
|#

; +--------------+---------------------------------------------------
; | Design goals |
; +--------------+

#|


|#

; +------------------------+-----------------------------------------
; | Requirements checklist |
; +------------------------+

#|

What are two image-making techniques you've used?  Where do you
use them?

???

What are two instances of recursion in your program? 

???

Describe a piece of code that you are particularly of.

???

|#

; +-------------------+----------------------------------------------
; | Primary procedure |
; +-------------------+

;;; (image-series n width height) -> image?
;;;   n : non-negative-integer?
;;;   width : non-negative-integer?
;;;   height : non-negative-integer?
;;; Create an image of the given width and height that meets the design
;;; goals specified above.  Given the same `n`, always creates the same 
;;; image.  Given different values of `n`, creates different images.
(define image-series
  (lambda (n)
    ???))

; +-------------------+----------------------------------------------
; | Helper procedures |
; +-------------------+
