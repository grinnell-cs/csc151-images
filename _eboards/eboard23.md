---
title: "EBoard 23: Functional images (bitmaps)"
number: 23
section: eboards
held: 2023-10-23
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Questions
* About bitmaps
* Lab

Administrivia
-------------

* Welcome back!  I hope you had wonderful breaks and that you are not broken.
* Yay!  Class 23 is on the 23rd.  I'm not sure whether or not that signifies
  anything special, but I'm still pleased.
* Quizzes returned.  Grade reports going out soon.
    * I'm amused that although only four people asked for a documentation
      quiz, about a dozen of you took it.
* Today's lab is brand new (so is the supporting code).
    * Ell{a,ie} may also be puzzled.
    * Things may break.
    * I need to get the autograder up.
* Registration starts somewhat soon.  I hope that you consider going on to 
  CSC-161.
    * Check the priority registration page at <https://grinco.sharepoint.com/sites/Registrars_Office/SitePages/PriorityRegistration.aspx> for our latest registration processes.
* Question: Should I permit extra students in CSC-151?  
    * The normal cap is 24; we had 30; I'm considering 32.
    * More students means less individual attention, but more opportunities
      for students to take CSC-151.
    * Another way to think about it: _How were you negatively impacted by
      the size of this class?_

### Upcoming Token activities

Academic

* CS Table, Tuesday, noon, The Open Web
    * Tim Berners-Lee. Information Management: A Proposal. CERN. March 1989, updated May 1990. <https://www.w3.org/History/1989/proposal.html>
    * Hossein Derakhshan. The Web We Have to Save. Matter. July 14, 2015. <https://medium.com/matter/the-web-we-have-to-save-2eb1fe15a426> (login required)
    * Copies available outside 3827 and 3809.
* CS Extras, Thursday, ???

Cultural

* Latin Cocktail, Tomorrow, 7pm, Herrick

Peer

* Swimming vs. Coe college, Friday at 6pm.
* Women's Volleyball vs. Cornell, November 1 at 7pm.

Wellness

Misc

### Other good things (no tokens)

* Women's soccer, Tuesday, 4pm
* Women's soccer, Saturday, 11am

### Upcoming work

* Tuesday night: Reading for Wednesday (pairs)
* Sunday night: MP5 (try to get it in earlier)
* Friday: Quiz(zes)
    * Friday's new topic: Numeric recursion
* Next week: SoLA 2
    * All leftover LAs from SoLA 1.
    * All of the following
         * Code style (new)
         * Lists and the big three (quizzes)
         * Cut and Compose (new)
         * List recursion (quizzes)
         * Local bindings (quizzes)
         * Numeric recursion (new, quiz Friday)
         * Vectors (really new, coming Friday)
         * Diagramming structures (really new, coming Wednesday and Friday)

About MP5
---------

In short: Numeric recursion plus images.

Four parts:

* Fractal triangles
* Carpets
* Spinning squares
* Freestyle

Questions
---------

### Administrative

### Other

About bitmaps
-------------

_Oh no!  Sam did this on the whiteboard!_

* We can think of images as grids of colors.
* We normally don't want to build these images by hand.  But we can.
* We will build them with functions instead.

Lab
---

Sam will spend the first few minutes of class getting the autograder
working so that you can submit it on Gradescope.

If you want to scale, add `(require 2htdp/image)` to the top of your file.

```
; SAM SAID "This lab is (much) too long.  You can stop here."
```
