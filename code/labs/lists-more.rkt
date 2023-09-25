#lang racket

;; CSC-151 (SEMESTER)
;; Lab: More Fun with Lists
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-----------------------+------------------------------------------
; | Requirements and such |
; +-----------------------+

(provide (all-defined-out))
(require csc151)
(require 2htdp/image)
(require rackunit)

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

#|
In this lab, you and your partner will practice manipulating lists
using the big-three higher-order functions: map, filter, and reduce.
There are four exercises; here's the division.

Exercise 1: A-Side
Exercise 2: B-Side
Exercise 3: A-Side
Exercise 4: B-Side

The person with the problem description should drive and their
partner should navigate.  Again, make sure to be good partners and
focus completely on solving the current problem together rather than
working ahead on your own.

a. Don't forget our "start of session".  Chat with your partner
about working habits and strengths.  Maybe share something interesting
about yourself.

b. If you haven't done so yet, make sure to open tabs in your browser
for the lab and the recent readings.

c. Do't forget to save this file as `lists-more.rkt`!
|#

#| A |#

; +---------------------------------+--------------------------------
; | Exercise 1: Manipulating a list |
; +---------------------------------+

#|
Complete each of the definitions that manipulate ex-1-list in various sorts
of ways using one or more of the big three functions.  You may also use the
other standard library functions for lists (e.g., length) when appropriate.
|#

(define ex-1-list (list 25 25 23 5 21 20 20 18 10 1 22 21))

; Increments the value of each element of the list `ex-1-list` by 5
(define ex-1-list-adjusted "<TODO: fill me in>")

