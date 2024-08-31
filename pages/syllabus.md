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

  {% if tutors %}
    <dt>Evening Tutors</dt>
    <dd>
      <ul class="list-unstyled">
        {% for mentor in site.mentors %}
          <li>{{ mentor }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}

{% if site.tutor_sessions %}
    <dt>Evening Tutor Sessions</dt>
    <dd>
      <ul class="list-unstyled">
        {% for tutor in site.tutors %}
          <li>{{ tutor }}</li>
        {% endfor %}
      </ul>
    </dd>
  {% endif %}
</dl>

Welcome to CSC 151! In this class, you will learn computer programming using the Scamper programming language. You do not need any prior knowledge of computer science or programming. Section X will focus on TOPIC.

## Staff



### Instructor

<table>
  <tr> 
    <td>
      <img src="images/instructor.jpg" alt="Instructor Name" width="200"/> 
    </td>
    <td width="25"></td>
    <td> 
      <p><b>Instructor Name (pronouns)</b></p>
      <p>Instructor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>
</table>


### Mentors

We have N wonderful mentors working with CSC XXX this semester. You will see Mentor A class during our TIME section, while Mentor B and Mentor C will attend SECTIONS. All N mentors will hold mentor sessions for students from all sections.

<!-- awaiting data from peer educators -->

<!-- see Letter grades section at https://github.com/grinnell-cs/csc151-images/blob/main/pages/syllabus.md?plain=1 and _data/bundles.yml for example of how to make these tables nicer by putting the data in a config file and using loops !-->


<table>
  <tr>
    <td>
      <img src="images/mentorA.jpg" alt="Mentor Name" width="200"/>
    </td>
    <td width="25"></td>
    <td>
      <p><b>Mentor A (pronouns)</b></p>
      <p>Mentor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>

  <tr>
    <td>
      <img src="images/mentorB.jpg" alt="Mentor Name" width="200"/>
    </td>
    <td width="25"></td>
    <td>
      <p><b>Mentor B (pronouns)</b></p>
      <p>Mentor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>

  <tr>
    <td>
      <img src="images/mentorC.jpg" alt="Mentor Name" width="200"/>
    </td>
    <td width="25"></td>
    <td>
      <p><b>Mentor C (pronouns)</b></p>
      <p>Mentor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>

</table>


### Evening Tutors

We have T amazing evening tutors in the department this semester. During their evening lab hours, they are eager to help you with your learning and your homework. They also help students taking CSC 161 and CSC 207.

<table>
  <tr>
    <td>
      <img src="images/tutorA.jpg" alt="Tutor Name" width="200"/>
    </td>
    <td width="25"></td>
    <td>
      <p><b>Tutor A (pronouns)</b></p>
      <p>Tutor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>

  <tr>
    <td>
      <img src="images/tutorB.jpg" alt="Tutor Name" width="200"/>
    </td>
    <td width="25"></td>
    <td>
      <p><b>Tutor B (pronouns)</b></p>
      <p>Tutor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>

  <tr>
    <td>
      <img src="images/tutorC.jpg" alt="Tutor Name" width="200"/>
    </td>
    <td width="25"></td>
    <td>
      <p><b>Tutor C (pronouns)</b></p>
      <p>Tutor Bio</p>
    </td>
  </tr>
  <tr height="25"></tr>

</table>

## Learning Objectives

This course covers 18 learning objectives (LOs).

### Unit 1 (Weeks 1–4) 
- **Decomposition.** Decompose a computational problem into smaller sub-problems amendable to implementation with functions. 
- **Procedural abstraction.** Take a concrete implementation in Racket and create a procedure that generalizes that behavior. 
Tracing. Trace the execution of a Racket program using a substitutive model of computation. 
- **Primitive types.** Express basic computations over primitive values and their associated standard library functions. 
- **Conditionals.** Use Boolean expressions and conditional operations to produce conditional behavior. 
- **Lists.** Manipulate lists with fundamental higher-order list functions. 
- **Local bindings.** Refactor redundancy and add clarity in computations with let-bindings. 
- **Documentation.** Document programs according to good software engineering principles. 

### Unit 2 (Weeks 5–8) 
- **Testing.** Test programs according to good software engineering principles. 
- **List recursion.** Design and write recursive functions over lists. 
- **Numeric recursion.** Design and write recursive functions over the natural numbers. 
- **Higher-order programming.** Write procedures that take procedures as parameters and return procedures as results. 
- **Lambda-free anonymous procedures.** Use section and composition to simplify computations. 

### Unit 3 (Weeks 9–13) 
- **Dictionaries.** Design and write functions that use dictionaries. 
- **Vectors.** Design and write functions (potentially recursive functions) that use vectors. 
- **Data abstraction.** Design data structures to separate interface from implementation. 
- **Tree recursion.** Design and write recursive functions over trees. 
- **Running time.** Use a mental model of computation to count the relevant number of operations performed by a function. 


## Communication

**Course Website** - This website contains all courses policies. Course materials and homework deadlines will be posted here as they become available. Familiarize yourself with the website so you know where to find everything.

**Email** - Your instructor will send course announcements via email. You are responsible for reading all email from your instructor.

**Teams** - Our class has a Teams channel for Q&A shared by all three sections. If you have a question and others in the class could benefit from its answer, please post in the teams Q&A channel.

