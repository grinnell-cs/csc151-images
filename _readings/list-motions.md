---
title: List Motions
---

Our recursive skeleton gives us a framework for writing recursive functions over lists.
This is an _algorithmic_ perspective on problem-solving.
We have identified an algorithmic technique, recursion, and built a system for developing programs that use that technique.

In contrast, it is beneficial to develop perspectives on problem-solving that are _data-centric_ in nature.
In particular, we frequently express our solutions to problems in terms of manipulating lists, _e.g._,

+   _Traverse_ a list to sum its elements.
+   _Insert_ an element at a particular position in a list.
+   _Delete_ the first occurrence of an element from the list.

Thus, it is beneficial to have in our toolbox, the ability to write variants of these fundamental _motions_ over the data structure in question.
For our purposes, these motions become particular patterns of recursive programming over lists that are useful to understand and internalize.

## Traversal

Our basic recursive skeleton itself performs a traversal over a list!
For example, in computing the length of a list:

<pre class="scamper source">
(import test)

(define list-length
  (lambda (lst)
    (match lst
      [null 0]
      [(cons _ tail) (+ 1 (list-length tail))])))

(test-case "length empty"
  equal? 0
  (lambda ()
    (length null)))

(test-case "length non-empty"
  equal? 12
  (lambda ()
    (length (range 12))))
</pre>

We necessarily walk every element of the list!
More specifically, the combination of:

{:type="a"}
1.  Peeling off the `head` of the list in the recursive case.
2.  Recursively analyzing the `tail` of the list.

Is how we walk the list and process each element, one-by-one.

## Insertion

To insert an element into the list, we can traverse to a particular position and then use `cons` to add an element to the front.
For example, here is a function that inserts a character in front of the first occurrence of another character in a list.
`(insert-before c1 c2 lst)` inserts `c1` before the first occurrence of `c2` in `lst` or at the end of the list if `lst` does not contain `c2`.
First, here's the recursive decomposition:

> To insert `c1` before `c2` inside of `lst`:
> +   If `lst` is empty, then `c2` is definitely not inside of `lst`.
      We insert `c1` into this list, yielding the list just containing `c1`.
> +   If `lst` is non-empty, then:
>     -   If the `head` is equal to `c1`, then return `lst` but with `c1` at the front.
>     -   If the `head` is not equal to `c1`, then return the result of inserting `c1` before `c2` inside the tail of the list and add the `head` back onto the front of that result.

Observe how we have carefully expressed the "work" of the recursive decomposition---looking for `c2` inside of `lst`---in terms of the `head` and `tail` of the list.

Now, let's look at the implementation:

<pre class="scamper source">
(import test)

(define insert-before
  (lambda (c1 c2 lst)
    (match lst
      [null (list c1)]
      [(cons head tail)
       (if (equal? head c2)
           (cons c1 lst)
           (cons head (insert-before c1 c2 tail)))])))

(test-case "insert-before empty"
  equal? (list #\!)
  (lambda ()
    (insert-before #\! #\c null)))

(test-case "insert-before non-empty"
  equal? (list #\a #\b #\! #\c #\d)
  (lambda ()
    (insert-before #\! #\c (list #\a #\b #\c #\d))))
</pre>

In the recursive case, we perform different behavior depending on whether `head` is the character we are looking to insert before in `lst`.

+   If `head` is `c2`, then we insert `c1` by using `cons` to insert into the front of the list.
+   If `head` is not `c2`, then we recursively insert into the tail, _making sure to append `head` onto the result_.

This last bit of behavior is important!
Observe how `insert-before` works step-by-step:

~~~racket
    (insert-before #\! #\c (list #\a #\b #\c #\d)))
--> (cons #\a (insert-before #\! #\c (list #\b #\c #\d)))
--> (cons #\a (cons #\b (insert-before #\! #\c (list #\c #\d)))
--> (cons #\a (cons #\b (cons #\! (list #\c #\d))))
--> (cons #\a (cons #\b (list #\! #\c #\d)))
--> (cons #\a (list #\b #\! #\c #\d))
--> (list #\a #\b #\! #\c #\d)
~~~

Notice how in the execution of `insert-before` we _broke apart the list_ and then _built it back up_.
In other languages, we could directly modify the input list to contain the element in the desired position, _e.g._, with indexing.
However, in pure, functional languages like Scheme/Scamper, we have to destruct the list (with `match`) and then reconstruct the list with the desired modification.
The modification, insertion in this case, is achieved with a precise call to `cons` at the correct point in the list.
To reconstruct the list, we need to make sure to restore every `head` element we peel off with a corresponding `cons` call.

## Deletion

Because we are destructing and reconstructing the list during recursive traversal, deletion is performed _by omission_.
To "delete" an element from a list, we simply need to not `cons` it back in as we reconstruct the list.
For example, `(delete-first x lst)` returns `lst` but with the first occurrence of `x` removed, if it occurs in `lst` at all.

<pre class="scamper source">
(import test)

(define delete-first
  (lambda (x lst)
    (match lst
      [null null]
      [(cons head tail)
       (if (equal? head x)
           tail
           (cons head (delete-first x tail)))])))

(test-case "delete-first empty"
  equal? null
  (lambda ()
    (delete-first 0 null)))

(test-case "delete-first non-empty"
  equal? (list 3 1 8 2)
  (lambda ()
    (delete-first 0 (list 3 1 0 8 2))))
</pre>

In the recursive case, we test to see if `head` is equal to the element we are looking for, `x`.
If we find it, then we delete it by simply _not `cons`ing_ it onto our result.
This means we are left with returning the `tail` of the list unmodified.
As we return from subsequent recursive calls, we will then `cons` the peeled-off `heads` onto the front of the list in the order they were received.

~~~racket
    (delete-first 0 (list 3 1 0 8 2))
--> (cons 3 (delete-first 0 (list 1 0 8 2)))
--> (cons 3 (cons 1 (delete-first 0 (list 0 8 2))))
--> (cons 3 (cons 1 (list 8 2)))
--> (list 3 (list 1 8 2))
--> (list 3 1 8 2)
~~~

# Self-checks

## Problem: Replace-First, (‡)

Write a function `(replace-first x y lst)` that returns `lst` but replaces the first occurrence of `x` with `y` inside of `lst`.
If `x` is not in `lst`, then `lst` is returned.

~~~racket
> (replace-first 0 100 (list 1 8 0 9 5))
(list 1 8 100 9 5)

> (replace-first 0 100 null)
null
~~~