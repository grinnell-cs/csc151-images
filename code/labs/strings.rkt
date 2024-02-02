#lang racket

(require csc151)

;; CSC 151 (SEMESTER)
;; Lab: Strings
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

#|
In this lab you will be working with your partner to discover
common ways we manipulate characters and strings in Scheme.

For this lab, the partner nearer the board will drive on the
exercises marked "B" and the partner further from the board
will drive on the exercises marked "A".
|#

#| AB |#

#|

1. Make sure to introduce yourself to your partner.

2. Make sure to save this file as strings.rkt.

3. Optional: Review the Q&A.

|#

#| A |#

; +--------------------------+---------------------------------------
; | Exercise 1: Creating @'s |
; +--------------------------+

#|
Develop three ways of constructing the string "@@@": one using a call
to make-string, one a call to string, and one a call to list->string.
|#

(define making-@s-with-make-string ???)

(define making-@s-with-string ???)

(define making-@s-with-list->string ???)

#| A |#

; +---------------------------------+--------------------------------
; | Exercise 2: Textual experiments |
; +---------------------------------+

#|
Each of the following expressions evaluates to a string.  For each
expression write (a) its length of its resulting string value and
(b) a sentence description of the resulting string.
|#

#|
Length of texperiment1: 
Description of texperiment1: 
|#
(define texperiment1 "")

#|
Length of texperiment2: 
Description of texperiment2: 
|#
(define texperiment2 "hello world!")


#|
Length of texperiment3: 
Description of texperiment3: 
|#
(define texperiment3 "\"hello world!\"")

#|
Length of texperiment4: 
Description of texperiment4: 
|#
(define texperiment4 (string #\space))

#|
Length of texperiment5: 
Description of texperiment5: 
|#
(define texperiment5 (string))

#|
Enter any notes on what you've learned from this exercise.

|#

#| B |#

; +------------------------+-----------------------------------------
; | Exercise 3: Substrings |
; +------------------------+

#|
Consider the string "Department". Using the substring procedure, we
can extract a wide variety of words from this one string. Write a
Racket expression to extract each of the requested words below. You
may use substring multiple times in combination with string-append,
but please do not use string constants (e.g. "apart"), characters, or
any other procedures.

a. Write an expression to extract the string "Depart" from "Department".
b. Write an expression to extract the string "part" from "Department".
c. Write an expression to extract the string "ment" from "Department".
d. Write an expression to extract the string "a" from "Department".
e. Write an expression to extract the empty string from "Department".
f. Write an expression to extract the string "Dent" from
   "Department". Note that you may need to use two calls to substring
   along with a call to string-append.
g. Write an expression to extract the string "apartment" from
   "Department". Once again, you may need multiple calls.

Use the interactions pane to check that each of your defined
expressions produces the desired value.
|#

(define substring-ex-a "TODO!")

(define substring-ex-b "TODO!")

(define substring-ex-c "TODO!")

(define substring-ex-d "TODO!")

(define substring-ex-e "TODO!")

(define substring-ex-f "TODO!")

(define substring-ex-g "TODO!")

#| B |#

; +---------------------------------+--------------------------------
; | Exercise 4: Referencing lengths |
; +---------------------------------+

#|
Here are two opposing views about the relationship between
string-length and string-ref:

a. "No matter what string str is, provided that it is not the empty
   string, (string-ref str (string-length str)) will return the last
   character in the string."
b. "No matter what string str is,
   (string-ref str (string-length str)) is an error."

Which, if either, of these views is correct? Why? Experiment with code
in the interactions pane, substituting concrete strings for str (e.g.,
"hello world!"), to arrive at an answer. Answer this in a sentence or
two in the space below.

<TODO: write your response here>
|#

#| A |#

; +---------------------------------------+--------------------------
; | Exercise 5: Building simple sentences |
; +---------------------------------------+

#|
a. Consider the following definitions.

(define person "my lab partner")
(define adjective "awesome")

(define like
  (string-append 
     "I like " 
     person 
     " because " 
     person 
     " is "
     adjective
     "."))

What value do you expect `like` to have?

ENTER YOUR ANSWER HERE
|#

#|
b. Enter the expressions in DrRacket's interactions pane and check
your result.

ENTER THE VALUE OF `like` HERE
|#

#|
c. Write a procedure that does the same thing as this definition. (That is, takes a person and an adjective as inputs and produces a string that describes the person.)
|#

(define like-sentence
  ???)

#|
d. Write another "template sentence" of your own design. Make sure to
take at least two parameters.
|#

(define our-sentence
  ???)

#| B |#

; +---------------------------------+--------------------------------
; | Exercise 6: Deleting characters |
; +---------------------------------+

#|
Write a procedure, `(delete-char str pos)`, that creates a new string 
by deleting the character at position `pos` from `str`.

For example,

    > (delete-char "starlings" 8)
    "starling"
    > (delete-char "starling" 4)
    "staring"
    > (delete-char "staring" 2)
    "string"
    > (delete-char "string" 2)
    "sting"
    > (delete-char "sting" 1)
    "sing"
    > (delete-char "sing" 3)
    "sin"
    > (delete-char "sin" 0)
    "in"
    > (delete-char "in" 1)
    "i"
    > (delete-char "i" 0)
    ""

Example suggested by one of the Rebelsky offspring.
|#

(define delete-char
  (lambda (str pos)
    ???))

#| AB |#

; +-------------+----------------------------------------------------
; | Wrapping Up |
; +-------------+

#|
Congratulations on finishing this lab!  To turn in your work:

a. Make sure this file is named `strings.rkt`.
b. Email a copy of the code to your partner.
c. Submit this final file to Gradescope.  Make sure, if appropriate,
   to submit your work as a group submission and include your
   partner in the submission.
|#


#| AB |#

; +---------------------------+--------------------------------------
; | For those with extra time |
; +---------------------------+

#|
If you find that you finish all of these problems early, try one
or more of the following problems.  Note that some of these problems
require you to write functions.
|#

; +-----------------------------------+------------------------------
; | Extra 1: Collating your sequences |
; +-----------------------------------+

#|
In the reading, we discussed the fact that Racket assigns each of its
characters a unique integer.  These numbers are called a collating
sequence.  In this exercise, we'll explore these sequences in more
detail.
|#

#|
a. Compare notes with your partner about your answers to Check 2:
Collating sequences from the reading.  Use this acquired knowledge
to answer the following question:

What are the collating sequence numbers for the uppercase English
letters (A--Z)?  Write your answer in the space below:

<TODO: write your description here>

(Hint: the description should be shorter than listing 26 letter-number
pairs!)
|#

#|
b. Use your answer from part (a) to describe in a few sentences a
method for determining if a character is an upper-case English letter
by using collating sequences and subtraction.

<TODO: describe your method here>
|#

#|
c. Describe how you would extend your answer to part (b) to also
include lower-case English letters.  Can you just use the numbers
corresponding to 'A' (the beginning of the uppercase letter sequence)
and 'z' (the end of the lowercase letter sequence) or do we need to do
something more complicated?

<TODO: describe your updated method here
|#

#|
d. Finally, let's think a little bit more broadly!  What about other
languages?  For example, below are lowercase and uppercase alpha and
omega, the beginning and end of the Greek alphabet:

Α (uppercase alpha---note: *not* A!)
α (lowercase alpha)
Ω (uppercase omega)
ω (lowercase omega)

Describe in a few sentences how you would incorporate other languages
into your technique.  If you have the capability, try out letters in
other languages to see if your technique still works!

<TODO: describe your updated method here>
|#

