---
title: "Sample LA: Searching and sorting"
---
# {{ page.title }}

_Update or modify fundamental searching and sorting algorithms or trace the execution of those algorithms over concrete inputs._

Consider the following vector, represented in a way that makes indices and elements clear.

```
 0 : "Addison"
 1 : "Adrian"
 2 : "Aisley"
 3 : "Bailey"
 4 : "Beverly"
 5 : "Blake"
 6 : "Brett"
 7 : "Brook"
 8 : "Dakota"
 9 : "Dallas"
10 : "Dana"
11 : "Ellery"
12 : "Harley"
13 : "Hillary"
14 : "Hunter"
15 : "Jamie"
16 : "Lesley"
17 : "Mackenzie"
18 : "Madison"
19 : "Morgan"
20 : "Parker"
21 : "Quinn"
22 : "Reese"
23 : "Riley"
24 : "Sammie"
25 : "Shawn"
26 : "Taylor"
27 : "Temple"
28 : "Val"
```

As you may recall, the core of `binary-search` (code at the end) keeps track of a lower-bound (inclusive) and upper-bound (exclusive) within which we should be able to find the value, if it's in the vector.  For this vector, the lower-bound starts out as 0 and the upper-bound starts out as 29.

**a. Give the values of lower-bound, upper-bound, midpoint, and middle-key in each step as binary-search searches this vector in the following call.**

```
(binary-search names "Quinn" (lambda (x) x) string-ci<=?)
```

For example,

```
lower-bound: 0, upper-bound: 29
midpoint: 14, middle key "Hunter".  
  "Quinn" should follow "Hunter".

lower-bound: 15, upper-bound: 29 
midpoint: 22, middle key: "Reese"
  "Quinn" should precede "Reese"

lower-bound: 15, upper-bound: 22
midpoint: ??: middle-key: ??
  ...
```

> _Space for an answer._

**b. Give the values of lower-bound, upper-bound, midpoint, and middle-key in each step as binary-search searches this vector in the following call.**

```
> (binary-search names "Charlie" (lambda (x) x) string-ci<=?)
```

> _Space for an answer._

**c. Here is the binary search tree created by `vector->tree` from that vector.  How does a binary-tree search that tree relate to the binary search algorithm on the corresponding vector?**

```
> (vector->tree names)
'("Hunter"
  ("Brook"
   ("Bailey"
    ("Adrian" ("Addison" ◬ ◬) ("Aisley" ◬ ◬))
    ("blake" ("Beverly" ◬ ◬) ("Brett" ◬ ◬)))
   ("Ellery" ("Dallas" ("Dakota" ◬ ◬) ("Dana" ◬ ◬)) ("Hillary" ("Harley" ◬ ◬) ◬)))
  ("Reese"
   ("Madison"
    ("Lesley" ("Jamie" ◬ ◬) ("Mackenzie" ◬ ◬))
    ("Parker" ("Morgan" ◬ ◬) ("Quinn" ◬ ◬)))
   ("Taylor" ("Sammie" ("River" ◬ ◬) ("Shawn" ◬ ◬)) ("Val" ("Temple" ◬ ◬) ◬))))
```

> _Space for an answer._

_Here's the binary search algorithm, in case you need it._

```racket
;;; (binary-search vec key get-key less-equal?) -> integer?
;;;   vec : vector?
;;;   get-key? : procedure? unary?
;;;   less-equal? : procedure? binary?
;;; Search the vector for a value whose key is key.  Returns
;;;   the index of the matching element or #f.
;;; get-key is used to extract the keys and less-equal? 
;;;   specifies the ordering.
;;; Pre: The vector is sorted.  That is,
;;;   (less-equal? (get-key (vector-ref vec i)) 
;;;                (get-key (vector-ref vec (+ i 1))))
;;;   holds for all reasonable i.  
(define binary-search
  (lambda (vec key get-key less-equal?)
    ; Search a portion of the vector from lower-bound to upper-bound
    (letrec ([search-portion 
               (lambda (lower-bound upper-bound)
                 ; If the portion is empty
                 (if (>= lower-bound upper-bound)
                     ; Indicate the value cannot be found
                     #f
                     ; Otherwise, identify the middle point, the element at that 
                     ; point and the key of that element.
                     (let* ([midpoint (quotient (+ lower-bound upper-bound) 2)]
                            [middle-element (vector-ref vec midpoint)]
                            [middle-key (get-key middle-element)])
                       (cond
                         ; If the middle key equals the value, we use the middle value.
                         [(and (less-equal? key middle-key)
                               (less-equal? middle-key key))
                          midpoint]
                         ; If the middle key is too large, look in the left half
                         ; of the region.
                         [(less-equal? key middle-key)
                          (search-portion lower-bound midpoint)]
                         ; Otherwise, the middle key must be too small, so look 
                         ; in the right half of the region.
                         [else
                          (search-portion (+ midpoint 1) upper-bound)]))))])
      (search-portion 0 (vector-length vec)))))
```

