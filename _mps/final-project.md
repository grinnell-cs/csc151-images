---
title: (Mini-)Project 9
subtitle: A procedure is worth a thousand pictures
summary: |
  At this point in your career, you've learned a variety of techniques
  for writing algorithms and for working with images. This project
  provides an opportunity for you to push yourself in new directions.
collaboration: |
  Each group should submit their responses to this project together. You may
  consult other students in the class as you develop your solution.  If you
  receive help or advice from anyone, make sure to cite them in your responses.
link: true
---
The starter code for this project is [image-series.rkt](../code/mps/image-series.rkt).

Preliminaries
-------------

While the primary focus of this course is on learning how to write, describe, test, and analyze algorithms, our secondary focus is on writing algorithms that generate "interesting" images. We've created images with basic shapes, transformed existing images using color transformations, designed images as functions from positions to colors, and even wrote procedures that work with individual pixels.

At the same time, you've learned a variety of techniques for doing complex computations, particularly a variety of kinds of recursion (over lists, arbitrarily nested lists, pair structures, vectors, and numbers). You've also considered a variety of ways to store compound/complex data, including lists, vectors, pairs and pair structures, nested lists, and hash tables.

We also hope that you've learned a bit about working with other people as well as the different kinds of strengths that people bring to problem solving.

It is now time for you to bring your skills and knowledge together to in a new way. We are going to use our knowledge of CS in the service of a task both creative and analytic. In particular, we are going to write a procedure that heps us better understand a work of art.

Coding as analysis
------------------

As you may know, a multitude of (mostly) hidden design decisions go into each work an artist makes. As the audience for the work, we might develop better appreciation of the work as we "tease out" some of those design decisions. One way that both artists and art historians sometimes analyze works and their design decisions is to make variants of the work. "What happens if I move this one thing?" "What happens if I use a slightly different color?" "A different aspect ratio?"

One of the nice things about computers is that they can let us write procedures that make variants of an image. Rather than drawing one variant of an image by hand, we can write a proram that makes dozens or even hundreds of variants. The ability to generate variants helps us better understand the original image. At the same time, it lets us "create" in that we can now make a Warholesque trove of variants.

How many is enough? We'd like you to write a procedure that can make at least 1,000 different (but related) images, all based on a single starting image. Why "at least 1,000"? So that we can subtitle the project "a procedure is worth a thousand pictures" (a play on the aphorism "a picture is worth a thousand words").

Project specification
---------------------

Our computational image-making skills are not yet at the level that we can use them to make realistic representational art. Hence, in this project, we will focus on abstract art, particularly somewhat geometic abstract art. In part, such art matches our knowledge and skill sets. In part, analyzing such art may help us better understand what makes a particular work compelling.

This semester, will apply the "code as analysis" technique to the works of Hilma af Klint.  As Wikipedia tells us, "Hilma af Klint was a Swedish artist and mystic whose paintings are considered among the first abstract works known in Western art history. A considerable body of her work predates the first purely abstract compositions by Kandinsky, Malevich and Mondrian."

Identify an image by Hilma af Klint that you would like to use as a starting point. (We have placed a copy of her _Catalogue Raisonné_ in the classroom for you to browse. You can also find many of her images online.) Your goal will be to write a procedure that can generate a variety of variants of the image. In part, your goal is to be able to make individualized versions of the image. In part, your goal is to be able to better understand the underlying design ideas in the image.

Write a procedure, `(image-series n width height)`, that takes three non-negative integers as input and generates a `width`-by-`height` image that is similar to but different from your source image. Different values of `n` should give observably different images. The same `n`/`width`/`height` triplet should always give the same image; if you use randomness, you'll need to make it predictable randomness (use `(random-seed n)` at the start). You should support values of `n` between 0 and 999, inclusive. (You may also support other values of `n`.) You should support aspect ratios between 1:2 and 2:1.

You should find ways to use the following in your project.

* At least two of the ways we have of thinking about images: 
    * shapes, 
    * manipulating bitmaps by color (using `pixel-map`), 
    * manipulating bitmaps by position (using either `image-compute` or `pixel-pos-map`), and
    * manipulating bitmaps directly based on the underlying vector of pixels.
* At least two useful recursive procedures. (You can use any kind of recursion: list, numeric, vector, hash, tree, ...).

Additional requirements
-----------------------

### Design plans

