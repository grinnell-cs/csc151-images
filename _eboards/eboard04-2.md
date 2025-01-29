---
title: "EBoard 04: RGB Colors (Section 2)"
number: 4
section: eboards
held: 2025-01-29
link: true
---
# {{ page.title }}

_Today's start-of-class procedure_

* **Grab a quiz.**
* Take one of the business cards from outside the jar.
* Identify where the named computer is.
* Drop the business card in the jar.
* Navigate to that computer.
* If you are first, log in, but do not start the lab.
* Start the quiz.
* When a second person arrives, introduce yourselves (and then resume/start
  the quiz).

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Quiz [15 min]
* Lots of administrative stuff [10 min]
* Questions [10 min]
* Lab [40 min]
* Submit [5 min]

Quiz!
-----

Administrative stuff
--------------------

### Introductory notes

* Save early and often! (Sam tells semi-appropriate joke.)
* The College asks that I remind you that Friday is our Add/Drop deadline.
  Personally, I think it's too early to force you to decide, but
  it's not under my control. In any case, if you're worried about
  CSC-151, please chat with me.

### Some notes on quizzes

* Quizzes serve (at least) three purposes
    * They tell you how you're doing on a topic
    * They tell me how you're doing on a topic
    * They provide evidence that you have mastered a learning objective
* Quizzes are intended to be low-stress. It's fine if you don't get the
  topic the first time through.
    * Most of the time: You can make it up on the SoLAs.
    * Some of the time: You can also try the next week.

### A note on pre-reflections 

Here's a sample response to #4 that illustrates what I like.

```
(overlay (image1 image2 image3))
(beside (i1 i2 i3))
(define xxx
  (lambda (color size)
     ...
(define image1 (solid-circle 10 "blue" 5))
(define image2 (outlined-rectangle 10 20 "black" 7))
(rotate img angle)
(hflip img) or (vflip img)
(hshift img amt) or (vshift img amt)
(scale img amt)
(crop img left top width height)
```

### Upcoming activities

Scholarly

* Thursday, 2025-01-30, 11:00 a.m.--noon, JRC 101.
  _Scholars' Convocation: The Once and Future Grinnell College_.
    * Detour: Sam's thoughts on Convo.
* Tuesday, 2025-02-04, Noon--12:50 p.m., PDR 224C (White Dining Room).
  _CS Table_ (topic tbd).

Artistic

* Sunday, 2025-02-02, Bucksbaum 191 (Flanagan Theatre).
  _How the Light Gets In_ (with Celeste Miller).
    * Tickets in Bucksbaum Box Office starting tomorrow.
* Tuesday, 2025-02-04, 4:00-5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Kaufman, Strangfeld, and Yurkevicz_.
* Tuesday, 2025-02-11, 4:00-5:00 p.m., Bucksbaum 131 (GCMoA).
  _Gallery Talk with Chen, Kluber, and Tavares.

Multicultural

* Saturday, 2025-02-01, 1:00--10:00 p.m., Harris Concert Hall.
  _Lunar New Year Celebration_.

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

Wellness

* Wednesday, 2025-01-29, Noon--1:00 p.m., Whale Room.
  _Current Events Support Space with SHAW._
* Tuesday, 2025-02-04, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 2025-02-04, 4:30--6:30 p.m., BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.

Misc

* Thursday, 2025-01-30, 4:00--5:00 p.m., Noyce ????.
  _CS Major Declaration Info Session_.
    * Snacks beforehand in the CS Commons.

### Other good things

_These do not earn tokens, but are worth your consideration._

* Saturday, 2025-02-01, 10:00 a.m.--1:00 p.m., Field House.
  _Grinnell Track and Field Invitational_.

### Upcoming work

* Due Thursday, 2025-01-30
    * [Mini-Project 1](../mps/mp01)
        * [Submit MP1 on Gradescope](https://www.gradescope.com/courses/948769/assignments/5674195)
* Due Friday, 2025-01-31
    * [Submit post-reflection on MP1](https://www.gradescope.com/courses/948769/assignments/5674307)
* Due Sunday, 2025-02-02
    * [Submit lab writeup from today's class](https://www.gradescope.com/courses/948769/assignments/5691459)
        * Ideally, you'll submit it today.
    * More readings!
        * [Computation via expressions](../readings/computation-via-expressions)
        * [Mental models of computation](../readings/mental-models)
    * [Submit reading response on Gradescope](https://www.gradescope.com/courses/948769/assignments/5691486)
    * Read [Mini-Project 2](../mps/mp02) (please don't start before I send you email)
    * [Submit pre-reflection on MP2](https://www.gradescope.com/courses/948769/assignments/5691493)

## Q&A

### Administrative

**Will I have an opportunity to retake this Quiz/LA if I did not pass?**

> Certainly! That's the whole point of mastery grading.

> In general, your option will be to take it again on the next SoLA. 
  However, since this is your first quiz, you will also have an
  option before class next Wednesday (section 1) or after class
  next Wednesday (sections 2 and 3).

### MP1

**Can you explain further on part 4, and go over how to format the DrRacket, and turn it in? I do not want to have to take a lot of time figuring it out.**

> I'll try to demo that in class.

**I want to know the difference between "overlay" and "overlay/origin". I have tried using both of them in coding the overlapped hollow-orange-circle and orange circle. However, I don't really understand why the images look so different.**

> `overlay` overlays the two images, matching the centers. `overlay/origin` 
   overlays the two images, matching their upper-left-hand corners.

> I'll try demoing.

### Racket/Scheme

**How are "code" and "procedure" different?**

> A procedure is a parameterized set of code. Procedures only run when you
  call them. Code is the stuff that goes in procedures, but can also be
  written by itself. `(solid-square 100 "blue")` is code, but not a procedure.

### Colors

**Why do programmers working in image processing use test images like the kitten image, Mandrill, Peppers, Lena image, etc. instead of simply using swatches of color (like test patterns for TVs)?**

> I don't know about others, but I find it more fun.

**Can we go over why the color-merge procedure is the way it is. I couldn't discern why some things were being added together and what the "quotient" was meant to do.**

```
;;; (color-merge-red-green c) -> color?
;;;   c : color?
;;; Make both the red and green components closer to the average of the
;;; two components.
(define color-merge-red-green
  (lambda (c)
    (rgb (quotient (+ (color-red c) (color-red c) (color-green c)) 3)
         (quotient (+ (color-red c) (color-green c) (color-green c)) 3)
         (color-blue c))))
```

> We're trying to make the red component a bit greener and the green component a bit redder.

> For the new red component, we're using two parts "old red" and one part "old green". Since there are three parts we're adding together, we need to divide by 3. `quotient` is the "divide-by" procedure.

**When I tried to load the cat image, I got this message: `bitmap/file: could not find the file kitten.jpg`. Is that a problem on my end or does the image not exist anymore?**

> Racket can be weird in loading files. We'll talk a bit about that.

**What do pixel-map and image-map do?**

> Both of them apply the given color transformation to every color in the image.

**In the `color-pseudo-complement` code, I didn't get why c is a "color" or a code (rgb ...) Won't the computer intepret it as numerical value like size in the lambda (size)?**

```
;;; (color-pseudo-complement c) -> color?
;;;   c : color?
;;; Compute the pseudo-complement of a color
(define color-pseudo-complement
  (lambda (c)
    (rgb (- 255 (color-red c))
         (- 255 (color-green c))
         (- 255 (color-blue c))))) 
```

## Lab

