;;; shape-lists.rkt
;;;   A variety of procedures that transform images, created for MP4 in
;;;   CSC-151-XX 24fa.
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * Starter code provided by PM and Leah.  That code includes 
;;;   this header, the "provided code" section below, and a bit of
;;;   other material.
;;; * ...

(import image)
(import lab)
(import test)

(title "Shape Lists")

(part "Provided shapes and code")

(description "Shapes...")

(define red-narrow
  (solid-rectangle 10 20 "red"))

(define red-medium
  (solid-rectangle 20 20 "red"))

(define red-wide
  (solid-rectangle 30 20 "red"))

(define blue-narrow
  (image-recolor red-narrow "blue"))

(define blue-medium
  (image-recolor red-medium "blue"))

(define blue-wide
  (image-recolor red-wide "blue"))

(define purple-narrow
  (image-recolor red-narrow "purple"))

(define purple-medium
  (image-recolor red-medium "purple"))

(define purple-wide
  (image-recolor red-wide "purple"))

(description "Code...")

;;; (shape->ellipse? shape) -> ellipse?
;;;   shape : shape?
;;; Convert `shape` to an ellipse of the same width, height, and color.
(define shape->ellipse
  (lambda (shape)
    (solid-ellipse (image-width shape)
                   (image-height shape)
                   (image-color shape))))


;;; (thickly-outlined-ellipse width height color) -> ellipse?
;;;   width : positive-real?
;;;   height : positive-real?
;;;   color : color?
;;; Convert `shape` to an ellipse of the given width and height that is
;;; then outlined with a thick black line.
(define thickly-outlined-ellipse
  (lambda (width height color)
    (overlay (outlined-ellipse width height "black" 10)
             (solid-ellipse width height color))))

;;; (shape->thickly-outlined-ellipse shape) -> ellipse?
;;;   shape : shape?
;;; Convert `shape` to an ellipse of the same width, height, and color
;;; that is then outlined in a thick black line.
(define shape->thickly-outlined-ellipse
  (lambda (shape)
    (thickly-outlined-ellipse (image-width shape)
                              (image-height shape)
                              (image-color shape))))

;;; (shape-params shape) -> list?
;;;   shape : shape?
;;; Create a list of the width, height, and color of the image.
(define shape-params
  (lambda (img)
    (list (image-width img) (image-height img) (image-color img))))

;;; (five-variants shape) -> (list-of basic-image?)
;;;   shape : basic-image?
;;; Create a list of five shapes based on the original shape.
;;;
;;; * The first shape is 1/3 the width and much darker.
;;; * The second shape is 1/3 the width and slightly darker.
;;; * The third shape is the same.
;;; * The fourth shape is 4/3 the width and slightly lighter.
;;; * The fifth shape is 5/3 the width and much lighter.
(define five-variants
  (lambda (shape)
    (apply five-variants/helper (shape-params shape))))

;;; (five-variants/helper width height color) -> (list-of shape?)
;;;   width : nonnegative-integer?
;;;   height : nonnegative-integer?
;;;   color : rgb?
;;; Create a list of five shapes based on `width`, `height`, and
;;; `color`. See `five-variants` for the details.
(define five-variants/helper
  (lambda (width height color)
    (list (solid-rectangle (* 1/3 width) height (rgb-darker (rgb-darker color)))
          (solid-rectangle (* 2/3 width) height (rgb-darker color))
          (solid-rectangle width height color)
          (solid-rectangle (* 4/3 width) height (rgb-lighter color))
          (solid-rectangle (* 5/3 width) height (rgb-lighter (rgb-lighter color))))))

;;; (shape-list? val) -> boolean?
;;;   val : any?
;;; Determines whether `val` is a list of shapes.
(define shape-list?
  (list-of shape?))

;;; (slightly-nested-shape-list? val) -> boolean?
;;;   val : any?
;;; Determines whether `val` is a slightly-nested shape list. That is,
;;; a list of shapes and shape lists.
(define slightly-nested-shape-list?
  (list-of (any-of shape? (list-of shape?))))

;;; (doubly-nested-shape-list? val) -> boolean?
;;;   val : any?
;;; Determines whether `val` is a doubly-nested shape list. That is,
;;; a list of shapes, shape lists, and slightly-nested shape lists.
(define doubly-nested-shape-list?
  (list-of (any-of shape? 
                   slightly-nested-shape-list?)))

; ;;; (image-list? val) -> boolean?
; ;;;   val : any?
; ;;; Determines whether `val` is a list of images.
; (define image-list?
;   (list-of image?))

