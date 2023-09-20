---
title: "EBoard 12: Lists"
number: 12
section: eboards
held: 2023-09-20
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* Questions
* Lab

Administrivia
-------------

### Introductory notes

* Quiz 2 (Basic Types) and Quiz 1 (Tracing) redo returned.
    * If you missed Quiz 1 redo, you should make an appointment
      to meet with me.  Tracing is an important skill.
* This week's quiz will be on conditionals.  

### Upcoming Token activities

Academic

* Thursday, 21 Sept 2023, 4:15 pm, CS Extras: "Study Abroad in CS"
  (Science 3821)
* Sunday, 24 Sept 2023, 1:00 pm, Mentor Session: "Review for SoLA 1"

Cultural

* CRSSJ Friday 2:30-5:30, get a Drake Library Card.  Borrow ebooks,
  get free music downloads.  And even BORROW PHYSICAL BOOKS!

Peer

Wellness

Misc

### Other Good Things

### Upcoming work

* Thursday night: MP3 due
* Thursday night: Reading responses due.
* Friday morning: Today's lab due (but we'll get it turned in today)
* Friday night: MP3 post-assessment due

Sample quiz questions
---------------------

_Utilize boolean expressions and values in a program to produce conditional behavior._

As you know, we often associate words with students' standing in
college.  At Smileyville College, where we have three terms per
year, those who have completed fewer than four terms are "freshlings",
those who have completed between four and seven terms (inclusive)
are "wise fools", those who have completed between eight and eleven
terms (inclusive) are "subordinates", and those who have completed
at least twelve terms are "elders".

Write a procedure, `(status terms)`, that, given the number of
terms a student has completed as input, produces a string that
describes the student using the words above.

Notes from the readings
-----------------------

_TPS_

Which do you prefer to generate `'(6 5 4 3)`?

* `(take (reverse (range 7)) 4)`
* `(reverse (drop (range 7) 3))`
* `(take (drop (reverse (range 10)) 3) 4)`

Comments

* Our brains work in different ways; some things make more sense to us
  than others.
* `reverse` will be faster on shorter lists.
* `drop` is usually faster than take (given the same `n`).

What's wrong with the following solution to the self-check?

```
(define rainbow-colors 
  '("red" "orange" "yellow" "green" "blue" "indigo" "violet"))

;;; (outlined-circle color) -> image?
;;;   color : color?
;;; Make an outlined circle of the specified color.
(define outlined-circle
  (lambda (color)
    (overlay (circle 20 "outline" "black")
             (circle 20 "solid" color))))

;;; (color-darker c) -> color?
;;;   c : color?
;;; Create a slightly darker version of c.
(define color-darker
  (lambda (c)
    (rgb (- (color-red (color-name->rgb c)) 32)
         (- (color-green (color-name->rgb c)) 32)
         (- (color-blue (color-name->rgb c)) 32))))

#|
b. Using apply and map, make a picture of seven outlined circles in darker versions of the rainbow colors. Note that you’ll need to convert the color names to RGB colors with color-name->rgb and then make the darker with two calls to color-darker.
|#

(define rainbow-colors 
  '("red" "orange" "yellow" "green" "blue" "indigo" "violet"))

(apply beside (map outlined-circle (map color-darker rainbow-colors)))
```

* The colors aren't RGB, and `color-darker` requires RGB colors.
  (Well, it was rewritten, but it's BAD IDEA to rewrite Sam's code,
  PARTICULARLY if you don't change the documentation.)
* The instructions said "two calls to `color-darker`".

What would Sam have liked?

```
(define darker-rainbow-circles
  (apply beside
         (map outlined-circle
              (map color-darker
                   (map color-darker
                        (map color-name->rgb
                             rainbow-colors))))))
```

Observation: You need to learn to read Scheme expressions inside-out.

_It's okay if you don't try the code, but then let me know that you're
not sure whether or not it works._

How about this one?

```
(define 7-Circle-darker
  (apply beside (map outlined-circle (map color-darker
                                          (list
                                           (color-name->rgb "red")
                                           (color-name->rgb "orange")
                                           (color-name->rgb "yellow")
                                           (color-name->rgb "green")
                                           (color-name->rgb "blue")
                                           (color-name->rgb "indigo")
                                           (color-name->rgb "violet")
                                           )))))
```

* Rather than writing `color-name->rgb` seven times, we could use `map`.
* Formatting: Please don't put parentheses on a line by themselves.
* Formatting: Think about how you break up your lines.

Questions
---------

_Ask questions.  It's part of self gov.  If you have questions, others
likely do, too._

### On lists

Why do I sometimes get `'(1 2 3)` and sometimes `(list 1 2 3)`?

> I wish I knew.  That behavior is new to DrRacket this year.

> Just assume there are multiple ways to say "This is a list".

### On `map` and `apply`

Why do we need `map` and `apply`?  Why can't I just write `(+ (list 1 2 3))`?

> The designers of Scheme decided that it was confusing to have `+` take
  both individual values and lists as parameters.  `+` takes only individual
  values.

> It's also likely to be less efficient if we try to make all procedures
  accept a list.  Then the system needs to check if the parameter is a
  list or not.  

> Some cases are also likely to be ambiguous, such as when we have a 
  procedure that accepts lists as input.

> Do I want `(list '(1 2 3))` to make a list of the list `'(1 2 3)`
  or a list of the values `1`, `2`, and `3`?

> I'm not sure how else we'd write `map`.

Going over a bit more on map/apply when more than one lists are given would be helpful.

> `apply` takes one only list.

> We'll explore multi-parameter `map` in the lab.

```
    (map circle (list 10 20 30) (make-list 3 "solid") (list "red" "green" "blue"))
--> (list (circle 10 "solid" "red")
          (circle 20 "solid" "green")
          (circle 30 "solid" "blue"))
--> (list SOLID-RED-CIRCLE
          (circle 20 "solid" "green")
          (circle 30 "solid" "blue"))
--> (list SOLID-RED-CIRCLE
          SOLID-GREEN-CIRCLE
          (circle 30 "solid" "blue"))
--> (list SOLID-RED-CIRCLE
          SOLID-GREEN-CIRCLE
          SOLID-BLUE-CIRCLE
```

How would you like us to do the `colorful-circles` exercise?  I feel
like I could have done it better.

> See above.

Could you give me an example of a trace?

> See above.

### On mini-project 3

Can we round angles for HSV to exact integers?

> Yes, that's a great idea.


### On administrative stuff

Lab
---

Person closest to the board is A.  Person furthest from board is B.

### `char->digit`

* `(char->integer #\0)` -> `48`
* `(char->integer #\1)` -> `49`
* `(char->integer #\2)` -> `50`
* `(char->integer #\3)` -> `51`
* `(char->integer #\4)` -> `52`
* `(char->integer #\5)` -> `53`

Do you see a pattern?

### `string->integer`

Think about this sequence of values for the input "8143".

* `"8143"`
* `'(#\8 #\1 #\4 #\3)`
* `'(8 1 4 3)`
* `'(8000 100 40 3)`
* `8143`

We are decomposing this problem in two different ways:

* As a series of steps that we go through (how do we go from each value
  to the next value).
* As doing something to each value in a list, using `map`.

It's 9:45.  "SAM SAID I CAN STOP HERE"

But please finish the problems; they are important.
