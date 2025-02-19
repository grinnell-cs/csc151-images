---
title: Learning assessments
summary: One of the ways we assess your learning.
permalink: /las/
---

# Learning assessments

To directly assess your mastery of the learning objectives of this course, we will conduct a series of sets of learning assessments (SoLAs) over the course of the semester.  Each will contain assessments from one or more Learning Assessment Phases (LAPs).  The use LAs of this course is inspired by [mastery-based testing](https://mbtmath.wordpress.com/) practices found in mathematics.

There are four primary SoLAs in the course, along with one optional final SoLA.

+ SoLA 1 (LAP 1): Week 4, Monday--Tuesday, 12--13 February 2024
+ SoLA 2 (LAPs 1&2): Week 7, Monday--Tuesday, 4--5 March 2024
+ SoLA 3 (LAPs 1--3): Week 10, Monday--Tuesday, 8--9 April 2024
+ SoLA 4 (LAPs 1--4): Week 14, Monday--Tuesday, 6--7 May 2024
+ SoLA 5 (LAPs 1--4): Finals week (distributed Tuesday, 14 May 2024; due 5 p.m. Friday, 17 May 2024)

SoLAs consist of a set of individual assessment problems---one problem for each learning objective of the course covered so far.  

The learning objectives are listed below by LA period.  

Some of the LAs will appear as in-class paper-based ten-minute quiz, given at the start of class each Friday.

All of the LAs in a phase (except those marked as in-class-only) will be released as a SoLA on gradescope.  **Do not discuss the problems on the SoLA with anyone until I have returned graded problems.**

You may choose to attempt as many of the individual assessment problems as you wish for that period.  As described in the [syllabus]({{ "/syllabus" | relative_url }}), LA problems are graded on a binary *satisfactory (S)/not satisfactory (N)*.  Once you receive a satisfactory on a problem tied to a particular learning objective, you do not need to attempt additional problems tied to that learning objective in subsequent SoLAs, *i.e.*, you have demonstrated sufficient mastery of that objective, so you are done with it!

## Learning objectives

The objectives may change slightly during the semester as the schedule shifts.

{% for la in site.data.learning-goals %}
**{{ la.assessment }}**
{% for goal in la.goals %}
1.  {{ goal }}
{% endfor %}
{% endfor %}

## Rubrics for learning assessments

**Programming problems**

For programming problems in learning assessments, we are concerned primarily with correctness rather than design.  Make sure that your program works according to the specification outlined in the problem by testing it on a variety of inputs.  Pay attention to the prompt for guidance about what aspects of design you need to include in your program, *e.g.*, documentation or explicit test suites.

**Written problems**

For problems with written responses, we are looking for responses that *address the prompt directly and concisely*.  In particular, if a written problems asks you to solve a problem in a certain style or show your work, *e.g.*, the trace of the execution of a program, make sure to include this information in the style presented in class.

## Sample LAs

Phase 1

* [Decomposition](decomposition.html)
* [Procedural abstractions](procedures.html)
* [Primitive types](primitive-types.html)
* [Tracing](tracing.html)
* [Collaboration](collaboration.html)
* [Lambda-free anonymous procedures](hop.html)

Phase 2

* [Documentation](documentation.html)
* [Conditionals](conditionals.html)
* [Testing](testing.html)
* [Lists](lists.html)
* [Program style](program-style.html)
* Ethics

Phase 3

* [List recursion](list-recursion.html)
* [Local bindings](local-bindings.html)
* [Numeric recursion](numeric-recursion.html)
* [Diagramming structures](memory.html)
* [Vectors](vectors.html)
* [Randomness](randomness.html)

Phase 4

* [Dictionaries](dictionaries.html)
* [Data abstraction](data-abstraction.html)
* [Higher-order programming](write-hop.html)
* [Tree recursion](tree-recursion.html)
* [Running time](running-time.html)
* [Sorting and searching](searching.html)

## An example of redos

As we noted, you are free to redo missed learning assessments (LAs). Each redo will have a new problem on the same subject matter. Here's an example of how that might work.

> Your first LA will be a paper-based in-class quiz at the end of week one.  Let's suppose you receive an S on that LA and it is the in-class-only LA.

> Your second LA will be a paper-based in-class quiz at the end of week two.  Let's suppose you receive an N on that LA.

> Your third LA will be a paper-based in-class quiz at the end of week three.  Let's suppose you receive an S on that LA.

> The first SoLA will occur in week four.  It will be an online out-of-class exam.  There are six learning objectives for that phase.  However, only five of those will appear on the SoLA, since one of them is marked as an in-class-only LA.  Fortunately, you've completed that one.

> You need not take the LA on the SoLA that corresponds to the third LA quiz.  You will have four left to do.  One will correspond to the learning objective that you did not complete successfully in week two and the remaining three will be for objectives not covered in the weekly quizzes.

> Let's suppose you receive grades of S on two of the new problems, N on the repeated LA, and that you skip one of the new problems.  That's okay.  You're still making good progress. You've completed four of six LAs!

> Your next LA will be a paper-based in-class quiz at the end of week four on an objective from Phase 2.  Let's suppose you receive an S on that LA.

> Your next LA will be a paper-based in-class quiz at the end of week five on an objective from Phase 2.  Let's suppose you receive an S on that LA.

> Your next LA will be a paper-based in-class quiz at the end of week six on an objective from Phase 2.  Let's suppose you receive an N on that LA.

> SoLA 2 appears in week seven.  It will have eleven LAs, corresponding to five of the six objectives from Phase 1 and all six objectives from Phase 2.  At this point, you've already completed LAs for six of the twelve objectives in Phases 1 and 2.  

> You'll have a third chance on the objective from phase 1 that you had difficulty with on the week-2 quiz and SoLA 1.  You'll have a second chance on the objective from phase 1 that you skipped on SoLA 1.  You'll have a second chance on the objective from phase 2 that you missed in week six.  And you'll have a first chance on the remaining three objectives from phase 2.

