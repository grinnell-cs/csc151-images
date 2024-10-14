;; CSC 151 (SEMESTER))
;; Lab: Implementing the Big Three
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

(title "Implementing the Big Three")

;; Whew! We've spent a solid week and a half drilling recursive design 
;; techniques over lists and the natural numbers. But this only the beginning!
;; We will deepen our knowledge of recursive design throughout the remainder
;; course as we explore more intricate and complex problems. As a starting
;; point in this conversation, we'll look at the patterns of recursion that
;; we have developed so far and how they relate to the "big three" operations
;; over lists we encountered earlier in the course.

;; -----------------------------------------------------------------------------

(part "Problem 1: Transformations")

;; Consider the following pair of recursive functions:

;;; (double lst) -> list?
;;;   lst: list? of numbers
;;; Returns lst but with every element of lst doubled.
(define double
  (lambda (lst)
    (match lst
      [null null]
      [(cons head tail) (cons (* 2 head) (double tail))])))

(test-case "double empty"
           equal?
           null
           (lambda () (double null)))

(test-case "double non-empty"
           equal?
           (list 0 2 4 6 8)
           (lambda () (double (range 5))))

;;; (flip lst) -> list?
;;;   lst: list? of booleans
;;; Returns lst but with every element of lst flipped, i.e., #t becomes #f
;;; and #f becomes true
(define flip
  (lambda (lst)
    (match lst
      [null null]
      [(cons head tail) (cons (not head) (flip tail))])))

(test-case "flip empty"
           equal?
           null
           (lambda () (flip null)))

