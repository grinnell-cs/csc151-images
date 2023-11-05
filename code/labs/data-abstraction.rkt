#lang racket
(require csc151)
(require rackunit)

;; CSC-151-NN (SEMESTER)
;; Lab: Data Abstraction (data-abstraction.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +-------------------------+----------------------------------------
; | Documentation for names |
; +-------------------------+

;;; (name prefix given middle family suffix) -> name?
;;;   prefix : string? or #f
;;;   given : string?
;;;   middle : string? or #f
;;;   family : string? or #f
;;;   suffix : string? or #f

;;; (name? val) -> boolean?
;;;   val : any?
;;; Determine if val is a name.

;;; (name-prefix name) -> string? or #f
;;;   name : name?
;;; Get the prefix of a name.  Returns #f if the name has no prefix.

;;; (name-given name) -> string?
;;;   name : name?
;;; Get the given name from a name.

;;; (name-middle name) -> string? or #f
;;;   name : name?
;;; Get the middle name from a name.  Returns #f if the name does
;;; not contain a middle name.

;;; (name-family name) -> string? or #f
;;;   name : name?
;;; Get the family name from a name.  Returns #f if the name lacks
;;; a family name.

;;; (name-suffix name) -> string? or #f
;;;   name : name?
;;; Get the suffix from a name.  Returns #f if the name lacks a 
;;; suffix.

; +--------------------------+---------------------------------------
; | Implementations of names |
; +--------------------------+

; Lists
(require (file "names-as-lists.rkt"))

; Vectors
; (require (file "names-as-vectors.rkt"))

; Hash tables
; (require (file "names-as-hash-tables.rkt"))

; Bar-separated strings
; (require (file "names-as-bar-strings.rkt"))

; +--------------+---------------------------------------------------
; | Sample names |
; +--------------+

(define ada (name "Countess" "Ada" "Augusta" "Byron" #f))
(define babbage (name #f "Charles" #f "Babbage" #f))
(define simon (name #f "Simon" #f #f #f))
(define clay (name #f "Roy" #f "Clay" "Sr"))
(define hopper (name #f "Grace" "Murray" "Hopper" #f))
(define qe2 (name "Queen" "Elizabeth" #f #f "II"))

; +----------------+-------------------------------------------------
; | Tests of names |
; +----------------+

(test-true "Admiral Grace Murray Hopper" (name? hopper))
(test-true "Charles Babbage" (name? babbage))
(test-true "Countess Ada Augusta Byron" (name? ada))
(test-true "QEII" (name? qe2))
(test-true "Roy Clay Sr." (name? clay))
(test-true "Simon" (name? simon))

(test-equal? "ada/prefix" (name-prefix ada) "Countess")
(test-equal? "ada/given" (name-given ada) "Ada")
(test-equal? "ada/middle" (name-middle ada) "Augusta")
(test-equal? "ada/family" (name-family ada) "Byron")
(test-false "ada/suffix" (name-suffix ada))

(test-false "babbage/prefix" (name-prefix babbage))
(test-equal? "babbage/given" (name-given babbage) "Charles")
(test-false "babbage/middle" (name-middle babbage))
(test-equal? "babbage/family" (name-family babbage) "Babbage")
(test-false "babbage/suffix" (name-suffix babbage))

(test-equal? "simon/given" (name-given simon) "Simon")
(test-false "simon/family" (name-family simon))
(test-false "simon/middle" (name-middle simon))
(test-false "simon/prefix" (name-prefix simon))
(test-false "simon/suffix" (name-suffix simon))

(test-false "clay/prefix" (name-prefix clay))
(test-equal? "clay/given" (name-given clay) "Roy")
(test-false "clay/middle" (name-middle clay))
(test-equal? "clay/family" (name-family clay) "Clay")
(test-equal? "clay/suffix" (name-suffix clay) "Sr")

(test-false "hopper/prefix" (name-prefix hopper))
(test-equal? "hopper/given" (name-given hopper) "Grace")
(test-equal? "hopper/middle" (name-middle hopper) "Murray")
(test-equal? "hopper/family" (name-family hopper) "Hopper")
(test-false "hopper/suffix" (name-prefix hopper))

(test-equal? "qe2/prefix" (name-prefix qe2) "Queen")
(test-equal? "qe2/given" (name-given qe2) "Elizabeth")
(test-false "qe2/middle" (name-middle qe2))
(test-false "qe2/family" (name-family qe2))
(test-equal? "qe2/suffix" (name-suffix qe2) "II")

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Begin the lab as we always do (or always should): Introduce
yourself to your partner, describe your strength and areas to
improve, discuss work styles, etc.

b. Save this file as `data-abstraction.rkt`.

c. Download the `names-as-???.rkt` files.

d. Quickly review the implementations of names in the files
`names-as-???.rkt` files.

e. Quickly review the tests given in this file.
|#

#| A |#

; +-----------------------------------+------------------------------
; | Exercise 1: From names to strings |
; +-----------------------------------+

#|
a. The practice of presenting your given name before your family
name is not universal; other cultures consider it important to
start with your family name.

Document, write tests for, and implement a procedure, `(name->fg)`.
that takes a name as a parameter and returns a string consisting
of the family name (if there is a family name) and the given name,
separated by spaces.

    > (name->fg simon)
    "Simon"
    > (name->fg clay)
    "Clay Roy"

In case you couldn't tell, the `fg` is supposed to represent
"family-given".
|#

;;; (name->fg name) -> 
;;;   name :
;;;
(define name->fg
  (lambda (name)
    ???))

#|
(test-equal? "(name->fg simon)"
             (name->fg simon)
             "Simon")
(test-equal? "(name->fg clay)"
             (name->fg clay)
             "Clay Roy")
|#

#|
b. Try each of the completed implementation of names to ensure that 
your process works correctly independently of how names are implemented.
You can try each implementation by commenting out the require for
one version and uncommenting another.  Note that `names-as-bar-strings.rkt`
is not yet completed.  You'll complete that in exercise 4.

You do not need to enter anything here; you may just have to fix
your code for `name->fg`.
|#

#| B |#

; +----------------------------------------------+-------------------
; | Exercise 2: From names to strings, revisited |
; +----------------------------------------------+

#|
a. Document, write tests for, and implement a procedure,
`name->simple-string`, that takes a name as input and returns it
as an appropriate string.  Once again, make sure to rely on the
procedures like `name-prefix` rather than the underyling implementation.

    > (name->simple-string qe2)
    "Queen Elizabeth II"
    > (name->simple-string simon)
    "Simon"
    > (name->simple-string babbage)
    "Charles Babbage"
|#

;;; (name->simple-string name) -> 
;;;   name : 
;;; 
(define name->simple-string
  (lambda (name)
    (string-append (if (name-prefix name)
                       (string-append (name-prefix name) " ")
                       "")
                   (name-given name)
                   (if (name-middle name)
                       (string-append " " (name-middle name))
                       "")
                   "FINISH ME")))

#|
(test-equal? "QE2"
             (name->simple-string qe2)
             "Queen Elizabeth II")
|#

#|
b. Once again, make sure your procedure works for each of the three
completed implementations.
|#

; +------------------------------+-----------------------------------
; | Exercise 3: Ordering strings |
; +------------------------------+

#|
You may recall from the reading that there are more things we
want to do with names than just convert them to strings using some
process.  For example, we might want to compare two names so that
we can put them in order.  Here's the start of a procedure to
do so.
|#

;;; (name<=? name1 name2) -> boolean?
;;;   name1 : name?
;;;   name2 : name?
;;; Determine whether name1 should come before name2 in traditional
;;; alphabetical ordering of names.
(define name<=?
  (lambda (name1 name2)
    (string-ci<=? (name->sortable name1) (name->sortable name2))))

#|
a. As you can tell, this relies on `name->sortable`.  Guess what?  It's
your job to write it for this exercise.

    > (name->sortable babbage)
    "Babbage, Charles"
    > (name->sortable simon)
    "Simon"
    > (name->sortable qe2)
    "Queen Elizabeth II"
    > (name->sortable ada)
    "Byron, Ada Augusta Countess"

For information on sort order, you should refer to 

  <https://www.webpages.uidaho.edu/cte492/Modules/M7/12_Rules_of_Filing.pdf>

You will likely need pay attention only to the first five rules.

And it's okay if your procedure is not perfect.
|#

;;; (name->sortable name) -> string?
;;;   name : name?
;;; Convert a name to a form appropriate for sorting/indexing.  Uses
;;; a variant of the ARMA filing rules borrowed from UIdaho.
(define name->sortable
  (lambda (name)
    ""))

#|
b. Using your new version of `name->sortable`, demonstrate what happens
when you sort our list of names.

   > (map name->simple-string 
          (sort (list hopper babbage ada qe2 clay simon) name<=?))

<TODO: Enter the results of this experiment.
|#

#|
c. Write at least three tests for `name->sortable`.  You can rely on the 
names we've defined above.
|#

#| A |#

; +------------------------------------+-----------------------------
; | Exercise 4: Another implementation |
; +------------------------------------+

#|
In a self-check for the corresponding reading, you considered
representing names as "bar-separated values".  We've started 
that implementation in the file `names-as-bar-strings.rkt`.

a. Finish the implementation.

b. Require that file (rather than any of the other implementations)
and ensure that it passes all of our tests.

c.  Verify that all of the procedures you've written still work as 
expected.
|#

#| B |#

; +---------------------------+--------------------------------------
; | Exercise 5: Pointed types |
; +---------------------------+

#|
Suppose we want to represent points in two-space, which have an
x coordinate and a y corrdinate.  
|#

#|
a. Decide on the list of procedures you think it would be useful
for someone to have.

Constructors 

* ...

Predicates

* ...

Extracting fields

* ...

Other useful procedures

...
|#

#|
b. Pick one of the following implementation styles and implement the
procedures you just described.

* A pair of the x and y coordinates.
* A string of the form "x,y".
* A complex number.
* A hash table.
|#

#|
c. Document, write tests for, and implement a procedure,
`(distance point1 point2)`, that finds the distance between
two points.

In case you've forgotten, the distance between two points is
the square root of the sum of the x offset and the y offset.

E.g., given the points p1=(x1,y1) and p2=(x2,y2), the distance
between p1 and p2 is (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))).
|#

;;; (distance point1 point2) -> real?
;;;   point1 : point?
;;;   point2 : point?
;;; Find the distance beween point1 and point2.
(define distance
  (lambda (point1 point2)
    ???))

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
We have a slightly different approach for submitting this lab.

* Make sure that you currently require the `names-as-bar-strings.rkt`
  library (rather than one of the other `names-as-???.rkt` libraries).
* Make sure that you've updated the header for `names-as-bar-strings.rkt`
* Submit both `data-abstraction.rkt` and `names-as-bar-strings.rkt`.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might consider one or more
of the following procedures.
|#

; +--------------------------+---------------------------------------
; | Extra 1: Pointed testing |
; +--------------------------+

#|
Write some tests for your point procedures.
|#

; +------------------------------------+-----------------------------
; | Extra 2: Alternate implementations |
; +------------------------------------+

#|
Sketch how you might approach the other three implementations of
points.
|#

; +--------------------------+---------------------------------------
; | Extra 3: More alternates |
; +--------------------------+

#|
Try writing a second implementation of points.
|#

