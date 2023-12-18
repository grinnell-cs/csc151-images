---
title: Redoing mini-projects
section: handouts
---

# {{ page.title }}

As you have heard, the _mastery grading_ approach we use in CSC-151 permits you to redo mini-projects you do not complete at a satisfactory level, sometimes at the cost of some [tokens](../handouts/tokens). To ease our graders' workload, we ask that you submit a file called `CHANGES.rkt` along with the other files for each redo. In that file, you should include the following (as one or more Racket comments).

* A header giving the basic information.
* The previous version you submitted. (E.g., "I was unable to submit the original assignment" or "I submitted the original version but not the first redo.")
* A list of all the major issues in that previous version, including those noted within the program code and those listed in the comments section, as well as a summary of how you have addressed them.

**Please do not include the `CHANGES.rkt` file until you are ready to have the redo graded.** For example, if you are only submitting to check autograder results, do not include the changes file.

Here's a sample `CHANGES.rkt` file.

```
#lang racket
#|
Mini-Project 3, Second Redo
River Smith
2024-03-17

Prior version: Mini-Project 3, Original
  (I submitted the original, but not the first redo.)

Issues I've addressed

* Unclear documentation for a few procedures.
  I've now added documentation for `tally-images` and `combine-all`.

* Failure to cite laboratory materials.
  I've added a citation to the laboratory materials to the introductory
  comments. I've also separated the materials from each lab and put
  a short comment before the section with those materials.
  
* `make-image`.
  My `make-image` procedure did not work correctly. I believe that
  I've fixed that issue. It now passes all of the tests, including
  the three-star tests.

* Style
  I think I've fixed all of my stylistic issues. The graders noted
  that I used nested `if` expressions rather than `cond` blocks. I've
  fixed that both where they noted it and also in `combine-all`. I've
  also been careful to reindent with Ctrl-I before submitting.

|#
```
