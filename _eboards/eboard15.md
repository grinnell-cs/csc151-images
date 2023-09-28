---
title: "EBoard 15: Recursion"
number: 15
section: eboards
held: 2023-09-27
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Administrivia
* A note on last Friday's quiz
* Questions
* Algorithms, revisited
* Play with recursion (Our context: Delegation)

Administrivia
-------------

* Quizzes returned.
* SoLA problems (6 of 'em) should appear at 10:00 a.m.  Let me know if
  you don't see them.
* If you have parents visiting for family weekend, you are welcome to
  bring them to class on Friday.  (Let me know in advance in case I have
  to find chairs.)
    * No, I won't make them take the quiz.
* Today is a talk day, to help us conceptualize recursion.

### Upcoming Token activities

Academic

* Convocation, "A Cure for the Epidemic of Loneliness?", Thursday, 11am, 
  HSSC Kernel.
* CS Extras, Thursday, 4:15 pm, Science 3821

Cultural

* Pieta Brown, Saturday night

Peer

* Football vs. Lawrence, Saturday, 1pm

Wellness

Misc

### Other good things

### Upcoming work

* Thursday night: SoLA 1 due
* There is no reading for Friday; focus your time on the SoLA and the quiz.
* Quiz Friday!  Lists (with the big three - map, filter, reduce)

### Friday's quiz

Primary topic: Lists + "the big three" (filter, map, reduce)

I will also have another round of tracing.

**Sample lists problem**

_Manipulate lists with fundamental higher-order list functions._

Write a procedure, `(acronym string-of-words)`, that takes as input
a string of words separated by spaces and produces as output an
acronym that consists of the first letter of each word.

```racket
> (acronym "International Business Machines")
"IBM"
> (acronym "Grinnell's Underground Magazine")
"GUM"
> (acronym "Sam's Assorted Musings and Rants")
"SAMaR"
```

You may rely on this following helper function.

```
;;; (first-char str) -> character
;;;   str: A non-empty string
;;; Extracts the first character of a string
(define first-char
  (lambda (str)
    (string-ref str 0)))
```

```
> (first-char "hello")
#\h
> (first-char "International")
#\I
```

Quiz from last Friday
---------------------

* Many people got "S" but still go lots of red on their quizzes.  Let
  me know if the red doesn't make sense (after we discuss it).
* Note that the quiz was quite similar to a lab problem; you'll find
  that that happens from time to time.
* I permit (minor) syntax errors on Friday quizzes; I will not permit
  them on the SoLA, since you can check in DrRacket.

_TPS: What's wrong with (or could be improved about) this solution?_

You should be able to be able to find at least six different issues.
(Invalid Scheme, won't meet specifications, bad style, unnecessary code ...)

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           ("black")]
          ((and (> (simple-brightness c) 20) 
                (< (simple-brightness c) 40)) ("dark-gray"))
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           ("medium-gray"))
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           ("light-gray"))
          ((> (simple-brightness c) 80)
           ("white")))))
```

"Wow, that's really bad!  Did that get an S?"  (Yeah, probably.)

First revision: The specification said "use `black`, `dark-gray`, ..."
note "use `"black"`, `"dark-gray"`, ... [Doesn't meet specifications.]

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           (black)]
          ((and (> (simple-brightness c) 20) 
                (< (simple-brightness c) 40)) (dark-gray))
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           (medium-gray))
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           (light-gray))
          ((> (simple-brightness c) 80)
           (white)))))
```

Second revision: Don't parenthesize individual values. [Prevents crash.]

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           black]
          ((and (> (simple-brightness c) 20) 
                (< (simple-brightness c) 40)) dark-gray)
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray)
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray)
          ((> (simple-brightness c) 80)
           white))))
```

Revision 3: Please put the consequent of a condition on a separate line.
[Style]

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           black]
          ((and (> (simple-brightness c) 20) (< (simple-brightness c) 40)) 
           dark-gray)
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray)
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray)
          ((> (simple-brightness c) 80)
           white))))
```

Revision 4: It's usually better practice to end with an else.

