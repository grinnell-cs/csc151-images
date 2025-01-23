---
title: Creating structured types
summary: |
  We consider the use of structured data, natural groupings of information.
  We also explore Racket's *struct* type, which allows us to create
  and use structured data.
---
In our recent [reading on data abstraction](../readings/data-abstraction),
we explored how we might represent names in Racket.  We considered a variety
of strategies, including arrays, lists, and hash tables.

Let's apply this same idea to a different domain.  Suppose we want
to keep track of a collection of Web pages.  What information might
we want to store?  Here's a possible list.

* A *unique identifier* that we can use to refer to the page.  (While
  the URL may serve that purpose, it will traditionally be a bit long.)
  For efficiency, we'll require that identifiers be symbols.
* The *URL* for the Web page.
* The *title* of the Web page.
* The *author* of the Web page.
* The *modification date* of the Web page, represented as three
  integers (year, month, day).

If we chose to store that information in a list, we might use
the following procedures to provide a bit of abstraction, so that
our clients can focus on how they use the information and not on
how we've stored the information.  (That would, for example, allow
us to rearrange the list, if we decided that it was appropriate
to do so.)

Here's a possible set of procedures that meet those guidelines.

```drracket
;;; (web-page identifier url title author date) -> web-page?
;;;   identifier : symbol?
;;;   url : string?
;;;   title : string?
;;;   author : string?
;;;   date : listof-integer? (three)
;;; Creates a structure that stores information on a Web page.
(define web-page
  (lambda (identifier url title author date)
    (cond
      [(not (symbol? identifier))
       (error "web-page: invalid identifier; expected a symbol, received" identifier)]
      [(not (string? url))
       (error "web-page: invalid url; expected a string, received" url)]
      [(not (or (regexp-match? #px"^http://" url)
                (regexp-match? #px"^https://" url)))
       (error "web-page: invalid url; does not begin with http or https" url)]
      [(not (string? title))
       (error "web-page: invalid title; expected a string, received" title)]
      [(not (string? author))
       (error "web-page: invalid author; expected a string, received" author)]
      [(not (and (list? date) (all integer? date) (= 3 (length date))))
       (error "web-page: invalid date (not three integers)" date)]
      [else
       (list identifier url title author date)])))

;;; (web-page-identifier page-info) -> symbol?
;;;   page-info : web-page?
;;; Extract the identifier from a Web page
(define web-page-identifier (section list-ref <> 0))

;;; (web-page-url page-info) -> string?
;;;   page-info : web-page?
;;; Extract the url from a Web page
;;;   (web-page-url (web-page ID URL TITLE AUTHOR DATE)) = URL
(define web-page-url (section list-ref <> 1))

;;; (web-page-title page-info) -> string?
;;;   page-info : web-page?
;;; Extract the title from a Web page
;;;   (web-page-title (web-page ID URL TITLE AUTHOR DATE)) = TITLE
(define web-page-title (section list-ref <> 2))

;;; (web-page-author page-info) -> string?
;;;   page-info : web-page?
;;; Extract the author from a Web page
;;;   (web-page-author (web-page ID URL TITLE AUTHOR DATE)) = AUTHOR
(define web-page-author (section list-ref <> 3))

;;; (web-page-date page-info) -> listof integer?
;;;   page-info : web-page?
;;; Extract the date from a Web page
;;;   (web-page-adate (web-page ID URL TITLE AUTHOR DATE)) = DATE
(define web-page-date (section list-ref <> 4))
```

Let's explore how these procedures work.

```drracket
> (define page1
    (web-page "grinnell-cs" "www.cs.grinnell.edu" "Grinnell CS Front Door" "The CS Department" '(2019 2 24)))
Error! . . web-page: invalid identifier; expected a symbol, received "grinnell-cs"
> (define page1
    (web-page 'grinnell-cs "https://www.cs.grinnell.edu" "Grinnell CS Front Door" "The CS Department" "2017-02-24"))
Error! . . web-page: invalid date (not three integers) "2017-02-24"
> (define page1
    (web-page 'grinnell-cs "www.cs.grinnell.edu" "Grinnell CS Front Door" "The CS Department" '(2019 2 24)))
Error! . . web-page: invalid url; does not begin with http or https "www.cs.grinnell.edu"
> (define page1
    (web-page 'grinnell-cs "https://www.cs.grinnell.edu" "Grinnell CS Front Door" "The CS Department" '(2019 2 24)))
> (web-page-date page1)
'(2019 2 24)
> (web-page-url page1)
"https://www.cs.grinnell.edu"
```

