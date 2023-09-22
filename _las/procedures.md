---
title: "Sample LA: Procedural abstraction"
---

# {{ page.title }}

_Take a concrete implementation in Racket and create a new function that generalizes the behavior._

As you may recall in building snowmen, we found it useful to be able
to create hats for the snowmen.  A hat consists of three parts: a box,
a brim, and a ribbon.  The brim is at the bottom.  The ribbon appears
to be on the box, directly above the brim, although we will create it
by stacking a rectangle over the box.

We've decided on a 50x50 grey hat with a purple ribbon.  We've
decided that brims will always be 5 units high and that ribbons
will take 1/5 the height of the box.  Rather than doing the
calculations by hand, we'll make Racket do the computations.

```racket
(above (rectangle (* 50 1/2) (* (- 50 5) 4/5) "solid" "grey")
       (rectangle (* 50 1/2) (* (- 50 5) 1/5) 192 "purple")
       (rectangle 50 5 "solid" "grey"))
```

Write a procedure, `colorful-hat`, that generalizes this approach
by taking the width, height, hat color, and ribbon color as parameters
and producing an appropriate image as output.

