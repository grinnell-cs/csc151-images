;; CSC 151 (SEMESTER)
;; Lab: List Basics
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

; a. Introduce yourself to your partner.  Make sure to discuss work 
; preferences and what you bring to the partnership.

; b. If you haven't done so already, review the list of procedures
; in the lab page, making sure that each of you understands the
; parameters and purpose of each procedure.

; c. Save the lab as `list-basics.scm`.

(problem "Exercise 1: Reviewing the self-check")

; (Side A drives!)

; a. Predict the results of evaluating each of the following expressions.
; Fill in each description which your prediction! And then uncomment each
; expression to check your work.

(description "(list 2 1) --> ...")
; (display (list 2 1))

(description "(make-list 1 2) --> ...")
; (display (make-list 1 2))

(description "(make-list -1 2) --> ...")
; (display (make-list -1 2))

(description "(range 3) --> ...")
; (display (range 3))

(description "(map range (list 2 1)) --> ...")
; (display (map range (list 2 1)))

; b. As discussed in the reading, range can take on one, two, or even three
; arguments! In its two-argument form, range takes a lower bound and an upper bound.
; In this form, range will return the list of numbers starting with the lower bound
; and ending with the upper bound (exclusive). With this in mind, we can think of
; the one argument version of range as taking the upper bound as input with the
; lower bound fixed to be 0. The three-argument form allows you to specify how much
; the range grows by its step value.
;
; With this in mind, predict the results of each of the following.  You may find
; it easiest to check the result of each before going on to the next.

(description "(range 5 10) --> ...")
; (display (range 5 10))

(description "(range -4 3) --> ...")
; (display (range -4 3))

(description "(apply + (range 10)) --> ...")
; (display (apply + (range 10)))

(description "(range 10 -5) --> ...")
; (display (range 10 -5))

(description "(range -5 -10) --> ...")
; (display (range -10 -5))

(description "(apply + (range 1 10 2)) --> ...")
; (display (apply + (range 1 10 2)))

; c. Why do you think we had you try so many different inputs to `range`?
; Answers this question in a sentence or two, reflecting on the variety of inputs
; you encountered in this problem.

(description "`range` has so many different inputs because...")

(problem "Exercise 2: Other list procedures")

; (Side B drives!)

; The list of procedures in the lab description is not comprehensive.
; Spend *no more than three minutes* coming up with a few other procedures
; you've encountered that generate or process lists.  Here are some
; hints that may help.  (You don't have to answer these particular
; questions; just try to think about when you've encountered lists
; before.)

; * What procedures do you know (other than those listed) that create a
;   list of strings?
; * What procedures do you know (other than those listed) that create a
;   list of characters?

(description
  "Other procedures include... ")


(problem "Exercise 3: Translating numbers")

; Consider the problem of turning a string, like "123" into the
; corresponding integer.  While `string->number` could help with
; such a task, let us assume that it does not exist, and we have
; to write it on your own.

; a. Write or sketch an algorithm, in English, that explains the steps
; in converting such strings to integers.  (You can assume that the
; strings consist only of digits.) *Spend no more than five minutes
; on this part of the exercise.*

(description "To convert a string into an integer, ...")

; b. One of the things we'll need to do is convert each character in
; the string to its corresponding decimal number.  Write a procedure,
; `(char->digit char)` that takes as input a digit character
; (`#\0`, `#\1`, ...) and converts it to the corresponding digit
; (0, 1, ...). Add additional test-cases to test your function!
;
; Note that you may find the collating sequence values helpful.
; You can get those with `(char->integer ch)`.

(description "char->digit")

;;; (char->digit char) -> integer?
;;;   char : digit-character?
;;; Convert a digit character to the corresponding digit/integer.
(define char->digit
  (lambda (char)
    {??}))

