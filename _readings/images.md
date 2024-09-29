---
title: Simple images in Scamper
subject: |
  We consider some basic mechanisms for dealing with images in Scamper.
prereqs: |
  [An abbreviated introduction to Scamper]({{ "/readings/intro-scamper.html" | relative_url }}).
disclaimer: |
  This section discusses Scamper procedures for creating images.  It
  will likely be less accessible or inaccessible to students with
  limited vision.  We apologize for these deficiencies and, upon
  request, will provide alternative exercises for those who cannot
  or prefer not to do image-based work.  We have done our best
  to provide appropriate alt text for each image.
preimg: true
---

## Introduction

In addition to supporting "standard" data types, such as numbers and
strings, Racket also includes libraries that support a number of more
sophisticated data types, including a type that the designers call
"images".  The image data type supports the creation, combination, and
manipulation of a variety of basic shapes.  Readers of an earlier
generation might consider Racket's picture type an extension of the
ColorForms that they played with as children.

In considering a new data type (and images are effectively a new data type), we should ask ourselves the standard set of five questions: 

What is the _name_ of the type? 
  : "image". 

What is the _purpose_ of the type?
  : To allow people to make interesting images.  

How do you _express_ values in this type?
  : We've seen a few ways, including the `circle` and `rectangle` procedures.  There are more.  

How does DrRacket _display_ values?
  : As the "expected" images.  
  
What _procedures_ are available?  
  : We've seen that we can use `above` and `beside`. Once again, there are more.

There's also one other question to ask for this type, since it's not a standard type: 

How does one _gain access to_ the type?  
  : The answer is straightforward: You add the following line to the top of your program:

```racket
(import image)
```

## Basic shapes

You've already seen a few procedures for creating basic shapes:

* `(circle raidus fill color)` creates a circle with the specified `radius`.
* `(rectangle width height fill color)` creates a rectangle with the specified `width` and `height`.

The `fill` argument to both shape procedures determines whether the shape is filled in.
Passing `"solid"` creates a solid (filled in) shape and `"outline"` creates an outlined (not filled in) shape.

