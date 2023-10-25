---
title: "EBoard 24: Pairs and pair structures"
number: 24
section: eboards
held: 2023-10-25
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Questions
* Lab

Administrivia
-------------

* Registration starts somewhat soon.  I hope that you consider going on to 
  CSC-161.
    * Check the priority registration page at <https://grinco.sharepoint.com/sites/Registrars_Office/SitePages/PriorityRegistration.aspx> for our latest registration processes.
    * Check out the the priority rules for each class at <https://grinco.sharepoint.com/:x:/s/Registrars_Office/EQfHJD0_kHlMgqJDvkATg18B8k6Sc5C_SOtUiQ51Ig2LZg?e=HQS7zq>.  CSC's were not yet up-to-date when I last checked.
* There are signs around campus for an event at 10:30 a.m. on Wednesday, October 23rd.  Since today is October 25, I assume the event is Wednesday, October 23rd, 2024.

### Upcoming Token activities

Academic

* Scholars' Convocation, Thursday, 11am, HSSC Auditorium (A2231): April Baker-Bell on _Linguistic Justice: Black Language, Literacy, Identity, and Pedagogy_.
* CS Extras, Thursday, ???
* Mentor Session, Sunday at 1pm (unless our mentors have changed it)
    * Review for the SoLA

Cultural

Peer

* Swimming vs. Coe college, Friday at 6pm.
* Women's Volleyball vs. Cornell, November 1 at 7pm.
* I hope to hear about more concerts, plays, and such.

Wellness

Misc

### Other good things (no tokens)

* Women's soccer, Saturday, 11am

### Upcoming work

* Tonight: Really late post-assessments for MP4
* Thursday night: Reading for Friday (vectors)
* Sunday night: MP5 (try to get it in earlier)
* Friday: Quiz(zes)
    * Friday's new topic: Numeric recursion
    * Friday's bonus new topic: Pairs and pair structures
* Next week: SoLA 2
    * Most of the leftover LAs from SoLA 1.
         * Decomposition
         * Procedural abstraction
         * Primitive types
         * Conditionals
         * Documentation
         * Testing
    * All of the following
         * Code style (new)
         * Lists and the big three (quizzes)
         * Cut and Compose (new)
         * List recursion (quizzes)
         * Local bindings (quizzes)
         * Numeric recursion (new, quiz Friday)
         * Vectors (really new, coming Friday)
         * Diagramming structures (really new, coming Wednesday and Friday)
* A week from Sunday: Various redos (posted to Gradescope)

### Friday's quizzes

_Someone will be here at 7:30 a.m. on Friday so that those who want to take
multiple quizzes can do so._

* New topic: Numeric recursion
* New topic: Diagramming structures (Pairs and pair structures)
* Repeated topic: Local bindings
* Repeated topic: List recursion
* Repeated topic: Lists and the big three
* Not offered: Documentation (it will be on the SoLA)
* Optional topic: Tracing (let me know if you plan to take this)

Sample quiz problems
--------------------

### Mental models of memory

_Describe or diagram the layout of memory for lists and vectors/arrays._

Draw a box-and-pointer diagram for the following structure, named `stuff`.

```
(define stuff
  (list (cons 'a 'b)
        (cons 'c (cons 'd 'e))
        (cons (cons null 'f) 'g)))
```

_You can read some more pair problems on the [LAs page](../las)._

### Numeric recursion

_Design and write recursive functions over the natural numbers._

Write a *recursive* procedure, `(bounded-power-of-2 n)`, that finds the largest integer power of 2 less than of equal to the positive integer `n`.

```
(check-equal? (bounded-power-of-2 1)
              1
              "edge case/base case: 2^0")
(check-equal? (bounded-power-of-2 2)
              2
              "edge case/base case: 2^1")
(check-equal? (bounded-power-of-2 3)
              2
              "normal case: small non-power-of-two")
(check-equal? (bounded-power-of-2 7)
              4
              "normal case: small non-power-of-two")
(check-equal? (bounded-power-of-2 16)
              16
              "normal case: relatively small power of 2")
(check-equal? (bounded-power-of-2 17)
              16
              "normal case: relatively small non-power-of-two")
(check-equal? (bounded-power-of-2 72)
              64
              "normal case: somewhat larger non-powr-of-two")
(check-equal? (bounded-power-of-2 (expt 2 123))
              (expt 2 123)
              "edge case: large power of 2")
(check-equal? (bounded-power-of-2 (+ (expt 2 123) 123))
              (expt 2 123)
              "edge case: large non-power of 2")
```

Questions
---------

### The reading

Could you go over the self-checks?

> The way we have drawn pair structures above makes it easy to think about
`car` and `cdr` operation. Reading from the inside out, you simply
follow the arrow from the left side of the pair for `car` or the arrow
from the right side of the pair for `cdr`.

> a. Using this strategy, find the values corresponding to the following
commands applied to the structure repeated below.

> ![Seven rectangles arranged in two rows.  The first row has four rectangles.
The second row has three rectangles, which are below the first, third, and
fourth rectangles in the first row.  Each rectangle is broken up into
two squares.  In the first row, the right boxes in the first three rectangles
have arrows to the subsequent rectangle.  The right box in the last rectangle
on the first row has  a slash through it.  The left box of the first
rectangle in the first row has an arrow downward to the first rectangle
in the second row.  The left box of the second rectangle in the first row
has an arrow pointing downward to the symbol `'b`.  The left box of the
third rectangle in the first row has an arrow pointing to the second rectangle
in the second row.  The left box of the fourth rectangle in the first
row has an arrow pointing downward to the symbol `'e`.  The first rectangle
in the second row i a rectangle that represents the list `'(a)`.  The left
box of that rectangle has an arrow pointing downward to the symbol `'a`.
The right box of that rectangle has a slash through it.  The left box
of the second rectangle in the second row has an arrow pointing downward
to the symbol `'c`.  The right box of the second rectangle in the second
row has an arrow pointing to the right to the third rectangle in the
second row.  The left box of the third rectangle in the second row has
an arrow pointing downward to the symbol`'d`.  The right box of the third
rectangle on the second row has a slash through it.](../images/pairs-4.png)

> - `caar`
> - `cadr`
> - `caaddr`

> b. Using an analog of the visual strategy, what sequence of commands
would you need to extract the `'e` and `'d`, respectively?

Does this mean that Scheme/DrRacket treats all lists as a collection of pairs paired together?

> Yes.

Are the dots in pairs elements of the list, or are they ignored by procedures like `list-ref`?

> The dots represent "this isn't a list; it just looks like one".  

> Lists are supposed to end in null, things that have dots don't end in
  null.

I still don't get this pair recursion, it is so different with list recursion.

> In list recursion, we typically recurse only on the cdr.

> In pair recursion, we recurse on both the car and the cdr.

> We've already done a bit of that on MP4.

Is using pairs more efficient in terms of processing time and memory than lists?

> I suppose it depends on how you use them.  But lists are just pairs, so
  in most cases there's no difference.

> The goal in learning this is to better understand what's going on
  "behind the scenes".

### Administrative

### MP5

### Other

Lab
---

