---
title: "EBoard 05: Mental models"
number: 5
section: eboards
held: 2024-01-31
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff, including attendance [25 min]
* Reading overview [10 min]
* Lab [40 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* My goal is always to do these in fifteen minutes or less.  I rarely succeed.
* I am usually spending the time right before class making sure that
  everything is ready. Don't expect to be able to ask me questions.
* Welcome to our newest class member!

### Attendance

_Yes, we'll do that once in a while._

### Upcoming activities

Scholarly

* Thursday, 2024-02-01, 11am, HSSC 2231 (Auditorium), 
  _Scholars' Convocation, Being a Pandemic Citizen._
* Thursday, 2024-02-01, 4:00pm, Science 3821:
  _CS Extras: Summer research_.

Cultural

Peer

* Friday, 2024-02-02, 8pm, Harris Concert Hall:
  _Weekend Murder Mystery_. There's food. You get to solve puzzles.
  The winner(s) will get prizes.
* Saturday, 2024-02-03, Natatorium:
  _Swim meet_.

Wellness

Misc

### Other good things

### Upcoming work

* Wednesday, 2024-01-31, 11:00pm: [Mini-Project 1](../mps/mp01) due.
    * [Submit on Gradescope](https://www.gradescope.com/courses/690100/assignments/4014689/)
* Thursday, 2024-02-01, 11pm: Read things in preparation for the sixth day of 
  class and report on those things
    * [Expressions and types](../readings/exprs-and-types)
    * [Numeric values](../readings/numbers)
    - [Characters and strings](../readings/strings)
    - [Symbolic values](..//readings/symbols)
    * [_Submit the reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4030968)
* Friday, 2024-02-02, Class time: Quiz
    * New quiz: Tracing
    * Quiz redo: Decomposition
    * You can arrive as early as 7:45 a.m. if you'd like to take both quizzes.
    * Quizzes must be done by 8:45 a.m.
* Friday, 2024-02-02, 8:30am: Submit today's lab writeup.
    * Preferred: Submit before the end of class today.
    * It's paper. You must hand it to me.
* Friday, 2024-02-02, 11pm: [Mini-project 1 post-refelection](https://www.gradescope.com/courses/690100/assignments/3974516) due.
* Friday, 2024-02-02, 11:00pm: [Mini-project 2 pre-reflection(https://www.gradescope.com/courses/690100/assignments/4030975) due.
* Wednesday, 2024-02-07, 11:00pm: [Mini-Project 2](../mps/mp02) due.
    * Gradescope forthcoming.

Notes on Monday's lab
---------------------

### Stopping with five minutes to go.

In general, I'll tell you to stop when there are five minutes left.

* Different people will have accomplished different amounts.
* I strongly encourage you to try to finish the lab on your own. At
  least one student from last semester said I should force you to
  finish the lab on your own. (We'll revisit why I don't.)
* It's okay if you don't pass all the tests. However, it's nice to
  have an idea why you haven't passed the test.
* You will generally get an "S" (1.0 or .9999) if you submit something.

### The joy of ctrl-up-arrow (or Esc-P)

* There is a command history.
* You can get to prior commands Ctrl-UpArrow 
    * That doesn't work on the Mac, because Ctrl-UpArrow already has
      a meaning.
* You can also get prior commands with Esc-P.
* Use Ctrl-I to reindent.

### Ways to define `snowperson` and `snowperson-revisited`

```
(define snowperson
  (lambda (size)
    (above (outlined-circle (* 2/5 size) "black" 1)
           (outlined-circle (* 3/5 size) "black" 1)
           (outlined-circle (* 5/5 size) "black" 1))))

(define snowperson-revisited
  (lambda (height)
    (above (outlined-circle (* 2/5 1/2 height) "black" 1)
           (outlined-circle (* 3/5 1/2 height) "black" 1)
           (outlined-circle (* 5/5 1/2 height) "black" 1))))
```

vs.

```
(define snowperson-revisited
  (lambda (height)
    (snowperson (* 1/2 height))))
```

TPS: Is this better than the old snowperson? Worse? The same?

* This is more concise, which is nice. It's also easier to write. 
  If we realize that the circle ratio in `snowperson` is wrong,
  there's only one set of code to fix.
* This could be confusing to the reader. 
    * Documentation would help.
* There's no guarantee that `(snowperson size)` always creates a
  snowperson whose height is `(* 2 size)`.
    * The documentation adds that guarantee, too.
* Please don't swear in my class.
 
```
;;; (snowperson size) -> image?
;;;   size : positive-real?
;;; Creates a snowperson whose bottom snowball is `size`
;;; and whose overall height is `(* 2 size)`.

;;; (snowperson-revisted height) -> image?
;;;   height : positive-real?
;;; Create a snowperson of the specified height
(define snowperson-revisited
  (lambda (height)
    (snowperson (* 1/2 height))))
```

vs.

```
(define snowball
  (lambda (diameter)
    (outlined-circle diameter "black" 1)))

(define snowperson
  (lambda (size)
    (above (snowball (* 2/5 size))
           (snowball (* 3/5 size))
           (snowball (* 5/5 size)))))
```

vs.

```
???
```

Questions
---------

### Administrative

Do you mind if we point out the plethora of mistakes on your Web pages?
I've found typos, broken links, bad HTML and more.

> Let me know. I would prefer to correct them. Perhaps you'll even
  earn a token.

> I also appreciate you using the word "plethora".

Can we use Scamper instead?

> No.

Can we use our own computers?

> Yes. You can download DrRacket onto your laptop/desktop and do your
  work there.

> You can also remote login to MathLAN. Talk to me if you want to do so.

Are there limits to how many tokens we can earn in a particular category?

> No.

Does it matter what category a token activity is in?

> No.

### Reading

Reading overview
----------------

TPS: What are the key points of the readings?

* UM: Understand Mechanisms
* Understand how Racket interprets expressions and procedures
    * We trace to follow that understanding.
* Also clarifications of terms like "procedure" and "identifier"
* We rely on parentheses to group things. Validate that they match
  correctly. 
* We generally use the innermost parenthesized expression first and
  then move outward. We also move left to right.
    * `(+ (* 3 4) (sqr (+ 1 2)))`
    * We would normally evaluate the `(* 3 4)` first. 
      We prioritize "left to right" over "innermost first".
* We use arrows to show our trace
  
    ```
        (+ (* 3 4) (sqr (+ 1 2)))
    --> (+ 12 (sqr (+ 1 2)))
    --> (+ 12 (sqr 3))
    --> (+ 12 9)
    --> 21
    ```
* When tracing user-defined functions (with a lambda), plug the arguments
  into the body of the procedure, and then put the new thing into the
  trace.
  
    ```
    (define square
      (lambda (x)
        (* x x)))

        (+ (square 5) (square 7))
    --> (+ (* 5 5) (square 7))
    --> (+ 25 (square 7))
    --> (+ 25 (* 7 7))
    --> (+ 25 49)
    --> 74
    ```

* Make sure you evaluate all of the parameters to a procedure before
  doing that substitution.
      

Lab
---

I'm not sure why `trace` isn't working for some of you. I hate computers.

