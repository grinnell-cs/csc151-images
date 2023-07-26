---
title: Learning assessments
summary: How we assess your learning.
permalink: /las/
---

# Learning assessments

To directly assess your mastery of the learning objectives of this course, we will conduct a series of sets of learning assessments (SoLAs) over the course of the semester.
Each will contain assessments from one or more Learning Assessment Phases (LAPs).
The use LAs of this course is inspired by [mastery-based testing](https://mbtmath.wordpress.com/) practices found in mathematics.

There are four primary SoLAs in the course, along with one optional final SoLA.

+ SoLA 1 (LAP 1): Week 4, Wednesday--Thursday, 20--21 September 2023
+ SoLA 2 (LAPs 1&2): Week 7, Wednesday--Thursday, 12--13 October 2023
+ SoLA 3 (LAPs 1--3): Week 10, Wednesday--Thursday, 9--10 November 2023
+ SoLA 4 (LAPs 1--4): Week 14, Wednesday--Thursday, 6--7 December 2023
+ SoLA 5 (LAPs 1--4): Finals week

SoLAs consist of a set of individual assessment problems---one problem for each learning objective of the course covered so far.  The approximate lists of learning objectives by LA period are listed below.  You will begin your learning assessments during class time.   If you need extra time (e.g., for individual assessments left over from the prior assessment), you will have slightly more than **one day** to complete the problems.  All problems are released online in Gradescope.  You may choose to attempt as many of the individual assessment problems as you wish for that period.  As described in the [syllabus]({{ "/syllabus" | relative_url }}), LA problems are graded on a binary *satisfactory/non-satisfactory*.
Once you receive a satisfactory on a problem tied to a particular learning objective, you do not need to attempt additional problems tied to that learning objective in subsequent SoLAs, *i.e.*, you have demonstrated sufficient mastery of that objective, so you are done with it!

> **Example**: The first SoLA will have seven problems corresponding to seven learning objectives from the first Learning Assessment Phase described below.
> Suppose that you receive S grades on the first five problems but not the sixth or seventh.
> The second SoLA will have 14 problems: seven corresponding to the first set of learning objectives and seven corresponding to the seven new learning objectives from Phase 2.
> You do not have to answer the questions corresponding to the first five learning objectives you have mastered already.
> Instead, you are free to attempt the additional seven areas new to SoLA 2 as well as the problems corresponding to the sixth and seventh objectives from LAP 1 that you missed previously.

*SoLA 5* during finals week is a *last-chance* assessment period.  No new learning objectives are introduced, but you are free to re-attempt any objectives that you missed in previous LAs.  SoLA 5 will be distributed on Tuesday morning and due Wednesday evening.

I will use class time on SoLA days to answer questions.  As [the schedule](../schedule/) suggests, I will hold a review session during class time on reading day.

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

For programming problems in learning assessments, we are concerned primarily with correctness rather than design.  Make sure that your program works according to the specification outlined in the problem by testing it on a variety of inputs.  Pay attempt to the prompt for guidance about what aspects of design you need to include in your program, *e.g.*, documentation or explicit test suites.

**Written problems**

For problems with written responses, we are looking for responses that *address the prompt directly and concisely*.  In particular, if a written problems asks you to solve a problem in a certain style or show your work, *e.g.*, the trace of the execution of a program, make sure to include this information in the style presented in class.

## Sample SoLAs

_Forthcoming._