**Getting in touch with your instructor** -- If you need to get in touch with me privately, use email or teams. I try to reply to messages within about 24 hours, excluding weekends and holidays. If you do not hear back within that amount of time, please send a reminder.

**Gradescope** -- You will submit assignments via gradescope. Please confirm that you have been added to this class on gradescope.

## Class related meetings
**Class meetings** -- Most days of class are lab days. Your instructor will make announcements and might briefly present concepts. Most of the time, you will collaborate with your lab team on programming practice problems. 

**Evening tutors** -- 5 days per week, peer educators will be available in our classroom during certain hours to help you with homework questions. You can drop in at any time to work on your homework or ask a question.

**Mentor sessions** -- 3 times per week, a peer educator will hold a supplementary session where they might offer a review of concepts from class or practice problems. You should show up at the start of the session and stay until the end.

**Informal time** -- You are encouraged to come to our classroom to study and work at any time that the room is not reserved for class or a meeting. This is an opportunity to collaborate with peers and form community.

**Office hours** -- Your instructor will hold office hours each week. This time is for you to meet with your instructor and talk about any course related matter that you like!


## Deliverables
**Reading responses** -- prior to each class meeting, you will read an online reading assignment about computing concepts, work through code examples in a programming environment, and answer a few questions about the reading

**Labs** -- during each class meeting, you will work with a partner to complete programming exercises to practice the concepts from the readings

**Homeworks** -- About once per week you will complete an individual programming assignment where you apply and extend concepts from readings and labs. No programming assignment on midterm exam weeks.

**Final project** -- The final programming assignment will be more open ended and completed in teams.

**Quizzes** -- About once per week, you will complete an individual, 15-minute quiz in class on paper (time extended according to any accommodations)

**Exams** -- 4 times during the semester, you will complete an individual midterm exam in class on paper, lasting the entire class period (time extended according to any accommodations)

**Pre-reflections** -- Before each homework and each exam, you will answer some reflection questions to help you prepare and feel confident to dive in. 

**Post-reflections** -- After each homework and each exam, you will answer some reflection questions to help you understand what went well and what went poorly.


## Collaboration
Policy to be announced.

## Grading
<!-- see Letter grades section at https://github.com/grinnell-cs/csc151-images/blob/main/pages/syllabus.md?plain=1 and _data/bundles.yml for example of how to make the table !-->

## Deadlines and Late Days

Check the schedule to see your assignments. Check Gradescope to see the time of day that each assignment is due. Due times are typically as follows:
- **Readings** -- 10 pm the day BEFORE it appears on the schedule
- **Labs** -- 10 pm on the next lab day (except around breaks and exams)
- **Homeworks** -- 10 pm the day it appears as "due" on the schedule
- **Reflections** -- 10 pm the day it appears on the schedule

### Late Days
- Late days are a currency that you can spend to turn in assignments late.
- You start the semester with 10 late days.
- You are responsible for keeping track of your own late days.
- You may spend late days on reading responses, labs, pre-reflections, post-reflections, homeworks, and homework revisions.
- You may spend one late day to submit any of the named assignments up to 24 hours late.
- You may spend up to two late days on any given assignment, for a maximum lateness of 48 hours on that assignment.


## Redo and Revision Opportunities
We offer redo and revision opportunities because we believe that your final grade should be able to reflect what you know at the end of the semester rather than mistakes you've made as part of the learning process.

### Redos for Learning Objectives (Quizzes and Exams)
- When you earn an N on an LO, you can attempt to demonstrate mastery on that LO again on every following exam.
- The final exam allows you to redo past LOs but does not introduce new LOs, ensuring that you get a minimum of 2 tries to earn an S on every LO.

### Revisions for Homeworks
- You may revise and resubmit homework assignments after receiving feedback.
- When revised work is graded, the new grade, if higher, replaces the old grade. Submitting revised work cannot lower your grade.
- To be eligible for resubmission, you must have completed the homework in good faith on your first attempt, earning at least an N. Redo opportunities cannot be used as a way to skip homeworks and do them later.
- For the full homework revision policy, including frequency of resubmit opportunities, see the handout on homework revision (coming soon).
- Reading responses, labs, and reflections are graded based on good faith engagement with the assigned questions and cannot be revised for credit.

## Attendance
We expect you to attend class every day because collaborative learning is such an integral part of the class. If you need to be absent, talk to your instructor as soon as you know. This means a week or more in advance for planned absences.

### Sick Policy
Please stay home when you are sick. Wait to come back to class until you truly feel well enough to learn. Each day that you will miss class due to illness, contact your instructor before class (or as soon as possible).

When coming back to class, wear a mask until there is no more than a normal concern of contagion. Protecting the people around you from your illness is a matter of professionalism and personal respect.

### Late Work due to Illness and Time Away
You are responsible for checking the course website to see what is assigned while you are out and for completing all assigned work.

The late day and redo policies are designed to offer flexibility so that late work resulting from one or two minor to moderate illnesses or unforseen circumstances will not lower your grade in the class. If you find yourself needing to take lots of time away, please talk to your instructor about getting additional late days or increasing the number of late days you can spend on a given assignment.

<!-- ## Religious observances -->

<!-- ## Access Needs -->

<!-- ## AI Policy -->