```
(define grayscale
  (lambda (c)
    (cond [< 20 (simple-brightness c)
           black]
          ((and (> (simple-brightness c) 20) (< (simple-brightness c) 40)) 
           dark-gray)
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray)
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray)
          ((> (simple-brightness c) 80)
           white)
          (else
           white))))
```

Revision 5: We should parenthesize our tests

```
(define grayscale
  (lambda (c)
    (cond [(< 20 (simple-brightness c))
           black]
          ((and (> (simple-brightness c) 20) (< (simple-brightness c) 40)) 
           dark-gray)
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray)
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray)
          ((> (simple-brightness c) 80)
           white)
          (else
           white))))
```

Revision 6: That first test is backwards. [Specifications/correctness]

```
(define grayscale
  (lambda (c)
    (cond [(< (simple-brightness c) 20)
           black]
          ((and (> (simple-brightness c) 20) (< (simple-brightness c) 40)) 
           dark-gray)
          ((and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray)
          ((and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray)
          ((> (simple-brightness c) 80)
           white)
          (else
           white))))
```

Revision 7: We prefer square brackets to parens in cond blocks.  Both work.
[Style]

```
(define grayscale
  (lambda (c)
    (cond [(< (simple-brightness c) 20)
           black]
          [(and (> (simple-brightness c) 20) (< (simple-brightness c) 40)) 
           dark-gray]
          [(and (> (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray]
          [(and (> (simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray]
          [(> (simple-brightness c) 80)
           white]
          [else
           white])))
```

Revision 8: This will fail to provide the correct answers for 20, 40, 60,
and 80

```
(define grayscale
  (lambda (c)
    (cond [(< (simple-brightness c) 20)
           black]
          [(and (>= (simple-brightness c) 20) (< (simple-brightness c) 40)) 
           dark-gray]
          [(and (>= (simple-brightness c) 40) (< (simple-brightness c) 60))
           medium-gray]
          [(and (>=(simple-brightness c) 60) (< (simple-brightness c) 80))
           light-gray]
          [(>= (simple-brightness c) 80)
           white]
          [else
           white])))
```

Revision 9: The `and` should be unnecessary.  If the first guard
did not hold, we know that `(simple-brightness c)` is at least 20.
There's no reason to check again. [Design/efficiency]

```
(define grayscale
  (lambda (c)
    (cond [(< (simple-brightness c) 20)
           black]
          [(< (simple-brightness c) 40)
           dark-gray]
          [(< (simple-brightness c) 60)
           medium-gray]
          [(< (simple-brightness c) 80)
           light-gray]
          [else
           white])))
```

Revision 10: Please don't put the first cond block on the same line
as the cond. [Style]

```
(define grayscale
  (lambda (c)
    (cond 
      [(< (simple-brightness c) 20)
       black]
      [(< (simple-brightness c) 40)
       dark-gray]
      [(< (simple-brightness c) 60)
       medium-gray]
      [(< (simple-brightness c) 80)
       light-gray]
      [else
       white])))
```

