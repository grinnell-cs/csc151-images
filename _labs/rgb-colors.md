---
title: RGB colors
summary: |
  We explore techniques for building and transforming RGB colors.
---

Procedures to remember
----------------------

Basic color procedures

* `(rgb r g b)` - create a new RGB color.
* `(rgb-red c)` - extract the red component of an rgb color.
* `(rgb-green c)` - extract the green component of an rgb color.
* `(rgb-blue c)` - extract the blue component of an rgb color.
* `(color-red c)` - extract the red component of a color.
* `(color-green c)` - extract the green component of a color.
* `(color-blue c)` - extract the blue component of a color.

Working with color names

* `(all-color-names)` - list all the color names.
* `(color-name->rgb name)` - convert a color name to an RGB color.
* `(find-colors name)` - find all the colors that include name.

Working with images

* `(image-load name)` - load an image.
* `(pixel-map color-transformation image)` 

The lab
-------

* Use the file [rgb-colors.rkt](../code/labs/rgb-colors.rkt)
* You should also download a copy of [the kitten image](../images/kitten.jpg) to your desktop.

Acknowledgements
----------------

The kitten image was downloaded from <http://public-photo.net/displayimage-2485.html>.  Unfortunately, the site behind that URL has disappeared.  Nonetheless, the kitten image lives on.
