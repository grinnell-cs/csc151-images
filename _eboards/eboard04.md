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

_Yes, we'll do that once in a while._

### Introductory Notes

* You can now submit mini-project 1.

### Upcoming activities

_Sam: Don't forget to do a token demo._

Scholarly

* Thursday, 2024-02-01, 11am, HSSC 2231 (Auditorium), 
  _Scholars' Convocation, Being a Pandemic Citizen._

Cultural

* Art gallery opening.

Peer

Wellness

* Today, 2024-01-29, 4pm, HSSC Atrium, 
  _Therapy Dogs_.

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

When are the mentor sessions?

> I'm not sure. I'll check with Maddy.

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

How do I make a semicircle?

> Overlay two circles.

> Ask Sam for a better approach and wait until tonight.

Can I use procedures we haven't learned yet?

> Yes, provided you cite how you learned them.

For part 4 of the MP1, how can my-image-alt and my-image be compared if
we had to edit the code to make the generation procedure?

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

    (define my-other-image (generate-my-image "green" "red" "white"))

> I hope that makes sense.

Can we name our parameters whatever we'd like?

> Yes, within reason.

Is there a way to place something at a particular location in an image?

> Yes, there's a `place` procedure.

> _Sam demos._

### Readings

Is there a way to guarantee that what someone passes in is the correct
type of thing so that, say, someone doesn't give me a color where I
expect a number?

> Yes, but we won't cover it for a few weeks. For now, assume that people
  know what the input type is and get it right.

Can one make a list of colors or numbers and feed it into a procedure
to generate lots of things with little effort?

> Yup. We'll see how in a week or so.

Can you make optional parameters for lambdas?

> Yes. You put them in square brackets and add a default value.

> Here's a way to define a procedure, `disc`, that takes a diameter and 
  an optional color, using "black" if it's not given one.

    (define disc
      (lambda (diameter [color "black"])
        (solid-ellipse diameter diameter color)))

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

### More comments from Sam

Here's what I'd like for problem 1a

```
(define my-func-1
  (lambda (x y)
    (+ x (* y y) x)))

     (my-func-1 (+ 1 1) 5)
---> (my-func-1 2 5)
---> (+ 2 (* 5 5) 2)
---> (+ 2 25 2)
---> 29
```

Stop working on problem 1 at 9:20.

It's 9:45. It's time to stop.

```
; Sam said I should stop here.
```

Submit on gradescope. It's okay if you don't pass all of the tests.

I would recommend that you try to do the snowperson problem if you have
not managed to do it.
