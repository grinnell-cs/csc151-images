---
title: "EBoard 19: Recursion"
number: 19
section: eboards
held: 2024-03-04
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [10 min]
* Questions [10 min]
* Review: "What goes into algorithms"
* Quick introduction recursion.
* Examples

Administrative stuff
--------------------

### SoLA 2

I'd like to see some you do a more in-depth brain dump. Putting
information in a "usable form" helps train your brain. For example,
what does an `if` expression look like? How many parameters does
`string-append` have? What are the key operations for lists and
what are examples of their use?

We may try a quick bit of practice.

### Token notes

* A new place to submit tokens is now available.
* I'm still working on getting your tokens into that place.
* You don't earn tokens for activities not mentioned in class.
* You don't earn tokens for peer activities when you are the peer
  being supported.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-03-05, noon, Some PDR.
  _CS Table_.
* Thursday, 2024-03-07, 11:00 a.m.,JRC 101.
  _Scholars' Convocation: An American Genocide: The United States and 
   the California Indian Catastrophe, 1846-1873_
* Thursday, 2024-03-07, 7:00pm, Science 3819.
  _Mentor Session_ (on recursion). 

Cultural

* Monday, 2024-03-04, Sebring Lewis.
  _Des Moines Metropolitan Opera: Beauty and the Beast_
* Thursday, 2024-03-07, JRC 101, 8:00-9:30 pm.
  _Writers@Grinnell: Carl Phillips_
* Thursday--Saturday, 2024-03-07 to 2024-03-09, 7:30 p.m.
  _Songs of the Scarlet and Wayback_ (play).
* Friday, 2024-03-08, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._
* Saturday, 2024-03-09, Harris Cinema, ??:??
  _Met Opera: Verdi's La Forza del Destino_.
* Saturday, 2024-03-09, 2:00 pm, Sebring-Lewis.
  _ZAWA!_ (Flute concert).

Peer

* Saturday, 2024-03-09, Field House.
  _Men's Tennis vs. Central._
* Sunday, 2024-03-10, 1--3pm, in JRC 225. 
  _Fiber Arts Club._ Community. Arts. Music in the background. What could
  be better.

Wellness

* Tuesday, 2024-03-05, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-03-05, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-03-05, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.
* Wednesday, 2024-03-06, 4pm, JRC 101.
  _Intimacy Stages_.
* Friday, 2024-03-08, noon, JRC 101.
  _Wellness Bingo_.

Misc

### Other good things (no tokens)

### Upcoming work

* Monday, 2024-03-04, 4:00pm, SoLA 2 released.
* Tuesday
    * Reread/skim [recursion basics](..//readings/recursion-basics). 
        * It's okay if this makes even less sense than everything we've 
          done so far; it takes many people time to understand recursion.
        * Do not submit anything.
* Wednesday, 2024-03-06, 11:00pm, SoLA 2 due.
* Sunday, 2024-03-10, 11:00pm, [MP3](../mps/mp3) Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4168533/)
    * Make sure to include the `CHANGES.rkt` file.
* Sunday, 2024-03-10, 11:00pm, [MP1](../mps/mp1) Second redo
    * [_Submit MP1 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4168529/)
    * Make sure to include the `CHANGES.rkt` file.

Questions
---------

### Administrative

### Recursion

In the following, the definition of `sum` includes `sum`, which we are
trying to define. Is this really possible and, if so, how is it possible?

```
(define sum
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (car numbers) (sum (cdr numbers))))))
```

> Welcome to the magic of recursion, in which we build procedures
  using the procedure we are building as a helper.

> Yes, it is possible. It's possible, in part, because of what our
  mental model demonstrates: These self-referential definitions naturally
  expand and then give us an answer.

Reminder: `(if #f CONSEQUENT ALTERNATE) --> ALTERNATE`

```
    (if (null? numbers) 0 (+ (car numbers) (sum (cdr numbers))))))
```

