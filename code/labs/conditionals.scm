;; CSC 151 (SEMESTER)
;; Lab: Conditionals
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; This lab consists of a number of programming and reasoning exercises
; about booleans and conditionals.  Start with the A-side exercises with
; A-side driving and B-side navigating.  Then switch back and forth as
; indicated.

; +-------------+----------------------------------------------------
; | Preparation |
; +-------------+

; 1. Make sure to introduce yourself to your partner and discuss Double dagger problems.
; 2. Make sure to save this file as `conditionals.scm`.

; +---------------------------------+--------------------------------
; | Exercise 1: Conditional tracing |
; +---------------------------------+

; (A side drives!)

; Consider the following code snippet:

(define foo
  (lambda (x1 x2)
    (if (< x1 x2)
        #t
        #f)))

(define bar
  (lambda (x1 x2)
    (< x1 x2)))

; Here's a trace of two similar expressions.

;     (foo 2 4)
; --> (if (< 2 4) #t #f)
;     ; Evaluate the test
; --> (if #t #t #f)
;     ; The test is truish; Use the consequent
; --> #t

;     (bar 2 4)
; --> (< 2 4)
; --> #t

; Remember that to trace an `if` expression, you first evaluate the guard
; (the first "parameter" to `if`).  If the guard holds, you replace the
; `if` with the consequent (the second "parameter" to `if`).  If the guard
; does not hold, you replace the `if` with the alternate (the third "parameter"
; to `if`).

; Give execution traces for each of the following expressions.  Check
; with the exploration pane that your final value coincides with the
; result of evaluating the expression in Scheme/Scamper.

; a. (foo 5 3)
;
; <TODO: give your trace here>

; b. (bar 5 3)
;
; <TODO: give your trace here>

; c. What do you see as the similarities and differences between
; `foo` and `bar`?
;
; <TODO: give your answer here>

; +---------------------------+--------------------------------------
; | Exercise 2: More tracing! |
; +---------------------------+

; (B side drives!)

; Consider the following code snippet:

(define baz
  (lambda (x1 x2 x3)
    (if (< x1 x2)
        (if (< x2 x3)
            #t
            #f)
        #f)))

(define qux
  (lambda (x1 x2 x3)
    (and (< x1 x2) (< x2 x3))))

; Here are some execution traces.

;     (baz 2 3 4)
; --> (if (< 2 3) (if (< 3 4) #t #f) #f)
;     ; Evaluate the test
; --> (if #t (if (< 3 4) #t #f) #f)
;     ; The test is truish; use the consequent
; --> (if (< 3 4) #t #f)
;     ; Evaluate the test
; --> (if #t #t #f)
;     ; The tst is truish; use the consequent
; --> #t

;     (qux 2 3 4)
; --> (and (< 2 3) (< 3 4))
;     ; Evaluate the first argument to `and`
; --> (and #t (< 3 4))
;     ; The first argument is truish; drop it
; --> (and (< 3 4))
;     ; There's only one argument to and, use it
; --> (< 3 4)
; --> #t

;     (baz 3 2 4)
; --> (if (< 3 2) (if (< 2 4) #t #f) #f)
;     ; Evaluate the test
; --> (if #f (if (< 2 4) #t #f) #f)
;     ; The test is false, use the alternate
; --> #f

;     (qux 3 2 4)
; --> (and (< 3 2) (< 2 4))
;     ; Evaluate the first argument to `and`
; --> (and #f (< 2 4))
;     ; When the first argument to `and` is false, the result is false.
; --> #f

; Give execution traces for each of the following expressions.  Check
; with the explorations pane that your final value coincides with the
; result of evaluating the expression in Scheme/Scamper.

; a. (baz 2 3 1)
;
; <TODO: give your trace here>

; b. (qux 2 3 1)
;
; <TODO: give your trace here>

; c. Why did we choose those three example inputs (that is, "2 3 4",
; "3 2 4" and "2 3 1")?
;
; <TODO: give your answer here>

; d. What do you see as the similarities and differences between
; `baz` and `qux`?
;
; <TODO: give your answer here>

; +---------------------------------------------+--------------------
; | Exercise 3: Mixing conditionals and numbers |
; +---------------------------------------------+

; (B-side continues!)

; In this exercise, we continue learning how to work with the primitive
; types and their standard library functions.  Use functions from the
; Scheme standard library to implement the following common functions
; that utilize booleans.
;
; When you are done, you should experiment with your function in the
; explorations pane on a variety of inputs to verify that the program
; works as expected.

; a. Write a predicate `(is-even? n)` that takes an integer as input
; and returns true if `n` is even and false otherwise.
;
; You may not use the built-in `even?` or `odd?` predicates.
;
; You may, however, use the `remainder` procedure you recently learned.

(define is-even?
  (lambda (n)
    ;; TODO: fill me in!
    #f))

; b. In your experiments with `is-even?`, you may have determined that
; `is-even?` reports an error when `n` is not an integer.
;
; Write a predicate, `(is-even-integer? n)`, that returns true when
; `n` is an even integer and false otherwise.  
;
; Your procedure should return false when `n` is a complex number, a
; non-integer real, a string, an image, and, well, anything that's
; not an integer.

(define is-even-integer?
  (lambda (n)
    ;; TODO: fill me in!
    #f))
    

; c. Write a function (number-not-integer? n) that returns true if `n`
; is a number that is not an integer and false otherwise.

; TODO: write your function here!

; d. Write a function, `(median-of-three x y z)`, that takes three
; real numbers as input and returns the number that is the middle
; value of the three when put in numerical order.  If two numbers are
; the same, you can return that number.  If all three are the same,
; you can return that number.

; TODO: write your function here!

; +-------------------------+----------------------------------------
; | Exercise 4: Boolean Zen |
; +-------------------------+

; (A-side drives!)

; a.  In a previous exercise, you wrote a function, `is-even?` that
; determines whether a number is even.  Consider the following functions
; that uses `is-even?` to determine if both of its parameters are even.

(define really-bad-both-even?
  (lambda (n1 n2)
    (if (equal? (is-even? n1) #t)
        (if (equal? (is-even? n2) #t)
            #t
            #f)
        #f)))

; For example:
;
; > (really-bad-both-even? 2 4)
; #t
; > (really-bad-both-even? 1 2)
; #f
;
; We claim that this implementation is "really bad" not because it
; produces the wrong answer, but because it is sylistically offensive!
; First, rewrite this function as `bad-both-even?` below using `and`
; and `or` to remove the need for a nested conditional expression.
;
; Experiment with `bad-both-even?` on a variety of examples to gain
; confidence that your function works identically to
; `really-bad-both-even?`.

(define better-both-even?
  (lambda (n1 n2)
    ; TODO: fill me in!
    #f))

; b. If your implementation of `better-both-even?` still contains a
; conditional, then you still have more work to do!  Rewrite the
; function one more time as `both-even?` below that uses neither `if`
; nor `cond` in its implementation.  Again, experiement with `both-even?`
; and a variety of examples to ensure that it works identically to
; the previous implementations.

(define both-even?
  (lambda (n1 n2)
    ; TODO: fill me in!
    #f))

; c. The process of reimplementing `both-even?` so that it is better
; designed while keeping its behaviror the same is called "refactoring".
; Refactoring this function tells us something profound about booleans
; and expressions, a concept that some faculty in the CS department
; picked up from Stuart Reges at the University of Washington called
; "boolean zen" (or "Boolean Zen").  In this class, we often use the
; slightly more verbose "The Zen of Booleans".
;
; Suppose that I have a piece of code that looks as follows:
;
;     (if <expr> #t #f)
;
; Where `<expr>` is a Boolean expression.  Based on `both-even?` or
; the code tracing exercises, describe what I can rewrite this code
; to that is equivalent to the original version but more concise.  In
; a few sentences, describe and justify your answer.
;
; <TODO: give your rewritten code and explanation here!>

; d. Finally, use the concept of the Zen of Booleans to write a concise
; version of the function `(both-odd? n1 n2)` that returns true only
; when both of its arguments are odd?.  You may assume that both
; parameters are integers.  
;
; Note: simply negating `both-even?` won't work since `both-even?`
; will return false if one argument is even and the other is odd.
;
; You may not use the `odd?` predicate here, but you may use the
; `is-even?` procedure.

(define both-odd?
  (lambda (n1 n2)
    ; TODO: fill me in!
    #f))

; +---------------------------------------------+--------------------
; | Exercise 5: Mixing conditionals and strings |
; +---------------------------------------------+

; (B-side continues!)

; In this exercise, we continue learning how to work with the primitive
; types and their standard library functions.  Use functions from the
; Scheme standard library to implement the following common functions
; that utilize booleans.
;
; When you are done, you should experiment with your function in the
; explorations pane on a variety of inputs to verify that the program
; works as expected.

; a. In a particular company, employees are given IDs that consist of
; a string of 6 digits, e.g., "419109".

; Write a function, `(employee-id? str)`, that takes a string as input
; and determines whether the string is a valid employee id.  You need
; not check that `str` is a string.

; > (employee-id? "123456")
; #t
; > (employee-id? "1")
; #f
; > (employee-id? "000111")
; #t
; > (employee-id? "00011x")
; #f
; > (employee-id? 123456)
; Boom!  Crash!

; Hint: `string->number` may help.  `string-length` may help.  `substring`
; may help.

; TODO: write your function here!

; b. The founders of the company are given IDs where the first 3
; digits are 0s, e.g., "000110".

; Write a function `(founder-id? sstr)` that takes a string as input and
; determines whether the string is a valid founder's ID.

; Note that you should use `employee-id?` to ensure that the id is a
; valid employee id.

; Hint: `substring` may help with the additional check.

; TODO: write your function here!

; +------------------------------+-----------------------------------
; | Exercise 6: Friendly prompts |
; +------------------------------+

; (A-side drives!)

; The situation frequently arises where a program will need to
; check whether a user says "yes" to a prompt.

; a. Write a procedure, `(yes? str)`, that takes a string as input and
; determines whether the string is "yes".

; > (yes? "yes")
; #t
; > (yes? "no")
; #f
; > (yes? "oui")
; #f
; > (yes? "y")
; #f
; |#

; ; TODO: write your function here!

; b. As a courtesy to users, we might want to permit three inputs,
; "yes", "Yes", and "y".  Write a procedure `(friendlier-yes? str)`
; that returns true if the input string `str` is any of those three.

; > (friendlier-yes? "yes")
; #t
; > (friendlier-yes? "no")
; #f
; > (friendlier-yes? "oui")
; #f
; > (friendlier-yes? "y")
; #t
; |#

; TODO: write your function here!

; +-------------------------------+----------------------------------
; | Exercise 7: Converting grades |
; +-------------------------------+

; (B-side drives!)

; There are a variety of ways of turning numeric grades in the range
; 0.0-4.0 into letter grades.  Here's one.

; * Greater than or equal to 3.5: A
; * Between 2.5 (inclusive) and 3.5 (exclusive): B
; * Between 1.5 (inclusive) and 2.5 (exclusive): C
; * Between 0.5 (inclusive) and 1.5 (exclusive): D
; * Less than 0.5: F

; Translate this table into a function `(gpa->letter g)` that takes
; a grade point average, a fraction in the range 0 ≤ g ≤ 4.0, and
; returns the corresponding letter (as a string) associated with that
; grade point value. Because there are many different cases, your
; implementation should `cond` rather than `if`.

; As before, you should experiement with your function on a variety of
; inputs in the interactions pane to ensure that the function works.

(define gpa->letter
  (lambda (g)
    ; TODO: implement me!
    "A"))

; +----------------------+-------------------------------------------
; | Submitting your work |
; +----------------------+

; Congratulations on finishing this lab!  To turn in your work:

; a.  Ensure that your file runs properly and it is named
;     conditionals.scm
; b.  Send this file to your partner for their records.
; c.  Submit this file to Gradescope.  Make sure, if appropriate,
;     to submit your work as a group submission and include your
;     partner in the submission.

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

; If you find that you have extra time, you might want to attempt
; one or more of these exercises.

; +----------------------------+-------------------------------------
; | Extra 1: Be more forgiving |
; +----------------------------+

; In one of the lab questions, you were asked to write a forgiving `"Yes"`
; prompt checker.  If you have additional time, work with your partner on
; enhancing this checker so that it accepts other reasonable forms of "Yes",
; including other words, e.g., "Yup", abbreviations and short-hands such as "Y",
; and strange capitalizations, such as "yeS".

; +-------------------------------+----------------------------------
; | Extra 3: Cleaner computations |
; +-------------------------------+

; In our experience, most of you wrote `gpa->letter` with the "B" test
; looking like this.

;     [(and (< g 3.5) (>= g 2.5))
;      "B"]

; However, it is possible to write that without the `and` (and even
; without the 3.5).  If you wrote something long like that, rewrite
; your `gap->letter` to be more efficient.

; If you are puzzled, ask one of the staff for help.

; +-------------------------------------+----------------------------
; | Extra 4: Median of three, revisited |
; +-------------------------------------+

; Earlier, you wrote `median-of-three`.  Write a version of `median-of-three`
; without conditionals.  (You may not use `and` or `or`.)

; Hint: You may find that `max` and `min` help.

(define new-median-of-three
  (lambda (x y z)
    ; TODO: implement me!
    0))