---
title: Redoing mini-projects
section: handouts
---

# {{ page.title }}

As you have heard, the _mastery grading_ approach we use in CSC-151 permits you to redo mini-projects you do not complete at a satisfactory level, sometimes at the cost of some [tokens](../handouts/tokens). There are also some additional policies for redos.

* You may only earn an E on the original mini-project or the designated first-redo.
* You must limit yourself to the aspects of Scheme we had covered at the time of the project.
* You must submit a `CHANGES.rkt` file that provides information for the grader.

## Limited opportunities for E grades

To encourage you to do your best work early, we limit E (Exemplary) grades to the initial mini-project or the designated first redo. 

Note that "initial mini-project" and "designated first redo" refer to the assignments, not your submissions. If your initial submission is for the second redo, the highest you can earn is an M.

## Limiting your use of new Scheme features

As the semester progresses, we will learn many new features of Scheme. The assignments are designed to challenge you to solve the problems using the knowledge you have at the time they were assigned. As you might expect, we'll learn new techniques that make many parts of the earlier projects much simpler.

When submitting a redo, you must limit yourself to the aspects of Scheme we had covered by the time the project was do.

## The `CHANGES.rkt` file

To ease our graders' workload, we ask that you submit a file called `CHANGES.rkt` along with the updated files for each redo (or for your first submission if you missed the initial submission). In the `CHANGES.rkt` file, you should include the following (as one or more Racket comments).

* A header giving the basic information.
* Information about the previous version you submitted. (E.g., "I was unable to submit the original assignment" or "I submitted the original version but not the first redo.")
* A list of all the major issues in that previous version---including those noted within the program code, those listed in the comments section, and the rubric items that were not completed---as well as a summary of how you have addressed them.

**Please do not submit the `CHANGES.rkt` file until you are ready to have the redo graded.** For example, if you are only submitting to check autograder results, do not include the changes file.

Here's a sample `CHANGES.rkt` file.

```
#lang racket
#|
Mini-Project 3, Second Redo
River Smith
2025-03-17

Prior version: Mini-Project 3, Original
  I submitted the original, but not the first redo.
  I realize that this means that I won't get more than an M.

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

Here's a sample `CHANGES.rkt` file for someone submitting the first time as a redo.

```
#lang racket
#|
Mini-Project 2, Second Redo
River Smith
2025-02-17

Prior version: None.
  I did not submit the assignment previously.
|#
```
