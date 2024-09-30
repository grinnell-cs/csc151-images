---
title: Functional Problem Solving
permalink: /syllabus/
---

# CSC-151-03 (Functional Problem Solving, Fall 2024)

## About

<dl class="dl-horizontal">
  <dt>Instructor</dt>
  <dd>
    <p><a href="{{ site.instructor_homepage }}">{{ site.instructor }}</a></p>
  </dd>

  <dt>Class Meeting Times</dt>
  <dd>
    <ul class="list-unstyled">
      {% for item in site.meeting_times %}
        <li>{{ item | markdownify | remove: "<p>" | remove: "</p>" }}</li>
      {% endfor %}
    </ul>
  </dd>

  <dt>Instructor Office Hours</dt>
  <dd>
    <ul class="list-unstyled">
      {% for item in site.office_hours %}
        <li>{{ item | markdownify | remove: "<p>" | remove: "</p>" }}</li>
      {% endfor %}
    </ul>
  </dd>

  {% if site.review_sessions %}
    <dt>Review Sessions</dt>
    <dd>
      <ul class="list-unstyled">
        {% for session in site.review_sessions %}
          <li>{{ session }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}

  {% if site.textbook %}
    <dt>Textbook</dt>
    <dd>
      {{ site.textbook | markdownify | remove: "<p>" | remove: "</p>" }}
    </dd>
  {% endif %}

  {% if site.mentor %}
    <dt>Class Mentor</dt>
    <dd>{{ site.mentor }}</dd>
  {% endif %}

  {% if site.mentors %}
    <dt>Mentors</dt>
    <dd>
      <ul class="list-unstyled">
        {% for mentor in site.mentors %}
          <li>{{ mentor }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}

  {% if site.mentor_sessions %}
    <dt>Mentor Sessions</dt>
    <dd>
      <ul class="list-unstyled">
        {% for session in site.mentor_sessions %}
          <li>{{ session | markdownify | remove: "<p>" | remove: "</p>" }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}

  {% if site.tutors %}
    <dt>CS Tutors</dt>
    <dd>
      <ul class="list-unstyled">
        {% for tutor in site.tutors %}
          <li>{{ tutor }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}

  {% if site.tutor_sessions %}
    <dt>Evening Tutor Sessions</dt>
    <dd>
      <ul class="list-unstyled">
        {% for time in site.tutor_sessions %}
          <li>{{ time }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}
</dl>

Welcome to CSC 151! In this class, you will learn computer programming using the Scamper programming language. You do not need any prior knowledge of computer science or programming. Section 03 will focus on image making and manipulation.


## Learning Objectives

This course covers 18 learning objectives (LOs). 

* Unit 1 (Weeks 1–4)   
    - **Decomposition**. Decompose a computational problem into smaller sub-problems amendable to implementation with functions.   
    - **Procedural abstraction**. Take a concrete implementation in Racket and create a procedure that generalizes that behavior.   
    - **Tracing.** Trace the execution of a Racket program using a substitutive model of computation.   
    - **Primitive types**. Express basic computations over primitive values and their associated standard library functions.   
    - **Conditionals**. Use Boolean expressions and conditional operations to produce conditional behavior.   
    - **Testing**. Test programs according to good software engineering principles.   
    - **Documentation**. Document programs according to good software engineering principles.   

* Unit 2 (Weeks 5–8)   
    - **Local bindings**. Refactor redundancy and add clarity in computations with let-bindings.   
    - **Lists**. Manipulate lists with fundamental higher-order list functions.   
    - **List recursion**. Design and write recursive functions over lists.   
    - **Numeric recursion**. Design and write recursive functions over the natural numbers.   
    - **Higher-order programming**. Write procedures that take procedures as parameters and return procedures as results.   

* Unit 3 (Weeks 9–13)   
    - **Lambda-free anonymous procedures**. Use section and composition to simplify computations.   
    - **Dictionaries**. Design and write functions that use dictionaries.   
    - **Vectors**. Design and write functions (potentially recursive functions) that use vectors.   
    - **Data abstraction**. Design data structures to separate interface from implementation.   
    - **Tree recursion**. Design and write recursive functions over trees.   
    - **Running time**. Use a mental model of computation to count the relevant number of operations performed by a function. 

