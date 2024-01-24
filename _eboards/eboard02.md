---
title: "EBoard 02: Our lab equipment"
number: 2
section: eboards
held: 2024-01-22
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Start of class instructions_

* Grab the lab instructions.
* Optionally: Grab a mask
* Grab a plastic-coated business card. It should have a computer name
  and location.
* Identify where the corresponding computer is.
* Return the card to the jar.
* If you arrive first, start the lab. (This is not the normal protocol.)
* When both partners arrive, introduce yourselves.

For the future: I'm happy to reserve a (somewhat random) seat at
the front of the classroom for those who need a front seat as an
adjustment or accommodation.  Just let me know.

_Approximate overview_

* Administrative stuff; no attendance [10--15 min]
* Debrief on Monday's activity [10 min]
* Set up for MathLAN, partner one [10 min]
* Set up for MathLAN, partner two [5 min]
* Lab [40--45 min]

Administrative stuff
--------------------

### Introductory Notes

* Hi, I'm still Sam (or SamR).
* Our class mentor is still Maddy Thompson.
* I hope you were able to make it to class safely today!
* Fingers crossed that the instructor workstation works better today.
* You will find that I call on students randomly using a set of cards
  with your names on them.
    * I use this process to give you practice "thinking on your feet",
      as it were.
    * I also use this process to help everyone realize that they are
      not the only one who is puzzled.
    * And I use the process to push you a bit.
    * Feel free to say "I'm not sure" or "I'd prefer not to answer."
    * If you don't want to be called on in class, please let me know.
* The `csc151` library (which you'll learn about in lab today) is
  updated daily. Each time you sit down to work, you should try to 
  update the version you have.
    * Also: Let me know when you encounter bugs or unexpected behavior.
* Reminder to self: Asking questions
* Reminder to self: Vygotsky's zone of proximal development.
* Consider setting up restoration on <https://passwordreset.grinnell.edu>.

### Upcoming activities

Scholarly

* Friday, 2024-01-26, 6:00--7:30 p.m., JRC 101. 
  _Celebration of MLK day with Alan Page_.

Cultural

* Saturday, 2024-01-27, 11:55 a.m.--3:55 p.m., Harris Cinema. 
  _Met Opera presents Carmen_.

Peer

Wellness

Misc

### Other good things

* Saturday, 2024-01-27, 10:00 a.m.--1:00 p.m., Field House.
  _Grinnell Track and Field Invitational_.

### Upcoming work

* Read things in preparation for the third day of class and report on those 
  things
    * [Images](../readings/images)
    * [Decomposition](../readings/decomposition)
    * Do the [Reading Response] (on gradescope)
    * _Note that readings responses are generally due in the evening. If
      you turn them in by 8pm or so, it's more likely that I'll read
      them before class._

Questions on the readings
-------------------------

Racket uses parentheses to determine order of evaluation / precedence.
When there are two subexpressions, which gets evaluated first? And
does it matter?

> You are asking about something like `(+ (sqr 5) (sqr 4))`. Do we
  evaluate `(sqr 5)` or `(sqr 4)` first?

> The Scheme Specification says "It is up to the implementer."

> We will find that it's generally left-to-right.

> But in almost all cases, it won't matter; it shouldn't matter.

Can you nest objects?

> Wow, you're already looking ahead.

```
> (define small-circle (solid-circle 30 "red"))
> small-circle
.
> (define big-circle (solid-circle 60 "black"))
> big-cicle
. . big-cicle: undefined;
 cannot reference an identifier before its definition
> big-circle
.
> (overlay small-circle big-circle)
.
> (overlay big-circle small-circle)
.
```

How did you update the CSC151 library?

> Open DrRacket.

> File -> Install Package ...

> Enter https://github.com/grinnell-cs/csc151.git#main

> Wait until it says "Close"

> Click "Close".

When we outline a circle, how do we color the inner circle?

> Use `overlay`.

Debrief on sandwich making activity
-----------------------------------

We will use _Think-Pair-Share_ (TPS) for this.

### Grouping students

Getting students into card groups was somewhat chaotic.  I intentionally
don't provide an algorithm, and it showed.  What would be a better
algorithm for getting card groups together?

* Sam could have prepared the classroom (e.g., by printing giant cards
  and taping them to places).
* Tell people to line themselves up in number order.
* Hold cards on your head.

### Other lessons

Here are the lessons you supplied.

* Be very specific, particularly when there are multiple things that
  could be described in the same way (e.g., "the bread").
* It's important to know what the data are like.
* It's important to know what the computer can and can't do. Don't assume.
* Break big tasks down into smaller tasks. (_Decomposition_.)
* Some processes can be repeated (e.g., spreading). (_Subalgorithms_.)

Here are a few lessons that I supplied.

* Things will go wrong when you write algorithms. Laugh!
* Four heads are better than one.
* It's nice to watch an algorithm while it's performing and correct as
  you go.

_Your goal: A few more. They can be your style or Sam's style._

* Reflect on what you've done. If it didn't work, why not?
* You will rarely get things right the first time. It's okay. Reflect
  and fix it.
* UM - Use Math
* Writing out the steps was helpful

Lab 1: Setting up Linux
-----------------------

This lab appears in the Schedule.  Each person will do this separately, with
the other person helping.

In past years, some students have had to edit the launcher to use
`firefox` instead of `firefox-esr %u`.  I'm not sure why people end up
with different launchers.

* Things will go wrong.

Lab 2: Learning Scheme
----------------------

* You'll do most of the second lab collaboratively.
* If I see you running DrRacket on your laptop, I may attempt
  to defenestrate aforementioned laptop.
* You will be turning in your answers to exercises 7--9.  At least we
  think you will.

### Questions and answers

How do I insert a comment in Racket?

> Precede it with a semicolon.

What's a comment?

> A note to the human reader that the computer should ignore.

What are `circle` and `rectangle`? I only saw `solid-circle` and
`outlined-circle` (similar for rectangles)?

> Remnants of an old version of the image library.

We're not done. What should we do?

> For this lab, _and this lab only_, you may finish the lab on your own.
  (Or set up a time to meet with your partner.) If you finish the lab on
  your own, please ignore the "include your partners on Gradescope"
  instructions.

Debrief (if time)
-----------------

_There usually isn't time, but I'm an optimist._