(test-case "flip non-empty"
           equal?
           (list #t #f #f #t #t #f)
           (lambda () (flip (list #f #t #t #f #f #t))))

;; (Partner A drives!)
;;
;; Follow the style of these two functions to write a similar, third function
;; called digits->nums. (chars->codepoints lst) takes a list of characters as
;; input and returns a list where each character has been turned into its
;; integer codepoint value, i.e., its collating sequence number. For example:
;;
;; (chars->codepoints (list #\a #\0 #\; #\q #\!))
;; > (list 97 48 59 113 33)
;; (chars->codepoints null)
;; > null

;; TODO: add documentation!
(define chars->codepoints
  ;; TODO: implement me!
  null)

;; TODO: write test cases!

;; (Partner B drives!)
;;
;; At this point, you should have noticed some redundancy between the
;; three implementations of these functions. Below, note which parts of
;; the three functions are shared and what is different between them.

(description "Shared between functions: <TODO: fill me in>")

(description "Differences between functions: <TODO: fill me in>")

;; Before moving on, check your work with a member of the course staff!

;; After you have correctly identified the essential difference between the
;; three functions, let's do exactly what we learned at the beginning of this
;; course: write a function that factors out these differences. It turns out
;; that this function is precisely the map function over lists! Follow your
;; nose and implement the map function over lists by factoring out the
;; essential difference in the implementations above and making it a parameter
;; to your function. You should arrive at precisely the same function signature
;; as the Prelude map function. Give test cases for your implementation of map,
;; list-map, that show how you can use list-map to implement the behavior of
;; the three specialized functions above.

;; TODO: add documentation!
(define list-map
  ;; TODO: implement me!
  null)

;; TODO: add tests for list-map that implement the behavior of the three
;; example functions from before!

;; -----------------------------------------------------------------------------

(part "Problem 2: Deletion")

;; Let's play the same game of observing similarities between functions and
;; factoring out the differences to create a new function! Consider these
;; specialized functions:

;;; (dropzeroes lst) -> list?
;;;   lst: list? of numbers
;;; Returns lst but with every zero removed from lst.
(define dropzeroes
  (lambda (lst)
    (match lst
      [null null]
      [(cons head tail)
       (if (zero? head) (dropzeroes tail)
                        (cons head (dropzeroes tail)))])))

(test-case "dropzeroes empty"
           equal?
           null
           (lambda () (dropzeroes null)))

(test-case "dropzeroes non-empty"
           equal?
           (list 1 1 2 1)
           (lambda () (dropzeroes (list 1 0 0 1 2 0 1 0))))

;;; (length-less-than-five lst) -> list?
;;;   lst: list? of strings
;;; Returns lst but with every element with length greater than or equal to
;;; five removed from the output.
(define length-less-than-five
  (lambda (lst)
    (match lst
      [null null]
      [(cons head tail)
       (if (>= (string-length head) 5) (length-less-than-five tail)
                                       (cons head (length-less-than-five tail)))])))

(test-case "length-less-than-five empty"
           equal?
           null
           (lambda () (length-less-than-five null)))

(test-case "length-less-than-five non-empty"
           equal?
           (list "abba" "doo!")
           (lambda () (length-less-than-five (list "abba" "yabba" "dabba" "doo!"))))

;; (Partner B drives!)
;;
;; Follow the style of these two functions to write a similar, third function
;; called dropfalses. (dropfalses lst) takes a list of booleans as input and
;; and returns a lst but with all the #f values removed from the result. For
;; example:
;;
;; (dropfalses (list #t #t #f #f #f #t #f #t))
;; > (list #t #t #t #t)
;; (dropfalses null)
;; > null

;; TODO: add documentation!
(define dropfalses
  ;; TODO: implement me!
  null)

;; TODO: write test cases!

;; (Partner A drives!)
;;
;; Like the previous problem, first identify what is shared and different
;; between these three functions:

(description "Shared between functions: <TODO: fill me in>")

(description "Differences between functions: <TODO: fill me in>")

;; Check your work with a member of the course staff!
;;
;; Once you know the essential difference between these three functions, create
;; the list-filter function that factors out this redundancy. list-filter
;; should behave indentically to the filter function when you are done!

;; TODO: add documentation!
(define list-filter
  ;; TODO: implement me!
  null)

;; TODO: add tests for list-filter that implement the behavior of the three
;; example functions from before!

;; -----------------------------------------------------------------------------

(part "Problem 3: Reduction")

;; At this point, there's one function left to write from the big three---fold!
;; Let's, again, follow the same procedure: write some specific functions and
;; generalize from there. Here are two examples:

;; (sum-with-init result lst) -> number?
;;   result: number?
;;   lst: list? of numbers
;; Returns the sum of the numbers in lst, starting with result as the initial
;; value.
(define sum-with-init
  (lambda (result lst)
    (match lst
      [null result]
      [(cons head tail)
       (sum-with-init (+ head result) tail)])))

(test-case "sum-with-init empty"
           equal?
           22
           (lambda () (sum-with-init 22 null)))

(test-case "sum-with-init non-empty?"
           equal?
           50
           (lambda () (sum-with-init 11 (list 27 2 10))))

;; (cons-onto-backwards result lst) -> list?
;;   result: lst?
;;   lst: list?
;; Returns the result of consing lst onto the front of result backwards.
(define cons-onto-backwards
  (lambda (result lst)
    (match lst
      [null result]
      [(cons head tail)
       (cons-onto-backwards (cons head result) tail)])))

(test-case "cons-onto-backwards empty"
           equal?
           (list 1 2 3)
           (lambda () (cons-onto-backwards (list 1 2 3) null)))

(test-case "cons-onto-backwards non-empty?"
           equal?
           (list 7 6 5 4 1 2 3)
           (lambda () (cons-onto-backwards (list 1 2 3) (list 4 5 6 7))))

;; (Partner A drives!)
;;
;; Follow the style of these two functions to write a similar, third function
;; called string-append-backwards. (string-append-backwards result lst) takes
;; an initial string value, and a list of strings as input and returns the
;; strings of the list appended onto the front of the initial string in
;; backwards order. Note that the order of the individual characters in each
;; string is preserved, but they are appended in backwards order. For example:
;;
;; (string-append-backwards "abc" (list "def" "h" "gi"))
;; > "gihdefabc"
;; (string-append-backwards "abc" null)
;; > "abc"

;; TODO: add documentation!
(define string-append-backwards
  ;; TODO: implement me!
  null)

;; TODO: write test cases!

;; (Partner B drives!)
;;
;; Like the previous problems, first identify what is shared and different
;; between these three functions:

(description "Shared between functions: <TODO: fill me in>")

(description "Differences between functions: <TODO: fill me in>")

;; Again, check your work with a member of the course staff!
;;
;; Once you know the essential difference between these three functions, create
;; the list-fold-left function that factors out this redundancy.
;; list-fold-left should behave indentically to the fold function when you are
;; done!

;; TODO: add documentation!
(define list-fold-left
  ;; TODO: implement me!
  null)

;; TODO: add tests here!

;; -----------------------------------------------------------------------------

(part "Problem 4: Really, Reductions")

;; (Partner A drives!)
;;
;; In our discussion of list transformations, rather than fold, we introduced
;; reduce first! Reduce is similar to fold-left but instead of providing an
;; initial value, we use the first element of the list as the initial value.
;;
;; Implement list-reduce below in terms of list-fold-left. It should be
;; functionality identical to reduce when you are done!

;; TODO: add documentation!
(define list-reduce
  (lambda (f l)
    null))

;; TODO: add tests here!

;; With implementations of list-fold-left and list-reduce in hand, you should
;; be in a better position to now talk about when you would use fold versus
;; reduce. Based on your implementation, give reasons when you would choose
;; fold versus reduce:
;;

(description "We would use fold when...")

(description "We would use reduce when...")

;; -----------------------------------------------------------------------------

(part "Extra Problem: That's Backwards")


;; (Partner B drives!)
;;
;; Awkwardly, fold-left seems to "reverse" our computations. In our above
;; examples we saw that cons-onto and string-append operated in a backwards
;; fashion when implemented with fold-left. Use your implementations to compare
;; how fold-left operates between sum-on-init and string-append-backwards. Trace
;; through an example execution of each function to highlight these differences
;; below:
;;
;; (sum-with-init 11 (list 27 2 10)))
;; --> ... <TODO: fill in your trace here>
;;
;; (string-append-backwards "abc" (list "def" "h" "gi"))
;; --> ... <TODO: fill in your trace here>
;;
;; In a sentence or two, explain why string-append-backwards performs its
;; "backwards" behavior but sum-with-init seems to work as expected.

(description "spring-append-backwards works \"backwards\" because... <TODO: fill me in!>")

(description "sum-with-init works because... <TODO: fill me in!>")

;; fold-left works through the elements of the list in a left-to-right fashion.
;; Counterintuitively, this results in backwards behavior! To get the desired
;; behavior for string-append, we need to go through the elements in
;; right-to-left fashion. This is a variant of fold call fold-right!
;;
;; Implement list-fold-right below which should behave functionally
;; identically to foldr when you are done. Implement this function using
;; recursion without appealing to any additional functions from the standard
;; library, e.g., reverse.
;;
;; Note, in fold-left, we assumed that the function behaved as follows:
;;
;; + The first argument is the accumulated result.
;; + The second argument is an element of the list.
;;
;; For fold-right, we traditionally switch the order of arguments so the first
;; argument is the element from the list and the second is the accumulated
;; result. We'll see why this is useful shortly!
;;
;; (Hint: think about how you integrated the head of the list into the result
;; in foldl. To get the desired effect for foldr, you should integrate the
;; head into the result in the other possible way!

;; TODO: add documentation!
(define list-foldr
  ;; TODO: implement me!
  null)

;; TODO: add tests here!

;; Finally, let's compare the behavior of fold-left and fold-right. If f is
;; the function we're folding over, init is the initial value, and
;; x1, ..., xk are the values of the list in l, there are two ways that
;; we can combine everything together to get the fold:
;;
;; (f x1 (f x2 (f x3 (... (f xk init)))))
;;
;; or
;;
;; (f (... (f (f (f init x1) x2) x3) ...) xk)
;;
;; Below, label each of the computations as either the foldl computation
;; or the foldr computation along with a sentence explaining why.

(description "`(f x1 (f x2 (f x3 (... (f xk init)))))` is ... because ...")

(description "`f(f(f(f(f(init, x1), x2), x3), ...), xk)` is ... because ...")