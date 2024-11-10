---
title: Iteration
summary: |
  We generalize the numeric recursion pattern over vectors into a higher-order function that allows us to iterate over the vector and perform mutating computation, analogous to mapping over a list.
---

Throughout our discussion of vectors, we've employed numeric recursion over the current index to perform computation over every element.
Here are some examples below:

<pre class="scamper source">
(import test)

(define my-vector-fill!/helper
  (lambda (i x vec)
    (if (>= i (vector-length vec))
        void
        (begin
          (vector-set! vec i x)
          (my-vector-fill!/helper (+ i 1) x vec)))))

(define my-vector-fill!
  (lambda (x vec)
    (my-vector-fill!/helper 0 x vec)))

(test-case "my-vector-fill!"
  equal? (vector "a" "a" "a" "a" "a")
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-fill! "a" v)
        v))))
</pre>

<pre class="scamper source">
(import test)

(define my-vector-inc-by!/helper
  (lambda (i x vec)
    (if (>= i (vector-length vec))
        void
        (begin
          (vector-set! vec i (+ (vector-ref vec i) x))
          (my-vector-inc-by!/helper (+ i 1) x vec)))))

(define my-vector-inc-by!
  (lambda (x vec)
    (my-vector-inc-by!/helper 0 x vec)))

(test-case "my-vector-inc-by!"
  equal? (vector 2 3 4 5 6)
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-inc-by! 2 v)
        v))))
</pre>

<pre class="scamper source">
(import test)

(define my-vector-downcase!/helper
  (lambda (i vec)
    (if (>= i (vector-length vec))
        void
        (begin
          (vector-set! vec i (string-downcase (vector-ref vec i)))
          (my-vector-downcase!/helper (+ i 1) vec)))))

(define my-vector-downcase!
  (lambda (vec)
    (my-vector-downcase!/helper 0 vec)))

(test-case "my-vector-downcase!"
  equal? (vector "apple" "banana" "calamansi" "date")
  (lambda ()
    (let* ([v (vector "aPPle" "BANANA" "calamansi" "Date")])
      (begin
        (my-vector-downcase! v)
        v))))
</pre>

We observe that each function:

1.  Performs numeric recursion on `i` starting from `0` up to `(vector-length vec)`.
2.  Runs a computation on the `i`th element of the vector and mutates the `i`th slot of the vector to contain the result of this vector.

This is analogous to `map`, but instead of returning a new vector, we mutate every element by the transformation function.
We can write a function that captures this redundancy, `vector-map!`:

<pre class="scamper source">
(import test)

(define my-vector-map!/helper
  (lambda (i f vec)
    (if (>= i (vector-length vec))
        void
        (begin
          (vector-set! vec i (f (vector-ref vec i)))
          (my-vector-map!/helper (+ i 1) f vec)))))

(define my-vector-map!
  (lambda (f vec)
    (my-vector-map!/helper 0 f vec)))

(test-case "my-vector-map! (fill)"
  equal? (vector "a" "a" "a" "a" "a")
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-map! (lambda (x) "a") v)
        v))))

(test-case "my-vector-map! (inc-by 2)"
  equal? (vector 2 3 4 5 6)
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-map! (lambda (x) (+ x 2)) v)
        v))))

(test-case "my-vector-map! (downcase)"
  equal? (vector "apple" "banana" "calamansi" "date")
  (lambda ()
    (let* ([v (vector "aPPle" "BANANA" "calamansi" "Date")])
      (begin
        (my-vector-map! string-downcase v)
        v))))
</pre>

However, there is a pattern latent in `my-vector-map!` that is worthwhile to capture on its own!
By performing numeric recursion in this manner, in effect, we walk over every element of vector and perform some action to every element.
In the case of `my-vector-map!` we walked from index `0` to `(- (vector-length vec) 1)`.
However, we may want to walk over the indices of the vector in different ways, for example,

+   Walk the indices of the vector _backwards_.
+   Explore every other index of the vector.
+   Explore every third index of the vector.

And so forth.
To do this, we can use a combination of two functions from the standard library:

+   `(vector-range beg end step)` is analogous to `range` except that it produces a vector instead of a list.
+   `(vector-for-each f vec)` takes a `vec` as input runs the function `f` on every element of `vec`.
    `f` is a function that takes an element of `vec` as input and produces `void` as output, _i.e._, it produces a side effect.