## Bonus question

The _selection sort_ algorithm works by repeatedly finding the smallest or largest value in a list or vector and then putting it in the right position.  Here's a mediocre implement of selection sort with lists.

```racket
;;; (selection-sort nums) -> listof real?
;;;   nums : listof real?
;;; Create a sorted version of nums.  Each element is no larger than
;;; the next element.
(define selection-sort
  (lambda (nums)
    (letrec ([helper 
             (lambda (unsorted sorted)
               (if (null? unsorted)
                   sorted
                   (let ([largest (reduce max unsorted)])
                     (helper (remove largest unsorted)
                             (cons largest sorted)))))])
      (helper nums null))))
```

Trace the operation of `selection-sort` on the list `'(6 1 2 8 4 7 3)`.  You need not (and should not) show the steps in `reduce` or `remove`.

For example, if we started with the list `'(1 3 5 4 2)`, you might write something like the following

```
    (selection-sort '(1 3 5 4 3))
--> (helper '(1 3 5 4 3) '())
    ; largest is 5
--> (helper (remove 5 '(1 3 5 4 2)) (cons 5 '()))
--> (helper '(1 3 4 3) '(5))
    ; largest is 4
--> (helper (remove 4 '(1 3 4 2)) (cons 4 '(5)))
--> (helper '(1 3 3) '(4 5))
    ; largest is 3
--> (helper (remove 3 '(1 3 3)) (cons 3 '(4 5)))
--> (helper '(1 3) '(3 4 5))
    ; largest is 3
--> (helper (remove 3 '(1 3)) (cons 3 '(3 4 5)))
--> (helper '(1) '(3 3 4 5))
    ; largest is 1
--> (helper (remove 1 '(1)) (cons 1 '(3 3 4 5)))
--> (helper '() '(1 3 3 4 5))
--> '(1 3 3 4 5)
```

## Bonus question

As you may have noted, our "divide and conquer" algorithms, such as binary search or mergesort, follow a common recursive pattern.

* If we have a base case, we're done; return the "obvious" result.
* If we don't have a base case
    * Split the input into two halves.
    * Recurse on one half or both halves.  Trust the magic recursion
      fairy that the recursion works.
    * Combine the results back together.

The mergesort algorithm, which, if you have not learned already, you will soon learn, sorts a list as follows.

* Empty lists and singleton lists are already sorted.
* Otherwise
    * Split the list in some way that is convenient
    * Sort each half
    * Merge the two sorted halves together

Mergesort works relatively well, and is generally faster than insertion sort or selection sort.

However, there are other sorting algorithms.  The Quicksort algorithm, discovered by C.A.R. Hoare in the late 1950's, works similarly to Mergesort, except that the split is a bit more complex.  Here's a variant of Quicksort, tailored to lists.

* Empty lists and singleton lists are already sorted.
* Otherwise
    * Pick a random value from the list
    * Split the list into (a) the values less than or equal to that
      number and (b) the values strictly greater than that value.
    * Sort each half.

Consider the list `(5 1 9 4 6 3 0 7 8 6)`.  Suppose we pick 6 as the random
value from the list.  

a. What values will be in the first sublist (those less than or equal to 6)?

> _Space for answer_

b. What values will be in the right sublist (those strictly greater than 6)?

> _Space for answer_

c. Suppose the magic recursion fairy sorts the first sublist for us.  What list will be get?

> _Space for answer_

d. Suppose the magic recursion fairy sorts the second sublist for us.  What list will we get?

> _Space for answer_

e. How do we combine those two lists to get a sorted version of the original list?

> _Space for answer_

