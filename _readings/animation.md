---
title: Animation
---

So far in the course, we have outputted static images.
However, we often want to produce the effect of _animation_ in our programs, whether it is to make our user interface snazzier or build a game.
In addition to animation, we may also want to have users _interact_ with our program in natural ways, _e.g._, via buttons or keyboard input.

In this reading, we introduce the animation and interactivity features of Scamper so that you can build true multimedia-oriented programs!

## The Canvas

All the image-rendering facilities of Scamper ultimately rely on a feature built into every modern browser, the _canvas_.
A canvas is a user-interface element that can be drawn on, similarly to a physical canvas that an artist paints on.
When we output a drawing, _e.g._,

<pre class="scamper source">
(import image)
(overlay
  (rotate 45 (solid-square 100 "purple"))
  (solid-square 100 (rgb-lighter (color-name->rgb "red"))))
</pre>

The drawing is ultimately rendered onto a canvas that is managed by the Scamper runtime.
In other words, we never had to worry about manipulating this canvas object!

However, Scamper also allows us to manipulate canvases directly.
In particular, we'll need to be able to draw on canvases in a mutating fashion in order to create the effect of animation!

The functions for manipulating canvases are found in the `canvas` library.
The key function here is `(make-canvas width height)` which makes a canvas of a given width and height.
Once a canvas is made, we can draw on it with the various functions found in the `canvas` library.
We can then render the canvas to the screen by `display`ing it.

<pre class="scamper source">
(import canvas)
(import image)

(define canv (make-canvas 200 200))
(display canv)

(ignore
  (canvas-rectangle! canv 0 0 200 200
    "outline" "black"))

(ignore 
  (canvas-rectangle! canv 25 25 150 150
    "solid" "green"))

(ignore
  (canvas-circle! canv 100 100 50 "solid" "red"))
</pre>

Unlike our drawing functions, the `canvas` drawing functions _mutate_ the canvas by drawing a shape at a particular location.
Thus, the order of our mutating calls matters; as we see from the example above, the red circle is on top of the green square because we drew the circle after the square.
The origin of a canvas is the _upper-left_ corner of the canvas and runs positively to the right and down.

This API for drawing is more low-level.
Observe how we have to specify the location of each shape that we draw and take care to paint objects in the right order.
Sometimes this trade-off is worth it, but other times, it is more convenient to use our higher-level drawing API.
We can bridge this gap by creating a drawing and then asking the canvas to render it!

<pre class="scamper source">
(import canvas)
(import image)

(define canv (make-canvas 200 200))
(display canv)

(ignore
  (canvas-drawing! canv 0 0
    (overlay
      (outlined-square 200 "black")
      (solid-circle 50 "red")
      (solid-square 150 "green"))))
</pre>

## Animation

With our mutable canvas, we can now code up the effect of animation!
The critical function here is `animate-with`.
`(animate-with func)` takes a function as input and calls this function repeatedly at a rate of approximately 60 times per second.
This function `func` takes the _current time in milliseconds_ and performs a task.
`func` should return `#t` if `animate-with` should continue calling it, otherwise, it should return `#f` which terminates this looping process.

We can use `animate-with` to create the effect of animation by providing a function that paints onto the canvas on every call.
For example, here is an invocation of `animate-with` that alternates the color of the square every second:

<pre class="scamper source">
(import canvas)
(import image)

(define canv (make-canvas 200 200))
(display canv)

(ignore
  (animate-with
    (lambda (time)
      (let ([color
             (if (> (remainder (round time) 2000) 1000)
                 "blue"
                 "red")])
        (begin
          (canvas-drawing! canv 0 0
            (overlay
              (outlined-square 200 "black")
              (solid-square 150 color)))
          #t)))))
</pre>

The color of the square is dependent on the `time` passed to the function we provide to `animate-with`.
Because `time`'s unit is milliseconds, we can check to see if a second has passed by checking the remainder of the time after dividing it by 2000, _i.e._, 2 seconds.
This remainder computation effectively makes the timer oscillate between zero and two seconds; at this time, we simply check to see if we are in the 0–1 or 1–2 second range and pick a color based off of that.

An important note about painting on the canvas is that _we do not clear the contents of the canvas automatically_.
We can see this by drawing an image where its position is based on the time:

<pre class="scamper source">
(import canvas)
(import image)

(define canv (make-canvas 200 200))
(display canv)

(ignore
  (animate-with
    (lambda (time)
      (let ([pos (remainder (round time) 200)])
      (begin
        (canvas-rectangle! canv 0 0 200 200 "outline" "black")
        (canvas-circle! canv pos pos 25 "solid" "green")
        #t)))))
</pre>

Becuase the canvas's contents are not wiped on each animation frame, we "smear" the circle across the canvas!
To fix this, we need to manually wipe the screen by painting over it.

<pre class="scamper source">
(import canvas)
(import image)

(define canv (make-canvas 200 200))
(display canv)

(ignore
  (animate-with
    (lambda (time)
      (let ([pos (remainder (round time) 200)])
      (begin
        ; This first solid white rectangle "wipes" the canvas!
        (canvas-rectangle! canv 0 0 200 200 "solid" "white")
        (canvas-rectangle! canv 0 0 200 200 "outline" "black")
        (canvas-circle! canv pos pos 25 "solid" "green")
        #t)))))
</pre>

## Interactivity

We can see that all of our animations above run forever.
This is not always desirable!
However, it is not obvious how we should _signal_ to our animation function that it should return `#f` instead of `#t`.

To do this, we'll maintain a piece of mutable state that indicates whether the animation should continue.
Using a vector for this purpose is overkill because we only need a single mutable slot!
Thus, we'll use a _reference cell_ for this purpose, essentially a one-element vector with a simpler API.

+   `(ref v)` makes a reference cell initially holding the value `v`.
+   `(deref r)` returns the value contained in the reference cell `r`.
+   `(ref-set! r v)` makes cell `r` contain value `v`.

Finally, to allow the user to toggle the state of the animation, we'll use `canvas-onclick!` to _register a callback function_ with the canvas that is run whenever the canvas is clicked by the user.
This function will _toggle_ the boolean found in the reference cell.
Once the boolean is toggled off, the animation ends!

<pre class="scamper source">
(import canvas)
(import image)

(define continue? (ref #t))

(define canv (make-canvas 200 200))
(display canv)

(ignore (canvas-onclick! canv
  (lambda () (ref-set! continue? (not (deref continue?))))))

(ignore
  (animate-with
    (lambda (time)
      (let ([color
             (if (> (remainder (round time) 2000) 1000)
                 "blue"
                 "red")])
        (begin
          (canvas-drawing! canv 0 0
            (overlay
              (outlined-square 200 "black")
              (solid-square 150 color)))
          (deref continue?))))))
</pre>

## Self-Checks

### Problem: Take-off, for real! (‡)

Here is an oldie but a goodie, a rocket ship:

<pre class="scamper source">
(import image)

(define rocket
  (above
    (solid-triangle 50 "green")
    (solid-square 50 "blue")
    (solid-square 50 "green")
    (solid-triangle 50 "red")))

(display rocket)
</pre>

Use a canvas and `animate-with` to try to create an animation where the rocket ship progresses from the bottom of the screen to the top!

As a starting point, you can try adapting the ball-animation code from above to change the $y$-coordinate that you draw the rocket ship at in some fashion.