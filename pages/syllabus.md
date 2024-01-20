---
title: Functional Problem Solving
permalink: /syllabus/
---
# Functional Problem Solving

<dl class="dl-horizontal">
  <dt>Instructor</dt>
  <dd>
    <p><a href="{{ site.instructor_homepage }}">{{ site.instructor }}</a></p>
  </dd>

  <dt>Meeting Times</dt>
  <dd>
    <ul class="list-unstyled">
      {% for item in site.meeting_times %}
        <li>{{ item | markdownify | remove: "<p>" | remove: "</p>" }}</li>
      {% endfor %}
    </ul>
  </dd>

  <dt>Office Hours</dt>
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
    <dt>Class Mentors</dt>
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
</dl>

## About this course

Welcome to CSC-151, Grinnell College's introductory computer science course.  In this course, we will work to develop your experience with algorithmic problem solving.  While we will be using Scheme as our programming language for this course, you will quickly see that the problem solving skills we learn in this class are applicable to other languages and in settings that don't involve programming at all.

This semester, CSC-151 will emphasize image making and manipulation.  We will consider a variety of image models along the way.

CSC-151 requires no prior knowledge of computer science or computer programming.  We'll teach you everything we want you to know. It's okay if you have some experience (although this may sometimes put you at a disadvantage; we do things differently), but it's certainly not necessary. We've found that those with prior experience and those with no experience generally seem to have the same distribution of grades.

*Due to the rapidly changing world that we find ourselves in, the policies of this syllabus are perpetually subject to change. Significant changes to course policies will be announced in class in addition to being reflected in the syllabus online.*

## Overview

How do we harness the power of modern-day computation to solve problems? Why is computation so pervasive in this information age?  What is this field, computer science, that drives much of this innovation?

To address these questions, we will introduce you to the basics of *computational thinking* and *computational problem solving*: describing and decomposing problems of a computational nature so that we can implement their solutions with a computer. We will demonstrate that computational problem-solving is the essence of computer science and is an essential first step in understanding the discipline and its effects on society.

By the end of this course, you should be able to:

+ Describe the fundamentals of computer science: algorithms, data structures, and abstraction.
+ Read and write computer programs *in the small* in the Scheme programming language.
+ Solve problems using design strategies from functional programming: functional decomposition, computational pipelines, recursive decomposition, and higher-order programming.
+ Carry out the basics of the software engineering process: design, documentation, development, testing, and debugging.

In addition to these primary outcomes, we also expect you will take away more general skills and knowledge related to the discipline:

+ Describe the benefits of collaboration in problem-solving and employ best-practices when working in groups.

### Problem domain: Image making and manipulation

Computational thinking and computational techniques can be applied to a wide variety of domains.  At Grinnell, we have a tradition of picking a domain or "theme" for each offering of CSC-151. The theme for this section is *image making and manipulation*. That is, we'll explore how to write programs that create new images (most often, abstract images) or that manipulate existing images to create new images. Along the way, we'll explore a variety of ways to think about images.

### Why take CSC-151?

Basic knowledge about solving problems computationally is useful in careers involving *every* major and concentration offered at Grinnell. This course outfits you with some versatile concepts applicable to other programming languages and environments you will encounter in the wild. Many skills, particularly decomposition, are also applicable in a wide variety of other situations. Finally, you have the opportunity to be creative in many ways, from problem solutions to finding new approaches to data. Creativity is highly encouraged!

### Important Notices

+ Experience shows that CSC-151 exercises different parts of your brain than other courses (even other math and science courses). Expect some challenges, but have confidence that you can work through them and that you'll come out of the course with much more knowledge.
+ Like learning a foreign language, learning in this course is cumulative: new ideas often build on ideas from earlier. If you feel like you've missed something important, please get in touch with the course staff as soon as possible for assistance!
+ Computers have no common sense or compassion. They are complex, and sometimes they do things we don't expect.  When things go wrong, don't blame yourself.  Ask your instructor, your mentor, or a tutor for help.