Rather than just building whatever comes to mind, you should begin by coming up with a "design document" in which you sketch the goals of your project. Your document will have two parts: A textual description of what you are trying to achieve and how you anticipate doing so as well as a hand-drawn sketch (or sketches) of the original image and the ways in which you will vary that image.

### Presentation

Your group will give a 5-minute presentation to the class on your project on Wednesday, 7 May 2025. In your presentation, you should plan to discuss the original image, your design plans, show some images you geneated, and highlight one or more pieces of code you are most proud of. You should also be prepared to answer questions.

You must submit the slide deck for your presentation (PDF or Powerpoint) along with your project file.

### Time log

This project is scheduled for slightly more than a week of class. We ask you to spend about four hours of out-of-class time plus about two hours of in-class time per team member, which includes planning, writing, development, and presentation preparation. No one should spend less than five hours. No one should spend more than ten hours. Please keep track of your time as you go in a time log that includes start time, stop time, elapsed time, and activity . Here's an example.

```
Taylor  2025-04-24 09:00-09:30  30 min  Met with reference librarian 
Taylor  2025-04-24 15:00-15:15  15 min  Found some good images
Taylor  2025-04-26 20:00-21:00  60 min  Discussed project with team
Taylor  2025-04-27 09:00-09:30  30 min  Started designing concentric-circles
Taylor  2025-04-28 11:15-12:00  45 min  Wrote concentric-circles; buggy
...
Toby    2025-04-25 14:00-14:15  15 min  Asked art history friend for ideas
Toby    2025-04-26 20:00-21:00  60 min  Met with team; they chose my idea!
Toby    2025-04-29 09:00-10:00  60 min  Helped Taylor debug concentric-circles
...
```

### Learning summary

Each group member should individually reflect on what they learned in the project.  You might consider what you learned about the work you are studying, programming, teamwork, yourself, etc.  You will enter this commentary in the MP9 post-reflection.

What to submit
--------------

**Your code**, saved as `image-series.rkt`. The file should include your _time log_, your _design discussion_, and _any notes you have on "outstanding code"_.

**The original image(s)** that you are using as an inspiration.

**Your sketch or sketches** as you reflect on the original image and how you will generalize it.

**Your presentation** as a PDF or PowerPoint document. Please pick a team name and name it `Team.pdf` or `Team.pptx`, as appropriate.

**Four images (at least 600x500, no more than 3000x2000)**. Please name them `Team01.png`, `Team02.png`, `Team03.png`, and `Team04.png`, substituting the name of your team.

**Learning summary** (submitted separately and individually). In two or three paragraphs, summarize what you learned from doing this project.  You will enter this on the post-assessment.

Setting project goals
---------------------

As you might expect, it's important that you have working code for this assignment. Hence, we recommend that you build your project gradually. It is not essential that you capture every aspect of the image (e.g., brush strokes, careful blends, even some of the lines).

Start with what people in industry call a "minimum viable product". You should focus on the central design components and make sure that you have a way of varying the image appropriately.

Once you've completed that part, start adding additional aspects. Perhaps you've noticed an interesting blend in one part. Perhaps there's a curve you want to add.

Only if there is time will you try to capture every aspect of the image.

Note that you should make many of these decisions in advance, as you decompose the problem. 

* _What should be the core of our project?_
* can we add once we've completed that part?
* If everything goes perfectly and we still have time, what else might we add?

Rubric
------

_This rubric is approximate. Our goal is that if you do the work and follow good habits, you should get at least an M._

_There are no redos available for this project._

### Required for M

```
[ ] Includes all necessary files 
    [ ] `image-series.rkt`
    [ ] The original images
    [ ] The sketch or sketches
    [ ] A PowerPoint deck
[ ] Project runs and produces different images for different values of `n`
[ ] Includes design description
[ ] Time log appears reasonable
[ ] Includes two recursive procedures
[ ] Includes two mechanisms for image making
[ ] All team members document spending at least 5 hours on the project
    (affects individuals, not group)
[ ] Presentation is approximately 5 minutes
[ ] Presentation includes goals and code description
[ ] Answered questions well
[ ] Code correctly formatted (a few mistakes are permissible)
[ ] Post-reflections (affects individuals, not group)
```

### Required for E

```
[ ] At least one of the following, at the discretion of the grader.
    [ ] A particularly nice procedure or piece of code (please describe in documentation)
    [ ] An outstanding, nearly flawless, presentation
[ ] All procedures documented clearly
[ ] Almost no inefficient or otherwise bad code
[ ] A well-organized code file
[ ] Project handles different aspect ratios
```

