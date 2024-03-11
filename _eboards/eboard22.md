---
title: "EBoard 22: Local bindings"
number: 22
section: eboards
held: 2024-03-11
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed).

_Approximate overview_

* Administrative stuff [10 min]
* Questions [15 min]
* Lab [50 min]
* Turn in Lab [5 min]

Administrative stuff
--------------------

* Greetings on the celebration of the revealing of the Quran
* Welcome to our prospective student!
* I hope you are doing okay with the time change.
* For reasons I will discuss, I will not be in class on Wednesday or
  Friday. You will have guest teachers both days.
    * I hope you have a wonderful break!
* I posted the 100th assignment to Gradescope last night. (I don't think
  you can see them all.)
* MP4 returned.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-03-12, noon, Some PDR.
  _CS Table_.
* Tuesday, 2024-03-12, 7:00pm, Science 3819.
  _Mentor Session_ (on the topic of the prior mentor session)
* Thursday, 2024-03-14, 7:00pm, Science 3819
  _Mentor Session_ (on the topic of the prior mentor session)
   (plus local bindings)

Cultural

Peer

Wellness

* Tuesday, 2024-03-12, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-03-12, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-03-12, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.
* Thursday, 2024-03-14, 7-8:30 pm, Harris Concert Hall.
  _Grocery Bingo_

Misc

### Other good things (no tokens)

### Upcoming work

* Tuesday, 2024-03-12, 11:00 pm, Reading
    * [Numeric recursion](../readings/numeric-recursion)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217685/)
* Wednesday, 2024-03-13, 8:30am, [Lab writeup](../labs/local-bindings)
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217684)
    * Try to submit today.
* Wednesday, 2024-03-13, 11:00pm, [MP5](../mps/mp5) due.
    * [_Submit MP5 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4216304)
* Friday, 2024-03-15, 8:30am, Quiz!
    * Topic: Local Bindings (which we'll cover today)
* Friday, 2024-03-15, 8:30am, [Wednesday's lab](../labs/numeric-recursion)
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4218845/)
* Friday, 2024-03-15, 11:00pm, [MP5](../mps/mp05) post-reflection
    * [_Submit post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4200918)
* Sunday, 2024-03-31, 11:00pm, Reading
    * [Randomness and simulation](../readings/randomness)
    * [_Submit randomness reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4218849/)
* Monday, 2024-04-01, 11:00pm, [MP6](../mps/mp06) pre-reflection
    * [_Submit MP6 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217838/)
* Sunday, 2024-04-07, 11:00pm, [MP4](../mps/mp04) Redo
    * [_Submit MP4 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4217681)

_On April 1, we'll discuss whether the MP5 redo should be due on April 7th or 14th._

### Spring Break PSA

* Take care of yourselves.

### Recursion Video!

* Remember: We're doing things again and again (and again and again).
* And it's joyful.
* "Again and Again" by the Birds and the Bees

Questions
---------

### Administrative

When is MP4 redo due?

> Sunday, April 7, 2024.

Can we have more tokens?

> You should be able to submit more on the new tokens page.

What about the old tokens?

> I'll move them over during spring break.

I turned in two tokens under the old system. Where should I start in the
new system?

> On token three.

How do we tell how many tokens we have?

> After spring break? Sorry.

### MP5

Do `gridify-hv` and `gridify-vh` work?

> Yes, they should work once you've written your procedures.

Why do I see a dot when I'm making a list of shapes or images (e.g.,
in `simple-shapes` or `variants`?

> Think about about your base case. Each of these procedures returns
  a list. Are you returning a list in the base case?

### Recursion

Is it possible to develop a recursive procedure that does not
necessarily have to use null in order to make the call "finite",
meaning it would eventually come to a result?

> Certainly. We can stop when two elements are left in a list, or
  when we find a particular element in al ist, or …

> On Wednesday, we'll see recursion based on numbers.

### Local Bindings

Can we define local helper procedures with `let`?

> Definitely!

> If you want local recursive procedures, you need `letrec`.

### Miscellaneous

Can you describe `ormap`?

> `ormap` takes the for `(ormap pred? lst)`, and it scans the list to find
  an element for which `pred?` holds. If it finds such an element, it returns
  true. If it fails to find such an element, it returns false. If it hits
  an element for which `pred?` generates an error, it throws an errow.

```
> (ormap odd? (list 1 2 3))
#t
> (ormap odd? (list 2 4 6))
#f
> (ormap odd? (list 2 4 "three" 6))
. . odd?: contract violation
  expected: integer?
  given: "three"
```

Where does the `or` come into play?

> Think of it as `(or (pred? (list-ref lst 0)) (pred? (list-ref lst 1)) (pred? (list-ref lst 2)) ...)`

Can you explain why you want us to put `let` statements outside the `lambda`?

> I could, but you'll learn why in lab.

Why do we have `ormap`?

> We have `andmap` and `ormap` because `and` and `or` are not really functions
(they have a different evaluation order), so they need a special form.

Lab
---

For exercise 4, what are you looking for?

```
(define make-change
  (lambda (cents)
    (let* ([quarters (quotient cents 25)]
           [centsible (- cents (* quarters 25))]
           [dimes (quotient centsible 10)]
           [centsless (- centsible (* dimes 10))]
           ...)
      (list quarters dimes nickles pennies))))
```

For exercise 5, can we use the built-in tracer?

> You could try, but I'd prefer that you do things by hand. Even though
  I wrote the built-in tracer, I'm not completely confident in it.


