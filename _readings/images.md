---
title: Simple images in Racket
subject: |
  We consider some basic mechanisms for dealing with images in DrRacket.
prereqs: |
  [An abbreviated introduction to Racket]({{ "/readings/racket-intro.html" | relative_url }}).
  [Data types]({{ "/readings/data-types.html" | relative_url }}).
disclaimer: |
  This section discusses Racket procedures for creating images.  It
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

In considering the image data stype, we should ask ourselves the
standard set of five questions: What is the _name_ of the type? It's
"image".  What is the _purpose_ of the type?  To allow people to make
interesting images.  How do you _express_ values in this type?  We've
seen a few ways, including `circle` the and `rectangle` procedures.
There are more.  How does DrRacket _display_ values?  As the "expected"
images.  What _procedures_ are available?  We've seen that we can use
`above` and `beside`. Once again, there are more.

There's also one other question to ask for this type, since it's not a
standard type: How does one _access_ the type?  The answer is
straightforward: You add the following line to the top of your
definitions pane.

```drracket
(require 2htdp/image)
```

## Basic shapes

You've already seen two procedures for creating basic shapes:
`(circle` `radius` `mode` `color)` creates a circle and
`(rectangle` `width` `height` `mode` `color)` creates a rectangle.

```drracket
> (circle 20 "outline" "red")
![A white circle outlined by a thin red line.  The circle has a radius of 20.]({{ "/images/image-reading-01.png" | relative_url }})
> (rectangle 40 25 "solid" "blue")
![A solid blue rectangle, 40 units wide and 25 units high.  It is approximately the same width as the previous circle.]({{ "/images/image-reading-02.png" | relative_url }})
```

There are a few other things you can do with these basic shapes. If,
instead of `"outline"` or `"solid"`, you use a number between 0 and 255
for the mode, DrRacket uses that number as the _opacity_ of the shape.

```drracket
> (beside
    (rectangle 25 40 255 "blue")
    (rectangle 25 40 191 "blue")
    (rectangle 25 40 127 "blue")
    (rectangle 25 40  63 "blue"))
![A sequence of four blue rectangles, each of which appears slightly paler than the previous one.]({{ "/images/image-reading-03.png" | relative_url }})
```

Opacity will be especially important as we start to overlay shapes.

```drracket
> (define circles
    (beside
      (circle 10 255 "red")
      (circle 10 191 "red")
      (circle 10 127 "red")
      (circle 10  63 "red")))
> (above
    (overlay circles (rectangle 60 20 255 "blue"))
    (overlay circles (rectangle 60 20 191 "blue"))
    (overlay circles (rectangle 60 20 127 "blue"))
    (overlay circles (rectangle 60 20  63 "blue")))
![A complex picture consisting of sixteen red circles in a four-by-four grid overlaid on four blue rectangles.  The red circles fade from left to right and the blue rectangles fade from top to bottom.  The lighter red circles blend with the blue rectangles.]({{ "/images/image-reading-04.png" | relative_url }})
```

You can also use different "pen" values when outlining a shape.  To
create a pen, you use `(pen` `color` `width` `style` `cap` `join)` where

* `style` can be `"solid"`, `"dot"`, `"long-dash"`, `"short-dash"`, or
  `"dot-dash"`.

* `cap` can be `"round"`, `"projecting"`, or `"butt"`.

* `join` can be `"round"`, `"bevel"`, or `"miter"`.

```drracket
> (define background (rectangle 80 80 "solid" "white"))
> (beside
   (overlay (circle 30 "outline" (pen "red" 4 "solid" "round" "round"))
            background)
   (overlay (circle 30 "outline" (pen "red" 6 "dot-dash" "round" "round"))
            background)
   (overlay (circle 30 "outline" (pen "red" 8 "short-dash" "butt" "round"))
            background)
   (overlay (circle 30 "outline" (pen "red" 8 "short-dash" "projecting" "round"))
            background))
![Four large red circles.  The first has a solid outline.  The second is outlined by alternating short and long lines, each with a curved end.  The third has short line segments with large gaps between them, almost as large as the segments.  The fourth has larger segments.]({{ "/images/image-reading-05.png" | relative_url }})
```

There are also a variety of other basic shapes.
`(triangle` `edge` `mode` `color)` creates an equilateral triangle,
`(ellipse` `width` `height` `mode` `color)` creates an ellipse, and
`(star` `side` `mode` `color)` produces a five-pointed star.

```drracket
> (beside
   (ellipse 40 20 "outline" "red")
   (ellipse 20 40 "solid" "blue")
   (triangle 40 "solid" "black")
   (star 30 "solid" "teal")
   (star 20 "outline" "teal"))
![Five shapes in a row.  The first is a wide ellipse, outlined in red.  The second is a tall, thin ellipse, in solid blue.  The third is a black equilateral triangle.  The fourth is a solid teal five-pointed start.  The last is a star made of five lines.]({{ "/images/image-reading-06.png" | relative_url }})
```

