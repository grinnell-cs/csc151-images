---
title: "EBoard 10: Boolean values and predicate procedures, continued" 
number: 10
section: eboards
held: 2023-09-15
link: true
---
# {{ page.title }}

* **Warning** This class is being recorded.

_Approximate overview_

* Quiz
* Administrivia
* A few notes on style
* A few notes on MP2
* A few notes on MP3
* Questions
* Lab

Quiz protocol
-------------

* When you arrive, grab one or both quizzes.
    * Primitive types: Green folder
    * Tracing: Red folder
* Work on the quizzes until 8:45 or you are done, whichever comes first.
* Meditate, read, rest until 8:45.
* Mentors will collect the quizzes.

Administrivia
-------------

### Introductory notes

* We are continuing Wednesday's lab.  If you're done with Wednesday's
  lab (including "For those with extra time") for some reason, you may 
  leave early.
* Next week's quiz will be on conditionals.  Sample problems forthcoming.
* Because of some issues with the first few solutions to MP2 we looked
  at (as well as some upload/autograder issues), I'm giving you until 
  Saturday to submit/update your mini-projects.

### Upcoming Token activities

Academic

* Sunday, 17 Sept 2023, 1pm, Mentor Session (Here)
* Tuesday, 19 Sept 2023, Noon, Day PDR, "Should Plagiarism Detectors Be
  Able to Keep Your Essays?"
* Thursday, 21 Sept 2023, 4:15 pm, CS Extras: "Study Abroad in CS"
  (Science 3821)

Cultural

Peer

Wellness

Misc

* Friday 15 Sept 2023, Noon, Whale Room, Lunch with Young Alums in Tech

### Other Good Things

### Upcoming work

* Saturday night: MP2 due (in case you want to make changes).
* Sunday night: Reading responses due.
* Sunday night: MP2 post-assessment due.
* Monday morning: Today's lab due (but we'll get it turned in today)
* Thursday: MP3 due

Fun with numbers
----------------

* `(round 4.4)`
* `(round 4.6)`
* `(round 4.5)`
* `(round 5.4)`
* `(round 5.6)`
* `(round 5.5)`

Observation: In the case that we are halfway between two integers, it rounds
to the even integer.  Why?  Because that's what statisticians like to do.

A reminder that it can be interesting (or confusing) (or frustring) (or
all of the above) to experiment with the new procedures you learn.

MP2 and style/formatting
------------------------

The way you organize code affects how readable it is.

Thewayyouorganizecodeaffectshowreadableitis.

```
Thew
    ay                          youorganize
  your     c      o       d       e              a
ffects how
r
 e
  a
   d
    a
     b
      l
       e
                                                                        it
is
.
```

Try to follow the basic patterns we are using.  Some of the more
important principles follow.

Move on to new lines (a) in "standard" places---e.g., before the
`(lambda`---and (b) when lines are getting too long.

Make sure to hit Ctrl-I before submitting (or regularly).  This command
reindents your code according to standard principles.  (However, it
does not insert new lines.)  (Ctrl-I is very useful for finding
mismatched parentheses.)

End parentheses belong at the end of the last line of code, not on
a line by themselves.

No nested defines.  (No putting `define` in the middle of your procedure.)
(This is a Grinnell stylism.)

Try to put comments before defines, not after and not to the side.

MP3
---

* RGB colors don't make complete sense.
* So we're going to look at other representations.  
* Particlarly HSV.

Questions
---------

_Ask questions.  It's part of self gov.  If you have questions, others
likely do, too._

### On MP2

If we didn't meet stylistic guidelines, should we update our code and
resubmit?

> Only if you want an M or above on this mini-project.

Does this mean we get a free extensions?

> Yes.  You get an extension without using tokens.

What do we do if the autograder won't work with our code?

> Ask an evening tutor.

> TeamsChat Sam.  (Usually only works until 9pm).

> TeamsChat or Email Sam and hope he'll answer the next day (after 9pm).

> In this case, most of the problems seemed to be that the code referenced
  `kitten.jpg` but did not include `kitten.jpg`.

### Style

What did you mean about "no nested defines"?

> Some people write

        (define foo
          (lambda (x)
            (define bar (* x x))
            (rgb bar bar bar)))

So how do we get rid of redundant code?

> Use a helper procedure.

        (define foo
          (lambda (x)
            (foo-helper (* x x))))

        (define foo-helper
          (lambda (bar)
            (rgb bar bar bar)))

Is there a rule about indenting?

> Use whatever Ctrl-I does.

Are there formatting guidelines for documentation?

> Follow the models.

> Read the reading for Monday.

> Three semicolons, a space, the "signature" of the procedure (open paren,
  procedure name, the parameters separated by spaces, a close paren),
  an arrow, and a type predicate or something similar.

> Three semicolons, three spaces, the name of the first parameter, a space,
  a colon, a space, a type predicate or something similar.

> (Repeat for remaining parameters)

> Three semicolons, a space, and a sentence or two on what the procedure does.
  
### On Boolean values and conditional expressions

### On MP2

Can I make other changes (beyond formatting and academic honesty)?

> Certainly.

### On MP3

### Miscellaneous

Are you ever going to stop talking Sam?

> Maybe.

### On administrative stuff

Can I send questions to the mentors outside of class time?  How about asking
them questions if I see them working in 3813?

> They have their own work to do.  Stick with the evening tutors.

> Mentor sessions are good.

### On lab

Do you expect us to finish lab today?

> As far as you get is fine.

Lab
---

Continue from last class.

Scheme style

Cond vs if

Some fun with numbers

