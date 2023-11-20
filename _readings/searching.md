---
title: Algorithms for searching lists and vectors
summary: |
  We consider a typical problem of computing and a variety of
  algorithms used to solve that problem.
---

**This reading has been updated for Fall 2021.**

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

In a linear data structure -- such as a flat list, a vector, or a
file -- there is an obvious algorithm for conducting a search: Start
at the beginning of the data structure and traverse it, testing
each element. Eventually one will either find an element that has
the desired property or reach the end of the structure without
finding such an element, thus conclusively proving that there is
no such element. Here are a few alternate versions of the algorithm.

```drracket
;;; Procedure:
;;;   list-sequential-search
;;; Parameters:
;;;   lst, a list
;;;   pred?, a unary predicate
;;; Purpose:
;;;   Searches the list for a value that matches the predicate.
;;; Produces:
;;;   match, a value
;;; Preconditions:
;;;   pred? can be applied to all values in lst.
;;; Postconditions:
;;;   If lst contains an element for which pred? holds, match
;;;     is one such value.
;;;   If lst contains no elements for which pred? holds, match
;;;     is false (#f).
(define list-sequential-search
  (lambda (lst pred?)
    (cond
      ; If the list is empty, no values match the predicate.
      [(null? lst) 
       #f]
      ; If the predicate holds on the first value, use that one.
      [(pred? (car lst)) 
       (car lst)]
      ; Otherwise, look at the rest of the list
      [else 
       (list-sequential-search (cdr lst) pred?)])))
```

```drracket
;;; Procedure:
;;;   vector-sequential-search
;;; Parameters:
;;;   vec, a vector
;;;   pred?, predicate
;;; Purpose: 
;;;   Searches the vector for a value that matches the predicate.
;;; Produces:
;;;   match, a value
;;; Preconditions:
;;;   pred? can be applied to all elements of vec.
;;; Postconditions:
;;;   If vec contains an element for which pred? holds, match
;;;     is the index of one such value.  That is,
;;;     (pred? (vector-ref vec match)) holds.
;;;   If vec contains no elements for which pred? holds, match
;;;     is false (#f).
(define vector-sequential-search
  (lambda (vec pred?)
    ; Grab the length of the vector so that we don't have to
    ; keep recomputing it.
    (let ([len (vector-length vec)])
      ; kernel: Keeps track of the position we're looking at.
      (letrec ([kernel 
                (lambda (position)
                  (cond
                    ; If we've run out of elements, give up.
                    [(= position len) 
                     #f]
                    ; If the current element matches, use it.
                    [(pred? (vector-ref vec position)) 
                     position]
                    ; Otherwise, look in the rest of the vector.
                    [else 
                     (kernel (+ position 1))]))])
        (kernel 0)))))
```

Here's an example of the latter procedure in action.

```drracket
> (define sample (vector 1 3 5 7 8 11 13))
> (vector-sequential-search sample even?)
4 ; The position of 8
> (vector-sequential-search sample (section = 12 <> ))
#f
> (vector-sequential-search sample (section < 9 <>))
5 ; The position of 11
```

### Alternative return values

These search procedures return `#f` if the search is unsuccessful. The
first returns the matched value if the search is successful. The second
returns returns the position in the specified vector at which the desired
element can be found. There are many variants of this idea: One might,
for instance, prefer to signal an error or display a diagnostic message if
a search is unsuccessful. In the case of a successful search, one might
simply return `#t`, if all that is needed is an indication of whether an
element having the desired property is present in or absent from the list.

### Searching for keyed values

One of the most common “real-world” searching problems is that
of searching a collection of compound values for one which matches a
particular portion of the value, known as the *key*. For example, we might
search a phone book for a phone number using a person's name as the key
or we might search a phone book for a person using the number as key. 

You've already seen a structure that supports such searching: hashes.
But we're supposing that we don't have hashes (or don't yet have
hashes).

Since each entry has various things we could use as the key, we should
include a `get-key` procedure as a parameter to our search procedure.

```drracket
;;; Procedure:
;;;   keyed-list-sequential-search
;;; Parameters:
;;;   values, a list of compound values.
;;;   get-key, a procedure that extracts a key from a compound value.
;;;   key, a key to search for.
;;; Purpose:
;;;   Finds a member of the list that has a matching key.
;;; Produces:
;;;   match, a Scheme value
;;;   #f, otherwise.
;;; Preconditions:
;;;   The get-key procedure can be applied to each element of values.
;;; Postconditions:
;;;   If there is no index for which
;;;     (equal? key (get-key (list-ref values index)))
(define keyed-list-sequential-search
  (lambda (values get-key key)
    (list-sequential-search
      values
      (lambda (val) (equal? key (get-key val))))))
```

