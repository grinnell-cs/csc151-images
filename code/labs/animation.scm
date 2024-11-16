;; CSC 151 (SEMESTER)
;; Lab: Animation (animation.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import canvas)
(import image)
(import lab)

(title "Animation")

;; In today's lab, we'll explore how to 
;;
;; (Just like the previous lab, alternate driver-navigator roles with your
;; partner on every function that you write.)

;; -----------------------------------------------------------------------------
(problem "Problem 1: Time")

;; The time parameter passed to the callback function is integral for
;; controlling an animation. Recall that the time parameter is the elapsed
;; time in milliseconds.
;;
;; To begin, add code below so that time-canvas displays the elapsed time.
;; You'll find the canvas-text! function of the canvas library useful for this
;; task. Additionally, don't forget to clear the canvas on every call to the
;; callback function.

(define time-canvas (make-canvas 250 250))
(ignore
  (canvas-rectangle! time-canvas 0 0 250 250 "solid" (rgb 245 235 200)))

(description "Time Example")

; TOOD: add your animation code here!

(display time-canvas)

;; Note that I didn't say what the "elapsed time" was! With your animated
;; time-canvas, experiment a bit by rerunning your program repeatedly and/or
;; refreshing the page. When we say that the time parameter is the "elapsed
;; time," what point in time is this relative to?

(description "The time parameter is the time elapsed since... <TODO: fill me in!>")

;; Finally, modify your animation above so that in addition to the raw value
;; of the time parameter, you use the time parameter to display a counter that
;; counts from 0 up to 10 seconds, restarts at 0, and repeats.
;;
;; (_Hint_: use division, remainder, and round to convert the time parameter
;;          as needed.)

;; -----------------------------------------------------------------------------
(problem "Problem 2: Movement")

;; We can create a cyclic counter using the time parameter and remainder, which
;; is useful for creating repetitive animation such as simple movement. For this
;; problem you will draw a collection of shapes, each of which has the following
;; properties (if a property is not specified, e.g., a size, you may choose
;; any reasonable values!)
;;
;; + A red circle of radius 10 that starts at the left edge of the canvas,
;;   moves to the right, and wraps back around to the left edge when it reaches
;;   the right edge.
;; + A green ball that starts with radius 10 and then grows to radius 100
;;   before resetting back to 10.
;; + A blue square that changes color from a dark blue to a light blue, then
;;   resets to its original dark blue color before repeating. (Hint:
;;   create rgb values directly rather than use rgb-darker!)
;; + A purple rectangle that spins repeatedly.
;;
;; The shapes should move slow enough that the pattern of their movement is
;; evident from inspection. To do this you should set a fixed period of time
;; for the animation to occur, e.g., 2 seconds. From there, you can use
;; remainder on the time to create a counter that repeatedly counts up to 2
;; seconds.

(define movement-canvas (make-canvas 250 250))
(ignore
  (canvas-rectangle! movement-canvas 0 0 250 250 "solid" (rgb 200 235 245)))

(description "Movement Example")

(display movement-canvas)

;; -----------------------------------------------------------------------------
(problem "Problem 3: State")

;; Recall that we can use reference cells to store state that can be modified
;; over the course of an animation or through user interaction.
;;
;; First, let's use a reference cell in conjunction with time-canvas from the
;; first problem to add text to the canvas that records the time elapsed since
;; the last call to the callback function. To do this, you should use the
;; reference cell to record the value of the time parameter on the _previous_
;; call to animate-with. With the value of the previous time parameter, you
;; can then compute the difference as needed. Just don't forget to save the
;; the current time to your reference cell at the end of the callback!

; TODO: add your code to time-canvas back in your animation loop for problem 1.

;; Next, let's revisit our example of using state to control animation
;; playback. Below the code replicated from the reading:

(define continue? (ref #t))
(define pause-canv (make-canvas 200 200))

(description "Pausing example")
(display pause-canv)

(ignore (canvas-onclick! pause-canv
  (lambda () (ref-set! continue? (not (deref continue?))))))

(ignore
  (animate-with
    (lambda (time)
      (let ([color
             (if (> (remainder (round time) 2000) 1000)
                 "blue"
                 "red")])
        (begin
          (canvas-drawing! pause-canv 0 0
            (overlay
              (outlined-square 200 "black")
              (solid-square 150 color)))
          (deref continue?))))))

;; Observe how clicking stops the animation but clicking again does not
;; restart it, even though we negate the contents of continue? every time
;; we click. Inspect the code and determine why this might be the case:

(description "Clicking only stops the animation. Clicking again does not restart the computation because... <TODO: fill us in>)")

;; Now, fix the code so that clicking not only stops the animation but
;; resumes it when clicked again.
;;
;; (Hint: what function do we use to start the animation? We should
;;        execute this code when we click on the button and continue?
;;        is #f! This might require some refactoring of the animation
;;        loop...)

;; Finally, let's consider using state to track the position of an
;; object that we draw. This kind of pattern will be useful for situations
;; where the object's movement doesn't obey a simple pattern, e.g., if
;; it is being controlled by the user!
;;
;; For pos-canvas below, draw a ball that starts at the top-left corner
;; of the canvas and every time the user clicks on the canvas, the ball
;; moves incrementally from the top-left to the bottom-right corner. To
;; do this, what data should your reference cell contain to track the
;; position of the ball? Clicking then modifies that data and the
;; animation loop reads from it!

(define pos-canvas (make-canvas 250 250))
(ignore
  (canvas-rectangle! pos-canvas 0 0 250 250 "solid" (rgb 235 245 200)))

(description "Position Example")

(display pos-canvas)

;; -----------------------------------------------------------------------------
(problem "Problem 4: Play Around (Optional)")

;; This lab has introduced us to a variety of ways we can use animation
;; to create various effects. Feel free to design your own simple animation
;; with your partner below, using any mixture of the techniques we've
;; discussed. You may, e.g., take a drawing from a previous lab and try
;; to move, shape, or recolor it! Try to also add some form of interactivity
;; by clicking the canvas, whether it is modifying the animation in some way
;; or simply starting and stopping it!

(define play-canvas (make-canvas 250 250))
(ignore
  (canvas-rectangle! play-canvas 0 0 250 250 "solid" (rgb 245 235 200)))

(description "Playing Around!")

(display play-canvas)

