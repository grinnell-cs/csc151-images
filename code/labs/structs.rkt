#lang racket

;; CSC-151-NN (SEMESTER)
;; Lab: Structs (structs.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(require csc151)
(require rackunit)
(require (file "date.rkt"))

; +---------------+--------------------------------------------------
; | Provided Code |
; +---------------+

;;; (pad-with-zeros str n) -> string?
;;;   str : string?
;;;   n : integer?
;;; Puts 0's at the front of str so that the result is
;;; n characters long.
(define pad-with-zeros
  (lambda (str n)
    (string-append (make-string (- n (string-length str)) #\0) str)))

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Make sure you have the normal start-of-lab discussion with your
partner. Share names, working preferences, etc.

b. Make sure to save this as `structs.rkt`.

c. If you have not done so already, download `date.rkt` from the lab
page.
|#

#| A |#

; +-------------------------------+----------------------------------
; | Exercise 1: Representing Time |
; +-------------------------------+

#|
As long as we're representing dates, we should probably take the
time to represent times.  Create a structured type, `clock`, with
three fields: hours, minutes, and seconds.  You need not add the
husk to clocks (at least not yet).

Note: We call this `clock`, rather than `time`, because `time` is
a built-in Racket procedure.
|#

; +--------------------------------------------------+---------------
; | Exercise 2: From times to strings and back again |
; +--------------------------------------------------+

#|
a. Write a procedure, `(clock->string atime)`, that takes a clock as
a parameter and returns the clock time as a string of the form
`HH:MM:SS`.
|#

(define clock->string
  (lambda (atime)
    ???))

#|
b. Write a procedure `(string->clock str)`, that takes a string 
of the form `HH:MM:SS` as a parameter and returns a clock structure.
You may find it useful to use `string-split` to break apart the
string. You may also assume that the string is correctly arranged.
|#

(define string->clock
  (lambda (str)
    ???))

#| B |#

; +---------------------------------+--------------------------------
; | Exercise 3: Representing chirps |
; +---------------------------------+

#|
*Chirp* is a new Internet startup that lets you send notes to your
friends, which they call "chirps".  (Creativity is not their strong
suit.)  Create a structured type, `chirp-kernel`, with the following
fields.

* `id`, a symbol we'll use to identify the chirp.
* `author`, a string that identifies the author of the chirp.
* `contents`, a string that contains the body of the chirp.
* `tags`, a list of strings
* `date`, a date that represents when the chirp was chirped.
* `time`, a clock that represents the time the chirp was chirped.
|#

; +--------------------------+---------------------------------------
; | Exercise 4: A chirp husk |
; +--------------------------+

#|
Create a procedure, `(chirp author contents tags date time)`, that
takes five parameters, verifies their types, and then creates a
chirp kernel using those five parameters.  What about the identifier?
You should generate that automatically with `(gensym "chirp")`.
`gensym` is a procedure that generates a unique symbol.
|#

(define chirp
  (lambda (author contents tags date time)
    ???))

#|
(define chirp-id chirp-kernel-id)
(define chirp-author chirp-kernel-author)
(define chirp-contents chirp-kernel-contents)
(define chirp-tags chirp-kernel-tags)
(define chirp-date chirp-kernel-date)
(define chirp-time chirp-kernel-time)
(define chirp?
  (lambda (val)
    (and (chirp-kernel? val)
         (string (chirp-author val))
         (string (chirp-contents val))
         (and (list? (chirp-tags val))
              (andmap string? (chirp-tags val)))
         (date? (chirp-date val))
         (clock? (chirp-time val)))))
|#

#| A |#

; +-----------------------------+------------------------------------
; | Exercise 5: Limiting access |
; +-----------------------------+

#|
One outstanding question that we had with `date` and `date-kernel`
was how we prevent the client from using `date-kernel`, rather than
`date`.  In this exercise, we'll explore one approach.
|#

#|
a. Open the `date.rkt` file that you previously downloaded and click "Run".
|#

#|
b. What do you expect to get when you type the following in the interactions
pane of the `date.rkt` window?

    > (define date1 (date 2022 03 01))
    _____
    > date1
    _____
|#

#|
c. Check your answer experimentally.

    > (define date1 (date 2022 03 01))
    _____
    > date1
    _____
|#

#|
d.  Since `date1` is valid, we should be able to extract its fields.
What do you expect the results of the following to be when typed in
the `date.rkt` interactions pane?

    > (date-year date1)
    _____
    > (date-month date1)
    _____
    > (date-day date1)
    _____
    > (date? date1)
    _____

Check your answer experimentally.
|#

#|
e.  Since `date1` is a date-kernel, we should be able to extract
its fields.  What do you expect the results of the following to be
when typed in the `date.rkt` interactions pane?

    > (date-kernel-year date1)
    _____
    > (date-kernel-month date1)
    _____
    > (date-kernel-day date1)
    _____
    > (date-kernel? date1)
    _____

Check your answers experimentally.
|#

#|
f. What do you expect to happen if we create an invalid date using
`date`?

    > (define invalid (date 'in 'val 'id))
    _____
    > (date->string invalid)
    _____

Check your answer experimentally.
|#

#|
g. What do you expect to happen if we create an invalid date using
`date-kernel`?

    > (define invalid (date-kernel 'in 'val 'id))
    _____
    > (date->string invalid)
    _____

Check your answer experimentally.
|#

#|
h. As that last experiment suggested, we'd prefer that the programmers
who use dates not be able to directly access the `date-kernel`
procedures, particularly `date-kernel`, which would permit them to
make invalid dates.  One standard approach is to move them to a
separate file and use it as a library.  You can tell that we've
done so in `structs.rkt` because it includes the following line.

    (require (file "date.rkt"))
|#

#|
i. What do you expect to get when you type the following in the interactions
pane of the `structs.rkt`

    > (define date1 (date 2022 03 01))
    _____
    > date1
    _____
    > (define date2 (date 2022 22 01))
    _____
    > date2
    _____
|#

#|
j. Check your answer experimentally.

    > (define date1 (date 2022 03 01))
    _____
    > date1
    _____
    > (define date2 (date 2022 22 01))
    _____
    > date2
    _____
|#

#|
You should have seen that `date1` appears as a `date` structure
(really a `date-kernel` structure, but ...) and that `date2` does
not exist because the second call to `date` is invalid.
|#

#|
k.  Since `date1` is valid, we should be able to extract its fields.
What do you expect the results of the following to be?

    > (date-year date1)
    _____
    > (date-month date1)
    _____
    > (date-day date1)
    _____
    > (date? date1)
    _____
|#

#|
l. Check your answer experimentally.

    > (date-year date1)
    _____
    > (date-month date1)
    _____
    > (date-day date1)
    _____
    > (date? date1)
    _____
|#

#|
m. What do you expect to happen if we try to create a date with
`date-kernel` in the `structs.rkt` interactions pane?

    > (define invalid (date-kernel 'in 'val 'id))
    > invalid
    _____

Check your answer experimentally.
|#

#|
n. We've seen that `date1` appears as a `date` structure, but we know
that it's a `date-kernel` structure.

What do you expect the result of the following to be?

    > (define date1 (date 2022 03 01))
    > (date-kernel? date1)
    _____
    > (date-kernel-year date1)
    _____
    > (date-kernel-month date1)
    _____
    > (date-kernel-day date1)
    _____

Check your answer experimentally.
|#

#|
o. What does this exercise suggest?

<TODO: Fill in your answer here.>
|#

#| B |#

; +------------------------------+-----------------------------------
; | Exercise 6: Lists of structs |
; +------------------------------+

#|
Typically, we want more than one of any struct we create.  Consider,
for example, the `chirp` structure we designed earlier.  In effect,
the Chirp service creates something like a list of chirps.  So let's
store them as a list.
|#

#|
(define chirp-list
  (list
    (chirp "grinco" "We have installed Chirp on campus."
           (list "grinnell" "chirp")
           (date 2022 02 27) (clock 11 03 00))
    (chirp "grinco" "We are so cutting edge!"
           (list "grinnell" "chirp")
           (date 2022 02 27) (clock 11 04 00))
    (chirp "rebelsky" "I love CSC 151."  (list "strange" "csc")
           (date 2022 03 01) (clock 10 00 15))
    (chirp "rebelsky" "That wasn't me."  (list "strange" "other")
           (date 2022 03 01) (clock 10 01 23))
    (chirp "rebelsky" "I think my son hacked my chirpstream."  
           (list "strange" "paranoid")
           (date 2022 03 01) (clock 10 01 55))
    (chirp "presHarris" "Welcome to GrinCo!" (list "grinnell" "grinpres")
           (date 2022 02 28) (clock 15 02 05))
    (chirp "presHarris" "I love CSC 151." (list "strange" "csc" "grinpres")
           (date 2022 03 01) (clock 10 01 55))
    (chirp "rebelsky" "I think my son hacked President Harris's chirpstream."  
           (list "paranoid")
           (date 2022 03 01) (clock 10 03 00))
    (chirp "grinco" "We are shutting down Chirp on campus"
           (list "grinnell" "chirp" "its")
           (date 2022 03 01) (clock 11 03 00))))
|#

#|
a. Write an expression that identifies all of the chirps from `rebelsky`
and creates a list of their contents

(define rebelsky-chirps
  (map chirp-contents (filter ???? chirp-list)))
|#

(define rebelsky-chirps
  ???)

#|
b. Write an expression that determines how many chirps in the list
are by `presHarris`.  (Recall that `(tally lst pred?)` counts the number
of values in a list that meet a particular predicate.
|#

(define count-of-harris-chirps
  ???)

; +----------------------------------------+-------------------------
; | Exercise 7: Lists of chirps, revisited |
; +----------------------------------------+

#|
a. Write a procedure, `(chirps-by chirps author)`, that
takes a list of chirps and a string as parameters, and returns a
list of the chirps that have that string in the author field.
|#

(define chirps-by
  (lambda (chirps author)
    ???))

#|
b. Write a proceudre, `(chirps-tagged-as chirps tag)`, that
takes a list of chirps and a string as parameters, and returns
a list of the chirps that have that tag.

Note that this task is slightly different than the `chirps-by` 
task.
|#

(define chirps-tagged-as
  (lambda (chirps tag)
    ???))

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might consider attempting
one or more of the following exercises.
|#

; +-------------------------+----------------------------------------
; | Extra 1: Comparing date |
; +-------------------------+

#|
Write a predicate, `(date-before? date1 date2)`, that determines if
`date1` comes before `date2`.  You can decide whether or not to issue
an error if either value is not a date.
|#

(define date-before?
  (lambda (date1 date2)
    ???))

; +---------------------------------+--------------------------------
; | Extra 2: Finding chirps by date |
; +---------------------------------+

#|
Write a procedure, `(chirps-from chirps start-date end-date)`, that
takes a list of chirps and two dates as parameters and returns all of
the chirps that come between those two dates.
|#

(define chirps-from
  (lambda (chirps start-date end-date)
    ???))

; +-------------------------------+----------------------------------
; | Extra 3: Protecting your time |
; +-------------------------------+

#|
Rewrite the `clock` struct using a husk-and-kernel approach that
ensures that the hours, minutes, and seconds are reasonable.
|#

; +--------------------------+---------------------------------------
; | Extra 4: Comparing times |
; +--------------------------+

#|
Write a procedure, `(time-before? time1 time2)`, that returns
true (`#t`) if `time1` comes before `time2` and false otherwise.
|#

; +----------------------------+-------------------------------------
; | Extra 5: Displaying chirps |
; +----------------------------+

#|
Write a procedure `(chirp->string chirp)`, that takes a `chirp` as
a parameter and creates a string that represents it in a useful
way.

    > (define mychirp
        (chirp "rebelsky" "I love CSC 151."  (list "strange" "csc")
               (date 2022 03 01) (clock 10 00 15)))
    > (display (chirp->string mychirp))
    Output! chirp12312: At 10:00:15 on 2022-01-01, rebelsky said "I love CSC 151".
|#

(define chirp->string
  (lambda (chirp)
    ???))

; +--------------------------+---------------------------------------
; | Extra 6: Hashing structs |
; +--------------------------+

#|
One of the disadvantages of lists is that they are relatively
slow to search.  That's one of the reasons we use hash tables
instead.  For example, we might hash chirps by their unique 
identifier.

Write a procedure, `(store-chirp! hash chrp)` that stores
a chirp in a hash table.

    > (define chirps (hash-new))
    > (define sample (chirp "someone" "something" (list "chirp")
                            (date 2022 02 28) (clock 20 21 22)))
    > (chirp-key sample)
    'chirp108319
    > (hash-has-key? chirps 'chirp108319)
    #f
    > (store-chirp! hash sample)
    > (hash-has-key? chirps 'chirp108319)
    #t
    > (chirp-contents (hash-ref chirps 'chirp108319))
    "something"
|#

