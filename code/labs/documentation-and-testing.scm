;; CSC 151 (SEMESTER)
;; Lab: Documentation and Testing (documentation-and-testing.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import image)
(import lab)
(import music)
(import test)

(title "Documentation and Testing")

(problem "Problem 1: Roundtable")

; (A side drives)

; Define a series of tests using test-case for this procedure:

;;; (range1 n) -> listof integer?
;;;   n : integer?
;;; Returns the list of numbers from 1 to n, inclusive.  If
;;; n is non-positive, then returns the empty list.
(define range1
  (lambda (n)
    (map (lambda (n) (+ n 1)) (range n))))

; We have given you one test case to get started.

(test-case "A very small range" equal? (list 1)
  (lambda () (range1 1)))

; TODO: write your additional tests here

; This is a good practice as you are developing your program so you can quickly
; know if your code meets the current set of tests.
;
; To develop the tests, you should alternate volunteering test cases which the
; driver then adds to the file. Continue identifying test cases until your
; group is satisfied with the set of tests. You should agree on when you feel
; that you have reasonably validated the function’s behavior. Make sure that
; the procedure passes all the tests that you write!

(problem "Problem 2: Positive and Negative Cases")

; (B side drives)

; One way to organize our tests is by exploring positive and negative test 
; cases. A positive test case is an example that exercises when the function
; reports “yes”—e.g., returns true, computes a result—when the inputs are 
; “good”. A negative test case is an example that exercises when the function 
; reports “no”—e.g., returns false, returns an error value, does not modify the 
; input—when the inputs are “bad”. (For the time being, you can’t test for 
; error values, so stick to the other kinds of negative tests.)
;
; Follow the same process as in the prior exercise for this function:

;;; (palindrome? str) -> boolean?
;;;   str : string?
;;; Returns true iff the string s is a palindrome, i.e., str is
;;; equal to its reversal.
(define palindrome?
  (lambda (str)
    (and (string? str)
         (string=? str (list->string (reverse (string->list str)))))))

; As in the previous exercise, collaboratively develop a set of tests for this 
; procedure. For this exercise, make sure to keep in mind the idea of positive 
; and negative test cases.
;
; When you are done, the driver should make sure that the completed function
; and its test suite are in the file and then comment out the code.

; TODO: write your tests here

(problem "Problem 3: Types and Corners")

; Another way to organize our tests is by exploring the range of possible 
; inputs. If the type of the input admits a finite set of values, we ought to 
; test all those values directly. However, if an infinite set of values is 
; possible, we need to be more judicious in what values we examine.
;
; One way to do this is to identify corner and non-corner case values. Think of 
; a corner case as an example input that exercises the “boundaries” of how the
; function ought to work. For example, if you are operating over a certain range
; of numbers, a corner case might be an input at the lower or upper end of that
; range. In contrast, the values in the middle of the range are non-corner case
; values. We expect that the function will likely operate in the same way over
; these non-corner values, so we would then surmise that we don’t have to test 
; all of these non-corner values; a few of them will suffice!
;
; Note: dedup-adjacent, below, relies on aspects of Scheme you do not yet know.
; That’s okay. You should focus on the documentation docs and the testing that
; might be appropriate given that documentation.

;;; (dedup-adjacent l) -> listof any?
;;;   l : listof any?
;;; Returns the original list l but with all duplicates found
;;; adjacent to each other removed from the list.  For example:
;;;   > (dedup-adjacent (list 3 4 7 8 1 1 0 9 9 9 6 5 5 2 4))
;;;   (list 3 4 7 8 1 0 9 6 5 2 4)
(define dedup-adjacent
  (lambda (l)
    (cond 
      [(null? l)
       null]
      [(null? (cdr l)) 
       l]
      [else
       (let ([c1 (car l)]
             [c2 (car (cdr l))]
             [rest (cdr (cdr l))])
         (if (equal? c1 c2)
             (dedup-adjacent (cons c2 rest))
             (cons c1 (dedup-adjacent (cons c2 rest)))))])))

; (A side drives)
;
; a. As in the previous exercises, collaboratively develop a set of tests for 
;    this function. For this exercise, keep in mind the idea of types and 
;    corner cases/edge cases.

; TODO: write your tests here

; (B side drives)
;
; b. Below is a not-quite-correct version of dedup-adjacent called 
;    bad-dedup-adjacent. Replicate your tests for dedup-adjacent for this
;    version of the function. Do your tests identify the error? If not, add more
;    tests until you find the error!

