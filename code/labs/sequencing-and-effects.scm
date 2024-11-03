;; CSC 151 (SEMESTER)
;; Lab: Sequencing and Effects (sequencing-and-effects.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)

;; -----------------------------------------------------------------------------
(part "Problem: Reading Review")

;; To begin the lab, review the second part of the reading question for today
;; with your partner. You were tasked to attempt to hand-trace this code:

(let* ([x (vector 7)]
       [y (+ (vector-ref x 0) 1)]
       [ignore (vector-set! x 0 2)]
       [z (+ (vector-ref x 0) y)])
  (+ (vector-ref x 0) y z))

;; Recall that our model of computation tells us that let-bindings are
;; evaluated by evaluating each bound variable in sequence, substituting for
;; that variable _immediately_ in the remainder of the let* once we have
;; evaluated its bound expression.
;;
;; In this particular instance, our first step will be to substitute
;; (vector 7) for x everywhere it occurs in the let*. If we do this, what
;; problem arises as we go to hand-execute the rest of the code?
;;
;; <TODO: write your response here>


;; -----------------------------------------------------------------------------
(part "Problem: Being Lazy")

;; The problem described above occurs because when we substitute _everywhere_
;; for x, we, in effect, are eagerly evaluating x to its bound value once we
;; know what it is. In a world where our code has no mutation, this is
;; perfectly fine to do. However, with mutation, the contents of x may change
;; at a point arbitrarily far away from the initial definition of x!
;;
;; Our solution is to be _lazy_ with how we address variables bound to
;; vectors. Rather than substituting for them eagerly, we will instead remember
;; off to the side that x is bound to a value. Then, we will reference this
;; side information about the current value of x whenever we need to know its
;; contents. We'll call this side information our _environment_, a mapping of
;; variables to their (mutable) values. If we mutate x, we modify our
;; environment with the updated value. Thus, all future accesses of x will
;; reflect this change.
;;
;; How does this change our trace? At every step of the trace, we will now
;; need to also write down the current environment. We'll continue to eagerly
;; substitute values for variables when we know those values will not change.
;; We'll write the environment as a list of variable-value pairs, encased in
;; double curly braces.
;;
;; Let's go through our example, tracing the code with environments. Initially
;; we have not recorded any variables bound to vectors, so our environment is
;; empty:

;     {{ }}
;     (let* ([x (vector 7)]
;            [y (+ (vector-ref x 0) 1)]
;            [ignore (vector-set! x 0 2)]
;            [z (+ (vector-ref x 0) y)])
;       (+ (vector-ref x 0) y z))

;; Our first step of evaluation is the same: bind (vector 7) to x. However,
;; instead of substitution, we'll merely record that x is bound to (vector y)
;; in our environment:

; --> {{ x = (vector 7) }}
;     (let* ([y (+ (vector-ref x 0) 1)]
;            [ignore (vector-set! x 0 2)]
;            [z (+ (vector-ref x 0) y)])
;       (+ (vector-ref x 0) y z))

;; Now, when we go to evaluate y, we will look into our enviroment for the
;; current state of the vector bound to x. Otherwise, we carry evaluation
;; normally:

; --> {{ x = (vector 7) }}
;     (let* ([y (+ 7 1)]
;            [ignore (vector-set! x 0 2)]
;            [z (+ (vector-ref x 0) y)])
;       (+ (vector-ref x 0) y z))
;
; --> {{ x = (vector 7) }}
;     (let* ([y 8]
;            [ignore (vector-set! x 0 2)]
;            [z (+ (vector-ref x 0) y)])
;       (+ (vector-ref x 0) y z))
;
; --> {{ x = (vector 7) }}
;     (let* ([ignore (vector-set! x 0 2)]
;            [z (+ (vector-ref x 0) 8)])
;       (+ (vector-ref x 0) 8 z))

;; From here, the next binding in our let* will mutate the entry for x in the
;; environment. Complete the execution trace of the program using the style
;; outlined above to accurately track the state of x. You should obtain 20
;; as the final result of the let*.

; <TODO: finish the trace here>

;; -----------------------------------------------------------------------------
(part "Problem: Acclimating to the Environment")

;; Give an execution trace of the following calls to f and g, functions that
;; operate over a mutable vector. For your trace, if a function call evaluates
;; to a conditional, you may instead step directly to the branch of that
;; conditional that is selected. Make sure to include the environment in each
;; of your steps:

(define f
  (lambda (vec)
    (begin
      (vector-set! vec 0 "h")
      (vector-set! vec 3 (vector-ref vec 2))
      (let ([x (vector-ref vec 1)])
        (begin
          (vector-set! vec 1 (vector-ref vec 4))
          (vector-set! vec 4 x)
          vec)))))

(define g
  (lambda (vec)
    (if (zero? (vector-ref vec 1))
        (vector-ref vec 0)
        (begin
          (vector-set! vec 0 (* 2 (vector-ref vec 0)))
          (vector-set! vec 1 (- (vector-ref vec 1) 1))
          (g vec)))))

; (a)
(f (vector "q" "o" "l" "p" "e"))

;; <TODO: provide your trace here!>

; (b)
(g (vector 5 3))

;; <TODO: provide your trace here!>

;; -----------------------------------------------------------------------------
(part "Problem: More Vector Recursion Practice")

;; To continue practicing writing functions over vectors using numeric
;; recursion, implementing the following functions. Make sure to provide
;; an appropriate test suite for each implemented function.

; (my-vector-fill! vec val) -> void
;   vec: vector?
;   val: any
; Replaces every element of vec with the value val.
(define my-vector-fill!
  (lambda (vec val)
    ; TODO: implement me!
    void
  ))

; TODO: provide your test suite here!

; (vector-reverse vec) -> vector?
;   vec: vector?
; Returns a new vector identical to vec but the elements are in reverse order.
(define vector-reverse
  (lambda (vec)
    ; TODO: implement me!
    (vector 0)
  ))

; TODO: provide your test suite here!

;; -----------------------------------------------------------------------------
(part "Optional Problem: Even More Vector Recursion Practice")

;; Implement the following variant of reverse that performs reversal in-place,
;; i.e., the function mutates the input vector so it is reversed rather than
;; return a new vector that is a reversed version of the input. Again, test
;; your function after you are done to ensure that your implementation works.

; (vector-reverse! vec) -> void
;   vec: vector?
; Mutates vec so that its elements are in reverse order.
(define vector-reverse!
  (lambda (vec)
    ; TODO: implement me!
    void
  ))