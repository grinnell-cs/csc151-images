---
title: "EBoard 10: Cut and Compose and more"
number: 10
section: eboards
held: 2024-02-12
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [20 min]
* Lab [55 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* As we discovered last Wednesday, when you write something like
  `(define kitten (image-load "kitten.jpg"))` in your *definitions
  pane*, the autograder will crash. That's because it's going to try
  to load "kitten.jpg".
    * Option 1: Don't load it in your definitions pane; just do it
      in your interactions pane.
    * Option 2: Upload any loaded files along with your .rkt file.
      In this case, you need to make sure that you just use the
      short name for the file, and not a full path.
* When you miss class, you are responsible for making up lab. You should  
  plan to spend *at least 60 minutes* on the lab.
    * Even when you don't finish the lab (even when you're in class),
      you should review the rest of the lab to make sure you understand
      the questions.
    * Don't forget to email me when you miss class.
* One of my hearing aids broke, so I may be even more unsure of what
  you say than normal.
* I've commented on your SoLA 1 pre-reflections.
* Since you'd been asking about quizzes on Gradescope, I'll do my
  best to demonstrate how you look at a quiz.

### Token activities

Academic/Scholarly

* Tuesday, 2024-02-13, noon--1:00pm, Some PDR.
  _CS Table: Functional programming_.
* Thursday, 2024-02-15, 11:00--noon, JRC 101.
  _Scholars' Convocation: Gaile Pohlhaus on "An Epistemology of 
   the Oppressed: Resisting and Flourishing under Epistemic Oppression"._

Cultural

* Thursday, 2024-02-15, 7:00--9:00pm, Sebring-Lewis.
  _Jazz Concert w/Carol Welsman_.
* Friday, 2024-02-16, 4:00--5:00pm, HSSC N1170 (Global Living Room).
  _Middle of Everywhere._
* Sunday, 2024-02-18, 7:00--9:00pm, Harris Cinema.
  _The Moth Storytelling Slam_.

Peer

* Friday through Sunday, 2024-02-16 through 2024-02-18. Osgood Pool.
  _Midwest Swimming and Diving Conference Championships_.
    * 30 minutes counts.
    * Up to two separate sessions.
* Sunday, 2024-02-18, Simpson College Baseball Diamond.
  _Baseball_.

Wellness

* Monday, 2024-02-12, 4:00--5:00pm, HSSC Atrium.
  _Therapy dogs._
* Tuesday, 2024-02-13, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-02-13, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-02-13, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

* Monday, 2024-02-12, 4:30--5:30pm, JRC 101.
  _Talking about disability policy with Daniel Van Sant, Director
   of disability policy at the Harkin Institute._

### Other good things (no tokens)

* Saturday, 2024-02-17, 1:00--3:00pm, Darby.
  _Men's Basketball vs. Monmouth_.
* Saturday, 2024-02-17, 2:00--5:00pm, Field House.
  _Women's Tennis vs. Ottwawa_.
* Saturday, 2024-02-17, 3:00--5:00pm, Darby.
  _Women's Basketball vs. Monmouth_.

### Upcoming work

* Today, 2024-02-12, 4:00pm, SoLA 1 released
    * Decomposition (Quiz week 1.)
    * Procedural abstraction.
    * Primitive types. (Quiz week 3.)
    * Collaboration. (Friday's topic.)
    * Lambda-free anonymous procedures (aka cut and compose). (Today's topic.)
    * No question on tracing. That will only be a paper quiz.
* Tuesday, 2024-02-13, 11:00pm: Submit reading responses.
    * [Boolean values and predicate procedures](../readings/booleans)
    * [Conditional evaluation in Scheme](../readings/conditionals)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087927/)
* Wednesday, 2024-02-14, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4087975)
    * Preferred: Submit before the end of class today.
* Wednesday, 2024-02-14, 11:00pm, SoLA 1 due
* Friday, 2024-02-16, 8:30am (or as early as 8:00am): Quizzes.
    * New: Conditionals
    * Old: Tracing
    * _You may bring one page of hand-written notes._
