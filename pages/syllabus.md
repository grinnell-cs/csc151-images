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

Welcome to CSC-151-{{ site.section_number }}, Grinnell College's introductory computer science course.
In this course, we will work to develop your experience with algorithmic problem solving.
While we will be using Racket as our programming language for this course, you will quickly see that the problem solving skills we learn in this class are applicable to other languages and in settings that don't involve programming at all.

This semester, CSC-151 will emphasize the digital humanities, the use of computing technology to explore humanistic subjects.
While we will primarily focus on text-based digital humanities, we are likely to touch on other approaches, too.

CSC-151 requires no prior knowledge of computer science or computer programming.
We'll teach you everything we want you to know.
It's okay if you have some experience (although this may sometimes put you at a disadvantage; we do things differently), but it's certainly not necessary.

*Due to the rapidly changing world that we find ourselves in, the policies of this syllabus are perpetually subject to change.*
*Significant changes to course policies will be announced in class in addition to being reflected in the syllabus online.*

## Overview

How do we harness the power of modern-day computation to solve problems?  Why is computation so pervasive in this information age?  What is this field, computer science, that drives much of this innovation?

To address these questions, we will introduce you to the basics of *computational problem-solving*: describing and decomposing problems of a computational nature so that we can implement their solutions with a computer.
We will demonstrate that computational problem-solving is the essence of computer science and is an essential first step in understanding the discipline and its effects on society.
By the end of this course, you should be able to:

+ Describe the fundamentals of computer science: algorithms, data structures, and abstraction.
+ Read and write computer programs *in the small* in the Racket programming language.
+ Solve problems using design strategies from functional programming: functional decomposition, computational pipelines, and recursive decomposition.
+ Carry out the basics of the software engineering process: design, documentation, development, testing, and debugging.

In addition to these primary outcomes, we also expect you will take away more general skills and knowledge related to the discipline:

+ Describe the benefits of collaboration in problem-solving and employ best-practices when working in groups.

**Problem domain: Image making and manipulation**

Computational thinking and computational techniques can be applied to a wide variety of domains.  At Grinnell, we have a tradition of picking a domain or "theme" for each offering of CSC-151.
The theme for this section is *image making and manipulation*. 
That is, we'll explore how to write programs that create new images (most often, abstract images) or that manipulate existing images to create new images.
Along the way, we'll explore a variety of ways to think about images.

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
  Ask your instructor, your mentor, or a tutor for help.

We are also using software developed at Grinnell and may still have some bugs lurking within.
Thus, you should develop a habit of saving your work frequently!

## Time and workload

Grinnell has indicated that a 4-credit course, like this one, should involve approximately 180 hours of work, which matches some guidance from the U.S. government.
Across a 14-week term (plus a week finals), that ends up being approximately 12 hours of work per week.
I have not been able to get anyone to answer the question of "180 hours *for whom* and *for what grade*?", I've been given the impression that I should strive for that workload for the "average" student in a course who seeks to earn a B.
In general, the twelve hours should work out to approximately four hours per week in class, three hours per week on readings (one hour per day), four hours per week on either mini-projects (homework assignments) or SoLAs (exams), and one hour per week for mentor sessions.
If you find yourself working much more than the expected amount in this course, please let me know.
It could be that other approaches, or better support resources, can help.

## Diversity and inclusion

I believe that any college-level course should challenge you and put you outside of your comfort zone.
My mission as an instructor is to help you manage that discomfort so that you can grow in knowledge and maturity.
Therefore, I strive to create a fully inclusive setting so that we all can ultimately succeed in the classroom.

### Learning needs

I welcome you to talk to me as early as possible about your distinctive learning needs.
I particularly encourage students with disabilities to meet with me and discuss how our classroom and course activities could impact their work and what accommodations would be essential.
I will also make adjustments for students without documented disabilities.  However, I do recommend that you seek official accommodations.
As part of the accommodations process, I recommend talking to our Coordinator for Student Disability Resources for guidance and further instructions:

+ Jae Hirschman, Goodnow Hall, 3rd floor (x3089)

You can find some additional details in [my statement on
accommodations and adjustments](../handouts/accommodations).

### Religious observance policy

I also support the class's religious diversity and anyone who needs to balance academic work with religious observations.
Please let me know by **week two** if you will need to be absent from class for any religious holidays this semester, and we can work out an appropriate schedule for making up absences or missed work.

### Community guidelines

