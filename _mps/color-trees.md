
Part four: Color trees
----------------------

A _color tree_ is a structure built from pairs and colors.  For
example, `(cons (rgb 255 0 0) (rgb 0 0 255))` is a simple color tree.

Here's a simple predicate for color trees.

```
;;; (color-tree? val) -> boolean?
;;;   val : any?
;;; Determines if `val` is a color tree.
(define color-tree?
  (lambda (val)
    (or (color? val)
        (and (pair? val)
             (color-tree? (car val))
             (color-tree? (cdr val))))))
```

Here's a procedure that converts color trees to images.

```
;;; (color-tree->image color-tree width height) -> image?
;;;   color-tree : color-tree?
;;;   width : integer?
;;;   height : integer?
;;; Convert a color tree to an image, alternately treating
;;; pairs as "split horizontally" and "split vertically".
(define color-tree->image 
  (lambda (color-tree width height)
    (if (color? color-tree)
        (rectangle width height "solid" color-tree)
        (let ([half (quotient width 2)])
          (beside (color-tree->image/alt (car color-tree) (- width half) height)
                  (color-tree->image/alt (cdr color-tree) half height))))))

;;; (color-tree->image/alt color-tree width height) -> image?
;;;   color-tree : color-tree?
;;;   width : integer?
;;;   height : integer?
;;; Convert a color tree to an image, alternately treating
;;; pairs as "split vertically" and "split horizontally".
(define color-tree->image/alt
  (lambda (color-tree width height)
    (if (color? color-tree)
        (rectangle width height "solid" color-tree)
        (let ([half (quotient height 2)])
          (above (color-tree->image (car color-tree) width (- height half))
                 (color-tree->image (cdr color-tree) width half))))))
```

Write a procedure, `(region->color-tree bitmap left top right bottom)`, that uses the following process to convert a region of a bitmap to a color tree.

* Sample five random points in the given region.
* If the five points are all similar, use the average of the five colors.
* If the five colors are not all similar
