---
title: "EBoard 03: Writing your own procedures (Section 1)"
number: 3
section: eboards
held: 2025-01-27
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Today's start-of-class procedure_

* Take one of the business cards from outside the jar.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* If you are first, log in, but do not start the lab.
* When a second person arrives, introduce yourself.

Note: If you need to sit in a particular area of the classroom, let me know
and we'll work things out in the future.

_Approximate overview_

* Lots of administrative stuff [10 min]
* Attendance [5 min]
* About MP1 [5 min]
* Questions [10 min]
* Lab [45 min]
* Submit [5 min]

Administrative stuff
--------------------

### Introductory notes

* Our mentor is unavailable today, so I'll be trying to handle things
  on my own.
* After talking with the mentors, I've decided to move quizzes to
  Wednesdays. (Having homework due on Thursday night and quizzes on
  Fridays seems inappropriate.)
* Something went wrong with the site updates over the weekend. Sorry
  about that.
* Here's the approximate "rhythm" of the class.
    * Fridays: Class; in most weeks, mini-projects distributed;
      MP/SoLA post-reflections due
    * Sundays: Friday's lab due; Monday's reading responses due;
      MP/SoLA pre-reflections due
    * Mondays: Class; in some weeks, SoLAs distributed at the end of the day;
      mentor session (?)
    * Tuesdays: Monday's lab due, Wednesday's reading responses due,
      mentor session (?)
    * Wednesdays: Class; quizzes
    * Thursdays: MPs/SoLAs due; Wednesday's lab due; Friday's reading
      responses due.
* Sam should discuss Vygotsky's _Zone of Proximal Development_.

### Upcoming activities

Scholarly

* Tuesday, 2025-01-28, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table: Positive aspects of computing_
    * <https://www.sciencedaily.com/releases/2024/12/241211143603.htm>
    * <https://www.latimes.com/business/story/2025-01-21/tech-wildfires-ai-la-fires-nvidia-lockheed-martin>
    * If you are not on a meal plan, you can charge it to the department.
* Tuesday, 2025-01-28, 4:00--5:00 p.m., Noyce 2022
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

* Saturday, 2025-02-01, 10:00 a.m.--1:00 p.m., Field House.
  _Grinnell Track and Field Invitational_.

Wellness

* Tuesday, 2025-01-28, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 2025-01-28, 4:30--6:30 p.m., BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Tuesday, 2025-01-28, 7:30--9:00 p.m., Harris Concert Hall (aka Harris Gym).
  _Queer Stompede_
* Wednesday, 2025-01-29, ???, ???.
  _Current Events Support Space_

Misc

* Thursday, 2025-01-30, 4:00--5:00 p.m., Noyce 3821.
  _CS Major Declaration Info Session_.
    * Snacks beforehand in the CS Commons.

### Other good things

_These do not earn tokens, but are worth your consideration._


### Upcoming work

* Due Tuesday, 2025-01-28
    * [Submit lab writeup from today's class](https://www.gradescope.com/courses/948769/assignments/5673980)
        * Ideally, you'll submit it today.
    * More readings!
        * [Design and color](../readings/design-and-color)
        * [RGB colors](../readings/rgb-colors)
    * [Submit reading response on Gradescope](https://www.gradescope.com/courses/948769/assignments/5674001)
* Wednesday, 2025-01-29
    * Quiz! (Topic: Writing your own procedures.)
* Due Thursday, 2025-01-30
    * [Mini-Project 1](../mps/mp01)
        * [Submit MP1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5674195)
    * Lab writeup
* Due Friday, 2025-01-30
    * No class.
    * [Post-reflection on MP1](https://www.gradescope.com/courses/948769/assignments/5674307)

### Attendance

## About MP1

* Part one: Make pieces "by hand" (well, by code)
* Part two: Write five potentially useful procedures
* Part three: Write a procedure to make pieces
* Part four: Call your procedure four times to build four (specific) pieces
* Make sure to read the rubric!

## Q&A

### Administrative

**Why do some of my assignments say "Submitted" and some say "Ungraded"?**

> "Submitted" means that you've submitted it but I haven't started grading
  the assignment.

> "Ungraded" means that you've submitted it, and I've started grading
  the assignment, but I haven't gotten to yours yet.

> Note that "I" can also mean "the graders".

**Though I have written my own code, I have used a library created by Grinnell CS.  Is it necessary to cite in this case, and if so, how do I properly cite the section of the csc151 library that I used?**

> If you are importing a library (in our case, with `(require csc151)`), you need not provide additional citations.

### DrRacket

**How do we go back and edit code?**

> I assume you're asking about the interactions pane. On Linux and Windows 
  boxes, it's usually Ctrl-UpArrow and Ctrl-DownArrow. On the Mac, it's 
  Esc-P (previous) and Esc-N (next).

**Why won't DrRacket load the csc151 library on my computer?**

> I'm not sure. Chat with me individually.

**Can I just run a few lines of the code in the definitions pane?**

> Not usually. The assumption is that we'll run all of the lines.

### Racket/Scheme

**Can DrRacket's image model use hexadecimal color?**

> If you mean the hex for RGB, then yes. You need to use something like
  `(hex->rgb "AA00B7")`.

**Why does the name of the color have to be in quotation marks, and how does DrRacket know that its a color not a string?**

> Actually, it's a string that names a color. If it weren't in quotation marks, DrRacket would think that it's something we've named with `define`. 

### Decomposition

**I don't really understand the top-down design, particularly what the purpose of using ??? just to come back and replace it is.**

> We'll think about this in terms of the PB&J sandwich.

> Big picture: Get bread, add peanut butter, add jelly, eat.

> But we may need to explain more.

> To get bread, you need to open the bag, pull out the top two pieces of
  bread, put them on the plate side by side face up.

### Procedures

**Can we go over the specific parts of a procedures**

> Certainly.

> There are three main important things for most procedures (subroutines,
  functions):

> * The name of the procedure (how we'll refer to it)

> * The names of the inputs to the procedure (also the types, but Scheme
    doesn't require those).

> * The actions the procedure is supposed to do. (The "body")

> In Scheme/Racket, we put all of this together with

```
(define PROCEDURE
  (lambda (INPUTS)
    BODY))
```

> For example,

```
(define boxed-circle
  (lambda (box-size box-color circle-color)
    (overlay (solid-circle box-size circle-color)
             (solid-square box-size box-color))))
```

**Can you define local named things within a procedure?**

> Yes, there's a way to do so. We will not teach you it yet.

**I know the text mentioned we will cover lambda without define eventually but I would genuinely love to know why the idea of it being "anonymous" is so powerful.**

> We should talk about it next week. (Perhaps even this week.) It's more than just the lambda.

**For the check 2 in the last reading, when I wrote the code `(solid-rectangle 40 20 "color")`, it did not work. Why are we not supposed to use "" with color?**

> The quotation marks mean "Take it verbatim" rather than "treat this as an input to the method". There's no color named "color", so it gives an error.

### MP1

**How do we keep things grouped together for a layer?**

> Usually with a `define` of the compound thing.

**Can you explain more about the parts of the rubric?**

> I'd prefer to focus on individual parts. Ask on Teams.

## Lab

**Make sure that you're doing the lab called "procedures". You may have to refresh your schedule.**

* If you're having trouble making the door, it's in the reading on procedures.
    * Make sure to cite that reading if you figure out the door.
* Make sure to save as `procedures.rkt`.
