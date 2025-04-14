#lang racket

;; CSC-151-NN (SEMESTER)
;; Library: Names as Bar Strings (names-as-bar-strings.rkt)
;;   A simple implementation of names as bar-separated strings.
;;   Note that the documentation can be found in `data-abstraction.rkt`.
;; Authors: Samuel A. Rebelsky and YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(require csc151)
(provide (all-defined-out))

(define name
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))]
        [convert (lambda (str) (or str ""))])
    (lambda (prefix given middle family suffix)
      (cond
        [(not (string-or-false? prefix))
         (error "name: Invalid prefix:" prefix)]
        [(not (string? given))
         (error "name: Invalid given name:" given)]
        [(not (string-or-false? middle))
         (error "name: Invalid middle:" middle)]
        [(not (string-or-false? family))
         (error "name: Invalid family:" family)]
        [(not (string-or-false? suffix))
         (error "name: Invalid suffix:" suffix)]
        [else
         (string-append (convert prefix)
                        "|" given
                        "|" (convert middle)
                        "|" (convert family)
                        "|" (convert suffix))]))))

(define name?
  (lambda (val)
    ???))

(define name-prefix 
  (lambda (name)
    ???))

(define name-given
  (lambda (name)
    ???))

(define name-middle 
  (lambda (name)
    ???))

(define name-family 
  (lambda (name)
    ???))

(define name-suffix
  (lambda (name)
    ???))

