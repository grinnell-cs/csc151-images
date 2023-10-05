---
title: "EBoard 18: Recursion practice"
number: 18
section: eboards
held: 2023-10-04
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* About the quiz
* About SoLA 1
* Questions
* Lab

Administrivia
-------------

* New places.
* Last Friday's lab is cancelled.  It's worth looking at, but you
  should not turn anything in.
* MP4 is now due a week from Thursday.
* The MP2 redo is now posted.  
    * It is due October 12th.
    * Please include a `changes.rkt` file that includes a list
      of the changes you've made in response to the grading comments.

### Upcoming Token activities

Academic

* CS Extra, Thursday, 4:15, Noyce 3821: Majoring in CS

Cultural

Peer

* Play this weekend.  _Everybody_.  Thursday, Friday, and Saturday
  at 7:30 p.m. in Flanagan.  Sunday at 2:00 also in Flanagan.  Get
  tickets at the box office starting at noon on Thursday.  (Maybe
  before.)  The box office is in Bucksbaum, near the courtyard.
* Volleyball vs. Lawrence Saturday at 1pm (Senior Day).

Wellness

Misc

* Grinnell homecoming parade, Thursday, downtown 5:30 p.m.

### Other good things

### Upcoming work

* LATE: MP4 pre-assessment due
* Thursday night: Readings due
* Friday morning: Lab writeup due (but turn it in today)
* Friday: Quiz!  
    * Tracing (for the few of you who still need it).
    * Lists and the big three (see our discussion below).
    * Documentation (see our discussion below).
    * One new one (you can vote).
        * Anonymous procedures with `cut` and `compose` (`o`).
        * List recursion.
    * Sam will be here at 7:30 for those of you who want to do
      many quizzes.

Sample problems
---------------

### List recursion

_Design and write recursive functions over lists._

Write a *recursive* procedure, `(increasing-length? words)`, that takes
a list of strings as input and ensures that every string is at least as
long as the previous string. If so, it returns true.  If not, it returns
false.

Here's a partial test suite.

```drracket
(check-equal? (increasing-length '())
              #t
              "No strings: They are in increasing length")
(check-equal? (increasing-length? '("hello"))
              #t
              "A singleton")
(check-equal? (increasing-length? '("a" "b" "cd" "efg" "hij" "klmn"))
              #t
              "Some duplicate-length words")
(check-equal? (increasing-length? '("a" "bb" "ccc" "dddd" "eee"))
              #f
              "Okay until the end.")
```

### Use higher-order procedures

_Use `cut` and composition to simplify computation._

Consider the following procedures

```drracket
;;; (vowel? char) -> boolean
;;;   char : char?
;;; Determine if char is a vowel.
(define vowel?
  (let ([vowels (string->list "aeiou")])
    (lambda (ch)
      (integer? (index-of vowels (char-downcase ch))))))

;;; (count-vowels str) -> integer?
;;;   str : string?
;;; Count the number of vowels in str
(define count-vowels
  (lambda (str)
    (tally vowel? (string->list str))))

;;; (select-special-words words) -> list-of string?
;;;   words : list-of string?
;;; Selects all the special words in words using the ALTV criterion.
(define select-special-words
  (lambda (words)
    (filter (o (cut (> <> 2)) count-vowels) words)))
```

a. What kinds of words does `select-special-words` select?

b. Explain how `(o (cut (> <> 2)) count-vowels)` works as a
predicate for such words.

c. Rewrite `vowel?` using `cut` and composition but no `lambda`.

## Use higher-order procedures (extra)

_This is a particularly evil problem.  You are unlikely to get one
this hard._

Consider the following procedure.

```drracket
(define silly
  (lambda (lst)
    (map (lambda (x) (sqr (+ 1 x)))
         (filter odd? lst))))
```

Rewrite the procedure using `o` and `cut` so that it has *no* lambdas.

Notes:

* Use `o` when you want to sequence actions. (Do *this* to the parameter,
  then *this* to the result, then *this* to the next result, and so on and
  so forth.)
* Use `cut` when you want to fill in one or more parameters to a procedure, 
  thereby creating a new procedure.
* This is a case in which the lambda-free version is likely much harder to
  read.

### Voting!

_We can start with a bit of debate

* `cut` and compose
* List recursion wins!

About the quiz on the big three
-------------------------------

* Ways to approach working with lists "all at once" rather than
  having to use recursion or something else to process them.
    * `map` applies a procedure to each element.
    * `filter` selects elements that meet some criterion (predicate)
    * `reduce` combines neighboring elements again and again and again
      until we have one element.
* The "normal" process:
    * Filter in the elements we want to deal with (e.g., I only want
      the odd numbers, or only the strings that represent numbers,
      or only the strings that represent colors).
    * We use `map` to modify each (e.g., to convert a string to a number)
    * We use `reduce` to combine them all into a single value.
* For our problem at hand
    * Determine which strings represent numbers and which strings are
      questionable.
    * Convert those strings to numbers
    * Find the furthest from zero
