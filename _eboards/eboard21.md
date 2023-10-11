---
title: "EBoard 21: Numeric recursion"
number: 20
section: eboards
held: 2023-10-11
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed).

_Approximate overview_

* Administrivia
* Questions
* Lab

Administrivia
-------------

* Happy halfway point!
* I've had a request to permit free late submissions of MP4.  You
  may submit MP4 without penalty until Saturday night.  You may
  submit the MP4 post-assessment without penalty until Sunday night.
* I anticipate getting the Gradescope page for MP4 up this afternoon 
  or evening.
* If you are struggling because of the conflict (or the world's varied 
  reactions to the conflict), let me know how I can help.  I'm certainly
  willing to push deadlines.
* It appears that my office hours today and tomorrow are nearly completely
  booked (completely booked today, just a little time tomorrow).  If you'd
  like to meet with me, drop me a note and we'll see what we can work out.
  (Preferred times: noon-1pm and 3:00-3:00pm today; 10:00am-noon tomorrow.

### Upcoming Token activities

Academic

* CS Extras Thursday (planning for summer)
* Friday: Talk and movie on security (1pm, Strand 3).
  <https://forms.office.com/r/u34bDgj8w2>

Cultural

Peer

* Football, 1pm, Saturday 21 October 2023.

Wellness

Misc

### Other good things

### Upcoming work

* Wednesday morning: Today's lab due (normal policy)
* Thursday night: MP4
* Thursday night: NO READING DUE! 
* Friday Quiz

Friday's Quiz
-------------

Topics

* New topic: Local bindings.
* Repeat topics: Lists and the big three, List recursion
* Optional topics (you must email me by Wednesday evening if you
  want a quiz on one of these topics): Tracing, documentation

Timing and such

* I'll be here at 7:30 a.m. on Friday for those who want to take
  multiple quizzes.
* You can bring a sheet of paper (8.5x11 or A4) with hand-written
  notes if you think it will help.

Sample question

_Refactor redundancy and add clarity in computations with let-bindings._

Consider the following procedure that contains some repetitious code.

```drracket
;;; (letter->number ch) -> either integer? boolean?
;;;   ch : char?
;;; Converts ch to the corresponding number in the English alphabet.
;;; (1 for #\a or #\A, 2 for #\b or #\B, etc.).  Returns false (#f)
;;; if ch is not a letter in the English alphabet.
(define letter->number
  (lambda (ch)
    (cond
      [(<= (char->integer #\a) (char->integer ch) (char->integer #\z))
       (+ 1 (- (char->integer ch) 97))]
      [(<= (char->integer #\a) (+ (char->integer ch) 32) (char->integer #\z))
       (+ 1 (- (+ (char->integer ch) 32) 97))]
      [else #f])))

(check-equal? (map letter->number (string->list "abcde"))
              '(1 2 3 4 5)
              "First five lowercase letters")
(check-equal? (map letter->number (string->list "ABCDE"))
              '(1 2 3 4 5)
              "First five uppercase letters")
(check-equal? (map letter->number (string->list "XYZ"))
              '(24 25 26)
              "Last three uppercase letters")
(check-equal? (map letter->number (string->list "xyz"))
              '(24 25 26)
              "Last three lowercase letters")
(check-equal? (letter->number #\.)
              #f
              "Not a letter")
```

As you know, we should avoid redundant computations and magic numbers.  Using
local bindings (`let` or `let*`), remove the redundant computations and magic
numbers from `letter->number`.  You need not change the primary stucture
of the `cond`, but you should not compute the same value twice.

Note: In case you didn't know, 32 is the result of subtracting the
collating sequence number of `#\A` from the collating sequence number
of `#\a`.  By adding 32, we switch from uppercase to lowercase.  And
97 seems to be the collating sequence number of `#a`, but we probably
shouldn't count on that.

A different way to write `select-odds`
--------------------------------------

Here's a way that Ellie and Ella and Sam tried helping some folks
with `select-odds`.  I like it because it emphasizes the recursion.

```
(define select-odds
  (lambda (nums)
    (if (null? nums)
        null
        (let ([remaining-odds (select-odds (cdr nums))])
          (if (odd? (car nums))
              (cons (car nums)
                    remaining-odds))))))
```

Many ways to write `longest-string`
-----------------------------------

I like `longest-string` because it suggests multiple approaches.

```
#|
Implement a procedure, `(longest-word words)`, that takes a nonempty list
of strings as input and finds the longest string in the list.  If there
are multiple strings that have the same length and are longer than any
other strings in the list, you can return any of them.

You may not use `sort` or `reduce` to solve this problem.  (You've
guessed it; this procedure helps you understand how one of the
forms of `reduce` might be implemented.)
|#

;;; (longest-word words) -> string?
;;;   words : list-of string? (nonempty)
(define longest-word
  (lambda (words)
    ???))
```

A straightforward way.  Compare the recursive result to the first
word and take the longer of the two.

```
(define longest-word
  (lambda (words)
    (if (singleton? words)
        (car words)
        (if (> (string-length (car words))
               (string-length (longest-word (cdr words))))
            (car words)
            (longest-word (cdr words))))))
```

The straightfoward way, rethought with a helper procedure to avoid
duplicating work.  In my world, this more closely matches the 
English-language description.

```
(define longer-word
  (lambda (word1 word2)
    (if (> (string-length word1) (string-length word2))
        word1
        word2)))

(define longest-word
  (lambda (words)
    (if (singleton? words)
        (car words)
        (longer-word (car words) (longest-word (cdr words))))))
```

The straightforward way, using a local binding to name the recursive
result.

```
(define longest-word
  (lambda (words)
    (if (singleton? words)
        (car words)
        (let ([longest-remaining (longest-word (cdr words))])
          (if (> (string-length (car words)) (string-length longest-remaining))
              (car words)
              longest-remaining)))))
```

Twisting things around: Compare the first two words.

```
(define longest-word
  (lambda (words)
    (if (singleton? words)
        (car words)
        (if (> (string-length (car words)) (string-length (car (cdr words))))
            (longest-word (cons (car words) (cdr (cdr words))))
            (longest-word (cons (car (cdr words)) (cdr (cdr words))))))))
```

_TPS_: Load the eboard, look at the variants.  Which do you prefer?  Why?

`awesum`
--------

Consider the problem of adding up all the numbers in a nested list
of a form something like the following.

```
'(3 (4 5) (6 (7 (8 9) (10 (11)))))
```

As you've seen in the mini-project, we call such lists "deeply nested".
A deeply nested list of numbers is a list that contains only numbers
and deeply nested lists of numbers.

```
;;; (awesum numbers) -> number?
;;;   numbers : a deeply nested list of numbers
;;; Add up all of the numbers in numbers.
(define awesum
  (lambda (numbers)
    ???))
```

We'll assume that `numbers` is correctly formed (that is, it is a list
of either numbers or deeply nested lists of numbers).

_TPS_: Base case, easy recursive case, harder recursive case.

Questions
---------

### Administrative

### Numeric recursion

I'm confused as to how the "partof" label applies to numeric recursion. I understand how it applies in regard to lists, but it just doesn't make sense to me in the examples given from the reading.

> For numeric recursion, `partof` is almost always just the number.

### MP4

I'm getting an error with `rgb-red`.

> It should be `color-red`.

Can I have an extension until Saturday night?

> Yes.

Can we assume that all sublists have at least two elements?

> For an M, yes.  For an E, you must handle singleton lists and empty
  lists.

> Hint: Write something that checks for these cases, does the appropriate
  thing for them, and applies `beside` or `above` in the remaining
  cases.  (I think that's the only time it really matters.)

### Other

Lab
---