Our class is a community.  We should behave as such.  Among other things, that means treating others with respect, not only in the language that we use (no slurs, please), but also in taking ideas, approaches, and perspectives seriously.  We will discuss appropriate guidelines for the class throughout the semester, developing those guidelines as a community.

### Pandemic issues

The normal instructional structure of this course requires that you be present, physically and mentally, each day.
However, the ongoing pandemic may disrupt some of your ability to be present physically.
I will adapt as necessary for those who must join the class remotely or who cannot attend in either way.
Please provide advance notice if possible.

### Other accommodations

There are a limitless number of dimensions to diversity and inclusion, the totality of which are unaddressable with a finite set of policies.
These may include other issues best addressed earlier in the semester (*e.g.*, student-athlete scheduling) or as they arise (*e.g.*, chronic health flare-ups).
I will do my best to be flexible in these cases with the overall goal of facilitating your growth in this course.
To do this, I need to receive advanced notice from you **at least one week in advance** so that we can make suitable arrangements.
For situations that arise within a given week, I will ask you to utilize the token system (described in the evaluation section) to manage your workload.

## Evaluation and grading

This course employs a grading system based on [*mastery grading* and *specifications grading*](https://docs.google.com/document/d/13V1fsPve19IU-tFNt4AeQ78VepuqVakp3xizJrj5KwY/edit) to evaluate your work.
These systems, inspired by adult learning theory, are designed to create a "low-threat" learning environment where:

+ Mastery obtained via exploration, experimentation, and failure is encouraged and valued as highly as "getting it right" the first time.
+ Your final grade accurately reflects your mastery of the learning goals of the course.
+ The expectations for grades should be easy to understand and easily trackable.

Ideally, all of you should be able to meet all of the goals in a reasonable amount of time (see the note about time and workload above).
To achieve high grades, some of you may find that you have to redo some of the work in the class.
Many of the components of the course have "no penalty" redos available.
See the notes below for more details.

### Deliverables

I use four kinds of deliverables to assess your mastery of the material.

+ **Reading problems**: quick assessments of the concepts found in the daily reading in preparation for in-class activities.  To earn an A, one should show appropriate work on most of the reading problems for the semesters.  Your work not need be uniformly correct, but it should show effort.
+ **Lab exercises**: practice problems worked on during class, frequently collaboratively, with a partner.  To earn an A, one should turn in correct solutions to most of the lab exercises.
+ **Mini-Projects**: individually completed, small-scale programming projects that apply the weekly concepts to the themes of the course.  (We may, on occasion, refer to "mini-projects" as "demos", using the terminology from the prior term.)  To earn an A, one must do an excellent job on most of the seven mini-projects.  (You will be able to re-do any project that earns less than excellent.)
+ **Learning assessments**: individually completed problems that directly assess your mastery of the learning goals of the course.  To earn an A, one must pass learning assessments for 26 of the 28 learning objectives.  (You will have the opportunity to retake any of the learning assessments you do not pass.)

*Reading problems* and *lab exercises* are designed for you to practice and explore the concepts of the course in a supportive environment.
Consequently, you may collaborate on these problems with your classmates, consult external resources, or ask the course staff for questions, provide that you cite them in your produced deliverable.
These deliverables are checked primarily for completion and effort rather than total correctness.

*Mini-projects* are designed to give you the opportunity to demonstrate your knowledge and mastery on more complex problems.
Work you turn in for mini-projects should be your own.
You may consult others for ideas and help, provided you appropriately acknowledge that help.

*Learning assessments* are designed to demonstrate your mastery of the courses naturally measurable learning goals.
You may only discuss these deliverables with the course staff.
These deliverables are checked for both correctness and appropriate design.

The details of and rationale for the policies are complex enough
that I have moved them to [a separate document on
grading](../handouts/grading).

### Letter grades

Letter grades for the course are determined by *bundles*, a collection of required grades for each of the deliverable categories.
You will receive the grade corresponding to the bundle for which you meet *all* of the requirements.
All bundles list *minimum amounts*, you may exceed the requirements for a bundle and still qualify for it.

Note that I reserve the right to update requirements for grades as circumstances dictate over the course of the semester, *e.g.*, if a deliverable is cut.
I will always update the requirements so that they are approximately as strict as they were previously.

---

(*Last updated: {{ site.data.bundles.last-updated }}*)

<table class="table">
<thead>
<tr>
<th scope="col">Overall</th>
<th scope="col">Readings ({{ site.data.bundles.totals.readings }})</th>
<th scope="col">Labs ({{ site.data.bundles.totals.labs }})</th>
<th scope="col">Projects ({{ site.data.bundles.totals.demos }})</th>
<th scope="col">LAs ({{ site.data.bundles.totals.las }})</th>
</tr>
</thead>
<tbody>
{% for tier in site.data.bundles.tiers %}
<tr>
<th scope="row">{{ tier.grade }}</th>
<td>{{ tier.readings }}</td>
<td>{{ tier.labs }}</td>
<td>{{ tier.demos }}</td>
<td>{{ tier.las }}</td>
</tr>
{% endfor %}
</tbody>
</table>

+ **D**: 3--4 requirements of a C are met.
+ **F**: 0--2 requirements of a C are met.

**Plus/minus grades**

To earn a plus/minus grade, you must have completed the requirements of one tier and meet the requirements of the next tier for *at least* one of Mini-Projects and/or LAs.
This will arise in two situations: **C/B** and **B/A**.
For example, you may completely meet the requirements of a *C* and at least one of Projects and/or LAs is a *B*.

+ If both mini-projects and LAs fulfill the requirements for the next tier, then you earn a minus grade for the higher tier, *i.e.*, *B-* if you are between a C and B.
+ Otherwise, one of Projects and LAs fulfill the requirements for the next tier.
  If **all of readings, labs, and quizzes** fulfill the requirements for the next tier, you earn a minus grade for the higher tier, *e.g.*, *B-* if you are between a C and B.
  Otherwise, you earn a plus grade for the lower tier, *e.g.*, *C+* if you are between a C and B.
+ Note that Grinnell does not award C- or D+ grades.

### Redos

Because I care more that you learn the material than that you learn it by a particular deadline, I permit redos in this course.
Redos on learning assessments are automatically available; you may try them again on the next set of learning assessments (SoLA).
Redos on reading responses and lab writeups are rare.
Please speak with me if you would like to redo a reading response or lab writeup.

Your first redo on a mini-project is generally free.
Subsequent redos on mini-projects may require tokens; see below for details.
When you receive a graded mini-project, it should include a checklist of issues that you must address to get a higher grade.
Please reproduce the checklist in your re-done project.
Where appropriate, you should indicate how you addressed the issues we have described.

### Final deadline for all work

Note that *all* work must be submitted by {{ site.all_work_deadline }}.
This is College policy and cannot be waived for any reason.
If you find yourself needing to turn in work past this deadline, you must consult with me as soon as possible to submit an *incomplete request* for the course.
If you take an incomplete in the course, the only work you can make up will be one of the mini projects.

## Tokens

Tokens reflect that life inevitably rears its ugly head in some fashion and ruins your best-laid plans.
You begin the course with **3 tokens**, and you may:

+ Use **1 token** to turn in any reading problem or lab writeup up to 48 hours late.
+ Use **1 token** to turn in a mini-project up to 48 hours late.
+ Use **1 token** to turn in a redo of a mini-project up to 48 hours late.
+ Use **2 tokens** for a second redo on any project.
+ Use **1 token** to show up to class late (after we take attendance).
+ Use **2 tokens** to miss class without reasonable notification.

In general, you may not redo reading problems or lab writeups.

In most cases, I will charge tokens automatically.
You can usually check your token status on Gradescope.
The regular status reports may also include information on tokens.

You will have opportunities to earn additional tokens throughout the semester by participating in extra-curricular activities such as attending CS community events—CS Table (most Mondays at noon CST) and CS Extras (most Thursdays at 5:00 p.m. CST).
To earn a token, attend the event (or watch a recording within one day) and submit a one-paragraph reflection on the event in the Tokens assignment on Gradescope.
You must submit your response paragraph within a week of the event.
Additional information about these opportunities will be posted to Teams as they arise.

If, at the end of the semester, you have used more tokens than you have, those extra tokens will count against your final grade.
Overspending of 1--5 tokens will drop your grade by 1/3 letter.
Overspending of 6--10 tokens will drop your grade by 2/3 letter.
Overspending of 11--15 tokens will drop your grade by 1 letter.
And so on and so forth.

Please try not to use more tokens than you have.

## Software, textbooks, references, technology, and such

There are several software packages we use in this course both for learning how to program as well as conducting learning online.

+ [Dr. Racket](https://racket-lang.org/): an Integrated Development Environment (IDE) for the Racket programming language.
+ Your [Grinnell Office365 account](https://office365.grinnell.edu) for the following services:
+ [Microsoft Teams](https://teams.microsoft.com): a collaboration tool for discussion, Q&A, and video/voice conferencing.
+ [Youtube](https://youtube.com): course videos.

Please make sure you can access all of these resources, and please let me know if you have any problems with access.

There is no required textbook for this course, as the material is written by Grinnell faculty and posted on the course website.
However, there are some useful textbooks and references you may want to bookmark or keep handy.

**Books**

+ [Dybvig, Kent R., _The Scheme Programming Language_ (Third Edition), MIT Press, 2003.](https://www.scheme.com/tspl3)
  *An effective reference and guide to learning the Scheme programming language which is the basis of Racket.*
+ [Felleisen, Matthias, Findler, Robert Bruce, Flatt, Matthew and Krishnamurthi, Shriram, _How to Design Programs_ (2nd Edition), MIT Press 2018.](http://www.htdp.org)
   *A wonderful guide, particularly for later topics in the course like higher-order programming, re-factoring, and recursion.*

**References**

+ [Racket Documentation](https://docs.racket-lang.org/)
  *The canonical resource for the Racket language definition as well as documentation for its support tools and libraries.*

## Help, collaboration, academic honesty, and academic integrity

To help expedite your learning, you can rely on me, our class mentor, and your peers as outlets in this course.

**The Instructor, course staff, and other resources**

When contacting the course staff, please use direct messages (DM) on Microsoft Teams.
While we will generally not respond immediately—we will check our messages at fixed times throughout the day—we will prioritize responses to student questions over Teams versus queries sent through other means, *e.g.*, email.

The **course mentors** also hold optional *mentor sessions* outside of regular class time.
In these sessions, the mentors guide you through practice problems designed to help you master the material and answer any questions you have about the material.
I highly recommend you attend each of these sessions, even if you feel like you understand the material.
You never know what you don't know, and the purpose of these sessions is to bring these blind spots to light!

The CS department provides **evening tutors** from 7--10 p.m. most nights of the week (Sunday through Thursday).  I encourage you to make use of the evening tutors.  

The CS department also provides **individual tutors** as needed.  If you find yourself struggling with the material, please let me know and I'll work with our peer education coordinator to get one assigned to you.

Finally, if you would like to discuss things in more detail—--course content, more general questions about computer science, or other things—--feel free to schedule a (virtual) meeting with me, either [during office hours](https://bit.ly/book-samr) or, if those don't work, by sending me a message with available times.

Note that if I find that you have fallen behind on assignments or are showing difficulty on quizzes or learning assessments, I will invite you to meet with me.  Please accept those invitations; they are intended to be supportive, not punative.

**Peer learning**

Utilizing discussion with peers to facilitate your learning is a critical skill for success in computer science.
However, at the same time, you must be aware that getting stuck and pushing through challenging problems is essential for robust learning.
To this end, we allow the following forms of collaboration.

+ You are encouraged to collaborate with your peers on reading exercises, labs, and projects.
  You may also consult the course staff as well as other people and external resources.
  In all cases, you (or your group in the case of group work) should independently write up your solutions and cite all the resources you used in authoring your work, including the other students.
+ You may only discuss learning assessments and quizzes with the course staff.
  When completing assessments and quizzes, you may only consult the course website and the Racket Documentation page in developing your program.
  You may not collaborate with peers, consult external resources beyond the ones mentioned above, or share information about these assignments with others.

Keep in mind that *adaptation of pre-existing code* whether it comes from a peer, myself, or the Internet, requires a citation in cases where it is allowed.
Also, whenever you are expected to show your code's output, you are expected to reproduce the output faithfully.
In other words, you should not forge the results of your programs!

In all cases, the work that you produce should be your own.
The golden rule is that you should be capable of reproducing your deliverable on the spot with minimal effort if it was accidentally deleted.

If you feel that the stress and pressure of the course are compelling you to violate the academic honesty policies of the course and the college as explained in the [student handbook](https://catalog.grinnell.edu/content.php?catoid=12&navoid=2537#Honesty
_in_Academic_Work), **please talk to me as soon as possible**.
The course's grading policies as designed to help you manage your time in light of the different stressors in your life.
I will do my best to work with you to figure out how to help you better manage your time relative to your learning goals and desired achievement level for the course.

And just if that wasn't enough, you should check out [my extended statement
on academic honesty and integrity](../handouts/academic-honesty).

**Sharing of course materials**

Our goal is to create an inclusive learning environment where people feel free to share, fail, and ultimately grow in knowledge.
To create such an environment, it is imperative that we be mindful of what we share outside of our learning space.
To this end, I request that you refraining from sharing any recordings of our class meetings with others.
Recordings of class meetings that we provide, *e.g.*, recorded through Microsoft Teams, are meant for your *personal use* and should not be shared outside of the class.

Furthermore, while you retain [copyright](https://www.plagiarism.org/blog/2017/09/25/do-i-own-my-work-even-if-im-just-a-student) of the work you produce in this course, we must still uphold the academic integrity of this course.
To this end, you may not share copies of your assignments with others (unless otherwise allowed by the course policies) or upload your assignments to third party websites unless substantial changes are made to the assignment (*e.g.*, significant extensions and improvements to your code) so that it is clear that the end product is significantly different from what was asked in original assignment.
I do recognize that there are times where you want to do this, *e.g.*, uploading projects to Github for your resume or to show to friendds and family, and so I encourage you come talk to me in advance, so that we can ensure that you upload a meaningful project that does not run afoul of this policy.

ITS has released and then temporarily withdrawn policies that may limit your ability to share your work with others.
I consider those policies inappropriate for many reasons.
The CS department managed to convince the College to revisit them, but we are not sure what the new policies will look like.  Stay tuned.

**AI programming assistants**

Please avoid the use of AI-based programming assistants, such as ChatGPT or Microsoft IntelliCode in this course.  You should also review [my policy on AI programming assistants](handouts/ai).

## Other issues

**Technology**

This may be your first semester learning with Teams.
Things will likely mess up from time to time.
That's okay; it's part of the process.
(I can almost guarantee that if we were in person, some aspect of the technology would break.  It has every other time. Usually it's the projection system.)

This may be your first semester using Gradescope.
Gradescope does some things well and some things less wel.
Things will likely mess up from time to time.
That's okay; it's part of the process.
I'll make adjustments when you have difficulty.
I hope you'll accept my apologies when I do something wrong
(or at least fail to adjust my processes to the way Gradescope thinks they
should be done).

I've taught Scheme/Racket for longer than most of you have been alive.
This is likely your first time encountering Scheme/Racket.
You will mess up from time to time.
Believe it or not, but I will, too.
(I'll be much faster at fixing and identifying problems, though; at least I hope I will be.)
That's okay; mistakes are part of the process.

**Names**

I get names wrong.  I get names wrong all the time.  Evidence
suggests that I am not just bad at remembering names, I also have
some brain differencees that regularly lead me to mix up peoples'
names.  I think, for example, of two of my favorite research students,
one with blonde hair, from Minnesota, who also served as a teaching
assistant for my software design course; the other with dark hair,
from Massachusetts, who brought a wealth of background in education
to my research projects.  I can tell you a lot about each student
(although I wouldn't without their permission), including hobbies,
where they studied abroad, what they are doing now (or at least
what they were doing before the pandemic hit), and more.  But I
inevitably reversed their names, calling Minnesota Massachusetts
and Massachusetts Minnesota.

When I discussed this issue with my family, my sons laughed and said "Dad,
you get *our* names backwards, too; we just ignore you when you do so."
And I've heard from other students I value highly that I do this and
don't always notice.  (The other day, I almost referred to an alum
by a different name.)

If I use the wrong name for you, it is not a sign that I do not
respect your or that I do not care about you.  It's a deficiency
in my processing, and one that I seem unable to fix.  Please accept
and understand that disability, just as I will do my best to accept
and understand your own differences.

**My health**

I had a heart attack in spring 2021.
For my health, I am trying to limit my work hours to appropriate amounts, typically 40 hours per week.
I apologize if that means that I am not always caught up on my work or available at times you would like.

I will also try to be respectful of your time.
Please let me know if you find yourself regularly spending more than twelve of so hours per week on this class, which is what the College considers appropriate for a four-credit course.  
(We have four hours in class each week, we suggests that you have eight hours out-of-class for readings, review, and mini projects.)

**Teaching is performative**

I believe that all teaching is a form of performance.
That performance may not always be explicit.
Nonetheless, I perform a particular role, perhaps even roles.
In my roles, I may say some things that seem strange.
Remember; it's a performance.

**Feeling overwhelmed**

You may feel a bit overwhelmed by this point.
I know that I do after re-reading most of it and re-writing some of it.
But **don't worry**.
CSC-151 has a great support system, a carefully designed pedagogical methodology, and an incredibly awesome topic.  (Yes, I know I am biased.)
Most students who take the course excel.
We'll enjoy this together.
