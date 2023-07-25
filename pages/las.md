---
title: Learning assessments
summary: How we assess your learning.
permalink: /las/
---

# Learning assessments

To directly assess your mastery of the learning objectives of this course, we will conduct a series of sets of learning assessments (SoLAs), targeted in-class, paper-based examinations, over the course of the semester.
Each will contain assessments from one or more Learning Assessment Phases (LAPs).
The use LAs of this course is inspired by [mastery-based testing](https://mbtmath.wordpress.com/) practices found in mathematics.

There are three primary SoLAs in the course, along with one optional final SoLA.

+ SoLA 1 (LAP 1): Week 4, Friday, 23 September 2022
+ SoLA 2 (LAPs 1--2): Week 8, Friday, 28 October 2022
+ SoLA 3 (LAPs 1--3): Week 13, Friday, 2 December 2022
+ SoLA 4 (LAPs 1--4): Finals week

You may choose to attempt as many of the individual assessment problems as you wish for that period.
As described in the [syllabus]({{ "/syllabus" | relative_url }}), LA problems are graded on a binary *satisfactory/non-satisfactory*.
Once you receive a satisfactory on a problem tied to a particular learning objective, you do not need to attempt additional problems tied to that learning objective in subsequent SoLAs, *i.e.*, you have demonstrated sufficient mastery of that objective, so you are done with it!

> **Example**: The first SoLA will have five problems corresponding to five learning objectives from the first Learning Assessment Phase described below.
> Suppose that you receive S grades on the first five problems but not the fourth or fifth.
> The second SoLA will have 10 problems: five corresponding to the first set of learning objectives and five corresponding to the five new learning objectives from Phase 2.
> You do not have to answer the questions corresponding to the first five learning objectives you have mastered already.
> Instead, you are free to attempt the additional five areas new to SoLA 2 as well as the problems corresponding to the fourth and fifth objectives from LAP 1 that you missed previously.

*SoLA 4* during finals week is a *last-chance* assessment period.
No new learning objectives are introduced, but you are free to re-attempt any objectives that you missed in previous LAs.  

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

For programming problems in learning assessments, we are concerned primarily with correctness rather than design.
Make sure that your program works according to the specification outlined in the problem by testing it on a variety of inputs.
Pay attempt to the prompt for guidance about what aspects of design you need to include in your program, *e.g.*, documentation or explicit test suites.

**Written problems**

For problems with written responses, we are looking for responses that *address the prompt directly and concisely*.
In particular, if a written problems asks you to solve a problem in a certain style or show your work, *e.g.*, the trace of the execution of a program, make sure to include this information in the style presented in class.
