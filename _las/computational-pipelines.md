---
title: "Sample LA: Computational Pipelines"
---

# {{ page.title }}

Consider the following list of movies and their ratings on IMBD:

~~~scheme
(define ratings
  (pair "Singin' in the Rain" 8.3)
  (pair "The Perfect Storm" 6.4)
  (pair "Storm of the Century" 7.3)
  (pair "Purple Rain" 6.5)
  (pair "Rain Man" 8.0))
~~~

Write a computational pipeline, _i.e._, an expression consisting of a series of list transformations using higher-order list functions, that transforms `ratings` into the maximum rating of all movies in `ratings` that contain the word `Rain` somewhere inside of them.
For `ratings` above, that expression should evaluate to `8.3` because `"Singin' in the Rain"` has a rating of `8.3`.

For this problem, you will find the following functions from the standard library useful:

+   `(car l)` and `(cdr l)` return the first and second components of a pair, respectively.
+   `(string-contains substr str)` returns `#t` if string `str` contains string `substr` somewhere inside of it.
+   `(max n1 n2 ... nk)` returns the maximum value of the numbers `n1`, ..., `nk`.

(_Note_: even though `ratings` looks like an association list, you should not treat it as such for this problem!
Treat `ratings` like a list whose elements happen to be pairs.)
