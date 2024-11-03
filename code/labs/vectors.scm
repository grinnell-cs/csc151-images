;; CSC 151 (SEMESTER)
;; Lab: Vectors (vectors.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

;; In today's lab, we'll explore how we can create and manipulate vectors in
;; Scheme. For each problem, alternative driver/navigator with your partner.

;; -----------------------------------------------------------------------------
(part "Problem: Binding and Sequencing")

;; Whenever possible, we will want to avoid using top-level definitions in
;; favor of local bindings and parameter passing. However, it is relatively
;; easy syntactically to define a top-level vector and mutate it at the top
;; level. But doing so locally requires a particular combination of binding
;; and sequencing with the begin expression that we should get used to.

;; First, let's review how the begin expression works. Consider the following
;; code snippet that attempts to mutate the first, third, and fifth slots of
;; the vector using function chaining:

; (define example-vector (vector 0 1 2 3 4))

; (vector-set!
;   (vector-set!
;     (vector-set! example-vector 0 "zero")
;     2 "two")
;   4 "four")

;; Uncomment the code (highlight the block, then press ctrl-/) and run it.
;; You should receive an error! In a sentence or two, describe the error and
;; why it occurs:

(description "The error is ... It occurs because ... <TODO: fill in!>")

;; (begin ...) allows us to execute a sequence of side effects. Now, let's
;; combine this concept with a local binding to:
;;
;; (a) Create a new vector (as a let-bound variable)
;; (b) Mutate the elements of the vector (using begin and vector-set!)
;; (c) Returns that vector after mutating it.
;;
;; Complete the definition of the function below that:
;;
;; a.  Creates a new vector of five elements, initially with values 0–4
;; b.  Mutates the 1st, 3rd, and 5th elements to be "zero", "two", and
;;     "four."
;; c.  Finally, the function returns that vector as output. Note that a
;;     begin expression produces the value of its final expression as
;;     output.

(define make-and-mutate-vector
  (lambda ()
    ; TODO: complete this function definition
    (vector)
  ))

(test-case "make-and-mutate-vector"
  equal? (vector "zero" 1 "two" 3 "four")
  make-and-mutate-vector)

;; -----------------------------------------------------------------------------
(part "Problem: Swapping")

;; Complete the following function definition using vector-set! that
;; swaps the elements found at two locations in a vector. For this function,
;; make sure to check that i and j are valid indices into the vector. If
;; not, your function should raise an error with (error msg). Additionally,
;; write two at least additional test cases for the function below. Observe
;; with the example test how we use the let/begin pattern from the previous
;; problem to make a vector, mutate it with swap!, and return it.

;; (swap! v i j) -> void?
;;   v: vector?
;;   i: integer?, a valid index into v
;;   j: integer?, a valid index into v
;; Swaps the elements at indices i and j of v.
(define swap!
  (lambda (vec i j)
    ; TODO: implement me!
    void))

(test-case "swap-test-1"
  equal? (vector 0 3 2 1 4)
  (lambda ()
    (let ([v (vector 0 1 2 3 4)])
      (begin
        (swap! v 1 3)
        v))))

; TODO: add at least two more tests here!

;; -----------------------------------------------------------------------------
(part "Problem: Incrementing in two ways")

;; A common "stateful" operation we might consider is incrementing the
;; value at a particular location in a vector. We may also want the value at
;; at that location either _before_ the increment occurs or _after_ the
;; increment occurs.
;;
;; Implement the following pair of functions:
;;
;; + (pre-inc vec i) takes a vector vec of numbers and a valid index i into
;;   vec as input. The function increments the ith element of vec as a side-
;;   effect and returns the value of the ith element _before_ the increment.
;; + (post-inc vec i) takes a vector vec of numbers and a valid index i into
;;   vec as input. The function increments the ith element of vec as a side-
;;   effect and returns the value of the ith element _after_ the increment.

(define pre-inc
  (lambda (vec i)
    ; TODO: implement me
    0))

(define post-inc
  (lambda (vec i)
    ; TODO: implement me
    0))

;; Write at least three test cases for your functions below. Keep in mind
;; that pre-inc and and post-inc mutate their input vectors, so the effects
;; of previous changes to a test vector will be reflected in your tests if
;; you aren't careful! We recommend using the let/begin pattern from the
;; first problem to write test-cases that are self-contained.

;; TODO: write tests here!

;; -----------------------------------------------------------------------------
(part "Problem: Recursion with Vectors")

;; A notable difference between lists and vectors is that vectors cannot be
;; easily broken up into a head and tail. Our only recourse for creating the
;; tail of a vector is to create a new vector without the head! If the
;; vector is large, then creating these vectors can become very expensive.
;; In contrast, lists are implemented behind the scenes so that we do not
;; need to create a copy of the list to access the tail---it is just available
;; to us.
;;
;; Nevertheless, we can still use recursion to traverse vectors. However,
;; instead of using structural recursion on the vector (because it is not
;; recursively defined), we'll instead use numeric recursion on the indices
;; of the vector. These indices range from 0 to (- 1 (vector-length v)) for
;; a vector v.
;;
;; This "current index" will then become a parameter to our function in
;; question. However, we frequently will want to always start this index at
;; 0 or (- 1 (vector-length vec)) to scan the entire vector. Thus, our
;; recursive functions over vectors will be broken up into two functions:
;;
;; - A "helper" function that takes the current index and vector as input and
;;   actually does the recursion.
;; - A "top-level" function that takes just the vector as input and simply
;;   calls the helper with an appropriate initial index.
;;
;; Let's apply this concept to write a recursive function
;; (vector-contains vec v) that returns #t if and only if v is contained
;; somewhere inside of vec. First, implement the helper function which
;; performs numeric recursion on the index of the vector:

(define vector-contains-helper
  (lambda (vec v i)
    ; TODO: implement me!
    #f))

;; Now, implement the top-level function that calls the helper you wrote
;; with an appropriate initial value for the index:

(define vector-contains
  (lambda (vec v)
    ; TODO: implement me!
    #f))

;; Finally, write test cases for vector-contains below, using the local
;; vector test-case pattern with let/begin described previously.

;; TODO: write your test cases here

;; -----------------------------------------------------------------------------
(part "Problem: More Vector Recursion")

;; Use numeric recursion over vectors to implement the following functions.
;; Make sure to write helper functions that perform the recursion; the
;; signatures of the top-level functions are provided below. Make sure to
;; write test cases to check your work below each implementation.

; (vector-all pred vec) -> bool?
;   pred: a predicate (one-argument function) over the elements of vec
;   vec: vector?
; Returns #t if every element of vec satisifies pred.
(define vector-all
  (lambda (pred vec)
    ; TODO: implement me!
    #f))

; (vector-sum-every-n vec n) -> number?
;   vec: vector? of numbers
;   n: integer?, non-negative
; Returns the sum of every nth element of vec, starting with the first.
; For example, if n = 3, then we sum up the elements at index 0, 3, 6, 9, etc.
(define vector-sum-every-n
  (lambda (vec n)
    ; TODO: implement me!
    0))

;; -----------------------------------------------------------------------------
(part "Problem: Mutable Map")

;; The standard library provides two mapping functions over vector. vector-map
;; behaves identically to map but over a vector. This function operates by
;; creating a new vector that contains the mapped elements. In contrast,
;; vector-map! _mutates_ the input vector to contain the mapped elements.
;;
;; Let's replicate the behavior of vector-map! by implementing
;; (my-vector-map! f vec) with numeric  recursion that performs a mapping
;; operation over vec with f but instead of creating a new vector, it instead
;; mutates each element of vec to be the  result of applying f to that element.
;; The function does not return anything as a result!

(define my-vector-map!
  (lambda (f vec)
    ; TODO: implement me!
    void))