Our strategy will be to use `vector-range` to produce the vector `(vector 0 1 ... (- (vector-length vec) 1))`.
Then, we will use `vector-for-each` to walk this vector and `f` will take one of its elements, _a valid index into `vec`, and perform an action involving that index.

Here is a reimplementation of `my-vector-map!` with this pattern:

<pre class="scamper source">
(import test)

(define my-vector-map!
  (lambda (f vec)
    (vector-for-each
      (lambda (i)
        (vector-set! vec i (f (vector-ref vec i))))
      (vector-range 0 (vector-length vec)))))

(test-case "my-vector-map! (fill)"
  equal? (vector "a" "a" "a" "a" "a")
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-map! (lambda (x) "a") v)
        v))))

(test-case "my-vector-map! (inc-by 2)"
  equal? (vector 2 3 4 5 6)
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-map! (lambda (x) (+ x 2)) v)
        v))))

(test-case "my-vector-map! (downcase)"
  equal? (vector "apple" "banana" "calamansi" "date")
  (lambda ()
    (let* ([v (vector "aPPle" "BANANA" "calamansi" "Date")])
      (begin
        (my-vector-map! string-downcase v)
        v))))
</pre>

At this point, your redundancy-checking instincts should kick in: using `vector-for-each` and `vector-range` is a pattern that we should capture!
Let's do so, creating a function called `vector-iterate` and reimplementing `my-vector-map!` once and for all using this function.

<pre class="scamper source">
(import test)

(define my-vector-iterate
  (lambda (f vec)
    (vector-for-each f (vector-range 0 (vector-length vec)))))

(define vector-get-and-set!
  (lambda (f i vec)
    (vector-set! vec i (f (vector-ref vec i)))))

(define my-vector-map!
  (lambda (f vec)
    (my-vector-iterate 
      (lambda (i)
        (vector-get-and-set! f i vec))
      vec)))

(test-case "my-vector-map! (fill)"
  equal? (vector "a" "a" "a" "a" "a")
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-map! (lambda (x) "a") v)
        v))))

(test-case "my-vector-map! (inc-by 2)"
  equal? (vector 2 3 4 5 6)
  (lambda ()
    (let* ([v (vector-range 5)])
      (begin
        (my-vector-map! (lambda (x) (+ x 2)) v)
        v))))

(test-case "my-vector-map! (downcase)"
  equal? (vector "apple" "banana" "calamansi" "date")
  (lambda ()
    (let* ([v (vector "aPPle" "BANANA" "calamansi" "Date")])
      (begin
        (my-vector-map! string-downcase v)
        v))))
</pre>

`vector-iterate` captures a fundamental pattern when working with impure code: _iteration_.
When we iterate, we perform a repeated action—the function passed to `vector-iterate`—to each element of a sequence.
Here, we employed that effect to perform a mutating mapping operation over each element of the vector.
As we shall see as we revisit the themes for this week, we can do more than `map`---because we can grab elements from arbitrary positions in the vector with `vector-ref`, we can perform more complex computation, _e.g._, a computation involving an element _and_ its adjacent elements!

## Self-check

### Problem: `vector-do` (‡)

There's even a bit more redundancy to remove on top of this!
In our original examples, observe this redundant code:

<pre class="scamper source-only">
(begin
  (my-vector-inc-by! 2 v)
  v)

; ...

(begin
  (vector-set! vec i (string-downcase (vector-ref vec i)))
  (my-vector-downcase!/helper (- i 1) vec))

; ...

(begin
  (my-vector-downcase! v)
  v)
</pre>

In each case, we:

1.  Perform a mutating operation to a vector `v`.
2.  Return that vector `v` as output.

When we wrote `vector-for-each`, we removed this redundancy by capturing the overall pattern of iteration present in the three functions.
However, capturing this pattern on its own may be useful in the future!

Write a function `(vector-do vec f)` that takes a vector `vec` and function `f` as input and captures the redundancy found in the code above.
The user `f` should pass a function that takes a vector as input and returns `void` as output, _i.e._, `f` mutates the input vector in some fashion.
The function performs that action and then returns the vector as output.
