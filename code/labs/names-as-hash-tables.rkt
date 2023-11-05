#lang racket

;;; names-as-hash-tables.rkt
;;; A simple implementation of names as hash tables.
;;; Samuel A. Rebelsky
;;; Version of 2022-05-05
;;; Note that the documentation can be found in `data-abstraction.rkt`.

(require csc151)
(provide (all-defined-out))

(define name
  (let ([string-or-false?
         (lambda (val)
           (or (string? val) (false? val)))])
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
         (let ([n (make-hash)])
           (when prefix
             (hash-set! n 'prefix prefix))
           (hash-set! n 'given given)
           (when middle
             (hash-set! n 'middle middle))
           (when family
             (hash-set! n 'family family))
           (when suffix
             (hash-set! n 'suffix suffix))
           n)]))))

(define name?
  (let ([ok-key?
         (lambda (key hash)
           (string? (hash-ref hash key "")))])
    (lambda (val)
      (and (hash? val)
           (ok-key? 'prefix val)
           (string? (hash-ref val 'given))
           (ok-key? 'middle val)
           (ok-key? 'family val)
           (ok-key? 'suffix val)))))

(define name-prefix (section hash-ref <> 'prefix #f))
(define name-given (section hash-ref <> 'given))
(define name-middle (section hash-ref <> 'middle #f))
(define name-family (section hash-ref <> 'family #f))
(define name-suffix (section hash-ref <> 'suffix #f))

