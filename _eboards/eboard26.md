---
title: "EBoard 26: Vectors, continued"
number: 26
section: eboards
held: 2023-10-30
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Diagramming structures quiz
* Questions
* Vector recursion
* Lab

Administrivia
-------------

* Happy not-quite Halloween!  (Or Hollow Happyween!)
    * Warning to those who have not eaten Hershey's Milk Chocolate:
      Those who have not eaten it before may find it disgusting.
* Quizzes returned.
* Grades distributed last night.
    * Tokens not yet updated.
    * Late MP4s not yet graded.
    * Redos not yet graded.

### Upcoming Token activities

Academic

* CS Table, Tuesday at noon, Options for living past death.  Readings
  outside Curtsinger's office and Eikmeier's offce.
* Digital Studies Welcome Session, Tuesday at 4pm, Kington Plaza
* Mentor Session, Tuesday at 7pm 
    * Review for the SoLA
* Mediating Polarizing Debates, Wednesday at 4pm in the HSSC Kernel
  (aka "Multipurpose Room", A1231).
* Scholars Convocation, Thursday at 11am in JRC 101. Jarvis Givens
  on "Black Reconstructions: Archival Assembly and the History of
  African American Education"
* CS Extras, Thursday at 4pm.  

Cultural

* Halloween concert, Tuesday at 8pm, Herrick
* Shift, the Documentary about RAGBAI, 4:15 pm, Thurday, in the 
  HSSC Auditorium.
* An evening of Ukranian Poetry and Music, Thursday, November 2, at
  7:30 pm.

Peer

* Awesome physics talk Wednesday at noon on making pretty pictures
  of galaxies.  
* Women's Volleyball vs. Cornell, Wednesday, November 1, at 7pm.
* Swimming vs. Iowa Central CC, Friday, November 3, at 6pm.
* Football vs. UofC, Saturday, November 4, at noon

Wellness

* Vigil for lives lost in Israel and Gaza/Palestine, today, 4:15 pm, JRC 101

Misc

### Other good things (no tokens)

### Upcoming work

* Tonight: Pre-Assessment for SoLA 2.
* Tuesday night: Reading on dictionaries and hash tables
* Wednesday: SoLA 2
    * Most of the leftover LAs from SoLA 1.  (Tracing and Collaboration
      will not be on the LA.)
         * Decomposition
         * Procedural abstraction
         * Primitive types
         * Conditionals
         * Documentation
         * Testing
    * All of the following topics we've covered since SoLA 1.
         * **Code style** (new)
         * Lists and list procedures (quizzes)
         * **Cut and Compose** (new)
         * List recursion (quizzes)
         * Local bindings (quizzes)
         * Numeric recursion (quizzes)
         * **Vectors and vector recursion** (really new)
         * Diagramming structures (quizzes)
* Friday: Quiz
    * Hash tables
    * Diagramming structures
* Sunday: Various redos (posted to Gradescope)

Diagramming structures quiz
---------------------------

_Enough people had trouble that we're going to go over it._

**Draw a box-and-pointer diagram for the following structure, named `example`.**

```
(define example
  (list (list "a" "b" null)
        (cons "a" "b")
        (cons "a" (cons "b" null))
        (cons null (cons "a" "b"))))
```

I'll be doing most of my work on the board.
 
Questions
---------

_I have a bunch of questions to go through.  Feel free to add your own
as we go, or wait until I've gone through them._

### Registration

Should I take CSC 161?

> Yes.

### Vectors

How should I answer "Create and define a vector, `tn3`, that contains
the values 3.14159 and 2.71828 by using the `make-vector` and
`vector-set!` procedures."

I tried `(define tn3 (vector-set! (vector-set! (make-vector 2 0) 0 3.14159) 1 2.71828))`.

> Remember!  `vector-set!` doesn't return anything.  We have to do this
  as a sequence of operations.

        (define tn3 (make-vector 2 0))
        (vector-set! tn3 0 3.14159)
        (vector-set! tn3 1 2.71828)

Why would we ever want to use a list rather than a vector if vectors 
are always faster?

> Vectors are easier to recurse through.

> Processing every element of a list and every element of a vector will
  likely take about the same amount of time.

> There are a lot of cases in which we want to make our collection
  shorter or longer.

I do not recall creating a 'random-elt' procedure or learning about
the 'random' or 'increment' procedures. Can you elaborate on how
these work and why they might be useful?

> Um ... we rearranged topics and I forgot.  We'll do randomness in
  a bit.

### Administrative

Can you tell me about the final?

> The "final" is an opportunity for you to make up any LA's you have
  missed.

> Like the SoLAs, it will be a take-home set of LAs.

> I'll distribute them on Tuesday of Finals Week.  They will be due
  at 5pm on Friday of Finals Week.

### MP5

I spent a whole day on 2e.  How could I have been more efficient?

> Stop after you are stuck for ten minutes and let your subconscious
  work on it.

> Ask for help.

> Set up an appointment with Sam.

> Decide that you'll get it on the redo.

### Other

What are some good MP strategies you've read?

* It would help to work with classmates earlier and to visit tutors
  more in the times that they are available. This would help me make
  improvements that I may not see in my code and help me make sure
  that I am on the right track.
* Starting early was helpful.
* First of all, especially as the amount of functions we know grows,
  being aware of them and what they require before starting the project
  would be handy .

Vector recursion
----------------

### Form one: Extracting information

### Form two: Modifying information

Lab
---

