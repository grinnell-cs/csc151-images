---
title: "EBoard 31: Data abstraction, revisited"
number: 31
section: eboards
held: 2024-04-15
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [10 min]
* Conceptual changes [10 min]
* A note from the SoLA [5 min]
* Questions [5 min]
* Lab [45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Happy Monday!
* Apologies for any bad jokes today.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-16, noon, some PDR.
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-16, 7pm, Science 3819.
  _Mentor Session_.
* Wednesday, 2024-04-17, 4:15--5:30pm, Burling 1st.
  _Book Talk by Sharon Quinsaat_.
* Wednesday, 2024-04-17, 5:00--6:00pm, HSSC A1231 (Kernel).
  _GrinTECH Project Expo_.  What does TECH stand for?
* **Thursday, 2024-04-18, 11am, JRC 101**.
  **_Ruha Benjamin on "Viral Justice: How We Grow the World We Want"_**
* Thursday, 2024-04-18, 4pm, JRC 2nd Floor Lobby.
  _CS Poster Session, Part 2._
* Thursday, 2024-04-18, 4:15--6:00pm, JRC 101.
  _McKibben Lecture: Athenian Heroes: Re-reading the West Pediment of the Parthenon_.
* Thursday, 2024-04-18, 7pm, Science 3819
  _Mentor Session_.

Cultural

* Tuesday, 2024-04-16, 7:00--9:00pm, JRC 101.
  _The Man Without a World_.
* Friday, 2024-04-19, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_. 
* Saturday, 2024-04-20, 2:00--5:00pm, Quad Dining Room.
  _Japanese Spring Festival_.

Peer

* Saturday, 2024-04-20, Noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit._
* Saturday, 2024-04-20, 1:00--4:00pm, Park Street to the Bear.
  _Carnivale_. (Vegetarian festival, I believe.)
  But why does it take three hours to go one block?
* Saturday, 2024-04-20, 2:30--5:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited._
* Saturday, 2024-04-20, 7:00--9:00pm, Herrick.
  _Michael Londra and the Grinnell Symphony Orchestra_.
* Sunday, 2024-04-21, 10:00am--1:00pm, Tennis Courts.
  _Men's Tennis vs. Coe._
* Sunday, 2024-04-21, noon--3:00pm, Pioneer Park.
  _Baseball vs. Beloit, revisited. The Sequel!_
* Sunday, 2024-04-21, 2:00--4:00pm, Sebring Lewis Hall.
  _Grinnell Singers with a King Singer (Simon Carrington)._

Wellness

* Monday, 2024-04-15, 4:00--5:00pm, HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 2024-04-16, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-16, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-16, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

* Tuesday, 2024-04-16, 4:00--5:30pm, HSSC N1112.
  _Printmaking Workshop with Digital Studies_. "Drinks and supplies included."
* Saturday, 2024-04-20, 10:00am--1:00pm, Track and Field Complex.
  _Dick Young Classic_.
* Saturday, 2024-04-20, 8:00am--5:00pm, JRC 209.
  _Mental Health First Aid Training_. Let me know how many tokens you
  consider appropriate for a full-day event.
* Saturday, 2024-04-20, 11:00am--6:00pm, Mac Field.
  _DAG Field Day_. Why is DAG all caps?

### Other good things (no tokens)

* Wednesday, 2024-04-17, 3:00--5:00pm, Softball Complex.
  _Softball vs. Knox_.
* Saturday, 2024-04-20, 1:00--3:00pm, .
  _Softball vs. Ripon._
* Saturday, 2024-04-20, 3:00--5:00pm, .
  _Softball vs. Ripon, revisited._

NO! You do not get tokens for Wonderland Harris.

### Upcoming work

* Tuesday, 2024-04-16, 11:00pm, [Reading on higher-order recursive design](../readings/higher-order-recursive-design)
    * [_Submit reading on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4361926)
* Wednesday, 2024-04-17, 8:30am, [Lab writeup](../labs/data-abstraction)
    * [_Submit todays's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4353282)
    * Preferred: Finish it during class today.
* Wednesday, 2024-04-17, 11:00pm, [MP7](../mps/mp07)
    * [_Submit MP7 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4348423)
    * Autograder should be ready tonight.
* Friday, 2024-04-19, 8:00am, Quizzes
    * Data abstraction (new).
    * Diagramming structures.
    * Tracing.
* Friday, 2024-04-19, 11:00pm, Post-reflection on [MP7](../mps/mp07)
    * [_Submit MP7 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330330)
* Friday, 2024-04-19, 11:00pm, Pre-reflection for [MP8](../mps/mp08)
    * [_Submit MP8 pre-reflection on Gradescope_](???)
* Sunday, 2024-04-21, 11:00pm, Redo for [MP6](../mps/mp06)
    * [_Submit MP6 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4348422)

Conceptual changes (making the implicit explicit)
-------------------------------------------------

Did you notice that we've encountered some significant conceptual
changes in the way we use Scheme?

* Topical: We're thinking more about structures.
* Abstraction: We're also trying to abstract away from the representation.
  (Procedures also provide abstraction from the underlying implementation.)
    * You don't have to worry about how `map` works; you can just use it.
    * Note: Soon, you'll learn to write `map`.

We've moved from a world in which `(fun args)` always gives the same
result to one in which `(fun args)` can give different results.

`(define x 5) (sqr 5) .... (sqr 5)`

Now `(define vec (vector 'a 'b 'c)) (vector-ref vec 0) ... (vec-ref vec 0)`

The second time through, we may not get `'a`. "It depends on what we did
in between."

Programming is now "stateful".  It complicates analysis. It complexifies
sequencing. (Order now matters significantly more than it did before.)

We therefore have to learn about ways to sequence operations other than
just "inside out".

What we know (or may know).

When you define a procedure, you can put more than one expression in the
body.

```
(define proc
  (lambda (...)
    (step-one!)
    (step-two!)))
```

It will then evaluate them in turn, returning the value of the last one.

When you use `cond`, you can put more than one expression after the guard.

```
(cond
  [(guard)
   (step-one)
   (step-two)
   (step-three)]
  ...)
```

If the guard holds, it will then evaluate them in turn, returning the value 
of the last one.

When you use `when`, you can put more than one expression after the guard.

We now have multiple ways of sequencing operations:

* Inside-out for most expressions.
* Sequencing "this then this then this" in the bodies of `cond`, and procedures
  and `let` and `when`.
* Left-to-right for `or` and `and` (and maybe others)
* composition

Since we may now be calling procedures to change state (rather than compute
a value). These procedures often return nothing. E.g., `vector-set!`
(it changes state - the vale in the vector) but returns nothing.

OUR SUBSTITUTIVE MODEL HAS NOW BROKEN!

Reviewing randomness
--------------------

What's wrong with `play-seven-eleven`?

```
(define play-seven-eleven
  (lambda ()
    (cond
      [(= 7 (pair-a-dice))
       1]
      [(= 11 (pair-a-dice))
       1]
      [else
       0])))
```

Because we call `pair-a-dice` twice, we have slightly different odds.
This is "roll the dice, compare to seven, roll again, compare to eleven".
(Take statistics to learn why the odds are lower.)

We can fix it with a `let` binding.

```
(define play-seven-eleven
  (lambda ()
    (let ([paradise (pair-a-dice)])
      (cond
        [(= 7 paradise)
         1]
        [(= 11 paradise)
         1]
        [else
         0]))))
```

Questions
---------

### Administrative

Are we permitted to use a page of notes on quizzes?

> Of course.

Will we get SoLA 3 back soon?

> Yes. Probably tonight.

### MP7

Is MP7 fun and awesome?

> Of course. Sam loves us.

### Misc

Lab!
----

What should I know about sorting names?

> The rules are at <https://www.webpages.uidaho.edu/cte492/Modules/M7/12_Rules_of_Filing.pdf>

> Titles are the hard part, and may need a lot of effort.

> "Father Jane" -> "Father Jane"

> "Father Jane Smith" -> "Smith Jane Father" (or "Smith, Jane Father")

> "Mr. Sam" -> "Sam Mr"

> "Mr. Sam Rebelsky" -> "Rebelsky Sam Mr" (or "Rebelsky, Sam Mr")

Do I really have to get rid of spaces and apostrophes and such?

> It would be nice, but it's not strictly necessary.

Should I treat "Brother" like "Sister"? Should I treat "Mother" like "Father"?

> I'm not sure. The guidelines are a bit abstract, aren't they? But yes,
  I'd count them as the same. (They are, arguably, "Religous Titles")

Should I treat "Deacon Smith" as "Deacon Smith" or "Smith, Deacon"?

> It depends on whether "Deacon" is a first name or a title. I think.

Is it okay if the sort names aren't perfect?

> Yes.