The `color` argument specifies the color of the shape, _e.g._, `"red"` or `"cyan"`.
You can use any of the named colors supported by most browsers; see this [w3schools.com list](https://www.w3schools.com/colors/colors_names.asp) to see which named colors are available.

<pre class="scamper source">
(import image)

(circle 100 "outline" "red")

(rectangle 100 75 "solid" "blue")
</pre>

In addition, you can draw ellipses, squares, and generalized polygons:

<pre class="scamper source">
(import image)

(ellipse 80 60 "solid" "purple")

(square 100 "solid" "orange")

(ellipse 50 100 "outline" "green")
</pre>

Polygons are created via the `path` function. They are a bit more complicated. We won't discuss all the details yet, but a few examples might be of interest. Note that `(pair x y)` creates an x/y point on an upside-down coordinate system.

<pre class="scamper source">
(import image)

(path 100 50 (list (pair 0 0) (pair 100 20) (pair 30 50)) "solid" "blue")

(path 100 100 (list (pair 0 0) (pair 100 20) (pair 50 50) (pair 100 70) (pair 0 100) (pair 0 0))
              "outline" "red")
</pre>

You can (eventually) find information on more ways to make images in the [Scamper library reference](https://scamper.cs.grinnell.edu/docs/index.html).

## Combining images

By themselves, the basic images (ellipses, rectangles, etc.) do not
permit us to create much.  However, as some of the examples above
suggest, we gain a great deal of power by combining existing images into
a new image.  You're already seen three basic mechanisms for combining
images.

* `beside` places images side-by-side.  If the images have different
  heights, their vertical centers are aligned.
* `above` places images in a stack, each above the next.  If the images
  have different widths, their horizontal centers are aligned.
* `overlay` places images on top of each other.  The first image is on
  top, then the next one, and so on and so forth.  Images are aligned
  according to their centers.

<pre class="scamper source">
(import image)
(define small-gray (circle 20 "solid" "gray"))
(define medium-red (circle 30 "solid" "red"))
(define large-black (circle 40 "solid" "black"))
(beside small-gray medium-red large-black)
(above small-gray medium-red large-black)
(overlay small-gray medium-red large-black)
</pre>

When overlaying images, order matters. The first is on top of the second, the second is on top of the third, and so on and so forth.

<pre class="scamper source">
(import image)
(define small-gray (circle 20 "solid" "gray"))
(define medium-red (circle 30 "solid" "red"))
(define large-black (circle 40 "solid" "black"))
(overlay large-black medium-red small-gray)
</pre>

What if we don't want things aligned on centers?  The Scamper image library provides alternatives to these three that provide a bit more control.

* `(beside/align alignment i1 i2 ...)` allows you to align
  side-by-side images at the top or bottom (using `"top"` and
  `"bottom"`).  You can also align at the center, mimicking `beside`,
  using `"center"` 
* `(above/align alignment i1 i2 ...)` allows
  you to align vertically stacked images at the left, right, or middle
  (using   `"left"`, `"right"`, and `'middle`). 
* `(overlay/align halign valign i1 i2 ...)` allows you to
  align overlaid images.

<pre class="scamper source">
(import image)
(define small-gray (circle 20 "solid" "gray"))
(define medium-red (circle 30 "solid" "red"))
(define large-black (circle 40 "solid" "black"))
(beside/align "top" small-gray medium-red large-black)
(beside/align "bottom" small-gray medium-red large-black)
(above/align "left" small-gray medium-red large-black)
(above/align "right" small-gray medium-red large-black)
(overlay/align "left" "top" small-gray medium-red large-black)
(overlay/align "left" "center" small-gray medium-red large-black)
(overlay/align "left" "bottom" small-gray medium-red large-black)
(overlay/align "right" "top" small-gray medium-red large-black)
(overlay/align "right" "top" large-black medium-red small-gray)
</pre>

As the overlay examples suggest, the alignment is based on the "bounding box" of each image, the smallest rectangle that encloses the image.

You can (eventually) find information on more ways to combine images in the [CSC-151 library reference](https://rebelsky.cs.grinnell.edu/Courses/CSC151/reference/). (If you want others, and ask Prof. Rebelsky nicely, he might implement them.)

## Colors

While we often think of colors by name (e.g., "red", "violet", or
"burnt umber"), one of the great advantages of computational image
making is that it is possible to describe colors that do not have a
name. Moreover, it is often better to use a more precise definition than
is possible with a name. After all, we may not agree on what precisely
something like "springgreen" or "burlywood" means. (One color scheme
that we've found has both "Seattle salmon" and "Oregon salmon". Would
you know how those two colors relate?)

In fact, it may not only be more accurate to represent colors
non-textually, it may also be more _efficient_, since color names may
require the computer to look up the name in a table.

The most popular scheme for representing colors for display on the
computer screen is RGB. In this scheme, we build each color by combining
varying amounts of the three primary colors, red, green, and blue.
(What, you think that red, yellow, and blue are the primary colors? It
turns out that primary works differently when you're transmitting light,
as on the computer screen, than when you're reflecting light, as when
you color with crayons on paper.)

So, for example, purple is created by combining a lot of red, a lot of
blue, and essentially no green. You get different purple-like colors by
using different amounts of red and blue, and even different ratios of
red and blue.

When we describe the amount of red, green, and blue, we traditionally
use integers between 0 and 255 to describe each component color. Why do
we start with 0? Because we might not want any contribution from that
color. Why do we stop with 255? Because 255 is one less than 28 (256),
and it turns out that numbers between 0 and 255 are therefore easy to
represent on computers. (For those who learned binary in high school or
elsewhere, if you have exactly eight binary digits, and you only care to
represent positive numbers, you can represent exactly the integers from
0 to 255. This is akin to being able to count up to 999 with three
decimal digits.)

If there are 256 possible values for each component, then there are
16,777,216 different colors that we can represent in standard RGB. Can
the eye distinguish all of them? Not necessarily. Nonetheless, it is
useful to know that this variety is available, and many eyes can make
very fine distinctions between nearby colors.

In Scamper's image model, you can use the `color` procedure to create RGB colors.  `(color 0 255 0 1)` makes a bright green, `(color 0 128 128 1)` makes a blue-green color, and `(color 64 0 64 1)` makes a relatively dark purple.

The `color` procedure also takes a fourth parameter, which is often called the "alpha" value, and which you can think of as the _opacity_ of the color. A color with an opacity of `0` is transparent; a color with an opacity of `1` obscures anything below it. Less opaque colors also appear lighter.

<pre class="scamper source">
(import image)
(beside (circle 40 "solid" (color 0 255 0 1))
        (circle 40 "solid" (color 0 128 128 0.25))
        (circle 40 "solid" (color 64 0 64 0.75)))
</pre>

<pre class="scamper source">
(import image)
(beside
  (rectangle 25 40 "solid" (color 0 0 255 1))
  (rectangle 25 40 "solid" (color 0 0 255 0.75))
  (rectangle 25 40 "solid" (color 0 0 255 0.50))
  (rectangle 25 40 "solid" (color 0 0 255 0.25)))
</pre>

Opacity will be especially important as we start to overlay shapes.

<pre class="scamper source">
(import image)
(define circles 
  (beside
    (circle 50 "solid" (color 255 0 0 1))
    (circle 50 "solid" (color 255 0 0 0.75))
    (circle 50 "solid" (color 255 0 0 0.50))
    (circle 50 "solid" (color 255 0 0 0.25))))
(above
  (overlay circles (rectangle 60 20 "solid" (color 0 0 255 1)))
  (overlay circles (rectangle 60 20 "solid" (color 0 0 255 0.75)))
  (overlay circles (rectangle 60 20 "solid" (color 0 0 255 0.50)))
  (overlay circles (rectangle 60 20 "solid" (color 0 0 255 0.25))))
</pre>

## Self Checks

### Check 1: A simple checkerboard

Write instructions for making a two-by-two checkerboard.

### Check 2: Iconic images

Write instructions for making a simple smiley face.

## Acknowledgements

Even though we no longer use the HtDP library, this section draws upon [The DrRacket HtDP/2e Image Guide](https://docs.racket-lang.org/teachpack/2htdpimage.html).  

The discussion of colors is based on [a reading from the 2017 spring section of Grinnell's CSC 151](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2017S/readings/rgb-early-reading.html).