For example, consider the following directory. 

```drracket
(struct entry (surname given-name uid extension)
  #:transparent)

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
```

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

To search by surname, we would use `entry-surname` for `get-key`.
To search by given name, we would use `entry-given-name` for `get-key`.  
And so on and so forth.

```drracket
> (keyed-list-sequential-search grinnell-directory entry-surname "Osera")
(entry "Osera" "PM" "type-snob" "4010")
> (keyed-list-sequential-search grinnell-directory entry-surname "Sarah")
#f
> (keyed-list-sequential-search grinnell-directory entry-given-name "Sarah")
(entry "Dahlby-Albright" "Sarah" "cheery-coach" "4362")
```

To search by the combination of first and last name, we would most likely need a more complex procedure.

```drracket
> (keyed-list-sequential-search grinnell-directory
                                (lambda (entry) 
                                  (string-append (entry-given-name entry) 
                                                 " " 
                                                 (entry-surname entry)))
                                "Sarah Barks")
(entry "Barks" "Sarah" "stem-careers" "4940")
> (keyed-list-sequential-search grinnell-directory
                                (lambda (entry) 
                                  (string-append (entry-given-name entry) 
                                                 " " 
                                                 (entry-surname entry)))
                                "Sarah Dahlby-Algright")
#f
> (keyed-list-sequential-search grinnell-directory
                                (lambda (entry) 
                                  (string-append (entry-given-name entry) 
                                                 " " 
                                                 (entry-surname entry)))
                                "Sarah Dahlby-Albright")
(entry "Dahlby-Albright" "Sarah" "cheery-coach" "4362")
```

## Binary search

The sequential search algorithms just described can be quite slow if the
data structure to be searched is large. If one has a number of searches
to carry out in the same data structure, it is often more efficient to
“pre-process” the values, sorting them and transferring them to a
vector, before starting those searches. The reason is that one can then
use the much faster *binary search* algorithm.

Binary search is a more specialized algorithm than sequential search. It
requires a random-access structure, such as a vector, as opposed to
one that offers only sequential access, such as a list. Binary search
is limited to the kind of test in which one is looking for a particular
value that has a unique relative position in some ordering. For instance,
one could use a binary search to look for an element equal to 12 in a
vector of integers ordered from smallest to largest, since 12 is uniquely
located between integers less than 12 and integers greater than 12;
but one wouldn't use binary search to look for an even integer, since
the even integers don't have a unique position in any natural ordering
of the integers.

Similarly, while we might use binary search to search for a surname in 
a vector of entries sorted by last name, we would not use binary search
to search by a first name, since they are not likely to be organized
by first name.

In essence, this means that we have to organize the vector based
on the kind of value we want to search for. If we want to search a
directory by surname, we need it alphabetized by surname.  If we
want to search it by phone extension, we organize it by phone
extension.

If you've explored binary search trees, you've seen something much like
binary search.  BST's have the advantage that they are already structured
in such a way to make binary search natural.  At each step, we look at the
"middle" value and then stop, recurse on the left, or recurse on the right.
But what if we just want to keep the values in a sorted vector rather than
putting them in a tree?  We still want to keep track of the portion of the 
data still of interest.  In a vector, we can do that by storing indices
for the start of the region of interest (inclusive) and the end of the 
region of interest (exclusive).  (If you've written or read a procedure
that converts vectors to trees, you may have an idea about those indices.)

So, in binary search, we keep track of the vector, the value searched
for, and the lower and upper bounds of the region still of interest.
The central idea is to divide the region of interest of the sorted
vector into two approximately equal parts, examining the element
at the point of division to determine which of the parts must contain
the value sought.

There are usually three possibilities for the relationship between the
value sought and the element at the point of division.

* The key sought *is* the key of the element at the point of division. 
  The search has succeeded.
* The key sought cannot follow the key of the element at the point of 
  division in the ordering that was used to sort the vector. In this
  case, the value sought must be in a position with a lower index that
  the element at the point of division (if it is present at all) -- in
  other words, it must be in the left half of the region of interest. The
  search procedure invokes itself recursively to search just the left
  half of that region.
* The value sought cannot precede the element at the point of division. 
  In this case, the value sought must be in a higher-indexed position --
  in the right half of the region -- if it is present at all. The search
  procedure invokes itself recursively to search just the right half of
  the region.

There is one other way in which the recursion can terminate: If, in some
recursive call, the region to be searched contains no elements at all,
then the search obviously cannot succeed and the procedure should take
the appropriate failure action.