Revision 11: "Ugh.  We are potentially computing `(simple-brightness c)` four 
times.  Can we do it only once? (Without using an internal `define` or things
they shouldn't have learned yet?)"

[Style/efficiency]

```
(define grayscale
  (lambda (c)
    (grayscale-helper (simple-brightness c))))

(define grayscale-helper
  (lambda (brightness)
    (cond 
      [(< brightness 20)
       black]
      [(< brightness 40)
       dark-gray]
      [(< brightness 60)
       medium-gray]
      [(< brightness 80)
       light-gray]
      [else
       white])))
```

Note: Racket does not care about the order of definitions.


Questions
---------

### In preparation for the SoLAs

Do I have one hour total for the SoLA?

> No.  You have one hour for each LA you do.

> But please stop at 15-20 minutes.

Do I have to do all the LAs at the same time?

> No.  You can take a break.

Can I move away from one LA and then come back to it?

> Yes, provided you come back within the hour.  The timer does not stop.

I am supposed to have extended time on tests and quizzes.  Do I?

> Try the sample LA.

Can I hack the system by submitting something and hoping the timer stops?

> You can try, but the timer will keep going.

If we got an S on the Conditionals or Primitive types quizzes, can we
skip the LAs?

> Yes!  Please skip those LAs.

> What happens if you get it wrong the second time?  

When will the real LAs show up?

> 10:00 a.m. today.  (more or less)

### On administrative stuff

Will collaboration be on the SoLA?

> No

Will you ever grade the collaboration LA?

> Yes.  By week 14.  Hopefully sooner.

When will we get mini-projects back?

> Soon.  Mini-project 2 will be immediately after class.

### On stuff from the last lab

Can we talk about the relationship between `cut` and `section`?

> Both are intended take a procedure and fill in *some* of the parameters,
  thereby creating a new procedure.

> `section` is what we used in years passed (years past)

> `cut` was introduced this year to provide what might be a simler model.

> `(cut (+ <> 5))` - Write an expression, put in diamonds for "I need a
  parameter", add the `cut`.

> `(section + <> 5)` - Doesn't use the parentheses.

> Sam wrote them both.  But the design predates Sam's implementation.

Why is it called `cut`?

> Because you are effectively cutting holes in an expression.

### In preparation for Friday's quiz

What's the difference between `apply` and `reduce`?

> `apply` generally needs procedures that can take lots of arguments.
  `(apply + (list 1 2 3 4 5))`.

> `apply` won't work with binary procedures.  
  `(define silly (lambda (x y) (* 2 (+ x y))))`
  You can't say `(apply silly (list 1 2 3 4 5))` because that's
  the same as `(silly 1 2 3 4 5)`, which gives `silly` the wrong number
  of parameters.

> `reduce` works with binary procedures.  But rarely predictably.

Will `cut` be on Friday's quiz?

> No.  I'll try to avoid it.  Thanks for the suggestion.

Algorithms, revisited
---------------------

It's time to return to something we covered early in the semester.

Six key components:

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

### Subroutines (procedures)

### Conditionals

### Repetition

### Naming

### Sequencing

Recursion
---------

* One of our techniques for repetition
* We know that solve a complex problem, we should decompose the problem 
  into smaller problems.
* Recursion says "To solve a complex problem, solve a smaller version 
  _of the same problem_, and then use that to solve the bigger problem."
* To write a recursive procedure, we need to
    * Determine how to "simplify" an input (for lists, it's usually
      to remove the first value)
    * Determine how to use the solution to the smaller problem to 
      solve the bigger problem
    * Identify when the problem is simple enough we can solve it directly.

The weird part of recursion is that we are solving the "smaller" problem with exactly the same solution as the smaller problem; we have to assume we’ve written something we haven’t written yet.

_The magic recursion fairy makes it work._

Examples
--------

We're going to rephrase recursion in terms of "delegation".  When given
a large problem, an executive will normally delegate most of the problem
to an assistant.  We'll assume that their assistant will do the same.

Algorithm for counting cards:

* If I have no cards, return 0
* Otherwise,
    * Remove one card
    * Count the remaining cards
    * Add 1

Algorithm for counting vowels

* If I have no cards, return 0
* Otherwise, look at the top card
* If the top card is a vowel
    * (Ask your assistant to) Count the vowels in the remaining cards
    * Add 1, returning the result
* If the top card is not a vowel
    * (Ask your assistant to) Count the vowels in the remaining cards
    * Return that number

In Scheme, 

* "have no elements in a list" is `(null? lst)`.
* "the first element in a list" is `(car lst)`.
* "all but the first element in a list" is `(cdr lst)`.
* "is it a vowel?" is `vowel?` (we'll pretend)

```
(define count
  (lambda (lst)
    (if (null? lst)
        0
; count the remaining elements
        (+ 1 (count (cdr lst))))))

(define count-vowels
  (lambda (lst)
    (if (null? lst)
        0
        (if (vowel? (car lst))
            (+ 1 (count-vowels lst))
            (+ 0 (count-vowels lst))))))

(define count-odds
  (lambda (lst)
    (if (null? lst)
        0
        (if (odd? (car lst))
            (+ 1 (count-odds lst))
            (+ 0 (count-odds lst))))))
```
    
```
