---
title: "EBoard 04: Writing your own procedures"
number: 4
section: eboards
held: 2024-01-29
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed) (provided the technology
is working correctly).

_Start of class instructions_

* Optionally: Grab a mask
* Grab a plastic-coated business card. It should have a computer name
  and location.
* Identify where the corresponding computer is.
* Return the card to the jar.
* If you arrive first, log in to the computer but _do not start the lab_.
* When both partners arrive, introduce yourselves and start looking
  at the lab together.
* Sam will start talking at about 8:30 a.m.

_Approximate overview_

* Administrative stuff, including attendance [15 min]
* Lab [60 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

### Attendance

### Introductory Notes

* Reminder to self: Demo Gradescope.
* You can now submit mini-project 4.

### Upcoming activities

Scholarly

Cultural

* Art gallery opening.

Peer

Wellness

Misc

### Other good things

### Upcoming work

* Tuesday, 2024-01-30, 11pm: Read things in preparation for the fifth day of 
  class and report on those things
    * [Computation via expressions](../readings/computation-via-expressions)
    * [More on mental models](../readings/mental-models)
    * Do the [Reading Response](https://www.gradescope.com/courses/690100/assignments/4007931/submissions)
* Wednesday, 2024-01-31, 8:30am: Submit today's lab writeup.
    * [Submit on Gradescope](...)
* Wednesday, 2024-01-1, 11:00pm: [Mini-Project 1](../mps/mp01) due.
    * [Submit on Gradescope](https://www.gradescope.com/courses/690100/assignments/4014689/)

Notes on quiz 1
---------------

* You did a good job, in general. Congratulations!
* Please write your full name (first and last)
* Naming is important. If I tell you to call something `three-by-three`,
  don't call it `image` or `grid` or something else.
* Please write your name on the back and do your work on the front
  so that I can grade anonymously.
* Think about the naming of subimages. `column1` doesn't tell me much.
  `red-diamonds` or `red-column` is better.
* Similarly, using the name `red-row` for a column is a bit misleading.

Questions
---------

### Administrative

What's the best way to check what work is due?

> The daily eboards are most likely to have links to everything.

> Gradescope will have the things you need to turn in, but Gradescope
  is sometimes overwhelming.

> The schedule lists most things, but won't always have links.

### Quizzes

Why do you have us do quizzes on paper rather than the computer?

> Lots of reasons. First of all, there are (usually) fewer computers 
  than students. More importantly, for the paper quizzes, my goal is
  not that you get the syntax perfect. Rather, I want to see that you
  can get the ideas right. The stressors of taking a quiz on the
  computer are also different.

What should I do if I did not receive credit for this quiz?

> There will be a makeup this Friday. If you don't receive credit
  on the makeup, you can try again on the first set of learning
  assessments (SoLA) in a few weeks. (The SoLA will be on the
  computer.)

### MP1

_I've put most of the questions and answers in the mini-project._

For part 4 of the MP1, how can my-image-alt and my-image be compared if we had to edit the code to make the generation procedure?

> You shouldn't alter your code from part 2 to make part 4.  Suppose this is my code from part 2.

    (define ayes
      (beside (solid-circle 20 "blue")
              (solid-rectangle 20 1 (rgb 0 0 0 0))
              (solid-circle 20 "blue"))) 

    (define smile
      (overlay (above (solid-circle 50 "yellow")
                      (solid-rectangle 1 10 (rgb 0 0 0 0)))
               (solid-circle 50 "red"))) 

    (define my-image
      (overlay (above ayes smile)
               (solid-circle 150 "yellow")
               (outlined-circle 150 "black" 5)))

> For part 4, I'd write something like the following.

    (define make-eyes
      (lambda (eye-color)
        (beside (solid-circle 20 eye-color)
                (solid-rectangle 20 1 (rgb 0 0 0 0))
                (solid-circle 20 eye-color)))) 
    
    (define make-smile
      (lambda (smile-color face-color)
        (overlay (above (solid-circle 50 face-color)
                        (solid-rectangle 1 10 (rgb 0 0 0 0)))
                 (solid-circle 50 smile-color)))) 
    
    (define generate-my-image
      (lambda (face-color eye-color smile-color)
          (overlay (above (make-eyes eye-color)
                          (make-smile smile-color face-color))
                   (solid-circle 150 face-color)
                   (outlined-circle 150 "black" 5))))

> Now, I'd write the following to generate the image.

    (define my-image-alt (generate-my-image "yellow" "blue" "red"))

> And something like the following to generate an alternate

    (define my-other-image (generate-my-image "green" "red" "black"))

> I hope that makes sense.

### Readings

Can one make a list of colors or numbers and feed it into a procedure to generate lots of things with little effort?

> Yup. We'll see how in a week or so.

Can you make optional parameters for lambdas?

> Yes. You put them in square brackets and add a default value.

> Here's a way to define a procedure, `disc`, that takes a diameter and 
  an optional color, using "black" if it's not given one.

    (define disc
      (lambda (diameter [color "black"])
        (ellipse diameter diameter color)))

> There are also some more complicated approaches that we might
  consider later in the semester.

Lab
---

### Notes

* You are best off right clicking on the link to the Racket file and 
  saving it in an appropriate place.
* As you may have noticed, the autograder cares that you have the right
  file name and that you give your values the right names. Following
  these kinds of guidelines is good practice.

### Questions and answers
