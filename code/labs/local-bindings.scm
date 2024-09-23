;; CSC 151 (SEMESTER)
;; Lab: Local Bindings (local-bindings.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import image)
(import lab)
(import test)

(display (title "Local Bindings"))

; In this lab, you and your partner will write some more complicated
; code than previous labs and manage that complexity with let-bindings.
; Side-A should drive first with Side-B navigating.  Once you are
; done with Side A's exercises, you can switch roles and move to Side B's
; exercises.  

; You may find these are bit more involved than previous problems,
; so make sure to collaborate well together and work efficiently!

(display (problem "Nesting let expressions"))

; (A side drives)

; a. Write a *nested* `let`-expression that binds a total of five
; names, `alpha`, `beta`, `gamma`, `delta`, and `epsilon`.  With
; `alpha` bound to the value 7, and each subsequent value to twice
; the previous value. That is, `beta` should be 2 times `alpha`, 
; `gamma` should be two times `beta`, , and so on and so forth.  The
; body of the innermost `let` should make a list from those values.

; Your result will look something like this:

; (let ([___ ___])
;   (let ([___ ___])
;     (let ([___ ___])
;       (let ([___ ___])
;         (let ([___ ___])
;           (list alpha beta gamma delta epsilon))))))

; The final value should be something like

; (list 7 14 28 56 112)

(define nested-let-7
  "TODO: write the nested let here")

(test-case "nested-let-7"
  equal?
  (list 7 14 28 56 112)
  (lambda () nested-let-7))

; b. Duplicate `nested-let-7` below but bind `alpha` to `(/ 1 3)`.  The
; remaining name should still be bound to subsequently doubled versions
; of `alpha`.  Observe how little of the code you need to change to make
; this work!

(define nested-let-1/3
  "TODO: write the nested let here")

(test-case "nested-let-1/3"
  equal?
  (list (/ 1 3) (* 2 (/ 1 3)) (* 4 (/ 1 3)) (* 8 (/ 1 3)) (* 16 (/ 1 3)))
  (lambda () nested-let-1/3))

; c. Create a `let*`-expression equivalent to `nested-let-1/3` above.

(define nested-let*
  "TODO: write the nested let* here")

(test-case "nested-let*"
  equal?
  (list (/ 1 3) (* 2 (/ 1 3)) (* 4 (/ 1 3)) (* 8 (/ 1 3)) (* 16 (/ 1 3)))
  (lambda () nested-let*))

; d. It is likely that you came up with a solution to part b that
; looks something like the following.

; (let* ([alpha (/ 1 3)]
;        [beta (* 2 alpha)]
;        [gamma (* 2 beta)]
;        ...)
;   (list alpha beta gamma delta epsilon))

; What if you decided that instead of doubling each previous value, you
; wanted to add three to that value?  You'll have four different
; expressions to change, which is annoying to modify in your code.

; Rewrite the expression to use the name `fun` for what needs to be done
; to each element of the list.  Your expression should look something
; like the following.

; (let* ([fun (lambda (x) (* 2 x))]
;        [alpha (/ 1 3)]
;        [beta (fun alpha)]
;        ...)
;   ...)

(define nested-let*-fun
  "TODO: write the updated let* here")

(test-case "nested-let*-fun"
  equal?
  (list (/ 1 3) (* 2 (/ 1 3)) (* 4 (/ 1 3)) (* 8 (/ 1 3)) (* 16 (/ 1 3)))
  (lambda () nested-let*-fun))

; e. Duplicate and modify nested-let*-fun so that `alpha` starts at 1
; and `fun` divides its parameter by 3.  Before running your code,
; predict the result.  Finally, check your answer experimentally.

(define updated-nested-let*-fun
  "TODO: write the final let* here")

(test-case "updated-nested-let*-fun"
  equal?
  (list 1 (/ 1 3) (/ 1 (expt 3 2)) (/ 1 (expt 3 3)) (/ 1 (expt 3 4)))
  (lambda () updated-nested-let*-fun))

(display (problem "Observing bindings"))
(display (description "(Answers are in the comments!)"))

; let* and let allow to perform the same behavior: binding local
; names to reduce redundancy in our programs. However, the way that
; they mechanically operate is different!
;
; Write additional code below to explore how let behaves versus let*
; in your various definitions. Answer the following questions in the
; space below:
;
; (a) What is the difference in how let binds names versus let*?
; (b) In general, we want to avoid binding names that will not be
;     used. Such unused names potentially make our code less
;     readable e.g., our future selves asking "why did I bind this
;     name and not use it?"
;
;     With this in mind, in what situations do we want to prefer
;     using let versus let*? Which of the two should be our "default"
;     option when needing to bind local names?

(display (problem "Ordering bindings"))
(display (description "(Answers are in the comments!)"))

; In the reading, we noted that it is possible to move bindings outside
; of the lambda in a procedure definition. In particular, we noted
; that the first of the two following versions of years-to-seconds
; required recomputation of seconds-per-year every time it was called
; while the second required that computation only once.

; a. Confirm that both appear to work correctly.

; c. Write code below to confirm that years-to-seconds-a does,
;    in fact, recompute the values each time it is called.

; d. Confirm that years-to-seconds-b does not recompute the values each
;    time it is called.

; e. Given that years-to-seconds-b does not recompute each time, when
;    does it do the computation?