* `(filter ____ lst)` 
    * We could use something that determines if there's a question mark
      in a string.  `(cut (string-contains <> "?"))`
    * We had two procedures that might help: `string->integer` and
      `further-from-zero`.
        * `string->integer` Returns an extact integer if the string 
          represents an exact integer.  Otherwise, returns #f.
        * `further-from-zero` Given two numbers, determines which is
          further from zero.
    * We can filter the list with `string->integer`, because we get
      false for anything we don't want to process further.  We get
      a truish value for the things we do want to process.
    * `(filter string->integer lst)` 
* `(map ____ (filter string->integer lst))`
    * `(map string->integer (filter string->integer lst))`
* `(reduce ____ (map string->integer (filter string->integer lst)))`
    * `(reduce further-from-zero (map string->integer (filter string->integer lst)))`
* Why are we using `string->integer` twice?
    * The first time, we're using it to select values.
    * The result of filtering the list is still a list of strings.
    * So we still have to turn all of the strings into integers.
    * And that's the second use.
* Another approach some of you tried to our problem at hand
    * `(reduce further-from-zero (filter integer? (map string->integer lst)))`
    * That's fine.
    * In general, we'll want to filter first, but not always.
* Another approach some of you tried to our problem at hand
    * `(reduce further-from-zero (filter string->integer lst))`
    * This will crash because we will be giving `further-from-zero` strings
      instead of integers, and it expects integers.

About SoLA 1
------------

* I've generally included comments when you don't get credit, but may not
  have added comments when you do get credit.  (I hope that makes sense.)
* I should be sending out summaries of how you are doing on LAs by next
  Monday.  (Hopefully sooner, depending on how things go with the software.)
* Those who missed three or more will likely get a note from me about getting
  extra help.

### Documentation

Documentation may have been the hardest one.  I expect precision
in your documentation, particularly with regards to the type restrictions
on inputs.

#### The question

Consider the following procedure that makes a simple "party person" in which we can choose the size and color of various aspects.

```
(define party-person
  (lambda (size hat tie)
    (above (triangle (* size 2) "solid" hat)
           (circle (* size 2) "outline" 'black)
           (beside (rotate 90 (triangle (* size 1/2) "solid" tie))
                   (rotate -90 (triangle (* size 1/2) "solid" tie)))
           (rectangle size (* size 4) "solid" "black"))))
```

Here's the result of a call to `(party-person 10 "teal" "salmon")`.

[Image elided].

a. Document `party-person` using the standard format.

#### An incorrect answer

_What's wrong with the following answer?_ (TPS)

```
; (party-person size hat tie) -> image?
; size : number?
; hat : color?
; tie : color?
; Create a simple stick figure wearing a hat and tie, where
; the size gives a scaling factor from some basic figure.  The
; hat is colored `hat` and the tie is colored `tie`.  The
; figure is about 10.5*size tall and 4*size wide.
```

* `color?` only returns true for RGB colors.  Not for color names.
* `number?` is fairly vague ... it permits numbers we probably
  shouldn't use as sizes, such as
    * 3+i (`real?`)
    * -5 (`positive-real?` or `non-negative-real?`)
    * side note: I prefer predicates, but I'm okay with a predicate
      plus some english. "real? (greater than zero)"
* We should indent all of the parameters by three spaces
* We use three semicolons for documentation, not one

#### A better answer

_How would you fix it?_

```
;;; (party-person size hat tie) -> image?
;;;   size : non-negative-real?
;;;   hat : either color? or color-name?
;;;   tie : either color? or color-name?
;;; Create a simple stick figure wearing a hat and tie, where
;;; the size gives a scaling factor from some basic figure.  The
;;; hat is colored `hat` and the tie is colored `tie`.  The
;;; figure is about 10.5*size tall and 4*size wide.
```

#### Re-dos

Note: I'll have a quiz on documentation available on Friday.

### Academic honesty, again

_I'm sick of having to talk about this._

Questions
---------

### Administrative

How do I pay tokens to turn something in late?

> You will be charged automatically.

How do I tell how I'm doing on tokens?

> Sam plans to update those this coming weekend.

When will you post the MP2 redo?

> It should now be posted.  Sorry for the delay.

Can I get a token for attending an event at which others are supporting me?

> Only if you are also supporting someone else.

Are we charged tokens for redos on learning assessments?

> Definitely not

Are you going to charge me because I turned in my mini-project five minutes late?

> Probably not.  

Are you going to charge me because I turned in my mini-project two to three hours late?

> It depends on how much you annoy me in class with questions like this.

What should be in the `changes.rkt`.

* "This is what I lost credit for last time.  This is how I addressed it."
* "These are the other things I changed."

### MP4

What's the difference between "shape parameter values" and "a list of shape parameter values".

> This is a shape parameter values thing: `(list 20 10 (rgb 10 10 10))`

> This is a list of shape parameter values lists:
  `(list (list 20 10 (rgb 10 10 10)) (list 30 100 (rgb 255 0 255)))`

Lab
---