You can find a host of others shapes, including nine different kinds of
triangles, a more generalized star, a variety of polygons, and even text
and curves in [The official DrRacket documentation for
images](https://docs.racket-lang.org/teachpack/2htdpimage.html).

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

In DrRacket's image model, you can use the `make-color` procedure to
create RGB colors.  `(make-color` `0` `255` `0)` makes a bright green,
`(make-color` `0` `128` `128)` makes a blue-green color, and
`(make-color` `64` `0` `64)` makes a relatively dark purple.

```drracket
> (beside (circle 20 "solid" (make-color 0 255 0))
          (circle 20 "solid" (make-color 0 128 128))
          (circle 20 "solid" (make-color 64 0 64)))
![Three circles in a row.  The first is a bright green circle.  The second is a dull teal-ish color.  The third is a very dark purple.]({{ "/images/image-reading-07.png" | relative_url }})
```

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

```drracket
> (define small-gray (circle 10 "solid" "gray"))
> (define medium-red (circle 15 "solid" "red"))
> (define large-black (circle 20 "solid" "black"))
> (beside small-gray medium-red large-black)
![Three circles in a row of increasing size.  The first is gray, the second is red, the third is black.]({{ "/images/image-reading-08.png" | relative_url }})
> (above small-gray medium-red large-black)
![Three circles in a snowman-like stack, with the smallest circle at the top of the stack.  The top circle is gray, the middle is red, the bottom is black.](../images/image-reading-09.png)
> (overlay small-gray medium-red large-black)
![A "bullseye" of sorts, gray in the center, then red, then black.]({{ "/images/image-reading-10.png" | relative_url }})
> (overlay large-black medium-red small-gray)
![A large black circle.]({{ "/images/image-reading-11.png" | relative_url }})
```

What if we don't want things aligned on centers?  The Racket iamge
library provides alternatives to these three that provide a bit more
control.

* `(beside/align alignment i1 i2 ...)` allows you to align
  side-by-side images at the top or bottom (using `"top"` and
  `"bottom"`).  You can also align at the center, mimicking `beside`,
  using `"center"` 
* `(above/align alignment i1 i2 ...)` allows
  you to align vertically stacked images at the left, right, or middle
  (using   `"left"`, `"right"`, and `'middle`). 
* `(overlay/align halign valign i1 i2 ...)` allows you to
  align overlaid images.

```drracket
> (define small-gray (circle 10 "solid" "gray"))
> (define medium-red (circle 15 "solid" "red"))
> (define large-black (circle 20 "solid" "black"))
> (beside/align "top" small-gray medium-red large-black)
![A sequence of three circles in increasing size: gray, then red, then black.  The top edges of the circles are aligned.]({{ "/images/image-reading-12.png" | relative_url }})
> (beside/align "bottom" small-gray medium-red large-black)
![A sequence of three circles in increasing size: gray, then red, then black.  The bottom edges of the circles are aligned.]({{ "/images/image-reading-13.png" | relative_url }})
> (above/align "left" small-gray medium-red large-black)
![A stack of three circles in increasing size: gray, then red, then black.  The left edges of the circles are aligned.]({{ "/images/image-reading-14.png" | relative_url }})
> (above/align "right" small-gray medium-red large-black)
![A stack of three circles in incrasing size: gray, then red, then black.  The right edges of the ricles are aligned.]({{ "/images/image-reading-15.png" | relative_url }})
> (overlay/align "left" "top" small-gray medium-red large-black)
![Three circles, or at least the impression of three circles.  A small gray circle is completely visible.  The gray circle obscures the top-left portion of a larger red circle.  That red circle obscures the top-left portion of a black circle.]({{ "/images/image-reading-16.png" | relative_url }})
> (overlay/align "left" "center" small-gray medium-red large-black)
![Three circles, or at least the impression thereof.  A small gray circle is cimplegely visible.  It obscures the left portion of a larger red circle, which obscures the left portion of larger black circle.]({{ "/images/image-reading-17.png" | relative_url }})
> (overlay/align "left" "bottom" small-gray medium-red large-black)
![Three circles, or at least the impression of three circles.  A small gray circle is completely visible.  The gray circle obscures the bottom-left portion of a larger red circle.  That red circle obscures the bottom-left portion of a black circle.]({{ "/images/image-reading-18.png" | relative_url }})
> (overlay/align "right" "top" small-gray medium-red large-black)
![Three circles, or at least the impression of three circles.  A small gray circle is completely visible.  The gray circle obscures the top-right portion of a larger red circle.  That red circle obscures the top-right portion of a black circle.]({{ "/images/image-reading-19.png" | relative_url }})
> (overlay/align "right" "top" large-black medium-red small-gray)
![A large black circle.  A small sliver of red is at the top right, and a sliver of grey is after that.]({{ "/images/image-reading-20.png" | relative_url }})
```

As the overlay examples suggest, the alignment is based on the "bounding
box" of each image, the smallest rectangle that encloses the image.

There's also another way to overlay images: You can offset the second
one relative to the first with
`(overlay-offset` `i1` `xoff` `yoff` `i2)`.  In this case, the second
one is offset by the specified amount from its original position.

```drracket
> (define medium-red (circle 15 "solid" "red"))
> (define medium-black (circle 15 "solid" "black"))
> (overlay/offset medium-red 2 6 medium-black)
![A red circle and the impression of a black circle.  The bottom of the black circle is visible, shifted slightly to the right.]({{ "/images/image-reading-21.png" | relative_url }})
> (overlay/offset medium-red 6 2 medium-black)
![A red circle and the impression of a black circle.  The right of the black circle is visible, shifted slightly down.]({{ "/images/image-reading-22.png" | relative_url }})
> (overlay/offset medium-red -3 -3 medium-black)
![A red circle and the impression of a black circle.  The black circle is represented by a small arc to the top-left of the red circle.]({{ "/images/image-reading-23.png" | relative_url }})
```

## Self Checks

### Check 1: A simple checkerboard

Write instructions for making a two-by-two checkerboard.

### Check 2: Iconic images

Write instructions for making a simple smiley face.

## Acknowledgements

This section draws upon [The DrRacket HtDP/2e Image
Guide](https://docs.racket-lang.org/teachpack/2htdpimage.html).  The
discussion of colors comes from [a reading from Grinnell's CSC
151](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2017S/readings/rgb-early-reading.html).
