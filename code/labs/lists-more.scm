;; CSC-151-NN (SEMESTER)
;; Lab: More Fun with Lists
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import image)
(import test)

(title "Lab: More Fun with Lists")

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

; In this lab, you and your partner will practice manipulating lists
; using the big-three higher-order functions---map, filter, and
; reduce---as well as some other useful functions.

; There are five exercises; here's the division.

; Exercise 1: A-Side
; Exercise 2: B-Side
; Exercise 3: B-Side
; Exercise 4: A-Side
; Exericse 5: Both sides

; The person with the problem description should drive and their
; partner should navigate.  Again, make sure to be good partners and
; focus completely on solving the current problem together rather than
; working ahead on your own.

; a. Don't forget our "start of session" steps.  Chat with your partner
; about working habits and strengths.  Maybe share something interesting
; about yourself.

; b. Make sure you are on the _most_ recent version of Scamper (see
; the board for the correct version!)

; c. If you haven't done so yet, make sure to open tabs in your browser
; for the lab and the recent readings.

; d. Don't forget to save this file as `lists-more.scm`!


(part "Exercise 1: Manipulating a list")

; (Side A drives)

; Complete each of the definitions that manipulate ex-1-list in various
; sorts of ways using one or more of the primary list functions.  You
; may also use other standard library functions for lists (e.g.,
; length) when appropriate.

; Please write expressions that compute the result, rather than computing
; the result by hand.

(define ex-1-list (list 25 25 23 5 21 20 20 18 10 1 22 21))

(problem "a. ex-1-list-adjusted")

; Increments the value of each element of the list `ex-1-list` by 5
(define ex-1-list-adjusted
  ; TODO: fill me in!
  0)

(test-case "Adjusting the list"
  equal? ex-1-list-adjusted
  (lambda () (list 30 30 28 10 26 25 25 23 15 6 27 26)))

(problem "b. ex-1-list-filtered")

; Keeps only the elements of the list that are greater than 10.
(define ex-1-list-filtered
  ; TODO: fill me in!
  0)

(test-case "ex-1-list-filtered"
  equal? ex-1-list-filtered
  (lambda () (list 25 25 23 21 20 20 18 22 21)))

(problem "c. ex-1-list-average")

; Computes the average of the list (Hint: this computation is more
; than just a single call to reduce!)
(define ex-1-list-average
  ; TODO: fill me in!
  0)

(test-case "ex-1-list-average"
  equal? ex-1-list-average
  (lambda () (/ 211 12)))

(problem "d. Counts the odd values")

(define ex-1-odd-count
  ; TODO: fill me in!
  0)

(test-case "ex-1-odd-count"
  equal? ex-1-odd-count
  (lambda () 7))

(problem "e. Puts them in inceasing order, from smallest to largest")

(define ex-1-increasing
  ; TODO: fill me in!
  0)

(test-case "ex-1-increasing"
  equal? ex-1-increasing
  (lambda () (list 1 5 10 18 20 20 21 21 22 23 25 25)))

(problem "f. Puts them in decreasing order, from largest to smallest")

(define ex-1-decreasing
  ; TODO: fill me in!
  0)

(test-case "ex-1-decreasing"
  equal? ex-1-decreasing
  (lambda () (list 25 25 23 22 21 21 20 20 18 10 5 1)))

; -------------------------------------------------------------------

(part "Exercise 2: Higher-order corners")

; (Side B drives!)

; Suppose we want to add 5 to every element of a list.  Some of you
; may have tried the following.
;
; > (define numbers (list 3 1 4 1 5 9 2 6))
; > (define numbers-plus-5a (map + numbers 5))

; Why doesn't that work? Fill your answer into the description
; below.

(problem "Why doesn't `(map + numbers 5)` work?")

(description "It doesn't work because... <TODO: fill me in!>")

(problem "numbers-plus-five with section")

; As we hope you've learned, you can use `section` to help with
; this problem.  Write an expression using `section` that adds
; five to each element of `numbers`.

(define numbers (list 3 1 4 1 5 9 2 6))
(define numbers-plus-five-b
  ; TODO: fill me in!
  0)

(test-case "numbers-plus-5-b"
  equal? numbers-plus-five-b
  (list 8 6 9 6 10 14 7 11))

(problem "numbers-plus-five without section")

; Suppose you had not learned `section`.  There are still at least
; two other ways to to add five to each element of a list.  Come up 
; with two, at least one of which uses the three-parameter `map`.

(define numbers-plus-five-c1
  ; TODO: fill me in!
  0)

(define numbers-plus-five-c2
  ; TODO: fill me in!
  0)

(test-case "numbers-plus-5-c1"
  equal? numbers-plus-five-c1
  (lambda () (list 8 6 9 6 10 14 7 11)))