#|
(test-equal? "Adjusting the list"
             ex-1-list-adjusted
             '(30 30 28 10 26 25 25 23 15 6 27 26))
|#

; Keeps only the elements of the list that are greater than 10.
(define ex-1-list-filtered "<TODO: fill me in>")

#|
(test-equal? "Filtering the list"
             ex-1-list-filtered
             '(25 25 23 21 20 20 18 22 21))
|#

; Computes the average of the list (Hint: this computation is more
; than just a single call to reduce!)
(define ex-1-list-average "<TODO: fill me in>")

#|
(test-equal? "Averaging the list" 
             ex-1-list-average 
             211/12)
|#

#| B |#

; +----------------------------------+-------------------------------
; | Exercise 2: Higher-order corners |
; +----------------------------------+

#|
Suppose we want to add 5 to every element of a list.  Some of you
may have tried the following.

> (define numbers (list 3 1 4 1 5 9 2 6))
> (define numbers-plus-5a (map + numbers 5))

a. Why doesn't that work?

TODO: ENTER YOUR ANSWER
|#


#|
b. As we hope you've learned, you can use `cut` to help with this
problem.  Write an expression  using `cut` that adds five to each
element of `numbers`.
|#

(define numbers (list 3 1 4 1 5 9 2 6))
(define numbers-plus-five-b "<TODO: FILL ME IN, NOT AS A STRING>")

#|
(test-equal? "numbers-plus-5-b"
             numbers-plus-five-b
             (list 8 6 9 6 10 14 7 11))
|#

#|
c. Suppose you had not learned `cut`.  There are still at least
two other ways to to add five to each element of a list.  Come up 
with two, at least one of which uses the three-parameter `map`.
|#

(define numbers-plus-five-c1 
  ???)

(define numbers-plus-five-c2 
  ???)

#|
(test-equal? "numbers-plus-5-c1"
             numbers-plus-five-c1
             (list 8 6 9 6 10 14 7 11))
(test-equal? "numbers-plus-5-c2"
             numbers-plus-five-c2
             (list 8 6 9 6 10 14 7 11))
|#

#|
d. Which of those definitions do you most prefer?  Why?

ENTER YOUR ANSWER HERE
|#

#| A |#

; +------------------------------------+-----------------------------
; | Exercise 3: Party people revisited |
; +------------------------------------+

#|
One of the things that `map` allows us to do is perform repetitive
behavior.  We'll demonstrate this by generalizing one of the images
we created in our first lab on decomposition and then using our list
functions to generate repeated instances of that images.
|#

#|
a. Recall in the first exercise of our decomposition lab
you created an image that consisted of five people with party hats.
Using this code as a base, write a function `(party-person scale)`
that draws a single person, *i.e.*, a person with a party hat but
scales the person's width and height by a factor of `scale`.  For example:

+   If `scale` is `1`, then the image is drawn at its original dimensions.
+   If `scale` is `0.5`, then the image is drawn at half size.
+   If `scale` is `2`, then the image is drawn at 2x size.

Note: You should not use anything new for this part of the exercise.
Just return to the days of old, when we were generalizing individual
images to procedures.
|#

(define original-party-person
  (above (triangle 20 'solid 'green)
         (circle 20 'outline 'black)
         (rectangle 10 40 'solid 'black)))

(define party-person
  (lambda (scale)
    ???))

#|
b. Using `map` and `party-person` define a *list of images* called
`party-list` that consists of six party people scaled by the following
factors.

    3/2, 1, 1/4, 2, 7/4, 1/2

Hint: start with a list of these scaling factors as a list of fractions.
What functions can we use in combination to transform this list of factors 
into a list of images?
|#

(define party-list "TODO: fill me in!")

#|
c. You might notice that the type of `party-list` isn't quite an
image. To see this, attempt to rotate `party-list` using the `rotate`
function. In the space below, report the error you receive and in a
sentence or two explain what the problem is!

    > (rotate 90 party-list)

ENTER A DESCRIPTION OF THE ERROR AND WHY WE GET IT.
|#

#|
d. To fix the problem, we need to combine the images of `party-list`
into a single image.  To do so, we should use `beside` to place
each person beside each other.  However, we can't just use `beside`
directly with `party-list`.  Doing so should result in yet another
error!  In the space below, report the error and in a sentence or
two explain the problem!

   > (beside party-list)

ENTER A DESCRIPTION OF THE ERROR AND EXPLAIN THE PROBLEM.
|#

#|
e. As you might expect, it turns out that the fix is to use the
`apply` function which takes a function `f` and a list of values
as input and returns the result of applying `f` to the values of
the list.  Use `apply` to complete the definition of `party` below
and verify that it produces what you expect.  

Please use `beside` and not `beside/align`.
|#

(define party 
  ???)

#|
f. It's also possible to do this with `reduce` rather than `apply`.
(At least it should be.)  Try doing so.  Once again, please use
`beside` rather than `beside-align`.
|#

(define party-f 
  ???)

#|
g. Try using `reduce` with `beside/align` rather than `beside` to align
the partygoers along the baseline.

Note: You can't just write

    (reduce beside/align 'baseline party-list)

Remember: `reduce` needs a two-parameter procedure, so you'll need
to build one from `beside/align`.
|#

(define party-g 
  ???)

#| B |#

; +------------------------------------+-----------------------------
; | Exercise 4: Exercises in reduction |
; +------------------------------------+

#| 
If you do not get to this part of the lab in class, don't worry.
You need not do it together.  Each partner should do it on their
own and *not* submit it, but be ready to discuss it.
|#

#|
a. What does the following procedure do?

<TODO: INSERT YOUR ANSWER HERE>
|#

(define combine
  (lambda (s1 s2)
    (string-append s1 " and " s2 " and " s1)))

#|
b. What value do you expect to get for the following expressions?
Check each as you go.

<TODO: INSERT YOUR ANSWERS HERE>
|#

(define combine-2 (reduce combine (list "A" "B")))

(define combine-1 (reduce combine (list "A")))

(define combine-3-left (reduce-left combine (list "A" "B" "C")))

(define combine-3-right (reduce-right combine (list "A" "B" "C")))

(define left-and-right (equal? combine-3-left combine-3-right))

#|
c. What values do you expect for all-the-same below?  Why?
Don't check yet!  Wait until you get to part d.

<TODO: INSERT YOUR ANSWERS HERE>
|#

(define combine-abcde-1 (reduce combine (list "A" "B" "C" "D" "E")))

(define combine-abcde-2 (reduce combine (list "A" "B" "C" "D" "E")))

(define combine-abcde-3 (reduce combine (list "A" "B" "C" "D" "E")))

(define all-the-same 
   (and (equal? combine-abcde-1 combine-abcde-2)
        (equal? combine-abcde-1 combine-abcde-3)
        (equal? combine-abcde-2 combine-abcde-3)))

#|
d. Check your answer experimentally.  That is, print out the value
of `all-the-same` and see if it's what you expected.
|#

#|
e. What do you take as the main lessons of this exercise?

<TODO: INSERT YOUR ANSWER HERE>
|#

#| AB |#

; +----------------------+-------------------------------------------
; | Submitting your work |
; +----------------------+

#|
Congratulations on finishing this lab!  To turn in your work:

a.  If you're working online, combine the two parts into a single file.
b.  Ensure that your file runs properly.
c.  Make sure you save as `lists-more.rkt` using 
    File -> Save Other -> Save Definitions As Text...
d.  Send this completed file to your partner for their records.
e.  Submit this final file to Gradescope.  Make sure, if appropriate,
    to submit your work as a group submission and include your
    partner in the submission.
|#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you may wish to attempt one
or more of the following exercises.
|#

; +----------------------------------+-------------------------------
; | Extra 1: More tipsy party people |
; +----------------------------------+

#|
Remember those party people from an earlier exercise?  It's time
to play with them again.

Write a procedure, `(tipsy-party-people list-of-scales)`, that takes
as a parameter a list of numbers (e.g., (list 3/2 1 1/4 2 7/4 1/2))
makes a list of party people scaled by those numbers, rotates each
party person by 45 degrees, puts them beside each oother, and then
rotates the whole group by 45 degrees.
|#

(define tipsy-party-people
  (lambda (list-of-scales)
    ???))

; +----------------------------------+-------------------------------
; | Extra 2: More tipsy party people |
; +----------------------------------+

#|
One of the disadvantages of the prior procedure is that the scales
can be too large or too small.  Write a new procedure, 
`(less-extreme-party-people list-of-scales)`, that takes as a parameter
a list of numbers, filters out any number that is greater than 3/2 or
less than 1/2, and then makes an image of tipsy party people using
the prior approach.
|#

(define less-extreme-party-people
  (lambda (list-of-scales)
    ???))