## Communication

Course Website
: This website contains all courses policies. Course materials and homework deadlines will be posted here as they become available. Familiarize yourself with the website so you know where to find everything.

Email
: Your instructor will send course announcements via email. You are responsible for reading all email from your instructor.

Microsoft Teams
: Our class has a Teams channel for Q\&A shared by all three sections. If you have a question and others in the class could benefit from its answer, please post in the teams Q\&A channel.

Getting in touch with your instructor
: If you need to get in touch with me privately, use email or teams. We try to reply to messages within about 24 hours, excluding weekends and holidays. If you do not hear back within that amount of time, please send a reminder.

Gradescope
: You will submit assignments via gradescope. Please confirm that you have been added to this class on gradescope.

## Class meetings and help resources

Class meetings
: Most days of class are lab days. Your instructor will make announcements and might briefly present concepts. Most of the time, you will collaborate with your lab team on programming practice problems. 

Evening tutors
: 5 days per week, peer educators will be available in our classroom during certain hours to help you with homework questions. You can drop in at any time to work on your homework or ask a question.

Mentor sessions
: 3 times per week, a peer educator will hold a supplementary session where they might offer a review of concepts from class or practice problems. You should show up at the start of the session and stay until the end.

Informal time
: You are encouraged to come to our classroom to study and work at any time that the room is not reserved for class or a meeting. This is an opportunity to study with peers and form community.

Office hours
: Your instructor will hold office hours each week. This time is for you to meet with your instructor and talk about any course related matter that you like\!

Individual tutors
: If you are taking advantage of the resources above and need more help, contact your instructor to request an individual tutor to meet with you one-on-one.

