---
title: Higher-order design, recursive and other
summary: |
  In this reading, we apply recursive design to higher-order procedures, revisiting the big three list functions: map, filter, and fold.
---

After writing many recursive functions you may have noticed general patterns in the code you wrote.
For example, calculating the length of a list:

~~~racket
(define length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (length (cdr lst))))))
~~~

That should look similar to summing the elements of a list:

~~~racket
(define sum
  (lambda (lst)
    (if (null? lst)
        0
        (else (+ (car lst) (sum cdr lst))))))
~~~

Which, with a little bit of eye-contortion, is similar to appending lists:

~~~racket
(define append
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (append (cdr l1) l2)))))
~~~

In all three cases:

* We perform a case analysis on list in question.
* In the base case, we return a value that is constant relative to the list we perform case analysis over: `0` and `l2`.
+ In the recursive case, we apply a function (`+` or `cons`) to a value dependent on the head value of the list (`1` or `x`) and the result of recursively calling the function.

In the spirit of functions-as-abstractions, can we write a function that captures this generic behavior?
This line of investigation leads us back to the big three list functions, `map`, `filter`, and `reduce`/`foldl`/`foldr`!
We motivate the design of *higher-order recursive functions* by examining their implementation and discuss their limitations in more detail.

## Map

Recall that `(map fun lst)` returns a new list in which each element is the corresponding element of `lst` transformed by unary function `fun`.
For example, we can `(map increment nums)` to increment all the elements of `nums` by 1 or we can `(map zero? nums)` to turn every element of `l` into a boolean denoting whether that element was zero.

How can we implement `map`?
Let's try writing out the `inc-list-1` and `list-zero?` functions using recursion and note the similarities.

{% capture code %}
~~~racket
(define inc-list-1
  (lambda (lst)
    (if (null? lst)
        null
        (cons (+ (car lst) 1) (inc-list-1 (cdr lst))))))

(define list-zero?
  (lambda (lst)
    (if (null? lst)
        null
        (cons (zero? (car lst)) (list-zero? (cdr lst))))))
{% endcapture %}

{% include toggle-field.html id="toggle-map-aux" button="Specialized mapping functions" text=code %}

We can see that the functions are very similar:

+ In the base case, we return `null` because there are no elements to transform.
+ In the recursive case, we apply our desired function (`+` and `zero?`) to the head element and cons that onto the result of recursively processing the tail of the list.

We can use this recursive design to drive our implementation of `map`.
We can also observe that the only difference in the two implementation is the *function* we apply to the head element.
If we take one of the implementations and *abstract away* the applied function to an additional parameter, we also arrive at our desired function.

{% capture code %}
~~~racket
;;; (map fun lst) -> list?
;;;   fun : procedure? (unary)
;;;   lst : list?
;;; Returns a list in which each element is the corresponding element
;;; for lst with fun applied to it.
(define map
  (lambda (f lst)
    (if (null? lst)
        null
        (cons (f (car lst)) 
              (map f (cdr lst))))))
~~~
{% endcapture %}

{% include toggle-field.html id="toggle-map" button="map" text=code %}

We have already seen and used `map` extensively as the backbone of our computational pipelines.
Whenever we encounter a recursive function that is really just a `map` call, we should just use `map` instead.
However, are there situations where we want to transform the elements of a list where we cannot not use `map`?

Let's consider the problem of transforming a list of characters, presumed to be letters, into symbols denoting whether that character is a consonant (`'c`) or a vowel (`'v`).
We can first write a function to test if an individual character is a vowel and then *lift* that to a list of characters with `andmap`.

