#lang racket
(require csc151)
(require rackunit)

;; CSC-151-XX (SEMESTER)
;; Lab: Hash Tables (hash-tables.rkt)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

; +---------------+--------------------------------------------------
; | Provided code |
; +---------------+

;;; (common-form str) -> string?
;;;   str : string?
;;; Convert `str` to a common form for use as, say, a key in
;;; a hash table.
;;;   If provided with a non-string, just returns the value.
(define common-form
  (lambda (str)
    (if (string? str)
        (string-downcase (list->string (filter (lambda (ch)
                                                 (or (char-numeric? ch)
                                                     (char-alphabetic? ch)))
                                               (string->list str))))
        str)))

;;; (new-make-hash pairs) -> hash?
;;;   pairs : list-of pair?
;;; Create a hash table that uses the common form of the keys in pairs.
(define new-make-hash
  (lambda (pairs)
    (make-hash (map (lambda (pair)
                      (cons (common-form (car pair))
                            (cdr pair)))
                    pairs))))

;;; (new-hash-set! hash key value) -> void?
;;;   hash : hash?
;;;   key : any?
;;;   value : any?
;;; Sets a value in a hash using the common form of string keys.
(define new-hash-set!
  (lambda (hash key value)
    (hash-set! hash (common-form key) value)))

;;; (new-hash-ref! hash key) -> any?
;;;   hash : hash?
;;;   key : any?
;;; Look up a value using the common form of key.
(define new-hash-ref
  (lambda (hash key)
    (hash-ref hash (common-form key))))

;;; (new-hash-has-key? hash key) -> boolean?
;;;   hash : hash
;;;   key : any?
;;; Determine if hash has the common form of key.
(define new-hash-has-key?
  (lambda (hash key)
    (hash-has-key? hash (common-form key))))

#| AB |#

; +-------------------------+----------------------------------------
; | Exercise 0: Preparation |
; +-------------------------+

#|
a. Save this as `hash-tables.rkt`.
|#

#|
b. If you have not already done so, do the normal start-of-lab
discussion: Introduce yourselves, indicate strengths and areas to
improve, decide what to do if you aren't finished in time, etc.
|#

#|
c. Review the helper procedures above to ensure you understand what
they are supposed to do.  *Note that it will often be helpful for
the navigator to have those at hand.*
|#

#| A |#

; +---------------------------+--------------------------------------
; | Exercise 1: A basic table |
; +---------------------------+

#|
In the reading, we created a simple hash table of book authors.
Here are the commands we used.

    (define book-authors (make-hash))
    (hash-set! book-authors "The Princess Bride" "William Goldman")
    (hash-set! book-authors "Homegoing" "Yaa Gasi")
    (hash-set! book-authors "Moo" "Jane Smiley")
    (hash-set! book-authors "Moo, Baa, La La La!" "Sandra Boynton")

Transfer those commands to the interactions pane.  Then check to make
sure the hash table has the expected contents.
|#

#|
a. Add a few more book/author pairs.

<TODO: Enter the commands you used to add book/author pairs>
|#

#|
b. In the interactions pane, confirm that you can get the author
of "Moo" and "Homegoing".

<TODO: Enter the results from the interactions pane>
|#

#|
c. What do you expect as the result of the following expression?

    (hash-ref book-authors "homegoing")

Check your answer experimentally.

<TODO: Enter the results from the interactions pane>
|#

#|
d. In the reading, we claimed that you can use `hash-set!` to change
the author associated with a title.  Verify that claim.

<TODO: Enter the results from the interactions pane>
|#

#|
e. Although we did not mention it in the reading, there is also a
procedure, `(hash-remove! hash key)` that removes a value from a
hash table.  Determine by experiment how this procedure works.

<TODO: Enter the results from the interactions pane>
|#

#|
f. What do you think happens if you try to remove a key from a hash
table that is not in the hash table?  

<TODO: Enter  your answer>

Check your answer experimentally.

<TODO: Enter the results of your experiment>
|#

; +-------------------------------------+----------------------------
; | Exercise 2: An immutable hash table |
; +-------------------------------------+

#|
Recall that you define *immutable* hash tables with a command like
the following.  (Note the period in between the key and value.)

    (define sidekicks 
      '#hash(("Peabody" . "Sherman")
             ...))
|#

