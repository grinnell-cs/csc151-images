---
title: "Sample LA: Data abstraction"
---
# {{ page.title }}

_Design data structures to separate interface from implementation._

When we create a new way to structure data, there's a value of separating the *interface* to the structure (the procedures we call) from the *implementation* of the struture (the particular details, such as whether we use an array or list or whatever).

You may recall that we said that names are complex.  Some people have only one name.  Some people have multi-word last names.  Some people have middle names and others do not.  Some people have suffixes, like "Jr.", "Sr.", or "III".  Some people might also have prefixes to their names, like "King" or "Pope", but we will ignore those for now.

Here's the start of a library that is intended to represent the various possibilities for names.

```drracket
#lang racket
(require csc151)
(require rackunit)

;;; (make-name given middle surname suffix) -> name?
;;;   given : string?
;;;   middle : string? or #f
;;;   surname : string? or #f
;;;   suffix : string? or #f
;;; Create a new name from the appropriate components.
(define make-name
  (lambda (given middle surname suffix)
    (list given middle surname suffix)))

;;; (make-name-1 given) -> name?
;;;   given : string?
;;; Create a name for those who have only one name, such as Prince,
;;; Madonna, Cher, or Simon.
(define make-name-1
  (lambda (given)
    (make-name given #f #f #f)))

;;; (make-name-2 given surname) -> name?
;;;   given : string?
;;;   surname : string?
;;; Create a name for those who have only a given name and a surname.
;;; One of the most common forms.
(define make-name-2
  (lambda (given surname)
    (make-name given #f surname #f)))

;;; (make-name-3 given middle surname) -> name?
;;;   given : string?
;;;   middle : string?
;;;   surname : string?
(define make-name-3
  (lambda (given middle surname)
    (make-name given middle surname #f)))

;;; (make-name-gs given suffix) -> name?
;;;   given : string?
;;;   suffix : string?
;;; Make a name for someone who has only a given name and a suffix,
;;; such as Elizabeth II or Henry IV.
(define make-name-gs
  (lambda (given suffix)
    (make-name given #f #f suffix)))

;;; (name? val) -> boolean?
;;;   val : any?
;;; Determine if val appears to be a name created by `make-name`
;;; of any of the similar procedures.
(define name?
  (let ([string-or-false? (lambda (val) (or (string? val) (not val)))])
    (lambda (val)
      (and (list? val)
           (= 4 (length val))
           (string? (given-name val))
           (string-or-false? (middle-name val))
           (string-or-false? (surname val))
           (string-or-false? (suffix val))))))

;;; (given-name name) -> string? or false
;;;   name : name?
;;; Determine the given name for a name.  Returns false
;;; if there is no given name.
(define given-name
  (lambda (name)
    (car name)))

;;; (middle-name name) -> string? or false
;;;   name : name?
;;; Determine the middle name for a name.  Returns false
;;; if there is no middle name.
(define middle-name
  (lambda (name)
    (cadr name)))

;;; (surname name) -> string? or false
;;;   name : name?
;;; Determine the surname for a name.  Returns false if there
;;; is no surname.
(define surname
  (lambda (name)
    (caddr name)))

;;; (suffix name) -> string? or false
;;;   name : name?
;;; Determine the suffix for a name.  Returns false if there
;;; is no suffix.
(define suffix
  (lambda (name)
    (cadddr name)))

;;; (name->string) -> string?
;;;   name : name?
;;; Convert a name to one of the standard forms, approximately
;;;   Given Middle Surname, Suffix
(define name->string
  (lambda (name)
    (let ([given (given-name name)]
          [middle (middle-name name)]
          [surn (surname name)]
          [suff (suffix name)]
          [use (lambda (word pre) (if word (string-append pre word) ""))])
      (cond
        ; Special case: Only first and suffix.  We don't use a comma
        ; before the suffix here.
        [(and (not middle) (not surn) suff)
         (string-append given " " suff)]
        ; Normal case
        [else
         (string-append given
                        (use middle  " ")
                        (use surn " ")
                        (use suff ", "))]))))

;;; (name->dirstring) -> string?
;;;   name : name?
;;; Convert a name to the standard form used for alphabetization
;;; of names, approximately,
;;;   Surname, Given Middle Suffix
(define name->dirstring
  (lambda (name)
    (let ([given (given-name name)]
          [middle (middle-name name)]
          [surn (surname name)]
          [suff (suffix name)]
          [use (lambda (word pre) (if word (string-append pre word) ""))])
      (string-append (if surn (string-append surn ", ") "")
                     given
                     (use middle " ")
                     (use suff " ")))))
```

Here are a few tests of the various procedures working in conjunction.

```
(check-equal? (name->string (make-name "Barack" "Hussein" "Obama" "II"))
              "Barack Hussein Obama, II")
(check-equal? (name->dirstring (make-name "Barack" "Hussein" "Obama" "II"))
              "Obama, Barack Hussein II")
(check-equal? (name->string (make-name-3 "George" "Herbert Walker" "Bush"))
              "George Herbert Walker Bush")
(check-equal? (name->dirstring (make-name-3 "George" "Herbert Walker" "Bush"))
              "Bush, George Herbert Walker")
(check-equal? (name->string (make-name-3 "George" "W." "Bush"))
              "George W. Bush")
(check-equal? (name->dirstring (make-name-3 "George" "W." "Bush"))
              "Bush, George W.")
(check-equal? (name->string (make-name-2 "Kamala" "Harris"))
              "Kamala Harris")
(check-equal? (name->dirstring (make-name-2 "Kamala" "Harris"))
              "Harris, Kamala")
(check-equal? (name->string (make-name-1 "SamR"))
              "SamR")
(check-equal? (name->dirstring (make-name-1 "SamR"))
              "SamR")
(check-equal? (name->string (make-name-gs "Elizabeth" "II"))
              "Elizabeth II")
(check-equal? (name->dirstring (make-name-gs "Elizabeth" "II"))
              "Elizabeth II")
```

Update the name structure (the procedures above) to use a struct rather
than lists.

> _Space for answer_

## Data abstraction (extra)

_Design data structures to separate interface from implementation._

Variants of the name question above, using hash tables or vectors (rather
than structs) are also possible.
