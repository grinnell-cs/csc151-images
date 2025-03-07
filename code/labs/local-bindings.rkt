#lang racket

(require csc151)
; (require csc151/verbose-bindings)
(require rackunit)

;; CSC-151-NN (SEMESTER)
;; Lab: Local Bindings (local-bindings.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab, you and your partner will write some more complicated
code than previous labs and manage that complexity with let-bindings.
Side-A should drive first with Side-B navigating.  Once you are
done with Side A's exercises, you can switch roles and move to Side B's
exercises.  

You may find these are bit more involved than previous problems,
so make sure to collaborate well together and work efficiently!
|#

#| A |#

; +--------------------------------------+---------------------------
; | Exercise 1: Nesting let expressions. |
; +--------------------------------------+

#|
a. Write a *nested* `let`-expression that binds a total of five
names, `alpha`, `beta`, `gamma`, `delta`, and `epsilon`.  With
`alpha` bound to the value 7, and each subsequent value to twice
the previous value. That is, `beta` should be 2 times `alpha`, 
`gamma` should be two times `beta`, , and so on and so forth.  The body of
the innermost `let` should make a list from those values.

Your result will look something like this:

(let ([___ ___])
  (let ([___ ___])
    (let ([___ ___])
      (let ([___ ___])
        (let ([___ ___])
          (list alpha beta gamma delta epsilon))))))

The final value should be something like

'(7 14 28 56 112)
|#

(define nested-let-7
  "TODO: write the nested let here")

#|
b. Duplicate `nested-let-7` below but bind `alpha` to `1/3`.  The
remaining name should still be bound to subsequently doubled versions
of `alpha`.  Observe how little of the code you need to change to make
this work!
|#

(define nested-let-1/3
  "TODO: write the nested let here")

#|
c. Create a `let*`-expression equivalent to `nested-let-1/3` above.
|#

(define nested-let*
  "TODO: write the nested let* here")

#|
d. It is likely that you came up with a solution to part b that
looks something like the following.

(let* ([alpha 1/3]
       [beta (* 2 alpha)]
       [gamma (* 2 beta)]
       ...)
  (list alpha beta gamma delta epsilon))

What if you decided that instead of doubling each previous value, you
wanted to add three to that value?  You'll have four different
expressions to change, which is annoying to modify in your code.

Rewrite the expression to use the name `fun` for what needs to be done
to each element of the list.  Your expression should look something
like the following.

(let* ([fun (lambda (x) (* 2 x))]
       [alpha 1/3]
       [beta (fun alpha)]
       ...)
  ...)
|#

(define nested-let*-fun
  "TODO: write the updated let* here")

#|
e. Duplicate and modify nested-let*-fun so that `alpha` starts at 1
and `fun` divides its parameter by 3.  Before running your code,
predict the result.  Finally, check your answer experimentally.
|#

(define updated-nested-let*-fun
  "TODO: write the final let* here")

#| A |#

; +--------------------------------+---------------------------------
; | Exercise 2: Observing bindings |
; +--------------------------------+

#|
Bindings happen behind the scenes. It may, however, be useful to
see what bindings DrRacket is doing. The csc151 package includes a
set of operations for viewing what happens when you do a binding:
`verbose-define`, `verbose-let`, and `verbose-let*`. Since you will
rarely need these procedures, we don't include them in the primary
csc151 package. Hence, you need to require them separately.

Add the following line to the top of your definitions pane.

(require csc151/verbose-bindings)

Then rewrite the examples from above to use `verbose-let` or
`verbose-let*`, as appropriate.  
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 3: Ordering bindings |
; +-------------------------------+

#|
In the reading, we noted that it is possible to move bindings outside
of the lambda in a procedure definition. In particular, we noted
that the first of the two following versions of years-to-seconds
required recomputation of seconds-per-year every time it was called
while the second required that computation only once.

a. Confirm that both appear to work correctly.

b. Replace the `let*` with `verbose-let*`.

c. Confirm that years-to-seconds-a does, in fact, recompute the values each time it is called.

d. Confirm that years-to-seconds-b does not recompute the values each time it is called.

e. Given that years-to-seconds-b does not recompute each time, when does it 
do the computation? (Consider when you see the messages.)
|#

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

#| B |#

; +---------------------------+--------------------------------------
; | Exercise 4: Making change |
; +---------------------------+

#|
Write a function `(make-change cents)` that takes a positive integer
as input and returns a list of four integers. These integers
correspond to the number of quarters (25 cents), dimes (10 cents),
nickels (5 cents), and pennies (1 cent) used to make change for
`cents`. The amounts returned should reflect the *minimal number
of coins* used to make up the desired number of cents. For example:

> (make-change 118)
'(4 1 1 3)

The standard change-making algorithm is an example of an *greedy
algorithm*. You compute the change by first figuring out the number of
quarters to use, then the number of dimes, then nickels, and final
cents, in-order.  To do this, you will find the functions `quotient`
and `remainder` useful.
|#

(define make-change
  (lambda (cents)
    ???))

#|
Side note: While the greedy "use as many quarters as possible" works
for this set of denominations of coins, it turns out that it doesn't
work for all sets.  Suppose, for example, that there were no nickles.
If we wanted to make 30 cents, we should use three dimes.  However,
the greedy algorithm says to take a quarter, which would then require
five pennies to make thirty cents.  

In your spare time (not now), consider how you might handle issues 
like that.  (If you continue with the CS major, you'll learn an
algorithm in either CSC 207 or CSC 301.)
|#

; +-----------------------------+------------------------------------
; | Exercise 5: Nested bindings |
; +-----------------------------+

#|
a. There are two examples related to nested define expressions in
the reading, entitled sample-w/let and sample-w/define. Copy them
into your definitions pane and confirm that they work as described.

Note that you may find it useful to mouse over the various copies
of x to see where they refer.
|#

#|
b. Consider the following `sample2` procedure.  

Trace the computation of `(sample2 10)`.

     (sample2 10)
---> 

After answering, check your answer.
|#

(define sample2
  (lambda (x)
    (list x
          (let ([x (+ x 1)])
            (list x)))))


#|
c. Consider the following definition of `sample3`.  What do you
expect the output of (sample3 10) to be?

Check your answer experimentally.

<TODO: ENTER YOUR ANSWER HERE>

If your answer doesn't match, trace the computation.

     (sample3 10)
---> 
|#

(define sample3
  (lambda (x)
    (list x
          (let ([x (+ x 1)]
                [y (+ x 1)])
            (list x y)))))

#|
d. Consider the following definition of `sample4`.  What do you
expect the output of (sample4 10) to be?

<TODO: ENTER YOUR ANSWER HERE>

Check your answer experimentally.

If your answer doesn't match, trace the computation.

     (sample4 10)
---> 
|#

(define sample4
  (lambda (x)
    (list x
          (let* ([x (+ x 1)]
                 [y (+ x 1)])
            (list x y)))))

#| B |#

; +---------------------------------+--------------------------------
; | Exercise 6: Removing redundancy |
; +---------------------------------+

#|
Consider the following procedure that makes a few trees beside each
other.
|#

(define trees
  (lambda (sz)
    (beside
     (above (overlay
             (outlined-equilateral-triangle (* sz 1.5) "black" 2)
             (solid-equilateral-triangle (* sz 1.5) "green"))
            (overlay
             (outlined-rectangle (/ sz 2) (* sz 2) "black" 2)
             (solid-rectangle (/ sz 2) (* sz 2) "brown")))
     (above (overlay
             (outlined-equilateral-triangle (* sz 1.5) "black" 2)
             (solid-equilateral-triangle (* sz 1.5) "green"))
            (overlay
             (outlined-rectangle (/ sz 2) (* sz 2) "black" 2)
             (solid-rectangle (/ sz 2) (* sz 2) "brown")))
     (above (overlay
             (outlined-equilateral-triangle (* sz 1.5) "black" 2)
             (solid-equilateral-triangle (* sz 1.5) "green"))
            (overlay
             (outlined-rectangle (/ sz 2) (* sz 2) "black" 2)
             (solid-rectangle (/ sz 2) (* sz 2) "brown"))))))

#|
Rewrite the procedure using let bindings to reduce as much redundancy as 
you can.
|#

(define new-trees
  (lambda (sz)
    ???))

#| AB |#

; +-------------+----------------------------------------------------
; | Wrapping up |
; +-------------+

#|
Make sure that you save local-bindings.rkt as a text file and submit
that file on Gradescope.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

; +-------------------------+----------------------------------------
; | Extra 1: Improving code |
; +-------------------------+

#|
Find a few procedure from recent mini-projects that involve a lot of
repetition (or calling a helper procedure to reduce some of that
repetition) and rewrite them using `let` bindings.
|#

; +-----------------------+------------------------------------------
; | Extra 2: Other things |
; +-----------------------+

#|
If you find that you have extra time, please start the reading for
the next class or discuss the latest mini-project.
|#