(define years-to-seconds-a
  (lambda (years)
    (let* ([days-per-year 365.24]
           [hours-per-day 24]
           [minutes-per-hour 60]
           [seconds-per-minute 60]
           [seconds-per-year (* days-per-year hours-per-day
                                minutes-per-hour seconds-per-minute)])
      (* years seconds-per-year))))

(define years-to-seconds-b
  (let* ([days-per-year 365.24]
         [hours-per-day 24]
         [minutes-per-hour 60]
         [seconds-per-minute 60]
         [seconds-per-year (* days-per-year hours-per-day
                              minutes-per-hour seconds-per-minute)])
    (lambda (years)
      (* years seconds-per-year))))

(display (problem "Making change"))

; (B side drives)

; Write a function `(make-change cents)` that takes a positive integer
; as input and returns a list of four integers. These integers
; correspond to the number of quarters (25 cents), dimes (10 cents),
; nickels (5 cents), and pennies (1 cent) used to make change for
; `cents`. The amounts returned should reflect the *minimal number
; of coins* used to make up the desired number of cents. For example:

; > (make-change 118)
; (list 4 1 1 3)

; Note that the `list` function makes a list of values drawn from its
; arguments.
;
; NOTE: you've seen this function before in a previous lab! However,
; please try to write up the solution without referring to that previous
; lab, so you get practice designing programs with let-bindings!

; The standard change-making algorithm is an example of an *greedy
; algorithm*. You compute the change by first figuring out the number of
; quarters to use, then the number of dimes, then nickels, and final
; cents, in-order.  To do this, you will find the functions `quotient`
; and `remainder` useful.

(define make-change
  (lambda (cents)
    ; TODO: Fill me in!
    (list 0 0 0 0)))

(test-case "make-change example: 89 cents"
  equal?
  (list 3 1 0 4)
  (lambda () (make-change 89)))

; Side note: While the greedy "use as many quarters as possible" works
; for this set of denominations of coins, it turns out that it doesn't
; work for all sets.  Suppose, for example, that there were no nickles.
; If we wanted to make 30 cents, we should use three dimes.  However,
; the greedy algorithm says to take a quarter, which would then require
; five pennies to make thirty cents.  

; In your spare time (not now), consider how you might handle issues 
; like that.  (If you continue with the CS major, you'll learn an
; algorithm in either CSC 207 or CSC 301.)

(display (problem "Nested bindings"))
(display (description "(Answers are in the comments!)"))

; a. Consider the following `sample2` procedure.  
;
; Trace the computation of `(sample2 10)`.
;
;      (sample2 10)
; ---> 
;
; After answering, check your answer.

(define sample2
  (lambda (x)
    (list x
          (let ([x (+ x 1)])
            (list x)))))


; b. Consider the following definition of `sample3`.  What do you
; expect the output of (sample3 10) to be?
;
; Check your answer experimentally.
;
; <TODO: ENTER YOUR ANSWER HERE>
;
; If your answer doesn't match, trace the computation.
;
;      (sample3 10)
; ---> 
;

(define sample3
  (lambda (x)
    (list x
          (let ([x (+ x 1)]
                [y (+ x 1)])
            (list x y)))))

; c. Consider the following definition of `sample4`.  What do you
; expect the output of (sample4 10) to be?
;
; <TODO: ENTER YOUR ANSWER HERE>
;
; Check your answer experimentally.
;
; If your answer doesn't match, trace the computation.
;
;      (sample4 10)
; ---> 

(define sample4
  (lambda (x)
    (list x
          (let* ([x (+ x 1)]
                 [y (+ x 1)])
            (list x y)))))

(display (problem "Removing Redundancy"))

; One of the primary uses for `let` bindings is to remove redundancy
; from code _after_ we have written an initial draft. Remove the
; redundancy from the following functions by rewriting each using a
; a `let`/`let*` binding. Ensure that the test cases continue to pass
; for each function!

; (Side A drives!)

(define trees
  (lambda (sz)
    (beside
      (above (overlay
               (triangle (* sz 1.5) "outline" "black")
               (triangle (* sz 1.5) "solid" "green"))
             (overlay
               (rectangle (/ sz 2) (* sz 2) "outline" "black")
               (rectangle (/ sz 2) (* sz 2) "solid" "brown")))
      (above (overlay
               (triangle (* sz 1.5) "outline" "black")
               (triangle (* sz 1.5) "solid" "green"))
             (overlay
               (rectangle (/ sz 2) (* sz 2) "outline" "black")
               (rectangle (/ sz 2) (* sz 2) "solid" "brown")))
      (above (overlay
               (triangle (* sz 1.5) "outline" "black")
               (triangle (* sz 1.5) "solid" "green"))
             (overlay
               (rectangle (/ sz 2) (* sz 2) "outline" "black")
               (rectangle (/ sz 2) (* sz 2) "solid" "brown"))))))

(display (description "(You should see three trees below!)"))
(display (trees 100))

; (Side B drives!)

(define adjusted-diff-of-extremes
  (lambda (lst)
    (- (|> lst
           (section map (lambda (n) (/ n 2)) _)
           (section reduce max _))
       (|> lst
           (section map (lambda (n) (/ n 2)) _)
           (section reduce min _)))))

(test-case "adjusted-diff-of-extremes"
  equal?
  7.5
  (lambda () (adjusted-diff-of-extremes (list -5 4 8 2 6 1 10))))

; +-------------+----------------------------------------------------
; | Wrapping up |
; +-------------+

; Make sure that you save local-bindings.scm as a text file and submit
; that file on Gradescope.