(test-case "(char->digit #\\3)"
  equal? 3
  (lambda () (char->digit #\3)))

(test-case "(char->digit #\\9)"
  equal? 9
  (lambda () (char->digit \#9)))

(description "string->digits")

; c. Write a procedure, `(string->digits str)` that takes a string
; consisting of only digits as an integer and returns a list of the 
; corresponding integers.  Note that you will likely need to use
; `map`, `string->list`, and one of the procedures you came up with
; above. Again, add additional test cases to test your function!

;;; (string->digits str) -> list-of integer?
;;;   digits: string?
;;; Convert a string of digits to a list of integers that represent 
;;; the digits of the string.
(define string->digits
  (lambda (str)
    {??}))

(test-case "(string->digits \"123\")"
  equal? (list 1 2 3)
  (lambda () (string->digits "123")))

(test-case "(string->digits \"42\")"
  equal? (list 4 2)
  (lambda () (string->digits "42")))

(test-case "(string->digits \"0\")"
  equal? (list 0)
  (lambda () (string->digits "0")))

(description "ten-to-the")

; d. One of the things we'll likely need to do is compute powers of
; ten.  Write a procedure, `(ten-to-the n)`, that takes as input an
; integer, `n`, and computes 10 to the nth power.
;
; Note: you will not be using any list operations in creating this
; procedure; rather, this is an implicit part of the decomposed larger
; problem!

;;; (ten-to-the n) -> integer?
;;;   n : integer?
;;; Compute 10^n.
(define ten-to-the
  (lambda (n)
    {??}))

(test-case "(ten-to-the 2)"
  equal? 100
  (lambda () (ten-to-the 2)))

(test-case "(ten-to-the 3)"
  equal? 1000
  (lambda () (ten-to-the 3)))

(test-case "(ten-to-the 0)"
  equal? 1
  (lambda () (ten-to-the 0)))

(test-case "(ten-to-the -1)"
  equal? 0.10
  (lambda () (ten-to-the -1)))

(description "powers-of-ten")

; e. Write a procedure, `(powers-of-ten n)`, that produces the first
; `n` powers of ten, starting at ten to the 0 (1).  You will likely
; need to use `map` and `range` to create this list.

;; (powers-of-ten n) -> list-of integer?
;;   n : non-negative-integer?
;; Compute the first `n` powers of 10.
(define powers-of-ten
  (lambda (n)
    {??}))

(test-case "(powers-of-ten 5)"
  equal? (list 1 10 100 1000 10000)
  (lambda () (powers-of-ten 5)))


; f. Reconsider the problem of converting a string to an integer.
; How will/might the procedures you've just written help you in that
; activity?  How might `map` and `apply` help you with that that
; activity?  How might the three-parameter `map` help?  (If you're
; not sure about the three-parameter `map`, ask one of the course
; staff.)

; Sketch an algorithm, based on those tools, that might allow you to
; do the conversion.  *Once again, spend no moreo than five minutes
; on this part of the exercise.*

(description "To convert a string into an integer with the tools we have, ...")

(description "string->integer")

; g. Write a procedure, `(string->integer str)` that takes a string
; consisting only of digits as an integer and returns the value of
; that integer.  Do not use `number->integer`.
;
; Note that you will likely need all of the procedures you've just
; written, along with the three-parameter `map` and an `apply`, to
; complete this problem.

; Think about how those procedures help, as well as what other decomposition
; might be necessary.

;; (string->integer str) -> integer?
;;   str: string?
;; Convert a string of digits to the corresponding integer
;; the digits of the string.
(define string->integer
  (lambda (str)
    {??}))

(test-case "(string->integer \"123\")"
  equal? 123
  (string->integer "123"))

(test-case "(string->integer \"42\")"
  equal? 42
  (string->integer "42"))

(test-case "(string->integer \"2342341211231667\")"
  equal? 2342341211231667
  (string->integer "2342341211231667"))


;;; (Partner A now drives!)

(problem "Exercise 4: Check values")

; In the early days of the Internet, data could become corrupted.  For
; example, one letter in a communication might switch.  To help identify
; such problems (and, eventually, to help resolve them), many programmers
; started adding "check values" to their strings.  Here's a simple
; strategy for computing a check value.

; * Convert all the letters in the string to their corresponding ASCII
;   values.
; * Add all those numbers together.
; * Divide the sum by 26 and take the remainder.
; * Convert back to a letter, using the conversion 0->A, 1->B, 2->C, ...
;
; For example, given the string "Hello", I might do the following
; calculations in Scheme to help:
;
; + Convert 'h', 'e', 'l', 'l', 'o' to their character values: 72, 101,
;   108, 108, and 111, respecitvely.
; + Compute the sum of these numbers: 500
; + Divide the sum by 26 and take the remainder: 6
; + Convert back to a letter: 0->A, 1->B, ..., 5->F, 6->G
;
; So the check letter for "Hello" is #\G at least if we're right that
; "G" is the 7th letter.  (Do you know why we said 7th rather than 6th?
; The conversion does suggest that letter 6 is #\G)
;
; Write a procedure, `(check-letter str)` that takes an arbitrary string
; as input and computes its check letter (a character) using that approach.
;
; (Hint: how do we get a list of characters from the string? Given that
; list of characters, how do we convert them into their integral values
; and sum them up using map and apply?)

;;; (check-letter str) -> char?
;;;   str : string?
;;; Compute a check letter for str using the assigned process.
(define check-letter
  (lambda (str)
    {??}))

(test-case "(check-letter (\"Hello\"))"
  equal? #\G
  (check-letter "Hello"))

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

; You're done with this lab.  Congratulations!  Submit your work.

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

; If you finish the lab early, you should attempt one or more of these
; problems.

; +----------------------------------------+-------------------------
; | Exercise 1: Translating binary numbers |
; +----------------------------------------+

; Binary numbers are base-two numbers.  If you haven't encountered
; them, binary numbers are a lot like base-ten (normal) numbers except
; that instead of ten digits, we have only two (0 and 1).

; In base-ten numbers, the rightmost digit gets multiplied by one
; ("ones column"), the next-to-rightmost gets multiplied by ten
; ("tens column"), the next-to-next-to-rightmost gets multiplied by
;  100 ('hundreds column"), and so on and so forth.

; In base-two numbers, the rightmost digit gets multiplied by one
; ("ones column", the next-to-rightmost digit gets multiplied by
; two ("twos column"), the next-to-next-to-rightmost gets multiplied
; by four ("fours column") and so on and so forth.

; For example, 11001 in binary is 16 + 8 + 1 or 25 in base-ten
; notation. 

; Write a procedure, `(binary->integer str)` that takes as input a
; string consisting of only 0's and 1's that represents a binary
; number and converts it to the corresponding integer.

; You may find it beneficial to write other helper procedures
; along the way.  If you do so, you should consider documenting
; those procedures similar to how we have done so.  (You don't
; need to do so now, but it's a good habit to develop.)

; Note: When/if you take CSC-161, you'll discover that there are a
; variety of ways to interpret binary values as numbers.

;; (binary->integer str)
;;   str : string?
;; Convert a string consisting of only 0's and 1's that represents
;; a binary number to the corresponding integer.
(define binary->integer
  (lambda (str)
    {??}))

; +-----------------------------+------------------------------------
; | Extra 2: General conversion |
; +-----------------------------+

; You've now written two procedures that convert strings of digits to
; integers, using different bases.  Document and write a generalized 
; version, `(string->integer str base)`, that takes a base from 2 to
; 10 as a parameters.

; +-------------------------------------------+----------------------
; | Extra 3: Expanding support for conversion |
; +-------------------------------------------+

; Add support for negative numbers, bases greater than ten, perhaps
; even decimal numbers.