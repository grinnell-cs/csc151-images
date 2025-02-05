---
title: "EBoard 06: Transforming colors and images (Section 2)"
number: 6
section: eboards
held: 2025-02-05
link: true
---
# {{ page.title }}

_Today's start-of-class procedure_

* Take one of the business cards from **OUTSIDE** the jar.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* If you are first, log in, but do not start the lab.
* When a second person arrives, introduce yourselves.

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff [5 min]
* Questions [5 min]
* Lab [50 min]
* Turn in lab [5 min] (11:00)
* Quiz [15 min] 

Administrative stuff
--------------------

### Introductory notes

* I'm going to try to keep intro stuff short so that you have more time
  for lab.
* If you can't make it to class, for whatever reason, please send me a
  note (email or Teams Message), preferably in advance of class. You need 
  not explain why.
    * Missing class, no note: Two tokens charged.
    * Missing class, with note: No charge.
* I tend to have a bimodal response rate for email and DMs: Either I
  respond quickly or I forget about the message and never respond. If
  I haven't responded to your email or DM within 24 hours, feel free
  to send me a reminder.
* Please read your comments for quizzes and such on Gradescope, even if
  you get credit for them. We try to provide useful feedback.

### Upcoming activities

Scholarly

* Tuesday, 11 February 2025, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: ???_
* Thursday, 13 February 2025, 11:00 a.m.--Noon, JRC 101.
  _Grinnell Lecture: Darrius Hills on "The Achievement of Identity: Soul Work, Salvation, and Black Manhood in the Religious Imagination of James Baldwin"_.

Artistic

* Friday, 7 February 2025, 3:00--5:00 p.m., Burling Digital Studio.
  _Make a Fidget Workshop_.
    * Fill out form at <https://grinnell.co1.qualtrics.com/jfe/form/SV_1MRN686rnUjKrt4>.
* Tuesday, 11 February 2025, 4:00--5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Chen, Kluber, and Tavares_.

Multicultural

* Friday, 7 February 2025, 4:00-5:00 p.m., HSSC N1170 (Global Living Room)
  _Middle of Everywhere: How to Order a Coffee in Singapore_.

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Friday, 7 February 2025, 5:30--8:00 p.m., Downtown Grinnell.
  _The Sweet Stroll_.
* Tuesday, 11 February 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 11 February 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* Wednesday, 5 February 2025, Noon--12:45 p.m., Science 2021.
  _Learn about the UIowa U2G (aka 4+1) program_.
* Thursday, 6 February 2025, 4:15--5:00 p.m., Herrick.
  _Installation Ceremony for Endowed Professorships_.
* Sunday, 9 February 2025, 7:30--8:30pm, 3819. 
  _Mentor Session_.
* Tuesday, 11 February 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session_.
* Tuesday, 18 February 2025. 6:00--7:00 p.m., HSSC A1231.
  _Make a Portfolio Website_.
    * Please register at <https://grinnell.joinhandshake.com/edu/events/1679688>

### Other good things

_These do not earn tokens, but are worth your consideration._

(none at the moment)

### Upcoming work

* Wednesday, 2025-02-06 (Today!)
    * Turn in Mondays's lab if you didn't do so on Monday.
    * Quiz! (decomposition)
    * Makeup quiz! (procedures)
* Thursday, 2025-02-06
    * [Submit lab writeup from today's class on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732450)
    * Readings for Friday's class.
        * [Data types](../readings/types)
        * [Expressions and types](../readings/exprs-and-types)
        * [Numeric values](../readings/numbers)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732137)
    * [Mini-project 2](../mps/mp02) due
    * [Submit mini-project 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5717086)
* Friday, 2025-02-07
    * Mini-project 3 distributed
    * [Submit post-reflection for mini-project 2 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5719211)
* Sunday, 2025-02-09
    * [Submit pre-reflection for mini-project 3 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732264)
    * Readings for Monday's class.
        * [Characters and strings](../readings/strings)
        * [Symbolic values](../readings/symbols)
    * [Submit reading responses on Gradescope](https://www.gradescope.com/courses/948769/assignments/5732140)

Q&A
---

### Administrative

### Readings

Is the color swatch returned on calling (rgb <params>) an image, or some other kind of expression? If so, what is it?

> It's a color. Or a representation of a color.

Can we go over self-check 4?

> Sure.

```
> (beside kitten
          (pixel-map rgb-purpler kitten))
.
> (beside kitten
          (pixel-map (o rgb-bluer rgb-redder) kitten))
.
> (beside kitten
          (pixel-map (o rgb-darker rgb-darker rgb-darker) kitten))
.
> (beside kitten
          (pixel-map rgb-darker kitten)
          (pixel-map (o rgb-darker rgb-darker rgb-darker) kitten))
.
> (define rgb-much-darker (o rgb-darker rgb-darker rgb-darker))
> (beside kitten
          (pixel-map rgb-much-darker kitten))
.
> (rgb-purpler "green")
. . rgb-red: contract violation
  expected: rgb?
  given: "green"
```

For self-check 4, how can we create a procedure that specifies colors by both the colors name and their RGB values?

> That's a great followup question. I believe there's a `color->rgb`
  procedure that converts any form of color to an RGB color. So we
  could use something like `(o rgb-redder rgb-bluer color->rgb)`.

### MP2

Are there problems with `outlined-polygon` when coordinates are negative?

> Yes. It's on my list, but it will take a while to fix.

## Lab

Please make sure to copy the code from the lab page into DrRacket. 

Use a relatively small picture! 

Consider creating a CSC151 folder for all your work.

When you submit: If you reference the images in your definitions pane, then
you'll need to upload those, too.

This is a lab in which I'd recommend that you read the rest somewhat carefully.
You don't need to figure out numbers, but you should understand the cuts and
such.

## Quiz

Drop it with the class mentor on the way out.

