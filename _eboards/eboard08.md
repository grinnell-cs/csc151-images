---
title: "EBoard 08: RGB colors"
number: 8
section: eboards
held: 2024-02-07
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Approximate overview_

* Administrative stuff [15 min]
* Q&A [15 min]
* Lab [45 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* MP1 returned. 
    * Sam will demo how you should look at this information on gradescope.
    * Don't worry if you got an R or an I! You'll have a chance to redo it.
    * Sam will update the due date on the redo.

### Token activities

Scholarly

* Thursday, 2024-02-08, 11am in JRC 101.
  _Scholars' Convocation: A Life Worth Archiving – Excerpts from a Memoir._
* Thursday, 2024-02-08, 7pm in Science 3819.
  _Mentor session_. (Get ready for the SoLA)

Cultural

Peer

* Roller skating this Friday in Harris center.

Wellness

Misc

* InfoSec security survey (coming via email)

### Other good things

* Wednesday, 7:00 p.m, JRC 101: Learn about Renfrow Hall
* Wednesday, 7:30-9:00 p.m., Women's Basketball

### Upcoming work

* Wednesday, 2024-02-07, 11:00pm: [Mini-Project 2](../mps/mp02) due.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4064410)
* Thursday, 2024-02-08, 11:00pm: Submit reading responses.
    * [How Pair Programming Really Works (Wray)](../files/PairProgramming.pdf)
    * [Coping with Hitchhikers and Couch Potatoes on Teams](../files/OakleyHitchhikers2004.pdf)
    * [Diverse Teams Feel Less Comfortable -- and That's Why They Perform Better](../files/DiverseTeams2016.pdf)
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4058917/)
* Friday, 2024-02-09, 8:30am: Submit today's lab writeup.
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4066784/)
    * Preferred: Submit before the end of class today.
* Friday, 2024-02-09, 8:30am: Quiz!
    * Topic: [Primitive types](../las/primitive-types)
    * Also tracing and decomposition, for those who need them
* Friday, 2024-02-09, 11:00pm: Post-reflection for MP2
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4066759/)
* Friday, 2024-02-09, 11:00pm: Pre-reflection for SoLA 1
    * [_Submit on Gradescope_](https://www.gradescope.com/courses/690100/assignments/3974512/)

Questions
---------

### Administrative

How do I know which LAs to do and which to skip?

> You should know from your quizzes (or, in the future, your LAs).

> You can see that on Gradescope.

> Sam hopes to distribute a list to you by Monday.

Can I submit a mini-project more than once?

> Yup. That's one of the goals of having an autograder. That way, you
  get advice before the graders see it and can therefore catch errors
  (or see what Sam is looking for).

> Submit early and often!

What's the difference between evening tutors and mentor sessions?

> Mentor sessions are focused "class-like" situations run by the people
  who work directly on this class (Maddy and Mai).

> Evening tutors are here to answer questions (on any intro class), so
  are a bit less familiar with the class in particular. And their main
  goal is reactive (answer question) rather than proactive (guide your
  learning).

### MP2

How do I add a description to an image?

> Almost all of the basic image-creation procedures (including
  `solid-polygon` and `image-subtract`) have an optional parameter for
  a description of the image. You should generate that description.

> For example, here are two versions of `solid-isosceles-triangle`.

> ```
(define sit-a
  (lambda (width height color)
    (solid-polygon (list (pt (/ width 2) 0)
                         (pt width height)
                         (pt 0 height))
                   color)))
```

> ```
(define sit-b
  (lambda (width height color)
    (solid-polygon (list (pt (/ width 2) 0)
                         (pt width height)
                         (pt 0 height))
                   color
                   (string-append "a "
                                  (number->string width)
                                  "-by-"
                                  (number->string height)
                                  " "
                                  (describe-color color)
                                  " isosceles triangle"))))
```

I used `redescribe` to add a description to an image. Now all the tests fail.

> Whoops. I'll see if I can get `redescribe` to function better.

> Maybe you can use the ideas above instead of `redescribe`.

When you use `width` and `height` for outlined triangles, are those the
inner width/height or the outer width/height?

> The inner width and height.

### Reading (Colors)

I wasn't sure how to remove the blue component of an RGB color.

> ```
(define remove-blue
  (lambda (color)
    (rgb (rgb-red color) (rgb-green color) 0 (rgb-alpha color))))
```

Why and when do you use "color-name->rgb" function?

> When we're working with names (e.g., "blue") and want to do more
  computational things (like making them darker).

Can you please explain this part 

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

> This makes the red component more like the green component and vice versa.

I hear that your favorite color is plaid. How do you make plaid?

> Um ... it's a trade secret that I am not permitted to reveal.

Lab
---

```
; SAM SAID WE SHOULD STOP HERE
```

Things we learned

* red + green = yellow for transmissive colors
* The DrRacket "recover file" stuff works once in a while.
* Save early and often. (Someday Sam will tell the joke.)