#|
a. Finish defining an immutable hash table, `sidekicks`, that associates the
names of some famous cartoon protagonists (as strings) with the
names of their sidekicks (again, as strings).

    Protagonist          Sidekick
    -----------          --------
    Peabody              Sherman 
    Yogi                 Booboo 
    Secret Squirrel      Morocco Mole 
    Tennessee Tuxedo     Chumley 
    Quick Draw McGraw    Baba Looey 
    Dick Dastardly       Muttley 
    Bullwinkle           Rocky 
    Bart Simpson         Milhouse Van Houten 
    Asterix              Obelix 
    Strong Bad           The Cheat 
|#

(define sidekicks
  '#hash(("Peabody" . "Sherman")
         ("Yogi" . "Booboo")
         ("Secret Squirrel" . "Morrocco Mole")
         ("Tennessee Tuxedo" . "Chumley")
         ("Quick Draw McGraw" . "Baba Looey")
         ("Dick Dastardly" . "Muttley")
         ("Bullwinkle" . "Rocky")
         ("Bart Simpson" . "Milhouse Van Houten")))

#|
b. Verify that you can look up a few characters in the table,
such as "Asterix" or "Yogi".

<TODO: Enter your code from the interactions pane>
|#

#|
c. Determine what happens if you try to look something up by
sidekick (e.g., "Sherman") rather than protagonist.

<TODO: Enter your code from the interactions pane>
|#

#|
d. We claimed that it is not possible to change an immutable
hash table.  Verify that claim by trying to set a value in
the table (e.g., to make "Homestar Runner" a sidekick of "Strong
Bad") and by trying to remove an entry.

<TODO: Enter the code from the interactions pane>
|#

#|
e. We claimed that the order of the key/value pairs in the table
might change from the order in which we created the table.  Check
that claim by looking at the contents of `sidekicks`.

<TODO: Enter the contents of `sidekicks` as DrRacket prints it out>
|#

; +---------------------------------------------------------+--------
; | Exercise 3: More experiments with immutable hash tables |
; +---------------------------------------------------------+

#|
a. What do you expect to happen if we try to put two values with
identical keys in an immutable hash table?

    (define more-sidekicks
      '#hash(("Scooby Doo" . "Shaggy")
             ("Scooby Doo" . "Scrappy Doo")))

<TODO: Enter your answer here>

Check your answer experimentally.  Make sure that one of your
experiments is to look at what `more-sidekicks` looks like.

<TODO: Enter the experiments from the interactions pane>
|#

#| 
For the rest of this exercise, we'll continue to use the `sidekicks`
hash from Exercise 2.
|#

#|
b. Although we cannot use `hash-set!` and `hash-remove!` with immutable
hash tables, there are related procedures, called `hash-set` and 
`hash-remove`, that we can use.  For example,

    > (hash-set sidekicks "Strong Bad" "Homestar Runner")
    ?
    > (hash-ref sidekicks "Strong Bad")
    ?
    > (hash-remove sidekicks "Strong Bad")
    ?
    > (hash-ref sidekicks "Strong Bad")
    ?
    > sidekicks
    ?

What do you expect these two procedures to do?  What do you expect
the value of `sidekicks` to be when we're done?

<TODO: Enter your answers here>

Check your answer experimentally.

<TODO: Enter your experiments from the interactions pane>
|#

#|
c. What do you expect as the final result of the second of the
following two expressions?  (You should assume that both expressions
are evaluated and that `sidekicks` is defined as in the previous
exercise.)

    > (hash-set sidekicks "Scooby Doo" "Shaggy")
    > (hash-ref sidekicks "Scooby Doo")

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
d. What do you expect as the result of the following expression?

    > (hash-ref (hash-set sidekicks "Scooby Doo" "Shaggy")
                "Scooby Doo")

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#


#|
e. What do you expect as the final result of the second of the
following two expressions?

    > (hash-remove sidekicks "Strong Bad")
    > (hash-ref sidekicks "Strong Bad")

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
f. What do you expect as the result of the following expression?

    > (hash-ref (hash-remove sidekicks "Strong Bad") "Strong Bad")

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
g. Summarize what you've learned about immutable hash tables.

<TODO: Enter your answer here>
|#

#| B |#

; +---------------------------------------------+--------------------
; | Exercise 4: A return to mutable hash tables |
; +---------------------------------------------+