; ;;; (slightly-nested-image-list? val) -> boolean?
; ;;;   val : any?
; ;;; Determines whether `val` is a slightly-nested image list. That is,
; ;;; a list of images and image lists.
; (define slightly-nested-image-list?
;   (list-of (any-of image? (list-of image?))))

; ;;; (doubly-nested-image-list? val) -> boolean?
; ;;;   val : any?
; ;;; Determines whether `val` is a doubly-nested image list. That is,
; ;;; a list of images, image lists, and slightly-nested image lists.
; (define doubly-nested-image-list?
;   (list-of (any-of image? 
;                    slightly-nested-image-list?)))

(part "Part 1: Making lists of shape parameters")

(problem "a. color-variants-0")

;;; (color-variants-0 shape) -> {??}
;;;    shape : shape?
;;; {??}
(define color-variants-0
  (lambda (shape)
    {??}))

; (test-equal? "color-variants-0: Middle grey"
;              (color-variants-0 (solid-rectangle 30 30 (rgb 128 128 128)))
;              (list (solid-rectangle 30 30 (rgb 128 128 128))
;                    (solid-rectangle 30 30 (rgb-redder (rgb 128 128 128)))
;                    (solid-rectangle 30 30 (rgb-greener (rgb 128 128 128)))
;                    (solid-rectangle 30 30 (rgb-bluer (rgb 128 128 128)))))

(problem "b. color-variants-1")

;;; (color-variants-1 shapes) -> (list-of (list-of shape?))
;;;   shapes : (list-of shape?)
;;; Apply `color-variants-0` to each element of `shapes`.
(define color-variants-1
  (lambda (shapes)
    {??}))

(problem "c. color-variants-1x")

;;; (color-variants-1x stuff) -> (any-of (list-of shape?) (list-of (list-of shape?)))
;;;   stuff : (any-of shape? (list-of shape?))
;;; Make variants of all the shapes in `stuff`.
(define color-variants-1x
  (lambda (stuff)
    {??}))

(problem "d. color-variants-2")

;;; (color-variants-2 stuff) -> doubly-nested-shape-list?
;;;   stuff : slightly-nested-shape-list?
;;; Make variants of all the shapes in `stuff`.
(define color-variants-2
  (lambda (stuff)
    {??}))

(part "Part 2: Transforming lists of shapes")

(problem "a. shape->solid-isosceles-triangle")

;;; (shape->solid-isosceles-triangle shape) -> shape?
;;;   shape : shape?
;;; {??}
(define shape->solid-isosceles-triangle
  {??})

(problem "b. shapes->solid-isosceles-triangles-0")

;;; (shapes->solid-isosceles-triangles-0 shapes) -> (list-of shape?)
;;;   shapes : (list-of shape?)
;;; Convert all of the shapes in `shapes` to corresponding solid
;;; isosceles triangles.
(define shapes->solid-isosceles-triangles-0
  {??})

(problem "c. shapes->solid-isosceles-triangles-1")

;;; (shapes->solid-isosceles-triangles-1 shapes) -> slightly-nested-shape-list?
;;;   shapes : slightly-nested-shape-list?
;;; Convert all of the shapes in `shapes` to corresponding solid
;;; isosceles triangles.
(define shapes->solid-isosceles-triangles-1
  {??})

(problem "d. shapes->solid-isosceles-triangles-2")

;;; (shapes->solid-isosceles-triangles-2 shapes) -> doubly-nested-shape-list?
;;;   shapes : doubly-nested-shape-list?
;;; Convert all of the shapes in `shapes` to corresponding solid
;;; isosceles triangles.
(define shapes->solid-isosceles-triangles-2
  {??})

(part "Part 3: Combining images")

(problem "a. stack")

;;; (stack images) -> image?
;;;   images : (list-of image?)
;;; {??}
(define stack
  {??})

(problem "b. sequence")

;;; (sequence images) -> {??}
;;;   images : {??}
;;; {??}
(define sequence 
  {??})

(problem "c. stack-then-sequence")

;;; (stack-then-sequence images) -> {??}
;;;   images : {??}
;;; {??}
(define stack-then-sequence 
  {??})

(problem "d. sequence-then-stack")

;;; (sequence-then-stack images) -> {??}
;;;   images : {??}
;;; {??}
(define sequence-then-stack 
  {??})

(problem "e. sequence-then-stack-then-sequence")

;;; (sequence-then-stack-then-sequence images) -> {??}
;;;   images : {??}
;;; {??}
(define sequence-then-stack-then-sequence
  {??})

(problem "f. stack-then-sequence-then-stack")
  
;;; (stack-then-sequence-then-stack images) -> {??}
;;;   images : {??}
;;; {??}
(define stack-then-sequence-then-stack 
  {??})