```
    (sum (list 4 5 2))
--> (if (null? (list 4 5 2)) 0 (+ (car (list 4 5 2)) (sum (cdr (list 4 5 2)))))
--> (if #f 0 (+ (car (list 4 5 2)) (sum (cdr (list 4 5 2)))))
--> (+ (car (list 4 5 2)) (sum (cdr (list 4 5 2))))
--> (+ 4 (sum (cdr (list 4 5 2))))
--> (+ 4 (sum (list 5 2)))
--> (+ 4 (if (null? (list 5 2)) 0 (+ (car (list 5 2)) (sum (cdr (list 5 2))))))
--> (+ 4 (if (null? (list 5 2)) 0 (+ (car (list 5 2)) (sum (cdr (list 5 2))))))
--> (+ 4 (if #f 0 (+ (car (list 5 2)) (sum (cdr (list 5 2))))))
--> (+ 4 (+ (car (list 5 2)) (sum (cdr (list 5 2)))))
--> (+ 4 (+ 5 (sum (cdr (list 5 2)))))
--> (+ 4 (+ 5 (sum (list 2))))
--> (+ 4 (+ 5 (if (null? (list 2)) 0 (+ (car (list 2)) (sum (cdr (list 2)))))))
--> (+ 4 (+ 5 (if #f 0 (+ (car (list 2)) (sum (cdr (list 2)))))))
--> (+ 4 (+ 5 (+ (car (list 2)) (sum (cdr (list 2))))))
--> (+ 4 (+ 5 (+ 2 (sum (cdr (list 2))))))
--> (+ 4 (+ 5 (+ 2 (sum null))))
--> (+ 4 (+ 5 (+ 2 (if (null? null) 0 (+ (car null) (sum (cdr null)))))))
--> (+ 4 (+ 5 (+ 2 (if #t 0 (+ (car null) (sum (cdr null)))))))
--> (+ 4 (+ 5 (+ 2 0)))
--> (+ 4 (+ 5 2))
--> (+ 4 7)
--> 11
```

```
(define solid-square
  (lambda (size color)
    (solid-square size color)))
```

```
    (solid-square 12 "blue")
--> (solid-square 12 "blue")
--> (solid-square 12 "blue")
--> (solid-square 12 "blue")
--> (solid-square 12 "blue")
--> (solid-square 12 "blue")
--> (solid-square 12 "blue")
```

Whoops!

In Racket, the behavior we'll see is that we never ever get a prompt in
the interactions pane.

Algorithms, revisited
---------------------

It's time to return to something we covered early in the semester.

Six key components to algorithm writing:

* _Basic/built-in types, their values, and operations on those values._
  The things the computer already "knows" how to do.
* _Subroutines (procedures, etc.)_
  Named and parameterized (sub)algorithms.
* _Conditionals._
  Ways to make choices.
* _Repetition._
  Ways to repeat an action.
* _Naming._
  Assigning names to values (or parameters).
* _Sequencing._
  Controlling the order in which things are done.

_TPS: What do we know about each of these in Scheme?_

### Built-in types (+ values, operations)

* Lists (`append`, `cons`, `car`, `cdr`, `index-of`, `list-ref`)
* Strings (`string-append`, `substring`)
* Numbers (`+`, `/`)
* Characters (`char->integer`)
* Images/shapes (`rectangle`, `rotate`, `hflip`)

### Subroutines (procedures)

* `lambda`
* `cut`
* `o`
* (with `define`)

### Conditionals

* `(if TEST CONSEQUENT ALTERNATE)`
* `(cond [GUARD1 CONSEQUENT1] [GUARD2 CONSEQUENT2] ... [ELSE ALTERNATE])`
* `(cond [GUARD1 CONSEQUENT1a CONSEQUENT1b] [GUARD2 CONSEQUENT2] ... [ELSE ALTERNATE])`
* `or` and `and` can provide some measure of conditional control.

### Repetition

* `map` - Does something repeatedly (once to each element of a list)
* `reduce` - does something repeatedly (merges neighboring elements)
* `filter`
* Call the same helper procedure multiple times.
* `pixel-map` - applies a procedure to each pixel
* _All of these somewhat limited._
* Perhaps `make-list`.

