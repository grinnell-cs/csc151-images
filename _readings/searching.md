---
title: Algorithms for searching lists and vectors
summary: |
  We consider a typical problem of computing and a variety of
  algorithms used to solve that problem.
---

## Introduction

To *search* a data structure is to examine its elements one-by-one
until either (a) an element that has a desired property is found or (b)
it can be concluded that the structure contains no element with that
property. For instance, one might search a vector of integers for an even
element, or a vector of pairs for a pair having the string `"elephant"`
as its cdr.

You've already encountered a number of forms of searching in Scheme. 
For example, you've written general procedures that determine whether
there's an element with a particular property or that find elements 
with particular properties.

We're now reading to think about a more general form of searching, one in
which we specify the criterion for searching as a procedure value, rather
than hard-coding the particular criterion in the structure of the search.

## Sequential search

In a linear data structure---such as a flat list, a vector, or a
file---there is an obvious algorithm for conducting a search: Start
at the beginning of the data structure and traverse it, testing
each element. Eventually one will either find an element that has
the desired property or reach the end of the structure without
finding such an element, thus conclusively proving that there is
no such element. Here are a few alternate versions of the algorithm.

<pre class="scamper source">
;;; (list-sequential-search lst pred?) -> any?
;;;   lst, a list
;;;   pred?, a unary predicate
;;; Returns the first element of lst that satisfies pred or #f
;;; if no such element exists.
(define list-sequential-search
  (lambda (lst pred?)
    (match lst
      ; If the list is empty, no values match the predicate.
      [null #f]
      [(cons head tail)
       (if (pred? head)
            ; If the predicate holds on the first value, use that one.
           head
            ; Otherwise, look at the rest of the list
           (list-sequential-search tail pred?))])))

(define helper
  (lambda (i vec pred?)
    (if (>= i (vector-length vec))
        #f
        (if (pred? (vector-ref vec i))
            i
            (helper (+ i 1) vec pred?)))))

;;; (vector-sequential-search vec pred?) -> any?
;;;   vec, a vector
;;;   pred?, a unary predicate
;;; Returns the index of the first element of vec that satisfies
;;; pred? or #f if no such element exists.
(define vector-sequential-search
  (lambda (vec pred?)
    (helper 0 vec pred?)))

(define lst (list 1 3 5 7 8 11 13))
(list-sequential-search lst even?)
(list-sequential-search lst (lambda (x) (= 12 x)))
(list-sequential-search lst (lambda (x) (< 9 x)))

(define vec (vector 1 3 5 7 8 11 13))
(vector-sequential-search vec even?)
(vector-sequential-search vec (lambda (x) (= 12 x)))
(vector-sequential-search vec (lambda (x) (< 9 x)))
</pre>

### Alternative return values

These search procedures return `#f` if the search is unsuccessful. The
first returns the matched value if the search is successful. The second
returns the position in the specified vector at which the desired
element can be found. There are many variants of this idea: One might,
for instance, prefer to signal an error or display a diagnostic message if
a search is unsuccessful. In the case of a successful search, one might
simply return `#t`, if all that is needed is an indication of whether an
element having the desired property is present in or absent from the list.

### Searching for keyed values

One of the most common “real-world” searching problems is that
of searching a collection of compound values for one which matches a
particular portion of the value, known as the *key*. For example, we might
search a phone book for a phone number using a person's name as the key, or
we might search a phone book for a person using the number as key.

You've already seen a structure that supports such searching: association
lists! Since association lists are lists, we can use `list-sequential-search`
with an appropriate predicate to provide an alternative implementation of
`assoc-key? lst k` which returns `#t` if `k` appears as a key somewhere
inside of association list `lst`.

<pre class="scamper source">
(define list-sequential-search
  (lambda (lst pred?)
    (match lst
      ; If the list is empty, no values match the predicate.
      [null #f]
      [(cons head tail)
       (if (pred? head)
            ; If the predicate holds on the first value, use that one.
           head
            ; Otherwise, look at the rest of the list
           (list-sequential-search tail pred?))])))

(define my-assoc-key?
  (lambda (lst key)
    (list-sequential-search lst
      (lambda (p) (equal? (car p) key)))))
</pre>

However, we can also implement this behavior for an arbitrary list of
`struct` values. For example, consider the following code that implements
a directory of faculty members:

<pre class="scamper source-only">
(struct entry (surname given-name uid extension))

;;; grinnell-directory : listof entry?
;;; A list of people at Grinnell with contact information and some
;;; useful attributes.
(define grinnell-directory
  (list
   (entry  "Rebelsky"        "Samuel"  "messy-office" "4410")
   (entry  "Weinman"         "Jerod"   "map-reader"   "9812")
   (entry  "Osera"           "PM"      "type-snob"    "4010")
   (entry  "Curtsinger"      "Charlie" "systems-guy"  "3127")
   (entry  "Dahlby-Albright" "Sarah"   "cheery-coach" "4362")
   (entry  "Rodrigues"       "Liz"     "vivero"       "3362")
   (entry  "Barks"           "Sarah"   "stem-careers" "4940")
   (entry  "Harris"          "Anne"    "babel-tower"  "3000")
   (entry  "Eikmeier"        "Nicole"  "graph-wiz"    "3370")
   (entry  "Johnson"         "Barbara" "code-maven"   "4695")))
</pre>

As you may have noted, each entry is a structure with a surname, a
given name, a user id, and an extension.  In the interest of
separating the interface from the implementation, we'll write helper
procedures to get each part.

*Note*: Although one should not assume that all people have both surnames
and given names, or that they only have one of each, we have done so in the
interest of keeping this example comprehensible.  In a production system,
responsible programmers should handle a variety of kinds of names and accept
arbitrary-length names.  (Of course, by that metric, there are very few
responsible programmers.)

If we wanted to search by a given field of the `struct`, we can generalize
the behavior of `my-assoc-key?`. Observe that the key of an entry in an 
association list is the first element of the pair corresponding to that
entry. Hence, our implementation of `my-assoc-key?` uses `car` to retrieve
that value from the pair. Accessing values of our `struct` is slightly
different. For example:

+ To search by surname, we would use `entry-surname`.
+ To search by given name, we would use `entry-given-name`.

This insight suggests that we can generalize `my-assoc-key?` by adding
an additional parameter, the _projection function_ that should be used
to retrieve the value from each element of the list that will then be fed
to the predicate. The following function, `keyed-list-sequential-search`,
implements this behavior.

<pre class="scamper source">
(struct entry (surname given-name uid extension))

;;; grinnell-directory : listof entry?
;;; A list of people at Grinnell with contact information and some
;;; useful attributes.
(define grinnell-directory
  (list
   (entry  "Rebelsky"        "Samuel"  "messy-office" "4410")
   (entry  "Weinman"         "Jerod"   "map-reader"   "9812")
   (entry  "Osera"           "PM"      "type-snob"    "4010")
   (entry  "Curtsinger"      "Charlie" "systems-guy"  "3127")
   (entry  "Dahlby-Albright" "Sarah"   "cheery-coach" "4362")
   (entry  "Rodrigues"       "Liz"     "vivero"       "3362")
   (entry  "Barks"           "Sarah"   "stem-careers" "4940")
   (entry  "Harris"          "Anne"    "babel-tower"  "3000")
   (entry  "Eikmeier"        "Nicole"  "graph-wiz"    "3370")
   (entry  "Johnson"         "Barbara" "code-maven"   "4695")))

(define keyed-list-sequential-search
  (lambda (lst proj key)
    (match lst
      [null #f]
      [(cons head tail)
       (if (equal? (proj head) key)
           head
           (keyed-list-sequential-search tail proj key))])))

(keyed-list-sequential-search grinnell-directory entry-surname "Osera")
(keyed-list-sequential-search grinnell-directory entry-surname "Sarah")
(keyed-list-sequential-search grinnell-directory entry-given-name "Sarah")

; We can even do more complicated queries by adding complexity to
; our projection function!
(keyed-list-sequential-search grinnell-directory
                              (lambda (entry)
                                (string-append (entry-given-name entry)
                                               " "
                                               (entry-surname entry)))
                                "Sarah Barks")
(keyed-list-sequential-search grinnell-directory
                              (lambda (entry)
                                (string-append (entry-given-name entry)
                                               " "
                                               (entry-surname entry)))
                                "Sarah Dahlby-Algright")
(keyed-list-sequential-search grinnell-directory
                              (lambda (entry)
                                (string-append (entry-given-name entry)
                                               " "
                                               (entry-surname entry)))
                                "Sarah Dahlby-Albright")
</pre>

## Binary search

The sequential search algorithms just described can be quite slow if the
data structure to be searched is large. If one has a number of searches
to carry out in the same data structure, it is often more efficient to
“pre-process” the values, sorting them and transferring them to a
vector, before starting those searches. The reason is that one can then
use the much faster *binary search* algorithm.

Binary search is a more specialized algorithm than sequential search. It
requires a random-access structure, such as a vector, as opposed to
one that offers only sequential access, such as a list. Furthermore, we
require that the structure is _sorted_. What do these restrictions give
us?

As a thought experiment, imagine we are searching for the number 12 in
a vector of 100 numbers. Because our vector is random-access, we can grab
any element from our vector and see if it is 12. Let's imagine we grabbed
index 50 of the vector and found it was value 35. Here's the situation:

~~~
[ <indices 0-49> | 12 | <indices 51-99> ]
                   ^
                  index 50
~~~

So index 50 does not contain our desired value. In a standard search, we
would need to check all the others indices, 0–49 and 51–99, for our value.
However, since our vector is assumed to be sorted, we know something quite
valuable!

+   The values in indices 0–49 must all be less than or equal to 12.
+   The values in indices 51–99 must all be greater than or equal to 12.

Pictorially, we know the following:

~~~
[ <indices 0-49> | 12 | <indices 51-99> ]
       ≤ 12                   ≥ 12
~~~

The value we are looking for is 35, so we know it _cannot_ be located in
indices 0–49 because those values are all less than or equal to 12. We
can _refine_ our search to be exclusively within the indices 51–99!
Observe that this leaves us with a _smaller search problem_: we originally
searched the indices 0–99 and then refined our search (by looking at
index 50) to the indices 51–99. We could then repeat this process until
we either find our desired value or run out of indices to search.

Before we formally describe this algorithm, _binary search_, let's
try executing it on an example so that we have a feel for how it operates.
Let's consider a vector of 10 numbers in sorted order:

~~~
[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
~~~

And suppose that we are looking for the value 20. If we performed a
linear search of the vector, we would need to examine 7 elements to discover
20. Let's see how binary search fares, instead.

Initially, we will search _all_ of the indices of the vector, 0--9. Now
we must choose a element to inspect. Which should we choose? It turns out
that by choosing the _middle_ element of our range, we best take advantage
of the information we gain when when compare this element against our
target. In the case of an even number of elements, there isn't a "middle"
element _per se_, but we can simply round up or down to obtain a concrete
index to search.

With this strategy, we would we choose index $$\lfloor (9 - 0) / 2 \rfloor + 0 = 4$$
to inspect. At this point, there are three possibilities:

+   The chosen index _contains_ our target value. We have found our
    desired value, so we are done.
+   The chosen index's value is _less than_ our target. This means that
    our target value must be _to the right_ of the current index.
+   The chosen index's value is _greater than_ our target. This means
    that our target value must _to the left_ of the current index.

Index 4 of our vector contains the value 11 which is less than our target
value, 20. Therefore, we refine our search to indices 5--9 and repeat the
process. To summarize visually:

```
[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             ^
           index 4
```

Initially, we search indices 0–9 and then inspect index 4. We see that the
element at index 4, 11, is less than our target value 20. Therefore, we
refine our search as follows:

```
[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                 ~~~~~~~~~~~~~~~~~~~
                         ^
                      index 7
```

The portion of the vector we are searching is underlined with tildes, _i.e._,
`~~~`, indices 5–9. We then repeat the process with the middle index of
this range, $$\lfloor (9 - 5) / 2 \rfloor + 5 = 7$$.

Let's continue this process for a few more iterations:

```
[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                 ~~~~~~~~~~~~~~~~~~~
                         ^
                       index 7

==> 28 > 20, so now we search indices 5–6

[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                 ~~~~~~~
                 ^
                index 5

==> 28 > 20, so now we search indices 5–6

[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                     ~~~
                      ^
                    index 6

==> We found 20 at index 6!
```

Our search ends once we find the target value. Note that if we were
searching for a value not in the vector, _e.g._, 21, then we would
eventually run out of indices to search. At that point, we would know
that the target value was not in the vector.

In summary, here is a step-by-step execution of the binary search
algorithm on our vector. At each step, we note the indices under
consideration by underlining them as well as the middle element that
will be compared against the target value:

```
[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             ^ (index 4)

[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                 ~~~~~~~~~~~~~~~~~~~
                          ^ (index 7)

[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                 ~~~~~~~
                 ^ (index 5)

[2, 3, 7, 9, 11, 15, 20, 28, 40, 50]
                     ~~~
                     ^ (index 6)
```

### A Recursive Algorithm for Binary Search

We can define the binary search algorithm as a recursive algorithm.
Unlike the previous recursive algorithms we've seen which perform
case analysis on the structure of a list or a single natural number, we
instead perform analysis on the _range of the vector we're searching
and its middle element_.

To search indices `i` to `j` of a vector `vec` for a target value `t`
(assuming `i ≤ j`):

+   If `(i, j)` is not a valid range of indices in `vec`, then we have
    not found `t` in `vec`, return `#f`.
+   Otherwise, let `v` be the value at the middle index `k` of the
    range `(i, j)`, computed via `k = floor((j - i) / 2) + i`:

    -   If `v` is equal to `t`, then we have found `t`, return `#t`.
    -   If `v` is less than `t`, then recursively search the range `(k+1, j)`.
    -   Otherwise, `v` is greater than `t`. Recursively search the range `(i, k-1)`.

To search the entire vector, we can start the search with indices `i = 0`
and `j = length(vec) - 1`.

While more complicated than other recursive decompositions we've seen,
let's translate this into code. Here's our implementation of binary
search in Scheme:

<pre class="scamper source">
;;; (search-helper vec target i j) -> integer? or #f
;;;   vec: vector?, sorted
;;;   target: any
;;;   i, j: integer?, non-negative
;;; Returns an index of value target within the indices (i, j) of
;;; vec if it exists or #f if the target is not found.
(define search-helper
  (lambda (vec target i j)
    (if (< (- j i) 0)
        #f
        (let* ([k (+ i (floor (/ (- j i) 2)))]
               [v (vector-ref vec k)])
          (cond
            [(equal? target v) k]
            [(< v target)      (search-helper vec target (+ k 1) j)]
            [else              (search-helper vec target i (- k 1))])))))

;;; (binary-search vec target) -> integer? or #f
;;;   vec: vector? sorted
;;;   target: any
;;; Returns an index of value target within vec if it exists or #f
;;; #f if the target is not found.
(define binary-search
  (lambda (vec target)
    (search-helper vec target 0 (- (vector-length vec) 1))))

(binary-search (vector 2 3 7 9 11 15 20 28 40 50) 20)
</pre>

### An example: searching for primes

As an example of the efficiency of binary search, let's take a detour into
a traditional mathematical problem: *Given a number, n, how do you decide if
n is prime?* As you might expect, there are a number of ways to determine
whether a value is prime. Since we know a lot of primes, for small
primes an easy technique is to search through a vector of known primes. We
can use our `binary-search` function to determine if a number is prime from
this vector.

<pre class="scamper source">
(define search-helper
  (lambda (vec target i j)
    (if (< (- j i) 0)
        #f
        (let* ([k (+ i (floor (/ (- j i) 2)))]
               [v (vector-ref vec k)])
          (cond
            [(equal? target v) k]
            [(< v target)      (search-helper vec target (+ k 1) j)]
            [else              (search-helper vec target i (- k 1))])))))

(define binary-search
  (lambda (vec target)
    (search-helper vec target 0 (- (vector-length vec) 1))))

;;; Value:
;;;   small-primes
;;; Type:
;;;   vector of integers
;;; Contents:
;;;   All of the prime numbers less than 1000, arranged in increasing order.
(define small-primes
  (vector 2 3 5 7 11 13 17 19 23 29 31 37
          41 43 47 53 59 61 67 71 73 79 83 89 97
          101 103 107 109 113 127 131 137 139 149
          151 157 163 167 173 179 181 191 193 197 199
          211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293
          307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397
          401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499
          503 509 521 523 541 547 557 563 569 571 577 587 593 599
          601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691
          701 709 719 727 733 739 743 751 757 761 769 773 787 797
          809 811 821 823 827 829 839 853 857 859 863 877 881 883 887
          907 911 919 929 937 941 947 953 967 971 977 983 991 997))

; The number of primes smaller than 1000
(vector-length small-primes)

(define is-prime
  (lambda (n)
    (not (equal? (binary-search small-primes n) #f))))

(is-prime 231)
(is-prime 241)
(is-prime 967)
</pre>

Now, how many recursive calls do we do in determining whether a
candidate value is a small prime? If we were doing a sequential search,
we'd need to look at all 168 primes less than 1000, so approximately
168 recursive calls would be necessary. In binary search, we split
the 168 into two groups of approximately 84 (one step), split one of
those groups of 84 into two groups of 42 (another step), split one of
those groups into two groups of 21 (another step), split one of those
groups of 21 into two groups of 20 (we'll assume that we don't find the
value), split 10 into 5, 5 into 2, 2 into 1, and then either find it or
don't. That's only about six recursive calls. Much better than the 168.

Now, suppose we listed another 168 or so primes. In sequential search,
we would now have to do 336 recursive calls. With binary search, we'd
only have to do one more recursive call (splitting the 336 or so primes
into two groups of 168).

This slow growth in the number of recursive calls (that is, when
you double the number of elements to search, you double the number of
recursive calls in sequential search, but only add one to the number of
recursive calls in binary search) is one of the reasons that computer
scientists love binary search.

## Self checks

### Check 1: Choices

In our description of binary search, we claimed that it is "optimal"
to choose the middle element of our search range to compare against
the target. In a few sentences, explain why this strategy is
best when we do not know anything about our target value or contents
of our vector up front.

### Check 2: Tracing binary search (‡)

Give a step-by-step trace of the execution of binary search on the
following vector:

~~~
[3, 8, 10, 14, 22, 30, 56, 58, 60, 75, 80, 99]
~~~

With target values:

+ 14
+ 85

## Acknowledgements

This reading was updated in Fall 2021 to use structs rather than vectors
for the directory and student entries.  The Fall 2021 update also included
other minor cleanup. The Fall 2022 update made the code examples live
as well as removed from extraneous discussion to focus on the binary
search algorithm itself.

This reading was rewritten in Fall 2020 to (a) use the new documentation
style, (b) add some comments on data design and assumptions, and
(c) do some more information hiding in the searches.  It is closely based
on the reading from [CSC 151
2019S](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2019S/readings/searching),
or at least we think it is.

That reading was closely based on [a similar reading from CSC 151
2018S](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/readings/searching).
We've removed the references to association lists, added in some
sample directories, renamed `may-precede?` to `less-equal?`, and
cleaned up a few other things.

It appears that most of that reading dates all the back to [CSC 151
2000F](http://www.cs.grinnell.edu/~rebelsky/Courses/CS151/2000F/Readings/searching.html),
although the name of the comparison procedure changed from `less-equal?`
to `may-precede?`.  Isn't it nice that things eventually change
back?

And isn't it terrifying that someone has twenty years worth of this course online?