#|
Let's try repeating some of this experiments with a mutable hash
table.  We'll be using our list of protagonists and sidekicks.

    Protagonist          Sidekick
    -----------          --------
    Peabody              Sherman 
    Yogi                 Booboo 
    Secret Squirrel      Morocco Mole 
    Tennessee Tuxedo     Chumley 
    Quick Draw McGraw    Baba Looey 
    Dick Dastardly       Muttley 
    Bullwinkle           Rocky 
    Bart Simpson         Milhouse Van Houten 
    Asterix              Obelix 
    Strong Bad           The Cheat 
|#

#|
a. Create a *mutable* hash table, `sidekick-protagonists` that
associates sidekicks with their protagonists (rather than vice
versa).  Here are a few lines to get you started.
|#

(define sidekick-protagonists (make-hash))
(hash-set! sidekick-protagonists "Sherman" "Peabody")
(hash-set! sidekick-protagonists "Booboo" "Yogi")
(hash-set! sidekick-protagonists "Morocco Mole" "Secret Squirrel")
(hash-set! sidekick-protagonists "Chumley" "Tennesse Tuxedo")
(hash-set! sidekick-protagonists "Baba Looey" "Quick Draw McGraw")
(hash-set! sidekick-protagonists "Muttley" "Dick Dastardly")
(hash-set! sidekick-protagonists "Rocky" "Bullwinkle")
(hash-set! sidekick-protagonists "Milhouse Van Houten" "Bart Simpson")

#|
b. What do you expect as the final result of the second of the
following two expressions?  (You should assume that both expressions
are evaluated and that `sidekick-protagonists` is defined as in the
previous exercise.)

    > (hash-set! sidekick-protagonists "Shaggy" "Scooby Doo")
    > (hash-ref sidekick-protagonists "Shaggy")

<TODO: Enter your answer where>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
c. What do you expect as the result of the following expression?

   > (hash-ref (hash-set! sidekick-protagonists "Shaggy" "Scooby Doo")
               "Shaggy")

<TODO: Enter your answer where>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
d. What do you expect as the final result of the second of the
following two expressions?  

    > (hash-remove! sidekick-protagonists "The Cheat")
    > (hash-ref sidekick-protagonists "The Cheat")

<TODO: Enter your answer where>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
e. What do you expect as the result of the following expression?

    > (hash-ref (hash-remove! sidekick-protagonists "The Cheat")
                "The Cheat")

<TODO: Enter your answer where>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

; +-----------------------------------------------+------------------
; | Exercise 5: Mutable vs. immutable hash tables |
; +-----------------------------------------------+

#|
You've now experimented a bit with both mutable and immutable hash tables.  
Spend a few minutes discussing with your partner what you see as the
relative benefits of mutable and immutable hash tables.

<TODO: Enter your answer here>
|#

; +----------------------------+-------------------------------------
; | Exercise 6: Counting words |
; +----------------------------+

#|
You've seen that the `tally-value` lets us count the number of times
a particular value appears in a list.  What if we want to count each
different word in the list?  We could go through the list multiple
times, tallying each word separately.  But that seems inefficient.

Here's a better solution: We can go through the list once and use
a hash table to keep track of the count of each word.

Let's assume that `word-counts` is a hash table whose keys are strings
and whose values are numbers.
|#

#|
a. Write a procedure `(add-word! counts word)` with the following
behavior.

* If `word` appears in `counts`, grab the count associated with
  `word`, add 1, and store the new value back in `counts`.
* If `word` does not appear in `counts`, create a new entry
  in word counts whose key is `word` and whose value is 1.

For example,

    > (define word-counts (make-hash))
    > word-counts
    '#hash()
    > (add-word! word-counts "example")
    > (add-word! word-counts "snow")
    > word-counts
    '#hash(("example" . 1) ("snow" . 1))
    > (add-word! word-counts "example")
    > word-counts
    '#hash(("example" . 2) ("snow" . 1))

Here are the commands without the extra cruft, in case you want to
copy and paste

    (define word-counts (make-hash))
    word-counts
    (add-word! word-counts "example")
    (add-word! word-counts "snow")
    word-counts
    (add-word! word-counts "example")
    word-counts

|#

;;; (add-word! counts word) -> void?
;;;   counts : hash of string-number?
;;;   word : string?
;;; Add a word to a hash table.
(define add-word! 
  (lambda (counts word)
    ???))