{% capture code %}
~~~racket
(define vowel?
  (lambda (c)
    (or (equal? c #\a)
        (equal? c #\e)
        (equal? c #\i)
        (equal? c #\o)
        (equal? c #\u))))

(define list-of-vowels? (cut (andmap vowel? <>)))
~~~
{% endcapture %}

{% include toggle-field.html id="toggle-vowel" button="vowel?" text=code %}

This seems straightforward enough to write.
However, we forgot a pesky corner case: the letter 'y':

> 'y' is considered a vowel whenever it follows a consonant.
> Otherwise it is a consonant itself.

We can see more clearly now why `map` is now insufficient for perform this `vowel?` computation over a list of characters.
We would need to extend `vowel?` with an extra argument---the previous letter in the sequence---in order to determine if an occurrence of 'y' is a vowel.
However, `map`, by design, only takes functions of one argument!

In general, `map` operates on each of its elements *individually*.
We say that `map` is *non-contextual*: it only "knows" one element at a time and is not "aware" of its prior processing or what is coming up next.
If our transformation requires information about the elements surrounding the one in question, we either need to consider another approach, *e.g.*, writing the recursive function by hand or generalizing `map` appropriately.

## Filter

Recall that `(filter pred? lst)` is like `map` except:

+   We require that `pred?` is a function that takes an element of `lst` and then produces a boolean.
+   `filter` uses that boolean to determine whether to keep that element (`#t` or anything trueish) or drop that element (`#f`) from the list.

We'll omit the implementation of `filter` here because it is very close to `map` and leave it as a self-check exercise below.
However, `filter` inherits the same non-contextual limitations as `map`---`filter` can only decide whether to keep an element based on the current element and no other information.
This means that `filter` cannot remove "all-but-one" of a particular element---it can't "remember" whether it has previously kept an element yet!

Furthermore, `filter` must process all the elements of the list.
We can't short-circuit execution of `filter` because we have no way of specifying to `filter` when to stop execution.
For example, we might want to remove just the first occurrence of a value from a list---`filter` cannot do this.
In this situation, we would need to write a custom recursive function for this task.

## Reduce/Fold

Unliked `map` and `filter`, `reduce` is used to *summarize* the elements of a list.
Unlike `map` and `filter`, this means that these functions must be contextual in nature: we have to pass information between successive elements in the computation.
This is the *accumulated* result of the computation so far.

`reduce` was likely a bit arcane when we first encountered it several weeks ago.
Recall that `(reduce fun lst)` took two arguments as input:

+   A function `fun` of two arguments (a *binary* function).
    The first argument is an element of `lst`.
    The second argument is the result *accumulated* so far in the computation.
+   A list `lst` that `reduce` traverses in some order.

~~~racket
> (reduce + (list 1 2 3 4 5))
15
> (reduce * (list 1 2 3 4 5))
120
~~~

To get a better sense of what `reduce` is doing, let's again try writing specialized recursive functions `reduce-by-+` and `reduce-by-*` that reduce the list with `+` and `*`, respectively.

{% capture code %}
~~~
(define reduce-by-+
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (+ (car lst) (reduce-by-+ (cdr lst))))))

(define reduce-by-*
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (* (car lst) (reduce-by-* (cdr lst))))))
~~~

~~~racket
> (reduce-by-+ (list 1 2 3 4 5))
15
> (reduce-by-* (list 1 2 3 4 5))
120
~~~
{% endcapture %}

{% capture caption %}
Even though there are sensible values we can provide when the list is empty, we capture `reduce`'s behavior here where an error is given when the list is empty.
{% endcapture %}

{% include toggle-field.html id="toggle-reduce-aux" button="reduce-by examples" text=code caption=caption %}

We can see from our implementations that `reduce` repeatedly applies the binary function (`+` or `*`) to the current element and the result of recursively processing the remainder of the list.
With these concrete implementations, we can get more intuition about how `reduce` works:

~~~racket
    (reduce-by-+ (list 1 2 3 4 5))
--> (+ 1 (reduce-by-+ '(2 3 4 5)))
--> (+ 1 (+ 2 reduce-by-+ '(3 4 5)))
--> (+ 1 (+ 2 (+ 3 (reduce-by-+ '(4 5)))))
--> (+ 1 (+ 2 (+ 3 (+ 4 (reduce-by-+ '(5))))))
--> (+ 1 (+ 2 (+ 3 (+ 4 5))))
--> 15
~~~

And with this intuition and our two concrete implementations, we can derive the following recursive design for `(reduce f l)`:

+   (If the list is empty, we raise an error.)
+   If the list contains 1 element, we return that element.
+   Otherwise, the list contains at least 2 elements.
    We apply `fun` to the head of the list and the result of recursively reducing the rest of the list.

And then turn this design into an implementation of `reduce`:

{% capture code %}
~~~racket
(define reduce-right
  (lambda (f lst)
    (if (null? (cdr lst))
        (car lst)
        (f (car lst) (reduce-right f (cdr lst))))))
~~~

~~~racket
> (reduce + (list 1 2 3 4 5))
15
> (reduce * (list 1 2 3 4 5))
120
~~~
{% endcapture %}

{% include toggle-field.html id="toggle-reduce" button="reduce" text=code caption=caption %}

**Initial values and fold**

The restriction that `reduce` must take a non-empty list is burdensome.
Many times, we want our functions to operate without having to provide special cases for when the input list is empty.
A related issue is that the result of `reduce` must the same type as the elements of the input list.

We can fix both of these issues by generalizing `reduce` to take an *initial value* as a third argument.
This gives us a meaningful value to return in the base case.
Furthermore, now the binary operation can produce a value of the same type as the initial value which doesn't have to be the same type as the list.
We call this generalization `foldr`:

{% capture code %}
~~~racket
(define foldr
  (lambda (fun init lst)
    (if (null? lst)
        init
        (fun (car lst)
             (foldr fun init (cdr lst))))))

> (foldr + 0 (list 1 2 3 4 5))
15
> (foldr * 1 (list 1 2 3 4 5))
120
~~~
{% endcapture %}

{% include toggle-field.html id="toggle-foldr" button="foldr" text=code %}

**Direction of folding**

Besides the inclusion of the `init` parameter, `foldr`'s definition is identical to `reduce`.
Thus, we expect it to evaluate in a similar fashion:

~~~racket
    (foldr + 0 (list 1 2 3 4 5))
--> (+ 1 (foldr + 0 '(2 3 4 5)))
--> (+ 1 (+ 2 (foldr + 0 '(3 4 5))))
--> (+ 1 (+ 2 (+ 3 (foldr + 0 '(4 5)))))
--> (+ 1 (+ 2 (+ 3 (+ 4 (foldr + 0 '(5))))))
--> (+ 1 (+ 2 (+ 3 (+ 4 (+ 5 (foldr + 0 '()))))))
--> (+ 1 (+ 2 (+ 3 (+ 4 (+ 5 0)))))
--> 15
~~~

Note how we process the list!
We proceed by first adding the last element `5` to the initial value `0` and then work from *right-to-left* in the list.
This is why our implementation is called `foldr`---it is *right-associative* fold of the list.
`foldl` is similar to `foldr` but proceeds in a *left-associative* manner.

~~~racket
    (foldl + 0 (list 1 2 3 4 5))
--> (foldl + (+ 0 1) '(2 3 4 5))
--> (foldl + (+ (+ 0 1) 2) '(3 4 5))
--> (foldl + (+ (+ (+ 0 1) 2) 3) '(4 5))
--> (foldl + (+ (+ (+ (+ 0 1) 2) 3) 4) '(5))
--> (foldl + (+ (+ (+ (+ (+ 0 1) 2) 3) 4) 5) '())
--> (+ (+ (+ (+ (+ 0 1) 2) 3) 4) 5)
~~~

Addition is a symmetric operator, so it doesn't matter whether we associate `+` to the left or to the right.
However, this is not true in general, *e.g.*, suppose we use `string-append` to collapse a list of strings into a single string by joining all the strings together:

~~~racket
> (foldl string-append "" (list "!" "%" "#" "@"))
"@#%!"
> (foldr string-append "" (list "!" "%" "#" "@"))
"!%#@"
~~~

The result is slightly counterintuitive until we consider how the arguments to `foldl` and `foldr` are arranged.
From the [documentation](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._foldl%29%29):

> If foldl is called with n lists, then proc must take n+1 arguments.
> The extra argument is the combined return values so far.
> The proc is initially invoked with the first item of each list, and the final argument is init.

In both cases `f` is called with the element of the list in first position and the accumulated result in the second position.
(The standard library definitions of `foldl` and `foldr` generalize the computation to an arbitrary number of lists passed as input; our version only allows for one list.)
We thus obtain the following expanded computation using `foldl`:

~~~racket
(string-append "@" (string-append "#" (string-append "%" (string-append "!" ""))))
~~~

And for `foldr`:

~~~racket
(string-append "!" (string-append "%" (string-append "#" (string-append "@" ""))))
~~~

Note that the inner-most calls involving the initial values are performed on the left-most element for `foldl` and the right-most element for `foldr`.

## Returning procedures

You've seen a bit about the "big three" list procedures and how we might
implement them.  We've achieved generality, in part, by using proedures
as parameters to these procedures.  But we can do more.

Just as it is possible for procedures to take procedures as their
parameters, it is also possible for procedures to produce new procedures
as their return values. For example, here is a procedure that takes
one parameter, a number, and creates a procedure that multiplies its
parameters by that number.  (We know you can write this with `section`;
let's pretend that `section` does not yet exist.)

```
;;; (make-multiplier n) -> procedure?
;;;   n : numbers?
;;; Create a procedure that takes one parameter, a number, and returns
;;; (* n that-number).
(define make-multiplier
  (lambda (n) ; n is the parameter to make-multiplier
    ; Return value: A procedure
    (lambda (v) 
      (* n v))))
```

Let's test it out.

```
> (make-multiplier 5)
#<procedure>
> (define timesfive (make-multiplier 5))
> (timesfive 4)
20
> (timesfive 101)
505
> (map (make-multiplier 3) (list 1 2 3))
(3 6 9)
```

We can use the same technique to build a version of the legendary
*compose* operation that, given two functions, `f` and `g`, builds
a function that applies `g` and then `f`.  (This version is a bit
simpler than the multi-parameter `o` you have been using.)

```
;;; (compose f g) -> procedure?
;;;   f : procedure? (unary)
;;;   g : procedure? (unary)
;;; Create a new procedure of one input that applies g to the input
;;; and then f to the result.
(define compose
  (lambda (f g) ; f and g are the parameters to compose
    ; compose returns a procedure of one parameter
    (lambda (x)
      ; that procedure applies g, and then applies f.
      (f (g x)))))
```

Here are some experiments with that procedure.

```
> (define add2 (lambda (x) (+ 2 x)))
> (define mul5 (lambda (x) (* 5 x)))
> (define fun1 (compose add2 mul5))
> (fun1 5)
27
> (fun1 3)
17
> (define fun2 (compose mul5 add2))
> (fun2 5)
35
> (fun2 3)
25
```

Especially when using `map`, we often write anonymous procedures that look something like the following.

```racket
  (lambda (num) (* 2 num))
```

Even `make-multiplier` is actually something we might want to
generalize. You'll note that in that procedure, we filled in one parameter
`(* n ??)`{:.signature} of a two-parameter procedure (`*`). In pattern form,
we might write:

```racket
  (lambda (val) (BINARY-PROC ARG1 val))
```

Let's think about how we might turn that into procedures. `(left-section binary-proc arg1)` creates a new procedure by filling in the first
argument of a binary procedure. `(right-section` `binary-proc` `arg2`)
creates a new procedure by filling in the second argument of a binary
procedure. We often abbreviate these two procedures as `l-s` and `r-s`.

In the following example, we define procedures that multiply their
parameter by 2 or subtract 3 from their parameter, or some combination
thereof.

```
> (define mul2 (left-section * 2))
mul2
> (define sub3 (right-section - 3))
sub3
> (map mul2 (list 1 2 3 4 5))
(2 4 6 8 10)
> (map sub3 (list 1 2 3 4 5))
(-2 -1 0 1 2)
> (map (compose mul2 sub3) (list 1 2 3 4 5))
(-4 -2 0 2 4)
> (map (compose sub3 mul2) (list 1 2 3 4 5))
(-1 1 3 5 7)
> (map (compose (l-s * 2) (r-s - 3)) (list 1 2 3 4 5))
(-4 -2 0 2 4)
> (map (compose (l-s * 2) (l-s - 3)) (list 1 2 3 4 5))
(4 2 0 -2 -4)
```

Okay, what does `left-section` look like? The definition is fairly
straightforward.

```
;;; (left-section binproc left) -> procedure?
;;; (l-s binproc left) -> procedure?
;;;   binproc : procedure? (two-parameter)
;;;   left : any?
;;; Creates a one-parameter procedure by filling in the first parameter
;;; of binproc. 
(define left-section
  (lambda (binproc arg1)
    ; Build a new procedure of one argument
    (lambda (arg2)
      ; That calls binproc on the appropriate arguments
      (binproc arg1 arg2))))
(define l-s left-section)
```

How is `right-section` defined? We leave that as an exercise for the reader.

## Self-checks

### Check 1: Implementing `filter` (‡)

In our discussion of higher-order recursive functions, we elided the implementation of `filter`.
Write `(filter pred? lst)` based on the recursive design we described in the reading.

### Check 2: Implementing `right-section`.

Implement `right-section` and conduct a few experiments to assure yourself that it works as expected.

### Check 3: The power of fold (Optional)

It is possible to write both `map` and `filter` using `fold`.
Explain how to do so.