But what if we give these procedures non-pages?

```drracket
> (web-page-identifier (list "Whee"))
"Whee"
> (web-page-date (range 20))
4
```

That's not very satisfying, is it?  Hence, we might create a predicate
for Web pages.  Here's one possibility.

```drracket
;;; (web-page? val) -> boolean?
;;;   val : any/c?
;;; If val can reasonably be interpreted as a Web page (e.g., 
;;; it contains an identifier, title, etc.), the returns #t.
;;; Otherwise, returns false (#f).
(define web-page?
  (lambda (val)
    (and (list? val)
         (= (length val) 5)
         (symbol? (list-ref val 0))
         (string? (list-ref val 1))
         (or (regexp-match? #px"^http://" (list-ref val 1))
             (regexp-match? #px"^https://" (list-ref val 1)))
         (string? (list-ref val 2))
         (string? (list-ref val 3))
         (and (list? (list-ref val 4))
              (= 3 (length (list-ref val 4)))
              (all integer? (list-ref val 4))))))
```

We can now use this to update the various procedures so that they
verify their preconditions.  For example,

```
;;; (web-page-date page-info) -> listof integer?
;;;   page-info : web-page?
;;; Extract the date from a Web page
;;;   (web-page-adate (web-page ID URL TITLE AUTHOR DATE)) = DATE
(define web-page-date
  (lambda (page-info)
    (cond
      [(not (web-page? page-info))
       (error "web-page-date: Expected a web page, received" page-info)]
      [else
       (list-ref page-info 4)])))
```

And it makes some difference in our results.

```drracket
> (web-page-identifier (list 'grinnell-cs "http://www"))
Error! . . web-page-identifier: Expected a web page, received (grinnell-cs "http://www")
> (web-page-date (range 5))
Error! . . web-page-date: Expected a web page, received (0 1 2 3 4)
> (web-page-date (list 'grinnell-cs "http://www"))
Error! . . web-page-date: Expected a web page, received (grinnell-cs "http://www")
```

Many Scheme programmers have used a strategy like that when they want
to create collections of data.  (Some use something called a "vector"
instead of a list, but the approach is generally the same.)  

The design of such structures is so common that it makes much
more sense to develop a common way to create them.  Over the years, a
number of programmers have designed different libraries that make it
easier to create structures.

The designers of the Racket language decided that it made more sense
to include structures with named components as a set of built in
operations, which we generally refer to as "structs".

Racket's `struct`s
------------------

One creates a new struct type in Racket with the `struct` keyword.
At its simplest, one just provides `struct` the name of the 
structure and the names of its fields.

```drracket
> (struct date (year month day))
```

Now, we can easily create one of these structures using the
automatically defined `date` procedure.  (More generally,
whatever name you give to your struct becomes a procedure that
creates the struct.)

```drracket
> (define someday (date 2018 02 15))
> someday
#<date>
```