#|
b. What if we want to add lots of words.  That seems to be a task
for `map`, doesn't it?  Give it a try.  Use `map` to add the words
in the following list to `word-counts`.

   (list "cat" "and" "hat" "and" "rat")

<TODO: Enter you code and the result>
|#

#|
c. Here's what we got.

    > (map (cut (add-word! word-counts <>)) 
           (list "cat" "and" "hat" "and" "rat"))
    '(#<void> #<void> #<void> #<void> #<void>)
    > word-counts
    '#hash(("and" . 2) ("cat" . 1) ("example" . 2) ("hat" . 1) ("rat" . 1) ("snow" . 1))

It seems to have worked, but we've also ended up with a list of these
strange `#<void>` values.  Why?  Because `add-word!`, like `hash-set!`,
returns nothing.  For situations like this, in which our primary goal
is to change an underlying structure, rather than to return a list, Racket 
provides a procedure called `for-each`.  

_Determine experimentally what happens when we use `for-each` rather
than `map`._

<TODO: Enter your code and the result>
|#

#|
d. It seems worthwhile to work with a list that is slightly longer
than our five-word list but shorter than the much longer lists that
we get from a full novel.  (In an assignment, you'll work with a full
novel.)  For now, we'll work with the words in this file.

Make sure that you save this file as text (still with the name
`hash-tables.rkt`) using

   File -> Save Other -> Save Definitions As Text ...
|#

(define sample-words
  (file->words "hash-tables.rkt"))

#|
e. Reset `word-counts` to an empty hash table and then use `for-each`
and `add-word!` to add all the words in `sample-words`.  That hash
table should then be short enough to view in the interactions pane.

Can you easily tell which is the most frequent word?

<TODO: What is the most frequent word?  How do you know.>
|#

#| A |#

; +--------------------------+---------------------------------------
; | Exercise 7: Strange code |
; +--------------------------+

#|
a. The procedure `hash-keys` takes a hash table as input and returns
a list of all of the keys in that hash table.  Use `hash-keys` and
`length` to determine how many entries there are in `word-counts`.
|#

(define num-words
  ???)

#|
b. What does the following procedure do?  For example, what do
you expect for `(seven-bee word-counts "window")`?
|#

(define seven-bee
  (lambda (hash str)
    (list str (hash-ref hash str))))

#|
c. What do you expect the following expression to produce?

    (map (cut (seven-bee word-counts <>))
         (sort (hash-keys word-counts) string-ci<=?))

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#|
d. What does the following `seven-dee?` procedure do?

<TODO: Enter your answer here>
|#

(define seven-dee?
  (lambda (entry1 entry2)
    (>= (cadr entry1) (cadr entry2))))

#|
e. The `sort` procedure sorts a list according to a "comparator" that
takes two parameters and returns true if the first element should
precede the second and false otherwise.

What do you expect as the result of the following?

    (sort (map (cut (seven-bee word-counts <>))
               (hash-keys word-counts))
          seven-dee?)

<TODO: Enter your answer here>

Check your answer experimentally.

<TODO: Enter your experiment from the interactions pane>
|#

#| AB |#

; +------------------+-----------------------------------------------
; | Submit your work |
; +------------------+

#|
Yes, it's time for your favorite part of the lab.  Submit your work.
|#

#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you have extra time, you might consider one or more
of the following exercises.
|#

; +------------------------------------+-----------------------------
; | Extra 1: Counting words, revisited |
; +------------------------------------+

#|
Write a procedure, `(count-words fname)`, that returns a hash table
of the word frequencies in the file named by `fname`.  As you've
likely figured out from the previous exercises, your procedure
should probably,

* Create a new hash table (most likely, with a `let`).
* Read all of the words in the file (most likely, with `file->words`).
* Use the hash table to count the words in the file (using `for-each`
  and `add-word!`).
* Return the hash table.
|#

; +----------------------------+-------------------------------------
; | Extra 2: Most common words |
; +----------------------------+

#|
Write a procedure `(most-common-words fname n)`, that reads all of
the words in the file and returns the `n` most common words in
the file.  You will likely want to create a hash table for all
of the word counts (see extra 1), turn that into a list of
word/count lists, sort that list, and take the first `n` elements.
|#

