---
title: Functional Problem Solving
permalink: /syllabus/
---

*(Last updated: 1/28/2023)*

(*Due to the rapidly changing world that we find ourselves in, the policies of this syllabus are perpetually subject to change.*
*Significant changes to course policies will be announced in class in addition to being reflected in the syllabus online.*)

## Overview

How do we harness the power of modern-day computation to solve problems?  Why is computation so pervasive in this information age?  What is this field, computer science, that drives much of this innovation?

To address these questions, we will introduce you to the basics of *computational problem-solving*: describing and decomposing problems of a computational nature so that we can implement their solutions with a computer program.
We will demonstrate that computational problem-solving is the essence of computer science and is an essential first step in understanding the discipline and its effects on society.
By the end of this course, you should be able to:

+ Describe the fundamentals of computer science: algorithms, data structures, and abstraction.
+ Read and write computer programs *in the small* in the Scheme programming language.
+ Solve problems using design strategies from functional programming: functional decomposition, computational pipelines, and recursive decomposition.
+ Carry out the basics of the software engineering process: design, documentation, development, testing, and debugging.

In addition to these primary outcomes, we also expect you will take away more general skills and knowledge related to the discipline:

+ Describe the benefits of collaboration in problem-solving and employ best practices when working in groups.

**Computer Music**

Computational thinking and computational techniques can be applied to a wide variety of domains.
At Grinnell, we have a tradition of picking a domain or "theme" for each offering of CSC-151.
The theme for this semester is *computer music*, the application of computational techniques toward creating, analyzing, and consuming audio.
We'll take two perspectives on music in this course:

+   A *high-level* perspective: what is the structure of a musical composition and how can we realize that composition in a computer program?
+   A *low-level* perspective: how is audio generated represented and processed by a computer program?
    What sorts of analyses can we perform over this representation?

**Why take CSC-151?**

Basic knowledge about solving problems computationally is useful in careers involving *every* major and concentration offered at Grinnell.
This course outfits you with some versatile concepts applicable to other programming languages and environments you will encounter in the wild.
Finally, you have the opportunity to be creative in many ways, from problem solutions to finding new approaches to data.
Creativity is highly encouraged!

**Important Notices**

+ Experience shows that CSC-151 exercises different parts of your brain than other courses (even other math and science courses).
  Expect some challenges, but have confidence that you can work through them and that you'll come out of the course with much more knowledge.
+ Like learning a foreign language, learning in this course is cumulative: new ideas often build on ideas from earlier.
  If you feel like you've missed something important, please get in touch with the course staff as soon as possible for assistance!
+ Computers have no common sense or compassion.
  They are complex, and sometimes they do things we don't expect.
  When things go wrong, don't blame yourself.
  Ask your instructor, your mentor, or a tutor for help!

We are also using software developed at Grinnell and may still have some bugs lurking within.
Thus, you should develop a habit of saving your work frequently!

## Time and workload

A Grinnell 4-credit course, like this one, should involve approximately 180 hours of work.
Across a 14-week term (plus finals week), that ends up being approximately 12 hours of work per week.
While these are gross generalizations that vary for each individual, you should expect to break down these 12 hours as follows:

+   Four hours per week in class
+   Three hours per week on readings (one hour per day)
+   Four hours per week on either mini-projects or SoLAs, and
+   One hour per week for mentor sessions.

If you find yourself working much more than the expected amount in this course, please let us know.
It could be that other approaches, or better support resources, can help.

## Software, textbooks, references, technology, and such

There are several software packages we use in this course both for learning how to program as well as conducting learning online.