* Friday, 2024-02-16, 11:00pm: [SoLA 1 post-reflection](https://www.gradescope.com/courses/690100/assignments/3974516)
    * Try to do it earlier.
* Friday, 2024-02-16, 11:00pm: [MP3 pre-reflection](https://www.gradescope.com/courses/690100/assignments/4087963)

### Notes on the SoLA

* You don't have to memorize procedures. This is a semi-open-book exam.
* Don't worry if you don't get everything on this SoLA. Historical evidence
  suggests that you will find most of the questions easier on the next
  SoLA.

Questions
---------

### Administrative

Why can't I see how I'm doing with tokens?

> Because Sam hasn't tallied them yet. Stay tuned.

### Readings (Pair Programming)

### Readings (Cut and Compose)

Can you further explain how the computer understands/executes the `cut`
procedure?

> First of all, `cut` isn't strictly a procedure. It's a "keyword" (at
  least as I describe it). Instead of evaluating its parameter, which
  is the norm for procedures, it transforms its parameter into a procedure.

> Basically, it creates a parameter for each diamond/hole at the top
  level of the expression and then makes a procedure out of it.

Can `cut` or `section` be used such that one parameter is used twice?

> Neither `cut` nor `section` lets you duplicate a parameter. Hence, they 
  have somewhat limited use. They are still useful in a large range of
  situations.

For check one, I tried to make this work:

    (define sub3 (sub1 (sub1 (cut (sub1 <>)))))

But it gave me an error saying the second sub1 wasn't receiving a
number for an input but `(cut (sub1 <>))` does output a number. Why
doesn't that code work?

> Can you really put `cut` in the middle of an expression?

> `cut` doesn't work when you have a nested expression.

> Maybe we need to rearrange.

> How `define` works: We evaluate the expression and then associate
  it with the identifier.

> We're going to try to evaluate `(sub1 (sub1 (cut (sub1 <>))))`.

> If we were to going to evaluate `(sub1 (* 2 3))`, we'd multiply
  the 2 by the 3, giving us `(sub1 6)`. And we'd then evaluate
  the `(sub1 6)`, giving us 5.

> Racket will do the same with this expression above.

> "I have a sub1. What's the parameter? Oh, it's another sub1. What's
  the parameter? Oh, it's a cut. Let's see ... we build another procedure."

> `(sub1 (sub1 #<procedure>))`

> When we try to apply `sub1` to a procedure, we get the error message.

> In general, Racket is aggressive about evaluating expressions/procedure
  calls, only a few things (like `lambda` and `cut`) delay that evaluation.

> "It will make more sense as you get used to it."

> This is just `(sub1 (sub1 sub1))`

What's the difference between `(cut (rgb-darker <>))` and `rgb-darker`?

> They work the same.

> The `cut` is longer to write.

I discovered that I can't put a diamond in a nested expression, such
as `(cut (+ 2 (* 3 <>)))`. Why not?

> Option 1: The person who implemented `cut` wasn't clever enough to
  do that.

> Option 2: The person who implemented `cut` was too lazy to do that.

> Option 3: The person who implemented `cut` thought it wasn't necessary
  and wanted students to explore other approaches.

> We can break that up. The goal here is "multiply by 3 and then add 2".

> We can write "multiply by three" as `(cut (* 3 <>))`.

> We can write "add two" as `(cut (+ 2 <>))`.

> When we want to do one thing and then another we use composition.

> So we could write `(o (cut (+ 2 <>)) (cut (* 3 <>)))`.

Can we write `(+ 2 (cut (* 3 <>)))`? 

> No. Because `(cut (* 3 <>))` is a procedure. So you're writing
  `(+ 2 #<procedure>)`. It doesn't make sense to DrRacket to add to
  a procedure.

> Computers are dumb. You may know what you're saying. It can't figure it
  out.

I couldn't find any colors for which `(o rgb-darker rgb-lighter)` gave
a different color. Are there any?

> Yes.

> (rgb 255 255 255) ; white

> (rgb 255 0 0) ; red

```
> (rgb->string (rgb-lighter (rgb 255 0 0)))
"255/16/16"
> (rgb->string (rgb-darker (rgb-lighter (rgb 255 0 0))))
"239/0/0"
> (rgb->string (rgb-darker (rgb-lighter (rgb 242 243 244))))
"239/239/239"
```

> For very bright components, lighter and darker are not complete inverses.

Could you go over `rgb-purpler` and `rgb-much-darker`?

> Sure.

> `(define rgb-purpler (o rgb-redder rgb-bluer))`.

Can you show how to load an image in DrRacket? I'm getting errors.

> Sure.

> Your Racket file needs to be in the same directory as your image.

Can we put a longer path in `image-load`?

> Yes. But not for something you're submitting on Gradescope.

### Misc

Can you ever finish the introductory material promptly?

> Yes, but not if I try to answer all the questions.

> Last semester's class said that it's more important to answer all the
  questions.

Lab
---

Oh, cool. I can copy colors and images into the definitions pane!

> You can, but **please don't**. It makes the file unreadable on Gradescope.

I didn't finish the lab and it seems really important for the SoLA.

> It is. You should try it on your own. DM me on Teams when you have
  questions.

Why doesn't greyscale just average the three components?

> Because the color theory I looked up suggests that we perceive green
  as contributing more than blue or red.

> The formula I use is 
  `(+ (* .3 red-component) (* .11 blue-component) (* .59 green-component))`