Here, then, is the basic binary-search algorithm. The identifiers
`lower-bound` and `upper-bound` denote the starting and ending positions
of the region of the vector within which the value sought must lie,
if it is present at all. (We use the convention that the starting and
ending positions are *inclusive* in that they are positions within the
vector that we must include in the search.)

```
;;; (binary-search vec key get-key less-equal?) -> integer?
;;;   vec : vector?
;;;   get-key? : procedure? unary?
;;;   less-equal? : procedure? binary?
;;; Search the vector for a value whose key is key.  Returns
;;;   the index of the matching element or #f.
;;; get-key is used to extract the keys and less-equal? 
;;;   specifies the ordering.
;;; Pre: (less-equal? (get-key (vector-ref vec i)) (get-key (vector-ref vec (+ i 1))))
;;;   holds for all reasonable i.  That is, every element "comes before" the next
;;;   element.
(define binary-search
  (lambda (vec key get-key less-equal?)
    ; Search a portion of the vector from lower-bound (inclusive) 
    ; to upper-bound (exclusive)
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

### An example

So, how do we use binary search to search a sorted vector? It depends on
what the vector contains. Let's suppose each entry is a set of information
on students, sorted by first name.  Here is one such vector.

```
(struct student (given-name surname id major year)
  #:transparent)

(define simulated-students
  (vector
   (student "Amy"       "Zevon"    1336804 "Computer Science"  2023)
   (student "Bob"       "Smith"    1170605 "Mathematics"       2020)
   (student "Charlotte" "Davis"    1304091 "Independent"       2022)
   (student "Danielle"  "Jones"    1472662 "Undeclared"        2021)
   (student "Devon"     "Smith"    1546921 "Computer Science"  2022)
   (student "Erin"      "Anderson" 1320727 "Philosophy"        2023)
   (student "Fred"      "Stone"    1260057 "Linguistics"       2022)
   (student "Greg"      "Jones"    1668280 "Classics"          2020)
   (student "Heather"   "Jones"    1046860 "Classics"          2021)
   (student "Ira"       "Jackson"  1070103 "Political Science" 2022)
   (student "Janet"     "Smith"    1488985 "Chemistry"         2023)
   (student "Karla"     "Hill"     1821167 "Psychology"        2022)
   (student "Leo"       "Levens"   1399810 "English"           2023)
   (student "Maria"     "Moody"    1168059 "Computer Science"  2020)
   (student "Ned"       "Black"    1177023 "Russian"           2022)
   (student "Otto"      "White"    1908656 "Chinese"           2023)
   (student "Paula"     "Hall"     1218704 "Psychology"        2022)
   (student "Quentin"   "Smith"    1679081 "Art History"       2022)
   (student "Rebecca"   "Davis"    1658200 "Biology"           2020)
   (student "Sam"       "Sky"      1085519 "Mathematics"       2022)
   (student "Ted"       "Tedly"    1480618 "GWSS"              2023)
   (student "Urkle"     "Andersen" 1681805 "Anthropology"      2022)
   (student "Violet"    "Teal"     1493989 "Economics"         2023)
   (student "Xerxes"    "Homer"    1547425 "Economics"         2023)
   (student "Yvonne"    "Stein"    1748611 "Sociology"         2022)
   (student "Zed"       "Rebel"    1540899 "Computer Science"  2024)
  ))
```

As in our prior directory example, there are some flaws in the data design.
In addition to the name problem we mentioned earlier, we've assumed that each 
student has only one major; some have more.  (The alumni directory also fails
to acknowledge that situation.)  We've also assumed that student IDs start with 
a digit other than zero.  I don't think that's the case here at Grinnell.  And
what about students who are midyear graduates?  As always, we'll leave that as
topics for more advanced programmers.

Does it seem like we're writing really similar code for each of our structures?
We are.  For now, you'll have to deal with it.  At least we're writing the code.
But you should know that Racket (if not the original Scheme) provides things called
"structs" that help simplify the creation of such structures.

Where were we?  Oh, yes.  We were looking at binary search.

As you may recall, `binary-search` has four parameters: a vector
to search, a key, the procedure that extracts a key from each element
in the vector, and the procedure used to compare keys.  For this
example, the vector to search will be `simulated-students` and the
key to search for will be whatever given name we want. To get the
given name from an entry, we use `student-given-name`. To compare
two names, we use `string-ci<=?`.

So, to find out the index of the entry for the person whose first name is
"Heather", we would write something like the following:

```drracket
> (binary-search simulated-students "Heather" student-given-name string-ci<=?)
8
> (vector-ref simulated-students 8)
(student "Heather" "Jones" 1046860 "Classics" 2021)
```

To make it easier for people who don't want to write so much, we might
wrap that instruction into a more-specific procedure that looks up
people by given name and returns entries, rather than indicies.

```
;;; (lookup-by-given-name directory name) -> student? (or boolean?)
;;;   directory : vectorof student?
;;;   name : string?
;;; Find the entry associated with name.  Return #f if no such entry
;;; exists.
(define lookup-by-given-name
  (lambda (directory name)
    (let ([index (binary-search directory name student-given-name string-ci<=?)])
      (and index
           (vector-ref directory index)))))
```

Let's see how it works.

```
> (lookup-by-given-name simulated-students "Heather")
(student "Heather" "Jones" 1046860 "Classics" 2021)
> (lookup-by-given-name simulated-students "sam")
(student "Sam" "Sky" 1085519 "Mathematics" 2022)
> (lookup-by-given-name simulated-students "Jon")
#f
```

### Another example: Searching for primes

Let's take a detour into a traditional mathematical problem: *Given
a number, n, how do you decide if n is prime?* As you might expect,
there are a number of ways to determine whether or not a value is
prime. Since we know a lot of primes, for small primes an easy
technique is to search through a vector of known primes.

```
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
```

We could, of course, use a sequential search technique to look for a
value in this vector. However, binary search is much more efficient. What
procedure should we use for `get-key`? Well, each value is its own key,
so we use `(lambda (x) x)`. The values are ordered numerically, so we use
`<=` for *`less-equal?`*.

For example,

```
; Is 231 a prime?
> (binary-search small-primes 231 (lambda (x) x) <=)
-1 ; No
; Is 241 a prime?
> (binary-search small-primes 241 (lambda (x) x) <=)
52 ; Yes, it's prime number 52
; How many primes are there less than 1000?
> (vector-length small-primes)
168 
```

In procedure form, we might write

```drracket
(define small-prime?
  (lambda (candidate)
    (binary-search candidate small-primes (lambda (x) x) <=)))
```

Now, how many recursive calls do we do in determining whether or not a
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

### Verifying that a vector is sorted

For `binary-search` to work correctly, we need to have a sorted
vector. Checking that a vector is sorted will require looking at every
neighboring pair of values, so it is not something we want to do every
time we call binary search. However, it is helpful to have such a
procedure available.

```drracket
;;; (vector-sorted? vec get-key less-equal?) -> boolean?
;;;   vec : vector?
;;;   get-key : procedure? unary?
;;;   less-equal? : procedure? binary?
;;; Determine if vec is sorted by key
(define vector-sorted?
  (lambda (vec get-key less-equal?)
    (let ([veclen (vector-length vec)])
      (letrec ([helper (lambda (i)
                         (or (= i (- veclen 1))
                             (and (less-equal? (get-key (vector-ref vec i))
                                               (get-key (vector-ref vec (+ i 1))))
                                  (helper (+ i 1)))))])
        (helper 0)))))
```

Here are some tests for the vectors we defined earlier.

```drracket
> (vector-sorted? small-primes id <=)
#t
> (vector-sorted? simulated-students student-given-name string-ci<=?)
#t
> (vector-sorted? simulated-students student-surname string-ci<=?)
#f
```

## Self checks

These checks might take you a little bit longer, but they're not
complex. However, they are importantly designed to help you understand
searching before starting the lab, so please make your best effort to
complete them.

### Check 1: Where are my keys?

a. Explain the role of the *`pred?`* parameter in
`list-sequential-search`.

b. Explain the role of the *`get-key`* parameter in
`keyed-list-sequential-search`.

c. Explain how these parameters work together to implement a keyed
sequential search.

d. If we double the length of the list, what is the worst case effect
on the number of recursive calls in `list-sequential-search`?

### Check 2: Binary search (‡)

a. Explain the role of the *`less-equal?`* in `binary-search`.

b. In `binary-search`, how do we know if two values are equal?

c. Explain the role of `midpoint`, `middle-element`, `middle-key`,
which are bound in the `let*` of `binary-search`.

d. Describe why and how the *`upper-bound`* of helper `search-portion`
changes when the key we're looking for is less than the middle key.
(If it doesn't change, explain why not.)

e. Describe why and how the *`lower-bound`* of helper `search-portion`
changes when the key we're looking for is greater than the middle key.
(If it doesn't change, explain why not.)

f. If we double the length of the vector, what is the worst case effect
on the number of recursive calls in `binary-search`?

## Acknowledgements

This reading was updated again in Fall 2023 to return to the use of vectors,
since we didn't cover vectors (and may not for the near future).

This reading was updated in Fall 2021 to use structs rather than vectors
for the directory and student entries.  The Fall 2021 update also included
other minor cleanup.

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
