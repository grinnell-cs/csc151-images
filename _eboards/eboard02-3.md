---
title: "EBoard 02: Getting started with our lab equipment (Section 3)"
number: 2
section: eboards
held: 2025-01-24
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Today's start-of-class procedure_

* Take one of the business cards.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* Today only: Start the lab.
* When a second person arrives, introduce yourself.

Note: If you need to sit in a particular area of the classroom, let me know
and we'll work things out in the future.

_Approximate overview_

* Lots of administrative stuff, no attendance [10 min]
* Questions [5 min]
* Debrief on last class [10 min]
    * The pre-activity activity [5 min]
    * The activity [5 min]
* Lab one: Get yourself setup for MathLAN. (Both partners.) [15 min]
* Lab two: Play with DrRacket [30 min]
* Layers! [10 min]

Administrative stuff
--------------------

### Introductory notes

* Something that didn't end up in the syllabus and should have: I'm
  not only bad at remembering names, I'm likely to swap them. (There's
  a longer statement that's now in the syllabus.) I apologize.
* I should also report that I believe that all teaching is performative.
* I make it a practice to call on students using a set of cards with
  names on it.
    * I use this process to give you practice "thinking on your feet",
      as it were.
    * I also use this process to help everyone realize that they are
      not the only one who is puzzled.
    * And I use the process to push you a bit.
    * Feel free to say "I'm not sure" or "I'd prefer not to answer."
    * If you don't want to be called on in class, please let me know.
* The `csc151` library (which you'll learn about in lab today) is
  updated regularly. Each time you sit down to work, you should try to 
  update the version you have. The lab will tell you how.
    * Also: Let me know when you encounter bugs or unexpected behavior.
* Readings are taking people longer than I'd expected. If they continue
  to take many people more than an hour, I'll find ways to cut back.
* You should only submit the reading checks with double-daggers (‡).
* Consider setting up password reset on <https://passwordreset.grinnell.edu>.

### Upcoming activities

Scholarly

* Tuesday, 2025-01-28, 4:00--5:00 p.m., TBD.
  _CS Candidate Talk: Intelligent Tutoring Systems and Equity in Math
   Education_.
* Thursday, 2025-01-30, 11:00 a.m.--noon, JRC 101.
  _Scholars' Convocation: The Once and Future Grinnell College._

Artistic

Multicultural

* Saturday, 2025-02-01, 1:00--10:00 p.m., Harris Concert Hall.
  _Lunar New Year Celebration_.

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Tuesday, 2025-01-28, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 2025-01-28, 4:30--6:30 p.m., BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 2025-01-28, 7:30--9:00 p.m., Harris Concert Hall (aka Harris Gym).
  _Queer Stompede_

Misc

* Thursday, 2025-01-30, 4:00--5:00 p.m., Noyce 3821.
  _CS Major Declaration Info Session_.
    * Tea beforehand in the CS Commons.

### Other good things

_These do not earn tokens, but are worth your consideration._

* Friday, 2025-01-24, 10:00 p.m.ish. 
  _Nerf at Noyce_.
* Saturday, 2025-02-01, 10:00 a.m.--1:00 p.m., Field House.
  _Grinnell Track and Field Invitational_.

### Upcoming work

* Due Friday, 2025-01-24
    * [Read the Web site and answer questions](../mps/syllabus).
    * [Tell me about yourself](../mps/intro-survey).
* Due Sunday, 2025-01-26
    * [Lab writeup from today's class](https://www.gradescope.com/courses/948769/assignments/5656902/)
    * Read things in preparation for the third day of class.
        * [Simple images in Racket](../images)
        * [Decomposition](../decomposition)
        * [Writing your own procedures](../procedures)
    * [Report on what you've read](https://www.gradescope.com/courses/948769/assignments/5657672)
    * Read [the instructions Mini-project 1: Layers](../mps/mp01)
    * [Pre-reflections on MP1](https://www.gradescope.com/courses/948769/assignments/5657155)

### Friday PSA

* Please be moderate in mind and body altering acivities.
* Decide what's right for you in advance and try to stick to those goals.
* Know your limits.
* Consent is absolutely essential.

## Q&A

_I have answered questions for all the reading responses that came in by
 8:00 p.m. If you have another question and want it answered now, please
 ask._

### Administrative

**How do I record tokens?**

> On the ["Tokens earned" assignment on Gradescope](https://www.gradescope.com/courses/948769/assignments/5651903).

**Does Racket have any real-world or industry applications, or is it mainly just designed as a teaching tool?**

> A variant of Racket was used to both the first version of Yahoo Stores. There are a few niche software development studios that use Racket. But DrRacket is mostly for teaching. [Walmart uses Clojure (a more robust Scheme-like language) for sales and inventory management](https://cognitect.com/blog/2015/6/30/walmart-runs-clojure-at-scale).

### MathLAN

**How do I run Linux on my computer?**

> You shouldn't need to run Linux on your computer.

> You can run DrRacket on your computer. (Instructions are in the
  [syllabus](../syllabus)).

> You can also log into MathLAN remotely, but it's a bit complicated. 
  <https://mathlan.sites.grinnell.edu/fastx/2022/06/08/MathLAN-Remote-Access/>.

### Racket/Scheme

**What is a trivial expression?**

> One that does not involve any operations. For example, a number or a string
  is a trivial expression.

**What are values?** 

> The numbers and other things we use in our computations.

**What is a basic value?**

> A value that does not itself contain other values. That may sound werid,
  but Scheme has things like lists, which contain, well, lists of values.

**In the readings, it mentioned that DrRacket and also Scamper had modifications and features designed for beginners. what are these features specifically?**

> Scamper provides a feature that lets you "trace" how a Scheme expression 
  is evaluated.

> DrRacket tries to provide novice-friendly feedback about errors.

**Could you clarify what a delimiter is in the `string-split` procedure?**

> The delimiter is the character (or sequence of characters) we use to
  identify where to split strings. We might split on commas or spaces
  or ....

```
> (string-split "a,b,c|d,e,f" ",")
'("a" "b" "c|d" "e" "f")
> (string-split "a,b,c|d,e,f" "|")
'("a,b,c" "d,e,f")
```

**What are last set of number inputs when using procedures like `outlined-circle`?**

> For an outlined circle, the last set of numbers give the thickness of the 
  outline.

**What details are important to keep in mind and not ignore when working with scheme? like order and rules?**

> Use parentheses to indicate "this is an expression to be evaluated".

> Put the operation immediately after the open parentheses.

> Keep track of what kinds parameters (inputs) each procedure has. Do they
  expect numbers, strings (words surrounded by quotation marks), images,
  ...? 

## Debriefing

### The pre-instruction activity

_How could we have made the group formation process more efficient?_ 
(Think, Pair, Share)

* Assign locations for each card numbers
* Someone could call out each number in turn and people with that number
  could raise their hand. (More freedom on where to go.)

### The sandwich activity

_What might you have learned from the sandwich activity?_ (TPS)

* You have to be specific in giving instructions. 
* What you think something means doesn't necessarily mean that the person
  following the instructions interprets it the same way.
* Understand what the computer (or Sam) knows and doesn't know.
* UM - Use Magic.
* It's important to find the right level and type of language for your audience.

## Lab one

* Make sure that both partners attempt the first lab.
* The 2024Sp should be 2025Sp. Sorry!
* After you both finish the lab, move on to the Scheme lab.

## Lab two

* Get this from the class Web site.
* 3:35 - Move on to 7 a, b, and c. Then 9.
* 3:40 - Turn it in.
* 3:45 - Move on to the game

## Layers!
