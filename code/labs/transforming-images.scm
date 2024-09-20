;; CSC 151-NN (TERM)
;; Lab: Transforming Images
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import image)
(import lab)

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

; a. Introduce yourself to your partner.
;
; b. Discuss any issues that will contribute to a more successful 
;    partnership.
;
; c. Load the lab and readings pages in your Web browser so that you
;    have them available for reference.
;
; d. The person closer to the board is A.  The person further from the 
;    board is B.

; -------------------------------------------------------------------
(problem "Exercise 1: Loading images")

; (Side A drives!)

; In this exercise, we'll review how to load images since it'll be
; integral to completing today's lab and the week's assessment!
;
; a. If you haven't already done so, find an image you like, such as
; your campus directory picture (or President Harris' directory picture,
; or your instructor's directory picture) and save to your MathLAN
; account.

; b. Verify that you can load that image into your program using the
; `with-image-file` function. You can simply output the image back
; to the screen in your callback function.

(description "An image that I like...")
; TODO: write your image-loading code here

; c. Verify that you can load the stock kitten image with the
;    `with-image-from-url`. The URL of the kitten image is:
;
;    https://scamper.cs.grinnell.edu/images/kitten.jpg
;
;    In your callback function, use `pixel-map` and `rgb-bluer` to
;    transform the image so it is a little bit bluer.

(description "A bluer kitten")
; TODO: write your image-loading code here

; d. Observe that you can download the bluer kitten image (or any
;    other image for that matter) by right-clicking the image and
;    choosing "Save image as..." Save the image to your desktop and
;    double-click the resulting file to verify its contents.

; Since we will likely access the kitten URL string repeatedly,
; here is a quick definition to make life easier:

(define kitten "https://scamper.cs.grinnell.edu/images/kitten.jpg")

; -------------------------------------------------------------------
(problem "Exercise 2: Exploring transformations")


; Remind yourself of what some of the basic RGB transformers do by applying 
; them to `(rgb 127 128 129)` and any other colors you think will be useful. 
; Copy and paste your results from the interactions pane into the comments
; below.

; Include notes to yourselves as appropriate.

; Please use the steps in `rgb-darker` as an example.

(description "Preparation")

(display (rgb 127 128 129))
(display (rgb->string (rgb 127 128 129)))

(description "rgb-darker")

(display (rgb-darker (rgb 127 128 129)))
(display (rgb->string (rgb-darker (rgb 127 128 129))))

; TODO: fill in two other example colors below, displaying both the
;       color and the result of calling rgb->string on that color.
;
; <Fill me in notes about this function or delete if not needed>
  
(description "rgb-lighter")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

(description "rgb-redder")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

(description "rgb-greener")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

(description "rgb-bluer")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

(description "rgb-pseudo-complement")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

(description "rgb-greyscale")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

(description "rgb-phaseshift")

; TOOD: fill in with at least three example colors modified by the
;       function and their rgb strings.
;
; <Fill me in with notes about this function or delete if not needed>

; -------------------------------------------------------------------
(problem "Exercise 3: Composed transformations")

; As you may recall, the compose procedure, `o` , joins together multiple
; procedures, applying each in sequence from right to left.

; Consider the following definition.

(define rgb-transform-3a 
  (o rgb-redder rgb-pseudo-complement))

; a. What color (RGB components) do you expect to get for each of
; the following? First, guess the result (a rough estimate of the
; resulting rgb values), summarizing your guess in the description
; and then uncomment the invocation to check your work.

(description "rgb-transform-3a (guess 1): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3a (rgb 127 127 127)))

(description "rgb-transform-3a (guess 12: <TODO: fill me in!>")
; (rgb->string (rgb-transform-3a (rgb 255 0 0)))

(description "rgb-transform-3a (guess 3): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3a (rgb 0 255 0)))

; b. Consider the following definition.

(define rgb-transform-3b
  (o rgb-pseudo-complement rgb-redder))

; a. What color (RGB components) do you expect to get for each of
; the following? First, guess the result (a rough estimate of the
; resulting rgb values), summarizing your guess in the description
; and then uncomment the invocation to check your work.


(description "rgb-transform-3b (guess 1): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3b (rgb 127 127 127)))

(description "rgb-transform-3b (guess 2): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3b (rgb 255 0 0)))

(description "rgb-transform-3b (guess 3): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3b (rgb 0 255 0)))

; c. Consider the following definition.

(define rgb-transform-3c
  (o rgb-redder rgb-redder rgb-bluer rgb-bluer))

; Same deal! Guess and check what will happen with this transformation.

(description "rgb-transform-3c (guess 1): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3c (rgb 127 127 127)))

(description "rgb-transform-3c (guess 2): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3c (rgb 255 0 0)))

(description "rgb-transform-3c (guess 3): <TODO: fill me in!>")
; (rgb->string (rgb-transform-3c (rgb 0 255 0)))


; d. Using `pixel-map`, apply `rgb-transform-3a` and `rgb-transform-3b`
; to both your sample image and the kitten image and summarize the
; differences as best you can.

(description "mapped 3a transformations")

(description "mapped 3b transformations")

(description "differences between 3a 3b: <TODO: fill me in!>")

; TODO: fill me in with calls to load-image-from-file and
; load-image-from-url that transform the images with rgb-transform-3a
; and rgb-transform-3b.

; e. Using `pixel-map`, apply `rgb-transform-3c` to the kitten image and
; your sample image and summarize the differences as best you can.

(description "mapped 3c transformations")

(description "differences between original and 3c: <TODO: fill me in!>")

; f. Using the composition operation, `o`, and the basic rgb transformations,
; write a procedure, `rgb-less-red`, that makes its parameter less red.

(define rgb-less-red
  (o {??}))

; g. Consider the following transformation.

(define rgb-transform-g
  (o rgb-darker rgb-darker rgb-lighter rgb-lighter))

; At first glance, `rgb-transform-g` seems to return its input value.

(rgb->string (rgb-transform-g (rgb 128 128 128))) ; rgb(128 128 128 / 100%)

(rgb->string (rgb-transform-g (rgb 60 70 80)))    ; rgb(60 70 80 / 100%)

; Are there any colors for which `rgb-transform-g` does *not* return
; the same color? Answer in the description below and in a sentence,
; explain why!

(description "Are there any colors for which rgb-transform-g does not return the same color?")
(description "> <TODO: fill me in!>")

; What effect, if any, do you expect `rgb-transform-g` to have
; on an image?  (That is, what do you expect for something like
; `(pixel-map rgb-transform-g img)`?).

(description "What effect, if any, do you expect `rgb-transform-g` to have on an image?`")
(description "> <TODO: fill me in!>")

; -------------------------------------------------------------------
(problem "Exercise 4: Sectioning arithmetic expressions")

; (Side B drives!)

; As you may recall from the reading, the `section` special form creates
; a new procedure from an existing procedure by filling in some of the
; arguments.
;
; In this lab, we will first consider the effect of `section` on some
; basic  arithmetic operations.
;
; Consider each of the following definitions.

(define add10 (section + 10 _))
(define add11 (section + _ 11))
(define sub5 (section - 5 _))
(define sub6 (section - _ 6))
(define rem7a (section remainder _ 7))
(define rem7b (section remainder 7 _))

; a. What value do you expect to get if you apply each of these
;    procedures to the value 12? What about the value 5? Write your
;    guess in the description and then uncomment each expression to
;    check your work. If any of your guesses are wrong, capture your
;    misunderstanding in the description.

(description "(add10 12) --> <TODO: fill me in>")
; (add10 12)

(description "(add10 5) --> <TODO: fill me in>")
; (add10 5)

(description "(add11 12) --> <TODO: fill me in>")
; (add11 12)

(description "(add11 5) --> <TODO: fill me in>")
; (add11 5)

(description "(sub5 12) --> <TODO: fill me in>")
; (sub5 12)

(description "(sub5 5) --> <TODO: fill me in>")
; (sub5 5)

(description "(sub6 12) --> <TODO: fill me in>")
; (sub6 12)

(description "(sub6 5) --> <TODO: fill me in>")
; (sub6 5)

(description "(rem7a 12) --> <TODO: fill me in>")
; (rem7a 12)

(description "(rem7a 5) --> <TODO: fill me in>")
; (rem7a 5)

(description "(rem7b 12) --> <TODO: fill me in>")
; (rem7b 12)

(description "(rem7b 5) --> <TODO: fill me in>")
; (rem7b 5)

; Summarize in your own words in the description below
;
; (a) What is the purpose of section?
; (b) How does section work? What does it do?
;
; Check your answers with a member of the course staff
; before continuing!

(description "The purpose of section is... <TODO: fill me in!>")

(description "Section works by... <TODO: fill me in!>")

; -------------------------------------------------------------------
(problem "Exercise 5: Composing sectioned procedures")

; (Side B drives!)

; Consider the following procedure.

(define proc5
  (o (section * 5 _) (section - _ 2)))

; a. In your own words, what should `proc5` do? Write your response
; in a sentence or two below.

(description "`proc5`... <TODO: fill me in!>")

; b. What values do you expect to get when you apply `proc5` to the
; inputs 1, 2, 3, 4, and 5? Again, make a guess, fill in your guess
; in the description, and then check your work by uncommenting the
; appropriate expression.

(description "(proc5 1) --> <TODO: fill me in!>")
; (proc5 1)

(description "(proc5 2) --> <TODO: fill me in!>")
;(proc5 2)

(description "(proc5 3) --> <TODO: fill me in!>")
; (proc5 3)

(description "(proc5 4) --> <TODO: fill me in!>")
; (proc5 4)

(description "(proc5 5) --> <TODO: fill me in!>")
; (proc5 5)


; d. Describe what `proc5` does, i.e., what does it take as input
;    and what does it produce as output?

(description "proc5... <TODO: fill me in!>")

; e. In your own words, explain how the definition achieves that
;    result. In other words, how does the body of the function
;    achieve the effect you described above?

(description "proc5 does this by... <TODO: fill me in!>")

; -------------------------------------------------------------------
(problem "Exercise 6: Combining colors")

; (Side A drives)

; Determine what each of the following procedures does. You may want to
; read documentation (such as it is) and conduct experiments. Write
; your answer in each description tag below:


; a. `(rgb-add c1 c2)`

(description "rgb-add... <TODO: fill me in!>")

; b. `(rgb-subtract c1 c2)`

(description "rgb-subtract... <TODO: fill me in!>")

; c. `(rgb-average c1 c2)`

(description "rgb-average... <TODO: fill me in!>")

; -------------------------------------------------------------------
(problem "Exercise 7: Image transformations, revisited")

; (Side A drives)

; Determine what each of the following procedures does. You may want to
; inspect the implementation and conduct experiments. Write your
; answer in each description tag below:

; a. `transform-image-7a`

(define transform-image-7a
  (lambda (img)
    (pixel-map (o rgb-bluer rgb-redder) img)))

(description "transform-image-7a... <TODO: fill me in!>")

; b. `transform-image-7b`

(define transform-image-7b
  (lambda (img)
    (pixel-map (o rgb-pseudo-complement rgb-greener rgb-pseudo-complement) img)))

(description "transform-image-7b... <TODO: fill me in!>")

; c. `transform-image-7c`

(define transform-image-7c
  (lambda (img)
    (pixel-map (section image-subtract _ (rgb 100 0 100)) img)))

(description "transform-image-7c... <TODO: fill me in!>")

; d. `transform-image-7d`

(define transform-image-7d
  (lambda (img)
    (pixel-map (section image-subtract (rgb 255 255 255) _) img)))

(description "transform-image-7d... <TODO: fill me in!>")

; -------------------------------------------------------------------
(problem "Exercise 8: Image transformations, revisited")

; (Side B drives!)

; Determine what each of the following procedures does. You may want to
; inspect the implementation and conduct experiments. Write your
; answer in each description tag below:

; a. `transform-image-8a`

(define transform-image-8a
  (section pixel-map rgb-bluer _))

(description "transform-image-8a... <TODO: fill me in!>")

; b. `transform-image-8b`

(define transform-image-8b
  (section pixel-map (o rgb-darker rgb-darker rgb-darker) _))

(description "transform-image-8b... <TODO: fill me in!>")

; c. `transform-image-8c`

(define transform-image-8c
  (section pixel-map (section rgb-add (rgb 64 0 64) _) _))

(description "transform-image-8c... <TODO: fill me in!>")

; d. `transform-image-8d`

(define transform-image-8d
  (section pixel-map (o rgb-darker
                        rgb-darker
                        (section rgb-add (rgb 64 0 64) _))
                        _))

(description "transform-image-8d... <TODO: fill me in!>")

; Finally, summarized what you learned from this problem in the
; description below.

(description "Exercise 8 showed us that... <TODO: fill me in!>")

; +----------------+-------------------------------------------------
; | Submit the lab |
; +----------------+

; You're done.  Congratulations!  It's time to submit your lab.  After
; doing so, you should review the extra problems below and, as
; appropriate, pick one or more to attempt.  We'd suggest that you
; start with the first extra problem.

; To turn in your work:

; a. Ensure that your file runs properly.  (E.g., when we click "Run", it should
;    work not produce errors.)
; b. Make sure that this file is named `transforming-images.scm`.
; c. Submit this final file to Gradescope.
; d. Make sure to submit your work as a group submission and include your 
;    partner in the submission.

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

; If you find that you have extra time, go back and look at some of the
; extra exercises on the RGB-colors lab, then think about how you might
; write them anonymously.