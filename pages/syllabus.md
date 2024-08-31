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

# Staff



## Instructor

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


## Mentors

We have N wonderful mentors working with CSC XXX this semester. You will see Mentor A class during our TIME section, while Mentor B and Mentor C will attend SECTIONS. All N mentors will hold mentor sessions for students from all sections.

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


## Evening Tutors

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