That's interesting.  It won't let us see inside the date structure.
(Most programmers consider that a benefit.  There's no need for the
client to know how we've implemented our structure.)  But how do
we get the fields?  Using automatically-generated procedures
that get names of the form `structname-fieldname`.  For our `date`
example, those procedures are called `date-year`, `date-month`,
and `date-day`.

```drracket
> (date-year someday)
2018
> (date-month someday)
2
> (date-day someday)
15
```

These procedures verify that their parameter is a date (in that they
were created by the `date` procedure).

```drracket
> (date-day '(2018 02 15))
Error! . . date-day: contract violation
Error!   expected: date?
Error!   given: '(2018 2 15)
```

The `date` procedure does some basic checking, primarily on the
number of parameters.

```drracket
> (date 2018)
Error! . . date: arity mismatch;
Error!  the expected number of arguments does not match the given number
Error!   expected: 3
Error!   given: 1
Error!   arguments...:
```

We even get an automatically generated structure predicate,
named `structname?` (`date?`, in this case).

```drracket
> (date? someday)
#t
> (date? (date 2000 01 01))
#t
> (date? (list 2000 01 01))
#f
```

Checking the form of `struct` fields
------------------------------------

In our Web page example, we were careful to verify that the individual
fields had the right form (a symbol for the identifier, a string that
begins with "http" or "https" for the URL, and so on and so forth).
It does not appear that we've done so for structs.  Why not?  It
turns out that automatic checking of such patterns is difficult.

If you care about such issues (and you might), it is often better
to write your own "husks" for these underlying types.

```drracket
(struct date-kernel (year month day))

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

(define date?
  (lambda (val)
    (and (date-kernel? val)
         (integer? (date-kernel-year val))
         (integer? (date-kernel-month val))
         (integer? (date-kernel-day val))
         (<= 1 (date-kernel-month val) 12)
         (<= 1 (date-kernel-day val) 31))))

(define date-year date-kernel-year)
(define date-month date-kernel-month)
(define date-day date-kernel-day)
```

Here are a few quick explorations of these procedures.

```drracket
> (date 2019 01 31)
#<date-kernel>
> (date 2019 31 01)
. . date: invalid month 31
> (define sample (date 2019 01 31))
> (date? sample)
#t
> (date? (date-kernel 2019 31 01))
#f
> (date-year sample)
2019
> (date-month sample)
1
> (date-day sample)
31
```

With some careful work, we can require that our clients use the
`date` husks, rather than the `date-kernel` procedures.  (For now,
we'll just assume that our clients will not use the kernels.)

There's one other issues.  Rather than `(date 2019 01 31)` creating
something that says `#<date>`, we get something that says
`#<date-kernel>`.  Fortunately, Racket allows us to address the
problem by adding a note to the `date-kernel` struct that describes
how it should be displayed.

```
(struct date-kernel (year month day)
  #:reflection-name 'date)
```

Now things work better.

```
> (date 2022 01 01)
#<date>
```

String conversion
-----------------

You may have noted that many types provide procedures that convert to
and from strings.  For example, there are `string->number` and
`number->string` procedures.  It can be equally useful to provide
procedures that convert from structured types to strings and
back again.  Let's consider how we might do that with our `date`
type.

To convert a date to a string, we need to convert each of the three
parts (year, month, and day) to a string, which we can do with
`number->string`.  Let's sketch some code to do that.

```drracket
> (define sample (date 1999 12 31))
> (string-append (number->string (date-year sample))
                 "-"
                 (number->string (date-month sample))
                 "-"
                 (number->string (date-day sample)))
"1999-12-31"
```

That looks pretty good so far.  But what happens if the month or
day is fewer than two digits?

```drracket
> (string-append (number->string (date-year sample))
                 "-"
                 (number->string (date-month sample))
                 "-"
                 (number->string (date-day sample)))
"2000-1-1"
```

Whoops!  It looks like we may need to pad with leading zeros.  Let's
write a procedure to do that.

```drracket
;;; (pad-with-zeros str n) -> string?
;;;   str : string?
;;;   n : integer?
;;; Puts 0's at the front of str so that the result is
;;; n characters long.
(define pad-with-zeros
  (lambda (str n)
    (string-append (make-string (- n (string-length str)) #\0) str)))
```

Let's check it out.

```drrackeet
> (pad-with-zeros "5" 2)
"05"
> (pad-with-zeros "5" 7)
"0000005"
> (pad-with-zeros "12" 2)
"12"
```

We can now use this to write `date->string`.

```drracket
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
``` 

Let's see how well it works.

```drracket
> (date->string (date 1999 12 31))
"1999-12-31"
> (date->string (date 2000 01 01))
"2000-01-01"
> (date->string (date 0 1 1))
"0000-01-01"
```

Yes, that seems to cover the bases.  We may need to add a requirement
that years not be negative, but that's a task for another day.

What about the other direction?  If we have a date in YYYY-MM-DD format,
we can convert it back to a string by splitting at the dashes and then
converting each part to a number.  We won't do precondition checking
here (although we probably should).

```drracket
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
```

Let's check it out.

```drracket
> (define d (string->date "2019-01-15"))
> d
#<date>
> (date-year d)
2019
> (date-month d)
1
> (date-day d)
15
> (date->string d)
"2019-01-15"
```

That seems reasonable.  Perhaps we'll explore it more in the lab.

Self checks
-----------

### Self check 1 (‡)

Verify that the first set of date examples work as described in the reading.
(That is, everything from "Racket's `struct`s" up to, but not including
"Checking the form of `struct` fields".

### Self check 2

Design a struct that is intended to hold a person's name (e.g.,
first, middle, last, title, surname).

### Self check 3

What do you see as the advantages of structs over lists, vectors, or
hash tables for representing abstract data types?

What do you see as the advantages of lists, vectors, or hash tables
over structs for representing abstract data types?

Acknowledgements
----------------

This reading was newly written for spring 2019.  I referred to
[section 5 of _The Racket Reference_](https://docs.racket-lang.org/reference/structures.html)
and 
[section 5 of _The Racket Guide_](https://docs.racket-lang.org/guide/define-struct.html) while writing this reading.

The reading has encountered minor cleanup in the semesters since.