(test-case "numbers-plus-5-c2"
  equal? numbers-plus-five-c2
  (lambda () (list 8 6 9 6 10 14 7 11)))

(problem "Preferences...")

; Which of those definitions do you most prefer?  Why?

(description "I like definition ... because ... <TODO: fill me in!>")

; -------------------------------------------------------------------

(part "Exercise 3: Manipulating another list")

; (B side drives!)

; Complete each of the definitions that manipulate ex-1-list in various sorts
; of ways using one or more of list functions.  You may also use other standard
; library functions for lists (e.g., length) when appropriate. At times,
; you may find it useful to write helper procedures.

; Please write expressions that compute the result, rather than computing
; the result by hand.

(define ex-3-list
  (list "someone" "suggests" "that" "something" "may" "be" "smart" "&" "snarky"))

(problem "a. ex-3-title-case")

; Uses `string-titlecase` to convert each word to title case

(define ex-3-title-case
  ; TODO: fill me in!
  0)

(test-case "Titlecasing elements"
  equal? ex-3-title-case
  (lambda () (list "Someone" "Suggests" "That" "Something" "May" "Be" "Smart" "&" "Snarky")))

(problem "b. ex-3-s-words")

; Keeps only the elements of the list that start with s

(define ex-3-s-words
  ; TODO: fill me in!
  0)

(test-case "Selecting s words"
  equal? ex-3-s-words
  (lambda () (list "someone" "suggests" "something" "smart" "snarky")))

(problem "c. ex-3-smushed")

; Joins the words together without worrying about spaces

(define ex-3-smushed
  ; TODO: fill me in!
  0)

(test-case "smushed together"
  equal? ex-3-smushed
  (lambda () "someonesuggeststhatsomethingmaybesmart&snarky"))

(problem "d. ex-3-spaced")

; Joins the words together with spaces in between them

(define ex-3-spaced
  ; TODO: fill me in!
  0)

(test-case "spaced out"
  equal? ex-3-spaced
  (lambda () "someone suggests that something may be smart & snarky"))

(problem "e. ex-3-short-count")

; Counts how many words have four or fewer letters

(define ex-3-short-count
  ; TODO: fill me in!
  0)

(test-case "short count"
  equal? ex-3-short-count
  (lambda () 4))

(problem "f. ex-3-alphabetical")

; Puts them in alphabetical order

(define ex-3-alphabetical 
  ; TODO: fill me in!
  0)

(test-case "alphabetical"
  equal? ex-3-alphabetical
  (lambda () (list "&" "be" "may" "smart" "snarky" "someone" "something" "suggests" "that")))

(problem "g. ex-3-by-size")

; Puts them in order from shortest to longest. Note that you may want to
; write a separate procedure that compares two strings by size.

(define ex-3-by-size
  ; TODO: fill me in!
  0)

(test-case "by size"
  equal? ex-3-by-size
  (lambda () (list "&" "be" "may" "that" "smart" "snarky" "someone" "suggests" "something")))

; -------------------------------------------------------------------

(part "Exercise 4: Party people revisited")

; (Side A drives)

; One of the things that `map` allows us to do is perform repetitive
; behavior.  We'll demonstrate this by generalizing one of the images
; we created in our first lab on decomposition and then using our list
; functions to generate repeated instances of that images.

(problem "a. party-person")

; Recall in the first exercise of our decomposition lab
; you created an image that consisted of five people with party hats.
; Using this code as a base, write a function `(party-person scale)`
; that draws a single person, *i.e.*, a person with a party hat but
; scales the person's width and height by a factor of `scale`.  For example:

; +   If `scale` is `1`, then the image is drawn at its original dimensions.
; +   If `scale` is `0.5`, then the image is drawn at half size.
; +   If `scale` is `2`, then the image is drawn at 2x size.

; Note: You should not use anything new for this part of the exercise.
; Just return to the days of old, when we were generalizing individual
; images to procedures.

(define original-party-person
  (above (solid-triangle 20 "green")
         (outlined-circle 40 "black" 1)
         (solid-rectangle 10 40 "black")))

(define party-person
  (lambda (scale)
    ???))

(problem "b. party-list")

; Using `map` and `party-person` define a *list of images* called
; `party-list` that consists of six party people scaled by the following
; factors.

;     3/2, 1, 1/4, 2, 7/4, 1/2

; Hint: start with a list of these scaling factors as a list of fractions.
; What functions can we use in combination to transform this list of factors 
; into a list of images?

(define party-list
  ; TODO: fill me in!
  0)

(problem "c. party-list problems")

; You might notice that the type of `party-list` isn't quite an
; image. To see this, attempt to rotate `party-list` using the `rotate`
; function. In the space below, report the error you receive and in a
; sentence or two explain what the problem is!

; TODO: Uncomment me and observe the problem
; (rotate 90 party-list)

(description "The error I received was...")

(description "I received this error because...")