## Time and workload

Grinnell has indicated that a 4-credit course, like this one, should involve approximately 180 hours of work, which matches some guidance from the U.S. government. Across a 14-week term (plus a week of finals), that ends up being approximately 12 hours of work per week. We have not been able to get anyone to answer the question of "180 hours *for whom* and *for what grade*?", but some of us have been given the impression that we should strive for that workload for the "average" student in a course who seeks to earn a B.

In general, the twelve hours should work out to approximately

* four hours per week in class,
* three hours per week on readings (one hour per day),
* four hours per week on either mini-projects (homework assignments) or SoLAs (exams), and
* one hour per week for mentor sessions.

If you find yourself working much more than the expected amount in this course, please let me know ASAP.  It could be that other approaches to your work, or better support resources, can help.  It may also be that I'm assigning too much work.

## Diversity and inclusion

I believe that any college-level course should challenge you and put you outside of your comfort zone. My mission as an instructor is to help you manage that discomfort so that you can grow in knowledge and maturity. Therefore, I strive to create a fully inclusive setting so that we all can ultimately succeed in the classroom.

### Learning needs

I welcome you to talk to me as early as possible about your distinctive learning needs. I particularly encourage students with disabilities to meet with me and discuss how our classroom and course activities could impact their work and what accommodations would be essential. I will also make adjustments for students without documented disabilities.  However, I recommend that you seek official accommodations if it is possible and appropriate to do so. In particular, I recommend talking to our Coordinator for Student Disability Resources for guidance and further instructions:

+ Jae Baldree, Steiner 209, x3089, baldreej@grinnell.edu

You can find some additional details in [my statement on accommodations and adjustments](../handouts/accommodations).

### Religious observance policy

I also support the class's religious diversity and anyone who needs to balance academic work with religious observations.  Please let me know by the end of **week two** if you will need to be absent from class for any religious holidays this semester, and we can work out an appropriate schedule for making up absences or missed work.

### Community guidelines

Our class is a community.  We should behave as such.  Among other things, that means treating others with respect, not only in the language that we use (no slurs, please), but also in taking others' ideas, approaches, perspectives, and identities seriously.  We will discuss appropriate guidelines for the class throughout the semester, developing those guidelines as a community.

### Basic needs security