### Naming

* `define`
* When we call a procedure, we've "named" the parameters.

### Sequencing

* If there are a sequence of expressions in the interactions pane or the
  definitions pane, Racket evaluates them in order.
* Composition creates a procedure that sequences operations.
* Inner-out evaluation order

Recursion
---------

* One of the most powerful techniques for repetition.
* Derives (somewhat) from decomposition.
    * We know that solve a complex problem, we should decompose the problem 
      into smaller problems.
* Recursion says "To solve a complex problem, solve a smaller version 
  _of the same problem_, and then use that to solve the bigger problem."
* To write a recursive procedure, we need to
    * Determine how to "simplify" an input (for lists, it's usually
      "remove the first value")
    * Determine how to use the solution to the smaller problem to 
      solve the bigger problem
    * Identify when the problem is simple enough we can solve it directly.
      (For lists, that's usually "one or zero elements")

The weird part of recursion is that we are solving the "smaller"
problem with exactly the same solution as the smaller problem; we
have to assume we’ve written something we haven’t written yet.

_The magic recursion fairy makes it work._

Examples
--------

We're going to rephrase recursion in terms of "delegation".  When given
a large problem, an executive will normally delegate most of the problem
to an assistant.  We'll assume that their assistant will do the same.

To count the cards in a list

* If you have no cards, answer "0"
* Otherwise,
    * Remove one card
    * Ask your assistant to count all the remaining cards
    * Add 1

To count the number of odd numbers in a list

* If you have no cards, answer "0"
* Otherwise
    * Remove one card
    * Ask your assistant to count the odd numbers in the remaining cards
    * If you have an odd card, add 1
    * Otherwise, add 0

To sort a list of cards

* If you have zero or one cards, you're sorted
* Otherwise
    * remove one card
    * Ask your assistant to sort the remaining cards
    * Put your card in the right place.

```
;;; (list-length lst) -> integer?
;;;   lst : list?
;;; Define how many elements there are in a list.
(define list-length
  (lambda (lst)
    (if (null? lst)  
        0
        (+ 1 (list-length (cdr lst))))))
```

Yay! It works!

```
;;; (tally-odds lst) -> integer?
;;;   lst : (list-of integer?)
;;; Count how many odd numbers appear in `lst`.
(define tally-odds
  (lambda (lst)
    (if (null? lst)
        0
        (+ (if (odd? (car lst)) 1 0)
           (tally-odds (cdr lst))))))

(define tally-odds
  (lambda (lst)
    (cond
      [(null? lst)
       0]
      [(odd? (car lst))
       (+ 1 (tally-odds (cdr lst)))]
      [else
       (tally-odds (cdr lst))])))

(define tally-odds
  (lambda (lst)
    (list-length (filter odd? lst))))
; Correct; doesn't help us learn recursion
```

```
;;; (insert-number num sorted-nums) -> (list-of integer?)
;;;   num : integer?
;;;   sorted-nums : (all-of list-of-integer? sorted?)
;;; Insert `num` into the correct place in `sorted-nums`
;;;
;;; Notes: Look at each element in turn. If you're bigger, skip over
;;; it. If you're smaller, insert it there. If there are no elements,
;;; inserting it means "create a new list".
(define insert-number
  (lambda (num sorted-nums)
    (cond
      [(null? sorted-nums)
       (list num)]
      [(<= num (car sorted-nums))
       (cons num sorted-nums)]
      [else
       (cons (car sorted-nums) 
             (insert-number num (cdr sorted-nums)))])))
```

```
;;; (sort-nums nums) -> (all-of (list-of integer?)  sorted?)
;;;   nums : (list-of integer?)
;;; Sort `nums` in increasing order.
(define sort-nums
  (lambda (nums)
    (if (null? nums)
        null
        (insert-number (car nums)
                       (sort-nums (cdr nums))))))
```
