;; CSC 151 (SEMESTER)
;; Lab: Pattern Matching and Recursive Tracing
;;   (pattern-matching-and-recursive-tracing.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Pattern Matching and Recursive Tracing")

; ------------------------------------------------------------------

(part "Problem 1: Heads and Tails")

; (Alternate driving for each part of this problem.)

; In today's reading, you learned about the recursive definition of
; a list. A list is either:
;
; + Empty or
; + Non-empty, consisting of a head element and a sublist, its tail.
;
; You also learned about the functions that allow us to create and
; break apart lists based on this recursive definition.
;
; + (null? l): returns true if the list is empty, i.e., null.
; + (cons v l): returns the list containing v as the head element
;               and l as its tail
; + (car l): returns the head of l, a (non-empty) list.
; + (cdr l): returns the tail of l, a (non-empty) list.

; To warm-up, trace the step-by-step execution of the following
; expressions involving these functions. Uncomment the expressions
; and use the explorations pane to check your work. Remember, you
; can highlight lines of text and use ctrl-/ to quickly comment
; and uncomment lines of code.
;
; Note: don't be surprised if your traces result in errors as some
; of these expressions contain runtime errors!

(problem "Expression (a)")

; (cons 1 (cons 2 (cons 3 null)))
; --> ...

(problem "Expression (b)")

; (car (cons 1 (cons 2 (cons 3 null))))
; --> ...

(problem "Expression (c)")

; (car (cdr (cons 1 (cons 2 (cons 3 null)))))
; --> ...

(problem "Expression (d)")

; (cdr (car (cdr (cons 1 (cons 2 (cons 3 null))))))
; --> ...

(problem "Expression (e)")

; (list->string (cdr (cdr (cdr (string->list "hello world!")))))
; --> ...

(problem "Expression (f)")

; Note: for this one, evaluation will proceed in a single step
; because of |>. However, try to predict the output of each
; function in the pipeline!

; (|> "hello world!"
;     string->list
;     ; Note: fold operates similarly to reduce except that fold uses
;     ; its second argument as the initial value to the computation.
;     (lambda (l) (fold (lambda (s c) (cons c s)) null l))
;     list->string)
; --> ...

; ------------------------------------------------------------------

(part "Problem 2: Slightly more elegant")

; (Partner A drives!)

; In the reading, we demonstrated how a summation function over lists
; can be written recursively.

(define sum-2
  (lambda (numbers)
    (if (null? numbers)
      0
      (+ (car numbers) (sum-2 (cdr numbers))))))

(test-case "basic summation (sum-2)"
  equal? 45
  (lambda () 
    (sum-2 (range 10))))

(test-case "empty-list summation (sum-2)"
  equal? 0
  (lambda () 
    (sum-2 null)))

; Recall that we read this function as follows:
;
; To compute the sum of numbers:
; + If numbers is empty, then the sum is 0.
; + Otherwise, if numbers is non-empty, add the head of numbers to
;   the sum of the tail.
;
; In our implementation, we realize "head of numbers" with car and
; "tail" with cdr. Having to use car and cdr to get the head and
; tail of the list can make our code verbose, especially if we have
; to access these components many times in our function!
;
; Luckily, we have a tool to help us clean up our code: let-bindings!
; Complete the definition of sum-2-let below by:
;
; (a) Copying the definition of sum-2 above.
; (b) Replacing the recursive call to sum-2 to sum-2-let.
; (c) Adding a let-binding at the appropriate point in the function
;     to bind the head and tail of numbers to `head` and `tail`,
;     respectively.
;
; Recall that the syntax of a let-binding is:
;
; (let ([x e1]
;       [y e2])
;   e3)
;
; Where x and y are bound to the values that e1 and e2 evaluate to,
; respectively. And the overall let evaluates to e3 which may
; mention x and y.

(define sum-2-let
  (lambda (numbers)
    ; TODO: fill me in as described above!
    -1))

(test-case "basic summation (sum-2-let)"
  equal? 45
  (lambda () 
    (sum-2-let (range 10))))

(test-case "empty-list summation (sum-2-let)"
  equal? 0
  (lambda ()
    (sum-2-let null)))

; ------------------------------------------------------------------

(part "Problem 3: Pattern Matching")

; (Alternate driving for each part of this problem.)

; As you can tell, it is more readable to introduce names for the
; head and tail of the list. However, using let-bindings is fairly
; cumbersome, especially for simple definitions like sum.
;
; We can get the best of both worlds with a new language construct
; that is designed for the kinds of decomposition that we do with
; recursion: pattern matching. Pattern matching combines:
;
; (a) Conditional reasoning ala `cond`.
; (b) Binding of the different parts of a value ala `let`.
;
; In a simple syntactic package!
;
; A match expression performs a pattern match over an expression
; called the scrutinee:
;
; (match <scrutinee>
;   [<pat1> <expr1>]
;   [<pat2> <expr2>]
;   ...)
;
; Like a `cond` expression, a match expression contains a
; number of branches, one of which is selected during evaluation
; and the overall match evaluates to that branch's subexpression.
; However, unlike `cond`, each branch is guarded by a pattern,
; the syntactic form of a value. The match expression takes the
; scrutinee and "lines it up" with each branch's pattern, and
; that branch is chosen if the scrutinee matches that pattern.
;
; Let's take a look at how we can rewrite sum to use pattern
; matching:

(define sum-3
  (lambda (numbers)
    (match numbers
      [null 0]
      [(cons head tail) (+ head (sum-3 tail))])))

(test-case "empty-list summation (sum-3)"
  equal? 0
  (lambda ()
    (sum-3 null)))

(test-case "basic summation (sum-3)"
  equal? 45
  (lambda ()
    (sum-3 (range 10))))

; Much more elegant! Notice how we've combined the original
; implementation with the refactoring that you did in problem 2.

; How does pattern matching work? Let's imagine running our two
; test cases through sum-3. In the first case, the list passed to
; sum-3 is the empty list. Thus, the empty list, null, is the
; match expression's scrutinee. We then check each branch's pattern
; to see if it matches against null. And indeed, the first branch
; matches because the pattern is quite literally that: null! Thus
; the match evaluates to the body of the first branch, 0.

; In the second case, we have the list (list 0 ... 9) as the
; argument to sum-3. This becomes the scrutinee of the match
; expression. Recall that a list is really a collection of cons calls,
; so the scrutinee is really:
;
; (cons 0 (cons 1 (cons 2 (cons 3 ... ))))
;
; We take this value and "line it up" with each of the patterns. A
; call cons is not null, so we skip over the first branch. When we
; line up the scrutinee with the second branch's pattern, we have:
;
; scrutinee: (cons 0    (cons 1 (cons 2 (cons 3 ...))))
; pattern:   (cons head tail)
;
; And we see that the two match! Here, the variable "head" lines up
; with 0 and the variable "tail" lines up with the rest of the list.
; Thus, head is bound to 0 and tail is bound to the remainder of
; the list, as if we had used car and cdr manually!

; With this in mind, let's explore this match expression via
; further experimentation! Like the first problem, predict the
; result of evaluating each of these expressions. Use the
; explorations window to check your work!

(problem "Expression (a)")

; (match (cons 1 (cons 2 (cons 3 null)))
;   [(cons head tail) head])
; --> ...

(problem "Expression (b)")

; (match (cons 1 (cons 2 (cons 3 null)))
;   [(cons head tail) tail])
; --> ...

(problem "Expression (c)")

; (match null
;   [(cons head tail) "??"])
; --> ...

(problem "Expression (d)")

; (match (cons 1 (cons 2 (cons 3 null)))
;   [(cons h1 (cons h2 tail)) (+ h1 h2)])
; --> ...

(problem "Expression (e)")

; (match (cons 1 (cons 2 (cons 3 null)))
;   [(cons h1 (cons h2 tail)) (cons h2 (cons h1 tail))])
; --> ...

(problem "Expression (f)")

; (list->string
;   (match (string->list "hello world!")
;     [(cons c1 (cons c2 (cons c3 (cons c4 tail))))
;      (cons c2 (cons c4 tail))]))
; --> ...

; ------------------------------------------------------------------

(part "Problem 4: Into the unknown")

; (Partner B drives for this problem!)

; In the exercise, you will receive a recursive function to analyze.
; Your goal is to experiment, trace, and ultimately determine what
; the recursive function does.
;
; a. Note the pre-conditions on the function you were assigned (in
;    this case, those are the types of the parameters. With those in
;    mind, first explore executions of your function by writing out
;    2--3 examples of your function
;
; b. Next, confirm your intuition by using your mental model of
;    computation to give a step-by-step trace/evaluation of the 
;    an expression supplied to you. Feel free to evaluate a function
;    call directly to the branch of the match/cond/if expression that
;    is ultimately selected.
;
; c. Finally, develop an explanation of what your chosen function does.
;    Note that your functions (and many recursive functions over lists)
;    have a specific form:
;
; (match l
;   [null             <case where l is empty>]
;   [(cons head tail) <case where l is non-empty>]
;
; In other words, the behavior of the function can be broken up into
; two independent sub-problems:
;
; + How do I solve the problem when the list is empty (`null`)?
;   We call this the *base case* of the function.
; + How do I solve the problem when the list is non-`null`?
;   We call this the *recursive case* of the function.
;
; Explain your function's behavior below by writing what your
; function using this recursive template, i.e., how the function
; behaves in each of its cases.

;;; (func-4 x l) -> ??
;;;   x : any
;;;   l : list?
;;; ??
(define func-4
  (lambda (x l)
    (match l
      [null (list x)]
      [(cons head tail) (cons head (func-4 x tail))])))

; Analyze your function by completing the following:
;
; a. Examples

(description "func-4 examples")

; <TODO: Try the procedure on multiple inputs and enter your examples here>

; b. Trace for func-4
; (func-4 9 (list 1 8 2))
; --> ...
; --> <TODO: finish the derivation>

; c. Explanation

(description "Base case: <TODO: fill me in!>")

(description "Recursive case> <TODO: fill me in!>")

; ------------------------------------------------------------------

(part "Problem 5: Into the unknown, part 2")

; (Partner A drives for this problem!)

; Now you'll repeat the process for a different function! Again, your
; goal is to explain the behavior of the function experimentally,
; ultimately describing the behavior in terms of its two cases.

;;; (func-5 x l) -> ??
;;;   x : any
;;;   l : list?
;;; ??
(define func-5
  (lambda (x l)
    (match l
      [null null]
      [(cons head tail)
       (if (equal? head x)
           (func-5 x tail)
           (cons head (func-5 x tail)))])))

; Analyze your function by completing the following:
;
; a. Examples

(description "func-5 examples")

; b. Trace
; (func-5 7 (list 2 1 7 2 7))
; --> ...
; --> <TODO: finish the derivation>

; c. Explanation

(description "Base case: <TODO: fill me in!>")

(description "Recursive case> <TODO: fill me in!>")

; ------------------------------------------------------------------

(part "Problem 6: Go tell it on the mountain")

; (Both partners discuss for this problem!)

; As described in the reading, recursion looks like it shouldn't work
; because the definition of a recursive function is circular. Based on
; your experiences so far, why does recursion seems to work despite this
; initial perception of circularity? In particular, try to identify what
; is *necessary* for the program to do to ensure the "circular"
; definition doesn't lead to the problems you explored in the second
; self-check.
;
; Discuss this prompt with your partner and write up your response in a
; few sentences in the space below:

(description "Recursion \"works\" because... <TODO: fill me in!>")

; +------------------+---------------------------------------------
; | Submit your work |
; +------------------+

; Yes, that's right. Although you haven't written much code, you've done enough
; to learn how to read and trace through recursive code! Feel free to submit
; your lab to Gradescope at this point, or tackle the additional problems below
; to get more practice with recursion!

; ------------------------------------------------------------------

(part "Extra Problem 1: Deeper Waters")

; Analyze the following function using the same process as above!

;;; (func-extra l1 l2) ->??
;;;   l1 : list?
;;;   l2 : list?
;;; ??
(define func-extra
  (lambda (l1 l2)
    (match l2
      [null l1]
      [(cons head tail) (func-extra (cons head l1) tail)])))

; Analyze your function by completing the following:
;
; a. Examples

(description "func-extra examples")

; b. Trace
; (func-extra (list 1) (list 2 8 3 9))
; --> ...
; --> <TODO: finish the derivation>

; (func-extra (cons 2 (list 1)) (list 8 3 9))
; --> ...
; --> <TODO: finish the derivation>

; (func-extra (list 2 1) (list 8 3 9))
; --> ...
; --> <TODO: finish the derivation>

; c. Explanation

(description "Base case: <TODO: fill me in!>")

(description "Recursive case> <TODO: fill me in!>")

; d. Finally, what does this function do? Try to predict its behavior
; based on your previous exploration of func-extra as well as any other
; examples you wish to trace by hand!

(define func-extra-sauce
  (lambda (l)
    (func-extra null l)))