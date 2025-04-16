#lang racket

;; CSC-151-NN (SEMESTER)
;; date.rkt - A simple implementation of dates as structs.
;; Authors: Samuel A. Rebelsky and YOUR NAMES HERE
;; Date: THE DATE HERE

(provide date
         date?
         date-year
         date-month
         date-day
         date->string
         string->date)

;;; date-kernel
(struct date-kernel (year month day)
  #:reflection-name 'date)

;;; (date year month day) -> date?
;;;   year : integer?
;;;   month : integer?
;;;   day : integer?
;;; Create a new date.
(define date
  (lambda (year month day)
    (cond
      [(not (integer? year))
       (error "date: invalid year" year)]
      [(or (not (integer? month))
           (< month 1)
           (> month 12))
       (error "date: invalid month" month)]
      [(or (not (integer? day))
           (< day 1)
           (> day 31))]
      [else
       (date-kernel year month day)])))

;;; (date? val) -> boolean?
;;;   val : any?
;;; Determine if val is a date.
(define date?
  (lambda (val)
    (and (date-kernel? val)
         (integer? (date-kernel-year val))
         (integer? (date-kernel-month val))
         (integer? (date-kernel-day val))
         (<= 1 (date-kernel-month val) 12)
         (<= 1 (date-kernel-day val) 31))))

;;; (date-year date) -> integer?
;;;   date : date?
;;; Extract the year from a date
(define date-year date-kernel-year)

;;; (date-month date) -> integer?
;;;   date : date?
;;; Extract the month from a date
(define date-month date-kernel-month)

;;; (date-day date) -> integer?
;;;   date : date?
;;; Extract the day from a date
(define date-day date-kernel-day)

;;; (pad-with-zeros str n) -> string?
;;;   str : string?
;;;   n : integer?
;;; Puts 0's at the front of str so that the result is
;;; n characters long.
(define pad-with-zeros
  (lambda (str n)
    (string-append (make-string (- n (string-length str)) #\0) str)))

;;; (date->string d) -> string?
;;;   d : date?
;;; Convert d to a string in YYYY-MM-DD format.
(define date->string
  (lambda (d)
    (string-append (pad-with-zeros (number->string (date-year d)) 4)
                   "-"
                   (pad-with-zeros (number->string (date-month d)) 2)
                   "-"
                   (pad-with-zeros (number->string (date-day d)) 2))))

;;; (string->date str) -> date?
;;;   str : string?
;;; Convert str to a date.
;;; str should have the form YYYY-MM-DD [unverified]
(define string->date
  (lambda (str)
    (let ([parts (string-split str "-")])
      (date (string->number (list-ref parts 0))
            (string->number (list-ref parts 1))
            (string->number (list-ref parts 2))))))