+   [Visual Studio Code](https://code.visualstudio.com), a general-purpose Integrated Development Environment (IDE).
+   [Scamper](https://github.com/slag-plt/scamper-lang), an implementation of a subset of the [Scheme](https://en.wikipedia.org/wiki/Scheme_(programming_language)) programming language as an extension to Visual Studio Code.
+   Your [Grinnell Office365 account](https://office365.grinnell.edu) for email and [Microsoft Teams](https://teams.microsoft.com) for discussion and collaboration.
+   [Gradescope](https://gradescope.com) for assignment submission and feedback communication.

Please make sure you can access all of these resources, and please let me know if you have any problems with access.

There is no required textbook for this course, as the material is written by Grinnell faculty and posted on the course website.
However, there are some useful textbooks and references you may want to bookmark or keep handy.

### Books

+   [Dybvig, Kent R., _The Scheme Programming Language_ (Third Edition), MIT Press, 2003.](https://www.scheme.com/tspl3)
    *An effective reference and guide to learning the complete Scheme programming language.*
+   [Felleisen, Matthias, Findler, Robert Bruce, Flatt, Matthew and Krishnamurthi, Shriram, _How to Design Programs_ (2nd Edition), MIT Press 2018.](http://www.htdp.org)
    *A wonderful guide, particularly for later topics in the course like higher-order programming, re-factoring, and recursion.*

## Diversity and inclusion

We believe that any college-level course should challenge you and put you outside of your comfort zone.
Our mission as instructors is to help you manage that discomfort so that you can grow in knowledge and maturity.
Therefore, we strive to create a fully inclusive setting so that we all can ultimately succeed in the classroom.

### Religious observance policy

We support the class's religious diversity and anyone who needs to balance academic work with religious observations.
Please let us know by **week two** if you will need to be absent from class for any religious holidays this semester, and we can work out an appropriate schedule for making up absences or missed work.

### Community guidelines

Our class is a learning community.
We should behave as such.
Among other things, that means treating others with respect, not only in the language that we use (no slurs, please), but also in taking ideas, approaches, and perspectives seriously.
We will discuss appropriate guidelines for the class throughout the semester, developing those guidelines as a community.

### Other Accommodations

There are a limitless number of dimensions to diversity and inclusion, the totality of which are unaddressable with a finite set of policies. These may include other issues best addressed earlier in the semester (e.g., student-athlete scheduling) or as they arise (e.g., chronic health flare-ups). We will do our best to be flexible in these cases with the overall goal of facilitating your growth in this course. To do this, we need to receive advanced notice from you **at least one week in advance** so that we can make suitable arrangements. For situations that arise within a given week, we will ask you to utilize the token system (described in the evaluation section) to manage your workload.
Grinnell College makes reasonable accommodations for students with documented disabilities. Students need to provide documentation to the Coordinator for Disability Resources (Jae Hirschman - 641-269-3124) and discuss their needs with them. Students should then notify us within the first few days of classes so that we can discuss ways to ensure their full participation in the course and coordinate their accommodations.

## Evaluation and grading

Our grading philosophy comes from the _grading for growth_ movement described in such texts as Nilson's _Specifications Grading_, Feldman's _Grading for Equity_, and Blum's _Ungrading_.
We believe that:

1.  The stated learning outcomes are achievable by anyone that enrolls in this course.
2.  Mastery of the learning outcomes is obtained via exploration, experimentation, and failure.
3.  Eventual mastery should be valued as highly as "getting it right" the first time.
4.  Your final course grade should reflect your mastery of the course's learning goals at the end of the term.

To this end, the course is structured around several deliverables that, when taken together, indicate your mastery of the course's learning outcomes outlined in the [Overview section](#course-learning-outcomes) of the syllabus.

### Deliverables

The main activities of our course are centered around five kinds of deliverables:

+   **Reading problems**: practice problems due at the beginning of each class period that reinforce the material introduced in the readings.
+   **Lab exercises**: practice and exploration-style problems completed during class, frequently in a collaborative fashion.
+   **Mini-projects**: individually completed assignments that apply the weekly concepts to problems of significant complexity.
+   **Core exams**: in-class exams that directly assess mastery of the core skills of the course.
+   **Group project**: a final group-based project completed during the last half of the semester that acts as a capstone for your learning during the semester.

#### Reading problems

In each course reading, you will find a small number of practice problems that reinforce the concepts introduced in the reading.
As the old saying goes, "programming is not a spectator sport," and so these drills are designed to help you begin putting the day's topics into practice.

+   Each day's reading problems are due **before the start of the day's class period**.
+   Reading problems are graded on a binary **satisfactory (S)/non-satisfactory (N)** scale.
    If it is clear that you have put effort into your responses by completing the problems with mostly positive results, you can expect to receive a satisfactory grade.
+   Late reading problems will not be accepted unless you spend a token. (See below for details.)
+   On most days, you will check your reading problem solutions with your weekly lab partner at the start of class. Make sure to have your solutions readily accessible!

#### Lab Exercises

The bulk of your practice and exploration of the course learning goals come through lab exercises.
These lab exercises will allow you to gain familiarity and eventual fluency with the course concepts by exploring and working through problems.
More often than not, lab exercises are completed in small groups so that you can take advantage of the benefits of collaborative learning.

+   Each set of labs are due **the Sunday of the week that the lab is assigned**.
    For example, if labs are assigned on Monday, Wednesday, and Friday, these labs are due the same week on Saturday.
+   Like daily drills, labs are graded on a binary **satisfactory (S)/non-satisfactory (N)** scale.
+   Also, like dailies, late labs will not be accepted unless you spend a token.
+   Solutions for the labs are posted a few days after they are due.
    Again, you are expected to check your work against these solutions and bring any subsequent questions you have to the course staff.

#### Mini-projects

_Mini-projects_ are opportunities for you to demonstrate mastery of the course learning goals by applying these concepts and skills to problems larger in scope and complexity than the labs.
As often as possible, these projects are drawn from real-world domains to also help you begin drawing connections between the course and other areas of computer science.

We grade mini-projects in more depth than the other deliverables, specifically along two dimensions:

+   Is the deliverable _correct_?
    Does it accurately solve the posed problem?
    Does it meet the specification outlined in the problem description?
+   Is the deliverable _well-designed_?
    Does it follow the design requirements and conventions appropriate to the medium?
    Is the deliverable clear, and does it communicate a proper understanding of both the problem and its solution?

Rather than using a point-based system that obscures these two dimensions, we codify these requirements with an _EMRN rubric_ (an adaption of the ["EMRF" rubric](http://miss-serwy.weebly.com/uploads/1/2/1/6/12161802/emrf_rubric_1.pdf) designed by Stutzman and Race).
Demos are graded on a four-point scale:

+   **Excellent (E)**
    -   Complete understanding of the material is evident.
    -   Exhibits, at worst, a few minor design errors and can serve as an exemplar solution for the course.
+   **Meets Expectations (M)**
    -   Complete understanding of the material is evident without the need for further revision.
    -   Exhibits some minor correctness or design errors that can improve the submission significantly if revised.
+   **Needs Revision (R)**
    -   One or more misunderstandings of the material are evident from the work.
    -   Exhibits many minor errors or one or more major errors that necessitate revision.
+   **Not Completed (N)**
    -   Not completed to a degree where understanding is evident.

Each mini-project has a specific rubric in its write-up that outlines what we will be looking for regarding correctness and design.

Note that excellent ratings represent work that reflects mastery of the material and mindfulness toward producing quality work.
To obtain excellent ratings, you should dedicate ample time to review and revise your work---just like writing a paper---before the deadline.

**Mini-project Revisions and Feedback**

To promote learning and encourage you to produce quality work, we use a revision system for mini-projects:

+   If you earn an **E** on a mini-project, you do not need to perform further revision!
+   If you earn an **M** or **R** on a mini-project, the feedback you receive will be reflective of what you need to change to achieve an **E**.

You are, then, free to turn in a revision of a mini-project based on your prior submission's feedback.
Revisions for a mini-project are due _one week_ after your receive feedback on your initial submission.
If you would like to revise this work beyond the initial revision period, you must use a token to do so (see below).

When submitting a revision, you must include a short _changelog_ at the beginning of your submission summarizing the changes you have made.
Such a changelog will help us process your revision quickly.

**Incomplete Assignments**

An **N** indicates that your submission was not complete enough for us to ascertain that you understood the material or we are unable to give you substantial feedback.
With the rapid pace of the course, an **N** also indicates that you are behind and need to put in extra effort to catch up.

If you earn an **N** on a mini-project, you **must meet with us either during office hours or through a 1-on-1 meeting**.
In this meeting, we will:

+   Identify any gaps in your understanding of the material.
+   Develop a plan to get back on track.

#### Core Exams

We deem some of the learning outcomes of the course as _core outcomes_, demonstrable skills that you should be confident in performing by the end of the semester.
To directly assess your mastery of these skills, we will conduct a series of _core exams_ during the semester.
Core exams are inspired by [mastery-based testing practices](https://mbtmath.wordpress.com/) found in mathematics.

Core exams consist of one problem for each core learning outcome of the course covered so far at the time of the exam.
This includes all learning outcomes covered in previous core exams, allowing you re-attempt problems if you missed them on previous exams!

Core problems are graded on a **binary satisfactory (S)/non-satisfactory (N)** scale where a satisfactory answer is _completely correct_ (modulo minor flaws that are understandable given the timed, in-class nature of the exam).
Note that, unlikely the demonstration exercises, core exams more closely resemble the reading problems in terms of their scope and complexity.
Once you receive an **S** on a problem tied to a particular core outcome, you do not need to attempt additional problems connected to that outcome in subsequent exams, _i.e._, you have demonstrated mastery of that outcome, so you are done with it!

The final core exam period of the course, held during finals week, is a _revision core exam_.
No new learning outcomes are introduced so that you have a final opportunity to demonstrate mastery of any core outcomes that you have missed throughout the semester.

#### Group Project

Finally, the _course group project_ is an opportunity to dive deep with a group of your peers and further explore the themes of this course with a project of your own design.
The details of the group project will be released in the second half of the semester, and you should plan to spend substantial time outside of class working with your group to complete your project.

Your grade for the group project will not rest on your final output.
Instead, each member of your group will write an _individual reflection_ outlining your contributions to your project and answering specific questions about the design of your final product.
We will then assess this reflection on whether it demonstrates that you have met the learning objectives for the project.

### Overall letter grades

Major letter grades for the course are determined by _tiers_, a collection of required grades from your demos and core exams.
You will receive the grade corresponding to the tier for which you meet _all_ of the requirements.
For example, if you qualify for the A tier in one category and the C tier in another category, then you qualify for the C tier overall as you only meet the requirements for a C among all the categories.

Note that I reserve the right to update the requirements for grades as circumstances dictate during the semester, _e.g._, if a deliverable is cut.
However, I will always update the requirements so that they are **no stricter** than they were previously.

---

(*Last updated: {{ site.data.bundles.last-updated }}*)

<table class="table">
<thead>
<tr>
<th scope="col">Overall</th>
<th scope="col">Mini-projects ({{ site.data.bundles.totals.mps }})</th>
<th scope="col">Core exams ({{ site.data.bundles.totals.core }})</th>
<th scope="col">Group project</th>
</tr>
</thead>
<tbody>
{% for tier in site.data.bundles.tiers %}
<tr>
<th scope="row">{{ tier.grade }}</th>
<td>{{ tier.mps }}</td>
<td>{{ tier.core }}</td>
<td>{{ tier.project }}</td>
</tr>
{% endfor %}
</tbody>
</table>

+ **D**: 2 requirements of a C are met.
+ **F**: 0--1 of the requirements of a C are met.

**Plus/minus grades**

The tiers above reflect whole letter grades.
In situations where you successfully meet the requirements of one tier and partially meet the requirements of the next tier, you will earn a plus/minus letter grade as follows:

+   If you fulfill two of the requirements of the higher tier and one requirement of the lower tier, you earn a minus grade for the higher tier, _e.g._, an A- if you are between a B and A grade.
+   If you fulfill one of the requirements of the higher tier and two requirements of the lower tier, you earn a plus grade for the lower tier, _e.g._, a C+ if you are between a C and a B.

Note that Grinnell does not give C- and D+ grades, so this policy does not apply if your letter grade is between a D and C.

**Reading problems and labs**

You are allowed to miss:

+   **Three** reading problems and
+   **Three** lab assignments

In the semester without penalty.
This corresponds to missing a week of work due to illness, sports obligations, or other events that arise during the semester without significant prior notice.

Starting with the 4th missing reading problem or lab assignment, your overall letter grade will be lowered by **half a letter grade** for every two additional problems/assignments that you miss.
For example:

+   If you miss four reading problems, your overall letter grade drops by half.
+   If you miss five reading problems, you lose a full letter grade.
+   If you miss six reading problems, you miss a full letter grade.

And so forth for additional missing reading problems and similarly for labs.
Note that there is no limit to the number of letter grades that you lose due to this policy.

## Course Breakpoints

Our grading system offers flexibility, but at the cost of giving the illusion that if you fall behind in your work, there is always an opportunity to catch up.
While this is true in theory, in practice, it is difficult to do so in many situations because of personal issues, competing courses, extracurricular obligations, _etc._
This flexibility also makes it difficult---for both you and myself---to determine when you have fallen behind in the course and need external help whether that it is from the course staff, tutors, or academic advising.

We encourage you to also preemptively come to any member of the course staff—instructors, mentors, _etc.—for help and guidance if you feel like you are falling behind.
However, to be more clear about when you might be falling behind in the course, we am tracking the following _course breakpoints_ in your progress.
When one of the following situations occurs:

+   You miss more than 2 days of classes in a row.
+   You have used all your tokens.
+   You receive an N on a mini-project.
+   You do not turn in a revision for a mini-project graded as an R.
+   After a learning assessment, your total completed outcomes among all outstanding core outcomes are below 60%.
+   You are otherwise at substantial risk of earning below a C in the course.

I will follow up with you as well as academic advising (via an academic alert) to check in, provide guidance, and develop a plan for getting back on track, _e.g._, assigning an individual tutor.

## Tokens

Tokens reflect that life inevitably rears its ugly head in some fashion and ruins your best-laid plans.
You begin the course with **3 tokens**, and you may use **1 token** to:

+   Turn in any one reading problem or lab (due by the end of the semester)
+   Turn in a mini-project or a revision of a mini-project up to 48 hours late.
+   Turn in an additional revision of any mini-project (due by the end of the semester)

In most cases, I will charge tokens automatically by noting the time of your submission on Gradescope.
You can check your current token status on Gradescope.

At the end of the semester, if you have used more tokens than you possess, those extra "negative tokens" will count against your final grade.
+   Overspending of 1--5 tokens will drop your grade by half letter, _i.e._, from a B+ to a B.
+   Overspending of 6--10 tokens will drop your grade by a full letter, _i.e._, from a B+ to a B-.
+   Overspending of 11--15 tokens will drop your grade by a letter and a half, _i.e._, from a B+ to a C+.

And so forth for every 5 overspent tokens.

You can earn additional tokens on top of your initial three topics by attending CS-related community events such as CS extras or CS table.
To do so:

+   Attend a valid event. Please ask if the event counts if the event is not directly sponsored by the department.
+   Write a reflection about the event on Gradescope within **48 hours** of the event.

## Help and collaboration

To help expedite your learning, you can rely on the course staff and your classmates as outlets in this course.

### Teams

Use Teams as a first point for asking questions (that are appropriate for the whole class to see) by posting in the "Questions and Answers" channel.
Also, feel free to answer questions as you are able and contribute to our learning community!

### Contacting the course staff and peer mentors

When contacting the course staff directly, please use either email or Microsoft Teams DMs.
Each course staff member has a preference for one medium over the other, so please ask them before sending a message.
Regardless of the medium, note that we will _not_ generally not respond immediately—we will check our messages at fixed times throughout the day.

The **course mentors** also hold optional *mentor sessions* outside of regular class time.
In these sessions, the mentors guide you through practice problems designed to help you master the material and answer any questions you have about the material.
We highly recommend you attend each of these sessions, even if you feel like you understand the material.
You never know what you don't know, and the purpose of these sessions is to bring these blind spots to light!

The CS department provides **evening tutors** from 7--10 p.m. most nights of the week (Sunday through Thursday).  We encourage you to make use of the evening tutors. 

The CS department also provides **individual tutors** as needed.  If you find yourself struggling with the material, please let me know and we will work with our peer education coordinator to get one assigned to you.

## Academic honesty policies

Utilizing discussion with peers and other external resources to facilitate your learning is a critical skill for success in computer science.
However, at the same time, you must be aware that getting stuck and pushing through challenging problems is essential for making your learning robust.
To this end, we allow the following forms of collaboration:

+   You are encouraged to collaborate with your peers on **reading exercises and labs**.
    You may also consult the course staff as well as other people and external resources.
    In all cases, you (or your group in the case of group work) should independently write up your solutions and cite all the resources you used in authoring your work, including the other students.
+   You may only discuss **mini-projects and core exams** with the course staff.
    When completing mini-projects, you may only consult the course website.
    You may not collaborate with peers, consult external resources beyond the ones mentioned above, or share information about these assignments with others.
    Core exams are conducted during class, and you are not able to bring external materials to the exam.

Keep in mind that *adaptation of pre-existing code* whether it comes from a peer, myself, or the Internet, requires a citation in cases where it is allowed.
Also, whenever you are expected to show your code's output, you are expected to reproduce the output faithfully.
In other words, you should not forge the results of your programs!

In all cases, the work that you produce should be your own.
The golden rule is that you should be capable of reproducing your deliverable on the spot with minimal effort if it was accidentally deleted.

If you feel that the stress and pressure of the course are compelling you to violate the academic honesty policies of the course and the college as explained in the [student handbook](https://catalog.grinnell.edu/content.php?catoid=12&navoid=2537#Honesty
_in_Academic_Work), **please talk to an instructor as soon as possible**.
The course's grading policies as designed to help you manage your time in light of the different stressors in your life.
We will do my best to work with you to figure out how to help you better manage your time relative to your learning goals and desired achievement level for the course.

### Code completion assistants

In an introductory programming course, we believe you must write code yourself to internalize the material.
The act of construction reinforces concepts, checks your knowledge, and gives you opportunities for learning by failure that ultimately accelerate your learning.
Similarly to prose, there are _auto-completion tools_ for programming that will write various parts of the code for you.
While useful in production scenarios, these tools deny you the opportunity to learn by construction.
Consequently, we disallow **any auto-completion tools not already provided by the course software**.
This includes auto-completion provided by extensions or plugins to the course's recommended IDE beyond those required by the course.

### Sharing of course materials

While you retain [copyright](https://www.plagiarism.org/blog/2017/09/25/do-i-own-my-work-even-if-im-just-a-student) of the work you produce in this course, we must still uphold the academic integrity of this course.
To this end, you may not share copies of any of your assignments with others (unless otherwise allowed by the course policies) or upload your assignments to third-party websites unless substantial changes are made to the assignment (*e.g.*, extensions and improvements to your code) so that it is clear that the end product is significantly different from what was asked in the original assignment.
I do recognize that there are times when you want to do this, *e.g.*, uploading projects to Github for your resume or to show to friends and family, and so I encourage you to talk to me in advance so that we can ensure that you upload a meaningful project that does not run afoul of this policy.
