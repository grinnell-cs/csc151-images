---
title: Computing bitmaps
summary: |
  We explore techniques for building and transforming images based
  on the RGB colors of their individual pixels.
---

Procedures to learn or remember
-------------------------------

```
;;; (create-bitmap func width height) -> bitmap?
;;;   func : a procedure that takes two non-negative integers as input
;;;          and returns a color
;;;   width : positive-integer?
;;;   height : positive-integer?
;;; Creates a new `width`-by-`height` bitmap by applying `func` to
;;; each (col,row) coordinate to determine the color at that position.
```

```
;;; (bitmap-pixel bitmap col row) -> color?
;;;   bitmap : bitmap?
;;;   col : non-negative-integer? (less than (bitmap-width bitmap))
;;;   row : non-negative-integer? (less than (bitmap-height bitmap))
;;; Get the color of the pixel at position (`col`,`row`) in `bitmap`.
```

```
;;; (bitmap-set-pixel! bitmap col row color) -> void?
;;;   bitmap : bitmap?
;;;   col : non-negative-integer? (less than (bitmap-width bitmap))
;;;   row : non-negative-integer? (less than (bitmap-height bitmap))
;;;   color : color?
;;; Set the color of the pixel at position (`col`,`row`) in `bitmap`.
```

```
;;; (bitmap->image bitmap) -> image?
;;;   bitmap : bitmap?
;;; Convert a bitmap into an image.  (E.g., so that we can rotate,
;;; overlay, scale, etc.)
```

```
;;; (image->bitmap image) -> bitmap?
;;;   image : image?
;;; Convert an image into a bitmap.  (E.g., so that we can get and
;;; set pixels.)
```

The lab
-------

* Welcome your partner back from break.
* Discuss normal work habits.
* Plan to keep this window available to reference the procedures.
* Update your `csc151` library.
* Use the file [bitmaps.rkt](../code/labs/bitmaps.rkt).

Acknowledgements
----------------

The procedures for this lab were newly written in Fall 2023, based on procedures from the old MediaScheme version of CSC-151.  SamR is probably responsible for both sets of procedures.

The new procedures take advantage of a wide variety of DrRacket tools.