(problem "d. Trying to fixing the party-list")

; To fix the problem, we need to combine the images of `party-list`
; into a single image.  To do so, we should use `beside` to place
; each person beside each other.  However, we can't just use `beside`
; directly with `party-list`.  Doing so should result in yet another
; error!  In the space below, report the error and in a sentence or
; two explain the problem!

; TODO: Uncomment me and observe the problem
; (beside party-list)

(description "The error I received was...")

(description "I received this error because...")

(problem "e. Making a party")

; As you might expect, it turns out that the fix is to use the
; `apply` function which takes a function `f` and a list of values
; as input and returns the result of applying `f` to the values of
; the list.  Use `apply` to complete the definition of `party` below
; and verify that it produces what you expect.  
;
; Please use `beside` and not `beside/align`.

(define party
  ; TODO: fill me in!
  0)

(problem "f. Partying with reduce")

; It's also possible to do this with `reduce` rather than `apply`.
; (At least it should be.)  Try doing so.  Once again, please use
; `beside` rather than `beside-align`.

(define party-f
  ; TODO: fill me in!
  0)

(problem "g. Baselined party")

; Try using `reduce` with `beside/align` rather than `beside` to align
; the partygoers along the baseline.

; Note: You can't just write

;     (reduce beside/align "baseline" party-list)

; Remember: `reduce` needs a two-parameter procedure, so you'll need
; to build one from `beside/align`.

(define party-g
  ; TODO: fill me in!
  0)

; -------------------------------------------------------------------

(part "Exercise 5: Exercises in reduction")

; (From here, alternate sides for each part!)

(problem "Mystery reduction")

; What does the following procedure do?

(define combine
  (lambda (s1 s2)
    (string-append s1 " and " s2 " and " s1)))

(description "(combine s1 s2)... <TODO: fill me in!>")

(problem "Exploring the mystery")

; What value do you expect to get for the following expressions?
; Check each as you go by displaying the identifier below each
; description.

(define combine-2 (reduce combine (list "A" "B")))

(description "combine-2 = ...")

(define combine-1 (reduce combine (list "A")))

(description "combine-1 = ...")

(define combine-3-left (reduce combine (list "A" "B" "C")))

(description "combine-3-left = ...")

(define combine-3-right (reduce-right combine (list "A" "B" "C")))

(description "combine-3-right = ...")

(define left-and-right (equal? combine-3-left combine-3-right))

(description "left-and-right = ...")

(problem "Even more mysteries!")

; What values do you expect for all-the-same below?  Why?
; Don't check yet!  Wait until you get to part d.

(define combine-abcde-1 (reduce combine (list "A" "B" "C" "D" "E")))

(description "combine-abcde-1 = ...")

(define combine-abcde-2 (reduce combine (list "A" "B" "C" "D" "E")))

(description "combine-abcde-2 = ...")

(define combine-abcde-3 (reduce combine (list "A" "B" "C" "D" "E")))

(description "combine-abcde-3 = ...")

(define all-the-same 
  (and (equal? combine-abcde-1 combine-abcde-2)
       (equal? combine-abcde-1 combine-abcde-3)
       (equal? combine-abcde-2 combine-abcde-3)))

(description "all-the-same = ...")

(problem "Mystery unveiled!")

; Check your answer experimentally.  That is, print out the value
; of `all-the-same` and see if it's what you expected.
;
; What do you take as the main lessons of this exercise?

(description "From this exercise, I learned... <TODO: fill me in!>")

; -------------------------------------------------------------------

; Congratulations on finishing this lab!  To turn in your work, submit
; this file (lists-more.scm) to Gradescope. If you have time, please
; complete the exercises below before you turn in your work.

; -------------------------------------------------------------------
; | For those with extra time |
; +---------------------------+

; -------------------------------------------------------------------

(part "Extra 1: More tipsy party people")

; Remember those party people from an earlier exercise?  It's time
; to play with them again.

; Write a procedure, `(tipsy-party-people list-of-scales)`, that takes
; as a parameter a list of numbers (e.g., (list 3/2 1 1/4 2 7/4 1/2))
; makes a list of party people scaled by those numbers, rotates each
; party person by 45 degrees, puts them beside each oother, and then
; rotates the whole group by 45 degrees.

(define tipsy-party-people
  (lambda (list-of-scales)
    {??}))

; -------------------------------------------------------------------

(part "Extra 2: Even more tipsy party people")

; One of the disadvantages of the prior procedure is that the scales
; can be too large or too small.  Write a new procedure, 
; `(less-extreme-party-people list-of-scales)`, that takes as a parameter
; a list of numbers, filters out any number that is greater than 3/2 or
; less than 1/2, and then makes an image of tipsy party people using
; the prior approach.

(define less-extreme-party-people
  (lambda (list-of-scales)
    {??}))