Questions and answers
---------------------

Should we use the starter code?

> Yes.

Can we assume a minimum image width and height?

> Yes, provided you document it.

How big a picture can I make?

> I wouldn't go much beyound 2,000 x 2,000 pixels.

What do you mean by "variants of the original image"?

> You might use different colors (or different combinations of colors), different ratios of shape sizes, manipulations of the pixels (e.g., modifications of the patterns she uses across large areas), and other things like that. Your images should still be recognizably similar to the original image.

Can we use `random` in this assignment?

> Yes. However, your results for each `n` should be consistent. You'll need to call `(random-seed n)` at the start. (That "seeds" the random number generator.)

What if one of our team members works too few or too many hours?

> They will receive an R or an I. It will not directly affect the grades of other team members (provided they turn in working code).

How do variants help us understand the initial image? It was written matter-of-factly, however I am still confused on how that is analysis.
  
> Hypothetically, as you build variations, you'll come to better understand the design choices the artist made. Do other other pairings of colors seem less compelling, too relaxing, ...? In some sense, we're generating something like the artist's sketchbook for the piece.
  
Does working individually (stated at the beginning of the MP) mean that we can't work with people outside of our group, or does that mean we can't work directly with our team members?

> Working individually means that you choose to form a team of one.

> You can always talk to others provided you cite them.

I would like to see examples of the final images. Also how different should the images be? especially if we need 1000 of them, should the changes between one and another be super noticeable or can they be more discrete?

> I'll work on some examples if I can find the time.

> You can decide how different the images will be. They should be different enough that you'll learn something from the differences.

How would you split up the work?

> I'd suggest that you work as a team to decide upon the "big picture" of the project and how to decompose it. If you've decomposed well, you could have individuals or pairs work on each part.

> However, I'll note that in the past the best teams seemed to work together (or at least nearby) most of the time.

How should the in-class presentation be different from the coding and documentation portion?

> Your professor is the audience from the coding and documentation.  Your classmates (and any visitors) are the audience for the presentation.  In the presentation, make sure to demo your images and something cool about your code.

Should the time log be in a separate file or just somewhere with the rest of the code?

> There's a space in the code for the time log.

How can we work on the same Racket file from different computers at the same time?

> That's one reason we decompose.

> Know how you're communicating and communicate clearly.

> You might use a Teams channel.

> Mostly work together?

> You could learn to use GitHub. (Sorry.)

> You could sign up for a shared online coding platform. Repl.it is
  reasonable.

Do you have a recommendation for how to make 1000 different images?

> Choose three things that you can have ten variants of (e.g., a color,
  a size, which texture). Use the ones digit to choose the first variation.
  Use the tens digit to choose the second variation. Use the hundreds
  digit to choose the third variation.

Can we simplify the image?

> Certainly. For example, you may choose not to work with textures.

What procedure should we use to make blends?

> I'd suggest `image-compute` or `pixel-pos-map`.

Can we use `hscale` and `vscale` to scale our image?

> I'd prefer not.

Can we pad our image on both the sides and top and bottom?

> No. You may only pad on either the sides or the top and bottom. If
  the width and height change, your image should scale based on them.

Code snippets
-------------

How can I crop a circle?

> Using the [`(crop img left top width height description)`](https://rebelsky.cs.grinnell.edu/Courses/CSC151/reference/procs/crop.html) procedure.

```
(define cropped-ellipse
  (lambda (width height color)
    (crop (solid-ellipse (* 9/8 width)
                         (* 9/8 height)
                         color)
          (* 1/16 width)
          (* 1/16 height)
          width
          height
          "A cropped ellipse")))
```

> You will, of course, have to play with the factors.

How can I make a rainbow rectangle?

> Using `image-compute` and HSV colors.

```
(define rainbow-rectangle
  (lambda (width height)
    (image-compute (lambda (col row)
                     (hsv->rgb (hsv (* 360 (/ col width)) 100 100)))
                   width
                   height
                   (string-append "a "
                                  (number->string width)
                                  "-by-"
                                  (number->string height)
                                  " rainbow rectangle"))))
```

I've forgotten. How do I make parts of my image transparent?

> The `(white->transparent 

Acknowledgements
----------------

Although "A procedure is worth 1,000 pictures" has long been a part of the image-making versions of CSC-151, this new form of the project was introduced in Spring 2024.  the use of the project as an analysis tool was inspired by the works of James Clayson in his explorations of "Radical Bricolage". 