[**Academic advising**](https://www.grinnell.edu/about/leadership/offices-services/academic-advising)
: Grinnell offers academic coaches available to you as a resource to help you develop learning strategies and support you in your learning.

## Deliverables

Reading responses
: Prior to each class meeting, you will read an online reading assignment about computing concepts, work through code examples in a programming environment, and answer a few questions about the reading

Labs
: During each class meeting, you will work with a partner to complete programming exercises to practice the concepts from the readings

Take-Home Assessments
: About once per week you will complete an individual programming assignment where you apply and extend concepts from readings and labs. No programming assignment on midterm exam weeks.

Final project
: The final programming assignment will be more open ended and completed in teams.

Quizzes
: About once per week, you will complete an individual, 15-minute quiz in class on paper (time extended according to any accommodations)

Exams
: 4 times during the semester, you will complete an individual midterm exam in class on paper, lasting the entire class period (time extended according to any accommodations)

Pre-reflections
: Before each take-home assessment and each exam, you will answer some reflection questions to help you prepare and feel confident to dive in. 

Post-reflections
: After each take-home assessment and each exam, you will answer some reflection questions to help you understand what went well and what went poorly.

## Collaboration and Resources

Computer science is collaborative, and we encourage much collaboration in your learning. However some of your course work is intended to assess individual knowledge and must be completed individually. When you do collaborate, make sure to collaborate in ways that support, rather than undermine, your learning.

Here are the collaboration policies for each type of coursework:

Reading responses
: 
- You are encouraged to work with others to understand the readings
- Write your own answers to the reading response 
- You may get help from course staff and peers 
- Make sure you are able to explain all submitted answers yourself

Labs
: 
- Typically completed in teams of 2 (might be a team of 1 or 3 under certain circumstances)
- All team members should contribute equally to all parts of the lab
- You may get help from course staff and peers outside your team
- Make sure every team member can explain your team's answers

Take-home Assessments
: 
- Completed individually
- As help resources, you may use **only**:
  - the course website
  - your own class notes (those you have written yourself)
  - your own lab solutions (written by you and your lab partners)
- You may get help from course staff, including evening tutors, mentors and instructors
- You may **not** discuss the assessment with or get help from peers, inside or outside the class
 
Quizzes and Exams
: 
- Completed individually in class
- No form of collaboration is permitted

Final project
: 
- Completed in groups of 3–4
- All members should contribute equally to the project
- You may get help from course staff and peers outside your team

## Grading

Here is the grading policy for each type of coursework:

Reading responses 
: 
- Graded **S/N** based on whether you answered the assigned questions with a good faith effort  
- **S** = Satisfactory
- **N** = Not satisfactory  

Labs
: 
- Graded **S/N** based on whether you answered the assigned questions with a good faith effort  
- **S** = Satisfactory
- **N** = Not satisfactory  

Take-Home Assessments and the Final Project
: 
- Graded **EMRN** based on correctness and following instructions  
  * **E** = Exceeds expectations  
  * **M** = Meets expectations  
  * **R** = Needs revision  
  * **N** = Not complete (did not make a good faith effort)  
- Criteria for each letter grade are given on the homework instructions for each assessment.

Learning Objectives (Quizzes and Exams)
: 
* You will demonstrate your mastery of each Learning Objecive (LO) in assessments (quizzes or exams).   
* Each quiz gives you an opportunity to demonstrate mastery of **one** LO.  
* Each exam gives you an opportunity to demonstrate mastery of **every** LO that has been covered in class up until the date of the exam. There will be one exam problem for each LO.  
* Each LO is graded **S/N**
  * **S** = Satisfactory (demonstrated mastery)  
  * **N** = Not _Yet_ Satisfactory (did not yet demonstrate mastery)  
* Once you have demonstrated mastery of a certain LO, you do not need to be assessed on that LO again. That is, you can skip exam problems about LOs you have already mastered.

### Final grade

Major letter grades for the course are determined by _tiers_, a collection of required grades from your demonstration exercises and core exams. You will receive the grade corresponding to the tier for which you meet _all_ of the requirements. For example, if you qualify for the A tier in one category and the C tier in another category, then you qualify for the C tier overall as you only meet the requirements for a C among all the categories.

{: .table}
| Tier  | Take-Home Assessments (8 total)    | Learning Objectives (16 total)  | Project (1) |
| ----- | ---------------------------------------------- | ------------------ | ----------- |
| **C** | No **N**s, at most 2 **R**s, at least 2 **E**s | At least 10 **S**s | **R**       |
| **B** | No **N**s, at most 1 **R**, at least 4 **E**s  | At least 12 **S**s | **M**       |
| **A** | No **N**s or **R**s, at least 6 **E**s         | At least 14 **S**s | **E**       |

- **D**: two of the requirements of a C are met.
- **F**: zero or one of the requirements of a C are met.

**Plus/minus grades**

To earn a plus/minus grade, you must have completed one tier’s requirements and partially meet the next tier’s requirements. This will arise in two situations: **C/B** and **B/A**. For example, you may completely meet the requirements of a **C** and meet the requirements of a **B** for take-home assessments but not for core learning outcomes.

+ If you have completed **two** of the upper tier's requirements, then you earn a minus grade for the higher tier, _i.e._, B- if you are between a C and B.
+ If you have completed **one** of the upper tier's requirements, then you earn a plus grade for the lower tier, _i.e._, C+ if you are between a C and B.

Be aware that if you are at an A tier for one deliverable category but at a C tier for another, then you fully qualify for the C tier and partially meet the requirements of the B tier and thus would be considered for plus/minus grades in the B/C range.

**Reading responses, labs, and reflections**

- You may earn an N  **at most six** timely work deliverables (reading responses, labs, and reflections) without penalty. Note that unsubmitted work earns an N.
- After the first six deliverables, your overall letter grade will lower by **one-third of a letter grade** (_i.e._, A becomes A-, B- becomes a C+, C becomes a D) for **every two additional deliverables you miss**. 

The following table summarizes this policy for concrete numbers of deliverables through 12, although the policy extends to any number of deliverables.

{: .table}
| Ns earned on timely work| Letter adjustment |
| --------------------- | ----------------- |
| 0–6 deliverables      | -0	            | 
| 7 deliverables        | -1/3	            | 
| 8 deliverables        | -1/3	            | 
| 9 deliverables        | -2/3	            | 
| 10 deliverables       | -2/3	            | 
| 11 deliverables       | -1	            | 
| 12 deliverables       | -1	            |

### Deadlines and Late Days

Check the schedule to see your assignments. Check Gradescope to see the time of day that each assignment is due. Due times are typically as follows:

Readings
: 10 pm the day BEFORE it appears on the schedule  

Labs
: 10 pm on the next lab day (except around breaks and exams)  

Take-Home Assessments
: 10 pm the day it appears as "due" on the schedule  

Reflections
: 10 pm the day it appears on the schedule

**Late Days**

* Late days are a currency that you can spend to turn in assignments late.
* You start the semester with **10 late days**.  
* You may spend late days on reading responses, labs, pre-reflections, post-reflections, take-home assessments, and take-home assessment revisions.  
* You may spend one late day to submit any of the named assignments up to 24 hours late.  
* You may spend up to two late days on any given assignment, for a maximum lateness of 48 hours on that assignment.
* You are responsible for keeping track of your own late days.  

### Redo and Revision Opportunities

We offer redo and revision opportunities because we believe that your final grade should reflect what you know at the end of the semester rather than mistakes made along the way. 

Here are redo/revision policies for each type of coursework:

Learning Objectives (Quizzes and Exams)
: 
    * When you earn an N on an LO, you can attempt to demonstrate mastery on that LO again on every following exam.  
    * The final exam allows you to redo past LOs but does not introduce new LOs, ensuring that you get a minimum of 2 tries to earn an S on every LO.  

Take-Home Assessments
: 
    * You may revise and resubmit take-home assessments after receiving feedback.  
        * You may submit up to **2 revision assessments** in each weeklong revision period.
        * Revision periods are shown in the revision form below.
    * When revised work is graded, the new grade, if higher, replaces the old grade. Submitting revised work cannot lower your grade.  
    * To be eligible for resubmission, you must have completed the assessment homework in good faith on your first attempt, earning at least an R. Redo opportunities _cannot_ be used as a way to skip take-home assessments and do them later.
    * Resubmit an assessment by filling out the [**Take-Home Assessment Revision Request Form**](https://tinyurl.com/151-24au-revise) and resubmitting your work on gradescope. The form also clarifies some nuances of the revision policy.

Reading responses, labs, and reflections
: 
These are graded based on good faith engagement with the assigned questions and cannot be revised for credit.

## Attendance

We expect you to attend class every day because collaborative learning is such an integral part of the class. If you need to be absent, talk to your instructor as soon as you know. This means a week or more in advance for planned absences such as religious observances and sporting events.

### Sick Policy

Please stay home when you are sick. Wait to come back to class until you truly feel well enough to learn. Each day that you will miss class due to illness, contact your instructor before class (or as soon as possible).

When coming back to class, wear a mask until there is no more than a usual concern of contagion. Protecting the people around you from your illness is a matter of professionalism and personal respect.

### Late Work due to Illness and Time Away

You are responsible for checking the course website to see what is assigned while you are out and for completing all assigned work.

For any labs you missed, you must complete the lab on your own and submit it on gradescope by the lab deadline (see above section about deadlines). If you do not finish the lab after 90 minutes of focused work, you may make a comment saying that is how far you got in 90 minutes and submit what you have completed for credit.

The late day and redo policies are designed to offer flexibility so that late work resulting from one or two minor to moderate illnesses or unforseen circumstances will not lower your grade in the class. If you find yourself needing to take lots of time away, please talk to your instructor (before the deadline of the work in question) about getting additional late days or increasing the number of late days you can spend on a given assignment.

## Access Needs

To ensure that your access needs are met, I encourage individual students to approach me so we can have a discussion about your distinctive learning needs and how to meet them within the context of this course. In addition, Grinnell College makes formal accommodations for students with documented disabilities. Students with disabilities partner with the [Office of Disability Resources](https://www.grinnell.edu/about/leadership/offices-services/accessibility-disability/students) to make academic accommodation letters available to faculty via the accommodation portal. You can reach Disability Resources staff via email at access@grinnell.edu, by phone 641-269-3089, or by stopping by their offices on the first floor of Steiner Hall.

## Title IX and Pregnancy Related Conditions

Grinnell College is committed to compliance with Title IX and to supporting the academic success of pregnant and parenting students and students with pregnancy related conditions. If you are a pregnant student, have pregnancy related conditions, or are a parenting student (child under one-year needs documented medical care) who wishes to request reasonable related supportive measures from the College under Title IX, please email the Title IX Coordinator at titleix@grinnell.edu. The Title IX Coordinator will work with Disability Resources and your professors to provide reasonable supportive measures in support of your education while pregnant or as a parent under Title IX.