(define bad-dedup-adjacent
  (lambda (l)
    (cond
      [(null? l)
       null]
      [(null? (cdr l))
       l]
      [else
       (let ([c1 (car l)]
             [c2 (car (cdr l))]
             [rest (cdr (cdr l))])
         (if (equal? c1 c2)
             (bad-dedup-adjacent (cons c2 rest))
             (cons c1 (cons c2 (bad-dedup-adjacent rest)))))]))) 

; TODO: write your tests here

(problem "Problem 4: What's up Doc?")

; (A and B sides switch driver-navigator roles for each function.)

; Consider each of the following function definitions that are undocumented
; and poorly named. Note that these functions use techniques and libraries that
; we may not have introduced or used yet; that is fine! The purpose of this
; exercise is to get us to think about the _contract_ of these functions rather
; than how they work precisely.
;
; For each function:
;
; (a) Explore how the function works by writing down 3--5 test cases
;     illustrating its behavior on a variety of inputs. You can determine
;     what types of inputs the program expects by inspecting the code or
;     by trying out different values to see if they work.
; (b) Based on your results, write down a doc comment for each function
;     as described in the reading. Make sure to include a function
;     signature describing any preconditions on the function's parameters
;     (e.g., their types) as well as postconditions on the output of
;     the function.

;;; TODO: add a doc comment for func-1 here
(define func-1
  (lambda (s n)
    (string-append (substring s n (string-length s))
                   (substring s 0 n))))

; TODO: add func-1 test cases here:
(description "func-2 tests")

;;; TODO: add a doc comment for func-2 here
(define func-2
  (lambda (s k)
    (string-map (lambda (c)
                  (if (char-numeric? c) k c))
                s)))

; TODO: add func-2 test cases here:
(description "func-2 tests")

;;; TODO: add a doc comment for func-3 here
(define func-3
  (lambda (l)
    (if (< (length l) 2)
        l
        (let ([h1 (car l)]
              [h2 (car (cdr l))]
              [t (cdr (cdr l))])
          (cons h2 (cons h1 (func-4 t)))))))

; TODO: add func-3 test cases here:
(description "func-3 tests")

;;; TODO: add a doc comment for func-4 here
(define func-1
  (lambda (n r e g b)
    (if (zero? n)
        (triangle 0 "outline" "black")
        (overlay (triangle (* n r) "outline" (color e g b 1))
                 (func-1 (- n 1) r e g b)))))

; TODO: add func-4 test cases here
; NOTE: We don't have a way to test for equality of images!
;       Because of this, the best we can do is simply print the output
;       and _observe_ that the output is what we expect it to be,
;       visually. The lesson here is that some data types can be
;       resistant to nice, automated testing functions like test-case.
;       Nevertheless, we still need to go through the business of
;       testing our code, even if it is difficult to do so!
(description "func-4 tests")

(problem "Extra Problem: Test-driven Development")

; (You do not need to complete this part of the lab, but it is good practice!)

; Tests don’t have to be created after you write your function! Because we
; frequently implement a function with examples in mind to begin with, it is
; useful to codify these examples as tests first and then use those tests to
; guide development. Such a development methodology is called test-driven 
; development where the tests drive the design of the code.
;
; Consider the following procedure documentation:

;;; (describe-triangle side1 side2 side3) -> string? or #f
;;;   side1 : number?
;;;   side2 : number?
;;;   side3 : number?
;;; Describe the triangle whose three sides are as given.
;;; * If all three sides are equal, the description is "equilateral".
;;; * If exactly two sides are equal, the description is "isosceles".
;;; * If no two sides are equal, description is "scalene".
;;; * If the sides do not describe a triangle, return #f.  
;;;
;;; Note: Degenerate triangles are not real triangles, so parameters
;;; that describe a degenerate triangle will normally result in a
;;; return value of false (#f).

; And incorrect implementation of the procedure:

(define describe-triangle
  (lambda (side1 side2 side3)
    #f))

; An incorrect implementation is enough to get us started writing tests.
;
; a.  As before, write a set of tests for this function BEFORE implementing it.
; b.  After writing your tests, implement describe-triangle above ensuring that
;     it passes your tests.
; c.  Here’s an incorrect implementation of the function. How many errors do 
;     your tests find?

(define bad-describe-triangle
  (lambda (side1 side2 side3)
    (cond
      [(or (<= side1 0) (<= side2 0) (<= side3 0))
       #f]
      [(or (< (+ side1 side2) side3) 
           (< (+ side1 side3) side2)
           (< (+ side2 side3) side1))
       #f]
      [(and (equal? side1 side2)
            (equal? side2 side3))
       "equilateral"]
      [(or (equal? side1 side2)
           (equal? side2 side3)
           (equal? side1 side3))
       "isosceles"]
      [else
       "scalene"])))
