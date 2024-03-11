---
title: "EBoard 21: More list recursion"
number: 21
section: eboards
held: 2024-03-08
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed).

_Approximate overview_

* Quiz [15 min]
* Administrative stuff [10 min]
* Questions [10 min]
* Lab [50 min]
* Turn in Lab [5 min]

Administrative stuff
--------------------

* Happy International Women's Day
* Advance warning: We "spring ahead" on Sunday morning.

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-03-12, noon, Some PDR.
  _CS Table_.
* Tuesday, 2024-03-12, 7:00pm, Science 3819.
  _Mentor Session_ (on the topic of the prior mentor session)
* Thursday, 2024-03-14, 7:00pm, Science 3819
  _Mentor Session_ (on the topic of the prior mentor session)

Cultural

* Friday--Saturday, 2024-03-07 to 2024-03-09, 7:30 p.m.
  _Songs of the Scarlet and Wayback_ (play).
* Friday, 2024-03-08, 4pm, Global Living Room in HSSC.
  _Middle of Everywhere._
* Saturday, 2024-03-09, Harris Cinema, ??:??
  _Met Opera: Verdi's La Forza del Destino_.
* Saturday, 2024-03-09, 2:00 pm, Sebring-Lewis.
  _ZAWA!_ (Flute concert).

Peer

* Saturday, 2024-03-09, Field House.
  _Men's and Women's Tennis vs. Central._
* Sunday, 2024-03-10, 1--3pm, in JRC 225. 
  _Fiber Arts Club._ Community. Arts. Music in the background. What could
  be better.

Wellness

* Friday, 2024-03-08, noon, JRC 101.
  _Wellness Bingo_.
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

* Friday, 2024-03-08, 8:30am, [Lab writeup](../labs/recursion-basics)
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4200915/)
    * Try to submit today.
* Friday, 2024-03-08, 11:00pm, Post-reflection for SoLA 2
    * [_Submit SoLA 2 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4166817)
* Friday, 2024-03-08, 11:00pm, Pre-reflection for MP5
    * [_Submit MP5 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4200919/)
* Sunday, 2024-03-10, 11:00pm, [MP3](../mps/mp3) Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4168533/)
    * Make sure to include the `CHANGES.rkt` file.
* Sunday, 2024-03-10, 11:00pm, [MP1](../mps/mp1) Second redo
    * [_Submit MP1 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4168529/)
    * Make sure to include the `CHANGES.rkt` file.
* Sunday, 2024-03-10, 11:00 pm, More readings
    * [Local bindings](../readings/local-bindings)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4211810/)
* Monday, 2024-03-04, 8:30am [Today's lab](../recursion-practice) due.
    * [_Submit lab writeup on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4211823/)
    * Today you can stop wherever you reach by the end of class.
* Wednesday, 2024-03-13, 11:00pm, [MP5](../mps/mp5) due.
    * _Gradescope not yet available._
* Friday, 2024-03-15, 8:30am, Quiz!
    * Topic: Local Bindings (which we'll cover on Monday)

### Friday PSA

* You are wonderful people. Please do your best to stay that way, if
  not for yourself, do it for others.
* If you alter your brain, do so in moderation. But please don't tell
  me about.
* Don't feel pressure to behave as you believe others behave.
* If you cohabit, consent is essential.

Questions
---------

### Administrative

Aren't readings normally due on Tuesday, Thursday, and Sunday. Today's
seems to have been set for Friday.

> Whoops. Do it for tonight if you haven't already. Hope that your partner
  managed to do it.

How should we answer questions?

> A mix of code and English-like stuff.

When is MP4 redo due?

> Sunday, April 7, 2024.

### Recursion

Can you tell me more about "trust the recursion fairy"?

> If we're doing top down design, we say "I'll need this procedure procedure,
  so I'll call it here, and then write it later."

> We're doing the same thing with recursion. We're trusting that our
  future selves will solve the problem (but only on smaller inputs).
  We can use procedure as a helper (but only on smaller inputs).
 
> smaller means "closer to the base case".

> So our design question is normally "Suppose I can dump of the work on
  future me; what do have I left to afterwards?"

> E.g., If we are appending two lists, we can assume that future us
  knows how to append a shorter list to the other list. All we have
  to do is shorten the list and then repair the result with the
  element we dropped to shorten the list.

        (define my-append
          (lambda (lst1 lst2) 
            (if (null? lst1)
                lst2
                (cons 'a (my-append (cdr lst1) lst2)))))

> Thinking about that with a particular example

            (my-append '(a b c) '(d e f))
        --> (??? (my-append '(b c) '(d e f)))
        --> (cons 'a '(b c d e f))

> I have `'(b c d e f)`, I want `'(a b c d e f)`, so I need to put
  `a` on the front.

> Let's try it

        > (my-append '() '(d e f))
        '(d e f)
        > (my-append '(a) '(d e f))
        '(a d e f)
        > (my-append '(a) '())
        '(a)
        > (my-append '() '())
        '()
        > (my-append null '(d e f g))
        '(d e f g)

> Great! Except it fails miserably if the first list contains something
  other than `'a`.

> Fix!

        (define my-append
          (lambda (lst1 lst2)
            (if (null? lst1)
                lst2
                (cons (car lst1) (my-append (cdr lst1) lst2)))))

### MP5

When are you going to add pictures?

> Never. But I might make a video tomorrow.

I was still having trouble getting `pixel-map to work. Help!

> Sorry. I wrote bad code. I'll fix it during lab.

Lab
---

What is "parameter simplification"?

> Making the parameter smaller for the recursive call. For lists, it's
  most frequently taking the `cdr` of the list.

Why is the the result of multiplying all the elements in the empty
list supposed to be 1 rather than 0?

> Custom.

> Also, it's kind of like what we see when we use `(*)`.

        > (*)
        1