Any student who has difficulty affording groceries or accessing sufficient food to eat every day, or who lacks a safe and stable place to live, should know that these difficulties are likely to affect their performance in the course. Such students are urged to contact the [Dean of Students](https://www.grinnell.edu/profiles/student-affairs/staff) or the [CRSSJ](https://www.grinnell.edu/about/offices-services/crssj) for support. You may also notify me, if you feel comfortable doing so, and I will do my best to help you identify and arrange other resources.

### Other accommodations and adustments

There are many other ways in which it may be appropriate to adjust course policies and it is not possible to attempt to address them all in a few policies.  These may include other issues best addressed earlier in the semester (*e.g.*, student-athlete scheduling) or as they arise (*e.g.*, chronic health flare-ups).  I will do my best to be flexible in these cases with the overall goal of facilitating your growth in this course.  Please keep me informed!

In some cases, I will recommend consulting with the [Academic Advising staff](http://www.grinnell.edu/about/offices-services/academic-advising). They are an excellent resource for developing strategies for academic success and can connect you with other campus resources as well. If I notice that you are encountering difficulty, in addition to communicating with you directly about it, I will also likely submit an academic alert via Academic Advising's SAL portal. This reminds you of my concern, and it notifies the Academic Advising team and your advisor(s) so that they can reach out to you with additional offers of support.

## Evaluation and grading

This course employs a grading system based on [*mastery grading* and *specifications grading*](https://docs.google.com/document/d/13V1fsPve19IU-tFNt4AeQ78VepuqVakp3xizJrj5KwY/edit) to evaluate your work.  These systems, inspired by adult learning theory, are designed to create a "low-threat" learning environment where:

+ Mastery obtained via exploration, experimentation, and failure is encouraged and valued as highly as "getting it right" the first time.
+ Your final grade accurately reflects your mastery of the learning goals of the course.
+ The expectations for grades should be easy to understand and easily trackable.

Ideally, all of you should be able to meet all of the goals in a reasonable amount of time (see the note about time and workload above).  To achieve high grades, some of you may find that you have to redo some of the work in the class.  Many of the components of the course have "no penalty" redos available.  See the notes below and in the [handouts](../handouts) for more details.

### Deliverables

We rely on six kinds of work to assess your mastery of the material.

+ **Reading problems**: quick assessments of the concepts found in the daily reading in preparation for in-class activities.  _**Reading problems are generally due at {{ site.evening_due_time }} the night before class**_ (e.g., the problems associated with a reading for Wednesday's class are due Tuesday at {{ site.evening_due_time }})
+ **Lab exercises**: practice problems worked on during class, frequently collaboratively, with a partner.  _**Lab exercises are generally due immediately before the next class**_ (e.g., the problems associated with the lab from Wednesday's class are due Friday at {{ site.meeting_start_time }} and the problems associated with the lab from Friday's class are due Monday at {{ site.meeting_start_time }}).
+ **Mini-Projects**: individually completed, small-scale programming projects that apply the weekly concepts to the themes of the course. To earn an A, one must do an excellent job on most of the mini-projects and the group project.  (You will be able to re-do any project that earns less than excellent.)  _**Mini-Projects are generally due on Tuesdays at {{ site.evening_due_time }}.**_
+ **Group project**: a final, group-based project, that you will complete toward the end of the semester. The group project brings together the various materials you've learned throughout the semesters. In computing a final grade, we treat the group project as a mini-project.
+ **Learning assessments**: individually completed problems that directly assess your mastery of the learning goals of the course.  To earn an A, one must pass learning assessments for 22 of the 24 learning objectives.  (You will have the opportunity to retake any of the learning assessments you do not pass.)  _**Sets of Learning Assessments will be distributed at 4:00 p.m. on four Mondays throughout the semester and will be due on Tuesdays at {{ site.evening_due_time }}**_.  There will not be mini-projects in weeks that learning assessments are given.  _**Single learning assessments will also be given as quizzes in class on Fridays.**_
+ **Metacognitive reflections**: Short reflective pieces given before and after most assignments and exams.  _**Pre-task reflections are generally due the evening after a task is assigned.  Post-task reflections are generally due the day after the task is due.**_

*Reading problems* and *lab exercises* are designed for you to practice and explore the concepts of the course in a supportive environment.  Consequently, you may collaborate on these problems with your classmates, consult external resources, or ask the course staff for questions, provide that you cite them in your produced deliverable.  These deliverables are checked primarily for completion and effort rather than total correctness.

*Mini-projects* (MPs) are designed to give you the opportunity to demonstrate your knowledge and mastery on more complex problems.  Work you turn in for mini-projects should be your own.  You may consult others for ideas and help, provided you appropriately acknowledge that help.

Mini-projects are graded on an EMRI scale. E is "Excellent or Exemplar". M is "Meets Expectations", the standard grade for a correct assignment. R is "Redo", the grade you'll receive for an assignment that does shows incomplete understanding. And I is "Incomplete", the grade you'll receive for an assignment that is missing key components. These grades will appear as 3, 2, 1, and 0 on Gradescope.

*Learning assessments* (LAs) are designed to demonstrate your mastery of the courses naturally measurable learning goals.  You may only discuss these deliverables with the course staff.  These deliverables are checked for both correctness and appropriate design.  Learning assessments will come in at least two different forms: Weekly in-class quizzes (on Fridays) and regular take-home examinations/SoLAs (distributed on Mondays and due on Wednesdays at {{ site.evening_due_time }}).

LAs are graded using a Satisficatory (S or 1) or Unsatisfactory (U or 0) scale.

*Metacognitive reflections* are intended to help you build your broader metacognitive skills and will generally ask you to reflect on what you expect from each project (assignment) or SoLA (exam) (e.g., "What will be the hardest part of this project?", "Which topic will you struggle most with on the SoLA?", "How can you best succeed on this SoLA?") and what you discovered from each project or SoLA (e.g., "What aspect of the project took you the most time and why?", "How can you do better on the next SoLA?").

### Grading Scale and Policies

The details of and rationale for the policies are complex enough that I have moved them to [a separate document on grading](../handouts/grading). It describes the EMRI grading scale and other things that might be useful to know before you continue reading below.

### Letter grades

Letter grades for the course are determined by *bundles*, a collection of required grades for each of the deliverable categories.  You will receive the grade corresponding to the bundle for which you meet *all* of the requirements.  All bundles list *minimum amounts*, you may exceed the requirements for a bundle and still qualify for it.

Note that I reserve the right to update requirements for grades as circumstances dictate over the course of the semester, *e.g.*, if a deliverable is cut.  I will generally update the requirements so that they are no stricter than they were previously.

---

<table class="table">
<thead>
<tr>
<th scope="col">Overall</th>
<th scope="col">Projects ({{ site.data.bundles.totals.projects }})</th>
<th scope="col">LAs ({{ site.data.bundles.totals.las }})</th>
</tr>
</thead>
<tbody>
{% for tier in site.data.bundles.tiers %}
<tr>
<th scope="row">{{ tier.grade }}</th>
<td>{{ tier.projects }}</td>
<td>{{ tier.las }}</td>
</tr>
{% endfor %}
</tbody>
</table>

### Plus/minus grades

If your two primary grades are at the same level, you will earn that letter as the base grade.  I hope that you will all demonstate learning at the A level.

If your two primary grades are at different levels (e.g., projects at the B level and learning assessments at the A level), you will generally earn a grade between the two, with the particular level dependent on where in the range of each you fall.  Note that if you receive a C on one primary grade and an A on the other, your base grade will be a B-.

Your grade may also be affected by missing reading problems, labs, metacognitive reflections, and tokens.

Note that Grinnell does not permit grades of C-, D+, or D-.  A grade below C and at least D will be recorded as a D.  A grade below a D will be recorded as an F.

### Reading problems, laboratory assignments, and metacognitive reflections

You are allowed to miss up to **six total** reading problems, lab assignments, and metacognitive reflections in the semester without penalty.  If you miss more than six reading problems, labs, or reflections, your overall letter grade will be lowered by one-third of a letter grade for each two additional problems, labs, or reflections you miss. Excesses of one also result in a loss.  For example,

* If you miss four reading problems, one lab, and one reflection, you've missed *six* total things and there is *no penalty*.
* If you miss three reading problems, three labs, and two reflections, you've missed *eight* total things, which is two more than you are permitted.  *Your overall letter grade drops by one-third*, such as from a B to a B- or from an A- to a B+.
* If you miss three reading problems, two labs, and two reflections, you've missed *seven* total things, which is one more than you are permitted.  Once again, *your total letter grade drops by one-third*.
* If you miss three reading problems, four labs, and two reflections, you've missed *nine* total things, which is three more than you are permitted.  *Your overall letter grade drops by two-thirds*, such as from a B to a C+ or from an A- to a B.
* If you miss ten reading problems, zero labs, and zero reflections, yo've missed *ten* total things, which is four more than you are permitted.  *Your overall letter grade drops by a full letter*, such as from a B to a C, from an A- to a B-, or from a B- to a C.

I hope that you will do your best to miss as few reading problems, labs, and reflections as possible.

Note: If your LAs and MPs indicate that you should receive a passing grade (C or above), missing tokens, readings, labs, or metacognitive reflections cannot drop your grade below a C.

### Redos

Because I care more that you learn the material than that you learn it by a particular deadline, I permit redos for the major work in this course.  Redos on learning assessments are automatically available. In general, you may try them again on the next set of learning assessments (SoLA).

In contrast, redos on reading responses, lab writeups, and metacognitive reflections are are rarely permitted.  Please speak with me if you would like to redo a reading response or lab writeup. Since metacognitive reflections only work when done with a task, you may not make those up.

Your first redo on a mini-project is generally free.  Subsequent redos on mini-projects may require tokens; see [the handout on tokens](../handouts/tokens) for details.  When you receive a graded mini-project, it will generally include a checklist of issues that you must address to get a higher grade.  Please reproduce the checklist in your re-done project.  Where appropriate, you should indicate how you addressed the issues we have described. Please see the [handout on redoing mini-projects](../handouts/redos) for more details.

### Final deadline for all work

Note that *all* work must be submitted by {{ site.all_work_deadline }}.
This is College policy and cannot be waived for any reason.  If you find yourse
lf needing to turn in work past this deadline, you must consult with me as soon 
as possible to submit an *incomplete request* for the course.  The Committee on Academic Standing notes that ""An incomplete is generally not appropriate when […] there are multiple assignments to be completed." Hence, if you take an incomplete in the course, the only work you can make up will be one of the mini projects.

### Tokens

To provide a consistent and clear mechanism for dealing with the issues that regularly come up during the semester (e.g., late work, extra resubmissions), I rely on a variant of the "[token system](../handouts/tokens)" designed by my colleague Peter-Michael Osera.  In short, you begin the semester with a few tokens and use them up as you turn in work late, show up to class late, or miss class without notifying me. You may earn additional tokens by attending events that I deem appropriate, such as talks related to the course or your colleages' performances and competitions.

The regular status reports will include information on tokens.

Please read [the handout on tokens](../handouts/tokens) for more details.

## Course breakpoints

Our grading system offers flexibility.  However, it adds a cost of giving the illusion that if you fall behind in your work, there is always an opportunity to catch up. While this is true in theory, in practice, it is difficult to do so in many situations because of personal issues, competing courses, extracurricular obligations, etc. This flexibility also makes it difficult---for both you and me---to determine when you have fallen behind in the course and need external help whether that it is from the course staff, tutors, or academic advising.

We encourage you to also preemptively come to any member of the course staff---the instructor, the course mentor, our Peer Education Coordinator---for help and guidance if you feel like you are falling behind. However, to be more clear about when you might be falling behind in the course, I will do my best to track the following _course breakpoints_ in your progress. In particular, when one of the following situations occurs, I will follow up with you as well as academic advising (via an academic alert) to check in.

* You miss two or more days of classes in a row (for any reason).
* You have used all of your tokens.
* You receive an I on a mini-project.
* You do not turn in a revision for a mini-project graded as an R.
* After a SoLA, you have completed less than 60% of the LAs to date.
* You are otherwise at substantial risk of earning below a C in the course.

If any of those issues happen, we should also talk so that I might provide guidance and help you develop a plan for getting back on track, e.g., by assigning an individual tutor.

## Software, textbooks, references, technology, and such

There are several software packages we use in this course both for learning how to program as well as conducting learning online.

+ The [DrRacket](https://docs.racket-lang.org/drracket/) programming environment.
+ Your [Grinnell Office365 account](https://office365.grinnell.edu) for email and [Microsoft Teams](https://teams.microsoft.com) for discussion and collaboration.
+ [Gradescope](https://gradescope.com) for assignment submission and feedback communication.

Please make sure you can access all of these resources, and please let me know if you have any problems with access.

### Books

There is no required textbook for this course, as the material is written by Grinnell faculty and posted on the course website.
However, there are some useful textbooks and references you may want to bookmark or keep handy.

+ [Dybvig, Kent R., _The Scheme Programming Language_ (Third Edition), MIT Press, 2003.](https://www.scheme.com/tspl3)
  *An effective reference and guide to learning the Scheme programming language.*
+ [Felleisen, Matthias, Findler, Robert Bruce, Flatt, Matthew and Krishnamurthi, Shriram, _How to Design Programs_ (2nd Edition), MIT Press 2018.](http://www.htdp.org)
   *A wonderful guide, particularly for later topics in the course like higher-order programming, re-factoring, and recursion.*

### Installing DrRacket

You should feel free to install DrRacket on your own computer. Note, however, that you will also need to install the library for CSC-151.

* Download DrRacket from [the Racket download site](https://racket-lang.org/download/).
* Follow the instructions.
* Start DrRacket.
* In the **Language** menu, select **Choose Language ...**. In the dialog box that appears, click on the radio button next to **The Racket Language**.
Then click **OK**.  Finally, click **Run**.
* From the **File** menu, select **Install Package ...**. In the window that appears, enter [https://github.com/grinnell-cs/csc151.git#main](https://github.com/grinnell-cs/csc151.git). Click **Install**. Eventually, a **Close** button should appear. Click that button. It will be your only notification that the installation succeeded.

## Help, collaboration, academic honesty, and academic integrity

To help expedite your learning, you can rely on me, our class mentor, and your peers as outlets in this course.

### The Instructor, course staff, and other resources

When contacting the course staff, please use direct messages (DM) on Microsoft Teams. While we will generally not respond immediately---we generally check our messages at fixed times throughout the day---we will prioritize responses to student questions over Teams versus queries sent through other means, *e.g.*, email.

The **course mentor** also holds weekly *mentor sessions* outside of regular class time. In these sessions, the mentor guides you through practice problems designed to help you master the material and answer any questions you have about the material. **I highly recommend you attend each of these sessions**, even if you feel like you understand the material. You never know what you don't know, and the purpose of these sessions is to bring these blind spots to light!

The CS department provides **evening tutors** from 7--10 p.m. most nights of the week (Sunday through Thursday).  I encourage you to make use of the evening tutors.

The CS department also provides **individual tutors** as needed.  If you find yourself struggling with the material, please let me know and I'll work with our peer education coordinator to get one assigned to you.

Finally, if you would like to discuss things in more detail---course content, more general questions about computer science, or other things---feel free to schedule a meeting with me, either [during office hours](https://bit.ly/book-samr) or, if those don't work, by sending me a message with available times.

Note that if I find that you have fallen behind on assignments or are showing difficulty on quizzes or learning assessments, I will invite you to meet with me.  Please accept those invitations; they are intended to be supportive, not punative.

### Peer learning

Utilizing discussion with peers to facilitate your learning is a critical skill for success in computer science.  However, at the same time, you must be aware that getting stuck and pushing through challenging problems is essential for robust learning.  To this end, we allow the following forms of collaboration.

+ You are encouraged to seek help and advice from your peers as you work on reading exercises, labs, and mini-projects. You may also consult the course staff as well as other people and external resources.
+ You may only discuss learning assessments and quizzes with the course staff.
  When completing assessments and quizzes, you may only consult the course website and any additional documentation we provide.  You may not collaborate with peers, consult external resources beyond the ones mentioned above, or share information about these assignments with others.
+ **In all cases, you (or your group in the case of group work) should independently write up your solutions and cite all the resources you used in authoring your work, including other students, your instructor, and our peer educators.**

Keep in mind that *adaptation of pre-existing code* whether it comes from a peer, myself, or the Internet, requires a citation in cases where we allow such adaptation.  Also, whenever you are expected to show your code's output, you are expected to reproduce the output faithfully.  In other words, you should not forge the results of your programs!

In all cases, the work that you produce should be your own.  In general, you should be capable of reproducing any part of your deliverable with minimal effort if it was accidentally deleted.

If you feel that the stress and pressure of the course or the semester are leading you to consider violating the academic honesty policies of the course and the College as explained in the [student handbook](https://catalog.grinnell.edu/content.php?catoid=32&navoid=5208#Honesty_in_Academic_Work), **please talk to me as soon as possible**.  The course's grading policies are designed to help you manage your time in light of the different stressors in your life.  I will do my best to work with you to figure out how to help you better manage your time relative to your learning goals and desired achievement level for the course.

And just if that wasn't enough, you should check out [my extended statement on academic honesty and integrity](../handouts/academic-integrity).

### Sharing of course materials

Our goal is to create an inclusive learning environment where people feel free to share, fail, and ultimately grow in knowledge.  To create such an environment, it is imperative that we be mindful of what we share outside of our learning space.  To this end, I request that you refraining from sharing any recordings of our class meetings with others.  Recordings of class meetings that we provide, *e.g.*, recorded through Microsoft Teams, are meant for your *personal use* and should not be shared outside of the class.

Furthermore, while you retain [copyright](https://www.plagiarism.org/blog/2017/09/25/do-i-own-my-work-even-if-im-just-a-student) of the work you produce in this course, we must still uphold the academic integrity of this course.  To this end, you may not share copies of your assignments with others (unless otherwise allowed by the course policies) or upload your assignments to third party websites unless substantial changes are made to the assignment (*e.g.*, significant extensions and improvements to your code) so that it is clear that the end product is significantly different from what was asked in original assignment.

I recognize that there are times where you want to do this, *e.g.*, uploading projects to Github for your resume or to show to friendds and family, and so I encourage you come talk to me in advance, so that we can ensure that you upload a meaningful project that does not run afoul of this policy.

### AI programming assistants

Please avoid the use of AI-based programming assistants, such as ChatGPT or Microsoft IntelliCode in this course.  You should also review [my policy on AI programming assistants](../handouts/ai).

## Other issues

### Asking questions

We prefer that you ask general questions in the Questions and Answers channel on Teams. Doing so helps ensure that everyone has access to the answers. If you ask us questions in other ways, we will encourage you to use the Q&A channel.

We also prefer that you title your questions on Teams. After clicking "New Conversation", click on the icon with an A and a pencil. That will give you the opportunity to add a subject.  Click on the paper airplane in the lower-right-hand corner to post the question.

Feel free to answer each others' questions.

We understand that not all students are comfortable asking questions in public and that not all questions are appropriate for the whole class. Feel free to ask us questions via Teams chat, via email, and in person.

### Office hours

I have a different approach to office hours than most faculty. I prefer that you book my office hours in advance, rather than just showing up during office hours. You can book office hours at <https://bit.ly/book-samr>. In general, you should book a fifteen-minute slot unless you've discussed using a longer slot with me.

You may, of course, show up during office hours without booking them. In those circumstances, I will be happy to meet with you if no one has booked the time or if someone finishes early. I am also often happy to meet with students outside my regular office hours. If my door is open, feel free to knock and ask.

If my office hours do not work for you, I am happy to meet with you at other times. You can propose a meeting time with the Microsoft Scheduling Assistant. You can also email me. Please stick to the normal workday (8am to 5pm).

I tend to respond to questions submitted on Teams (preferably on the Questions and Answers channel, but also sent via direct message) outside of office hours, including in the evening.

I have some complex personal circumtances that may require that I hold office hours remotely or cancel office hours. I will do my best to keep you posted about such issues.

### Technology

This may be your first semester learning with Teams.  Things will likely mess up from time to time.  That's okay; it's part of the process.

This may be your first semester using Gradescope.  Gradescope does some things well and some things less well.  Things will likely mess up from time to time.  That's okay; it's part of the process.  I'll make adjustments when you have difficulty.  I hope you'll accept my apologies when I do something wrong (or at least fail to adjust my processes to the way Gradescope thinks they should be done).

I've taught Scheme for longer than most of you have been alive.  This is likely your first time encountering Scheme.  You will mess up from time to time.  Believe it or not, but I will, too.  (I'll be much faster at fixing and identifying problems, though; at least I hope I will be.) That's okay; mistakes are part of the process.

### Multiple sections

There are multiple sections of this course. While the instructors and mentors will take generally similar approaches to the material, you'll see that there are differences. These differences should not affect your overall learning in the course.

### Names

I get names wrong.  I get names wrong all the time.  Evidence suggests that I am not just bad at remembering names, I also have some brain differencees that regularly lead me to mix up peoples' names.  I think, for example, of two of my favorite research students, one with blonde hair, from Minnesota, who also served as a teaching assistant for my software design course; the other with dark hair, from Massachusetts, who brought a wealth of background in education to my research projects.  I can tell you a lot about each student (although I wouldn't without their permission), including hobbies, where they studied abroad, what they are doing now (or at least what they were doing a year so so ago), and more.  But I inevitably reversed their names, calling Minnesota Massachusetts and Massachusetts Minnesota.

When I discussed this issue with my family, my sons laughed and said "Dad, you get *our* names backwards, too; we just ignore you when you do so." And I've heard from other students I value highly that I do this and don't always notice.  (The other day, I almost referred to an alum by a different name.)

If I use the wrong name for you, it is not a sign that I do not respect your or that I do not care about you.  It's a deficiency in my processing, and one that I seem unable to fix.  Please accept and understand that disability, just as I will do my best to accept and understand your own differences.

### Teaching is performative

I believe that all teaching is a form of performance.  That performance may not always be explicit.  Nonetheless, I perform a particular role, perhaps even roles.  In my roles, I may say some things that seem strange.  Remember; it's a performance.

Note also that I am snarky by nature. I find that my teaching performances are more successful when they follow this nature. Remember, **snark is love**.

### Feeling overwhelmed

You may feel a bit overwhelmed by this point. I know that I do after re-reading it. **Don't worry!**. CSC-151 has a great support system, a carefully designed pedagogical methodology, and an incredibly awesome topic. (Yes, I know I am biased.) Most students who take the course excel.  We'll enjoy this together.

I will also try to be respectful of your time.  Please let me know if you find yourself regularly spending more than twelve of so hours per week on this class, which is what the College considers appropriate for a four-credit course.  (We have four hours in class each week, we suggests that you have eight hours out-of-class for readings, review, and mini projects.)

## Frequently (and not-so-frequently) asked questions

I'm confused about the grading scheme. Could you explain more?

> In short: The grading scheme is designed to assess you on what you've learned, not when in the semester you've learned it.  There's also a strong incentive built in for you to keep up with the work.  Doing regular work, even if it's not perfect, and receiving feedback on that work, is one of the best ways to learn.

> Broad overview: To succeed in the class, you must do the learning assessments (LAs) and projects (MPs and the final project).  Since not everyone learns at the same rate, you will have the opportunity to make additional attempts at  LAs (although with new problems) and projects.  In addition, you must keep up with regular work for the class: readings (and reading responses), labs (and lab writeups), and reflections.  If you keep up with the work and achieve appropriate results on the LAs and projects by the end of the semester, you are likely to do well in the course.  Additional details are found above and in [the page on grading](../handouts/grading).

> If that's not enough information, feel free to ask questions about particular points.

I plan to leave early for Spring break and won't be in class on Friday, 15 March 2024. What are the penalties for missing that class?

> As long as you let me know in advance, there is no penalty for your absence.

>  However, you will not be able to take the quiz that day, which means that you will have to complate that learning assessment in one of the following SoLAs.  In addition, you are responsible for making up the work from class on your own, and you are still responsible for turning in that labs.

I have an accommodation that gives me extra time on in-class exams.  What should I do about the Friday LA quizzes?

> I am happy to give those to you at 8:00 a.m. on Fridays.

I did not achieve a grade of S on one of the in-class-only learning assessments.  How do I make that up?

> I am happy to give those to you at 8:00 a.m. on the next Friday (or earlier, if necessary).

I need a mental health day. What should I do?

> Send me an email message telling me that you need a mental health day. Plan to make up the lab on your own and submit it before the next class. If you need extra time for the lab, you'll need to use a [token](../handouts/tokens).

> More importantly, please take care of yourself.

If I ask a question about the course, will it end up here?

> Perhaps. It will depend on a variety of issues, such as whether I consider it of general interest and whether I have time to update the syllabus.

How do I book your office hours?

> <https://bit.ly/book-samr>
