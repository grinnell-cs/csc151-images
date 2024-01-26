---
title: "EBoard 03: Images and decomposition"
number: 3
section: eboards
held: 2024-01-26
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Start of class instructions_

* Grab the quiz.
* Optionally: Grab a mask
* Grab a plastic-coated business card. It should have a computer name
  and location.
* Identify where the corresponding computer is.
* Return the card to the jar.
* If you arrive first, log in to the computer but _do not start the lab_.
* When both partners arrive, introduce yourselves.
* Do the quiz.
* If you finish before 8:45, look at [the homework assignment](../mps/mp01).

For the future: I'm happy to reserve a (somewhat random) seat at
the front of the classroom for those who need a front seat as an
adjustment or accommodation.  Just let me know.

_Quiz_

* See instructions above.

_Approximate overview_

* Quiz [15 min]
* Administrative stuff; no attendance [15 min]
* Lab [45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

### Introductory Notes

* Sorry for forgetting a few things on Wednesday's class.

### MP1

* Due next Wednesday.
* We'll look at it quickly.
* We'll also look at the pre-assessment on Gradescope

### Upcoming activities

Scholarly

* Friday, 2024-01-26, 6:00--7:30 p.m., JRC 101. 
  _Celebration of MLK day with Alan Page_.

Cultural

* Saturday, 2024-01-27, 11:55 a.m.--3:55 p.m., Harris Cinema. 
  _Met Opera presents Carmen_.
* Artist talk at new art exhibition. Further details forthcoming.

Peer

Wellness

Misc

### Other good things

* Saturday, 2024-01-27, 10:00 a.m.--1:00 p.m., Field House.
  _Grinnell Track and Field Invitational_.

### Upcoming work

* [Mini-Project 1 Pre-Reflection](https://www.gradescope.com/courses/690100/questions/32503307/) due tonight.
* By Sunday at 11pm: Read things in preparation for the fourth day of 
  class and report on those things
    * Do the [Reading Response](https://www.gradescope.com/courses/690100/assignments/3994740/)
* [Mini-Project 1](../mps/mp01) due Wednesday night.

### Friday PSA

* You are awesome.
* People care about you.
* So please take care of yourself this weekend. (And always.)
* Not everyone at Grinnell consumes brain-alterning substances.
* If you choose to do so, please be moderate.
* Know what is right for you, and choose to follow that.
* Take care of those around you.
* Consent is essential.

Questions
---------

### General

_It's better to ask general questions via Teams Messages, email, or
the Q&A channel than on the reading responses. You'll get quicker
answers._

When we redo a mini-project, do we have to redo the whole thing?

> Agh! No! Just the part that didn't get credit. And you'll make it
  clear to the grader what you changed.

That [passwordreset](https://passwordreset.grinnell.edu) detour was, um,
interesting, but not necessarily relevant. Do you often go off on tangents?

> Squirrel!

Where do I submit tokens?

> Stay tuned. The token assignments should be available on Gradescope
  by Monday.

From the Q&A channel, it sounds like some of the section 2 students have
finished MP1 already. Should I be worried?

> Not at all. It's not due until next Wednesday. I just want to make
  sure you read it and think about it today.

### On the readings

How does the order of the numbers correspond to the dimensions of
the shapes (length/width etc.) and can this be changed (such that
the first number corresponds to height instead of length or vice
versa)

> For shapes that have different width and height, the first number is
  usually the width and the second is the height.

> The documentation (see the Reference link) will usually give you
  the details. (I'm still working on the documentation.)

> You can write a new procedure that takes the parameters in a different
  order (at least you will be able to after you do Monday's reading).

Does top-down coding necessarily have to continue from the largest
procedure to the most simple, or if you understand what the code
should look like, could you start working out the 'middle bit'
first?  

> Top-down usually starts only at the top. In practice, most people
  work in multiple directions at once.

I would like more examples of top-down and bottom-up.

> We'll do some in lab (at least I think we will).

Lab 
---

Is the body of the party person a line or a rectangle?

> We don't know how to make lines, so it must be a solid rectangle.

How do we add a description to an image?

> You can add the description as the last parameter, putting it in
  quotation marks.

> `(beside person-1 person-2 "Two people, side by side")`

> `(circle 40 "red" "a red circle")`

> You can use the `redescribe` procedure, which returns a *copy* of the
  image with a new description.

>     > (define i (above (solid-circle 25 "blue")
                (solid-square 10 (rgb 0 0 0 0))
                (solid-rectangle 20 100 "blue")))
    > (describe-image i)
    "a center-aligned stack of images (a solid blue circle with diameter 25 above a solid black square with side length 10 above a solid blue 20-by-100 rectangle)"
    > (define j (redescribe i "a large blue letter i"))
    > (describe-image j)
    "a large blue letter i"
    > (describe-image i)
    "a center-aligned stack of images (a solid blue circle with diameter 25 above a solid black square with side length 10 above a solid blue 20-by-100 rectangle)"

Why did it describe the transparent square as "black"?

> Incompetent programmers. (Sam)

Can I test things out on my laptop to help my partner?

> No.

> There's a class policy on this. It goes like this: "If I see you running
  DrRacket on your laptop, I may defenestrate it."

Do both of us submit the lab writeup, or only one of us?

> Only one of you should submit. Then you should add your partner. If that
  doesn't work, let us know.

What should I name the file?

> `decomposition.rkt`.
