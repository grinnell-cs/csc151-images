---
title: "EBoard 32: Higher-order programming"
number: 32
section: eboards
held: 2023-11-13
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Administrivia
* Questions
* 

Administrivia
-------------

* Warning!  Friday the 13th falls on a Monday this month.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-14, Noon, Day PDR: _CS Table_.
* Tuesday, 2023-11-14, 7pm, ???: _Mentor session_.
* Wednesday, 2023-11-15, 4pm, HSSC Kernel: _Madison Van Oort ’08 speaks
  Frictions in the Future of Work_.
* Thursday, 2023-11-16, 11-noon, JRC 101: _Convocation: Richard Robinson
  on Nanoparticles 101._
* Thursday, 2023-11-16, 4:15pm, HSSC Kernel:  _CS Poster Session_.

Cultural

Peer

* Wednesday, 2023-11-15, 7-9pm, Darby: _Women's Basketball vs. Central_.
* Friday, 2023-11-17, 7-9pm, Darby: _Women's Basketball vs. Coe._
* Saturday, 2023-11-18, 1pm, Osgood: _Swimming vs Augustana._
* Sunday, 2023-11-19, 2pm, Darby: _Women's Basketball vs Waldorf._

Wellness

* We need more wellness activities!

Misc

* Monday, 2023-11-13, 4-5:30pm, HSSC N1112: _Politics of AI Info Session_.

### Other good things (no tokens)

### Upcoming work

_Please put these in your notes!_

* Monday: Late MP6 post-assessment
* Tuesday: Reading!
* Thursday: MP7
* Thursday: No reading!
* Friday: MP7 post-assessment, quizzes
* Sunday: MP8 pre-assessment
* Sunday; Reading!

### Friday quiz topics

* Higher-order programming (new)
* Tracing (very old)
* Diagramming structures (old)

Comments from MP6 post-assessmentss
-----------------------------------

Due to nearly every procedure referencing numerous others, it was difficult to trace where errors occurred when calling the final top level procedure.

> Write tests!  

> Ask Sam!

I couldn't find time to meet with Sam.

> Email and Teams Messages work (or usually work).

> Evening tutors might be able to help.

> Classmates might be able to help.

It was frustrating that I thought I was done and then learned that there were issues I hadn't thought about when I got results from the autograder.

> Don't forget that you can run the autograder at any point and see the kinds of things I'm looking for.  (You only see the input, but that plus the text should give you some ideas.)

I would have liked more class time on bitmaps.

> Sorry.  Sometimes the learning has to happen in the mini-projects.

I couldn't figure out how to do X.

> Did you ask anyone?

I would have benefited from reading through the prompts to begin thinking about the problems, even before actually starting.

> That's one of the reasons I give you a pre-assessment.

Questions
---------

### MP7

_Many questions and their answers can be found at the end of MP7._

### Administrative

Have you figured out what you're doing about missing metacognitive reflections?

> The policy has always been "You are permitted to miss up to six
  labs, readings, and metacognitive reflections."  I think that remains
  reasonable.

> I have added a policy that if your LAs and MPs indicate a passing
  grade, then missing tokens, labs, readings, or metacognitive
  reflections cannot drop you below a C.  I also think that seems
  reasonable.

### Ethics

Why did you give us this reading?

> Because I'm not doing my job as a CS instructor unless I get you
  to think about the implications of computing.  (I need to do more 
  of it.)

### Data abstraction

How would you solve the first self check?

> Write a procedure, (name->string name), that takes a name and converts it to the appropriate string. name->string should work no matter what representation we use, even if we use a representation we have not yet covered.

> Conceptual answer: Build a list of the five components.  Filter out the
  non-strings.  Join them with a space between them.

```
(define name->string
  (lambda (name)
    (reduce (cut (string-append <> " " <>))
            (filter string?
                    (list (name-prefix name)
                          (name-given name)
                          (name-middle name)
                          (name-family name)
                          (name-suffix name))))))
```

### Higher-order programming

How would you solve the self check?

```
(define filter
  (lambda (pred? lst)
    (cond
      [(null? lst)
       null]
      [(pred? (car lst))
       (cons (car lst) (filter pred? (cdr lst)))]
      [else
       (filter (pred? (cdr lst)))])))
```

Is the point of this to understand how these important procedures like map and filter came about (showing the underlying mechanisms now that we have more knowledge)?

> Yes, that's one of the key points.  Most of the procedures we use, we
  can write.

> Another point is that we can pass functions as parameters.  (We've done
  that many times.)

> A third point is that we can return procedures from procedures.

### Other

Ethics
------

<https://www.acm.org/code-of-ethics>

_Let's read them aloud._

* 1. GENERAL ETHICAL PRINCIPLES.
    * 1.1 Contribute to society and to human well-being, acknowledging that all people are stakeholders in computing.
    * 1.2 Avoid harm.
    * 1.3 Be honest and trustworthy.
    * 1.4 Be fair and take action not to discriminate.
    * 1.5 Respect the work required to produce new ideas, inventions, creative works, and computing artifacts.
    * 1.6 Respect privacy.
    * 1.7 Honor confidentiality.
* 2. PROFESSIONAL RESPONSIBILITIES.
    * 2.1 Strive to achieve high quality in both the processes and products of professional work.
    * 2.2 Maintain high standards of professional competence, conduct, and ethical practice.
    * 2.3 Know and respect existing rules pertaining to professional work.
    * 2.4 Accept and provide appropriate professional review.
    * 2.5 Give comprehensive and thorough evaluations of computer systems and their impacts, including analysis of possible risks.
    * 2.6 Perform work only in areas of competence.
    * 2.7 Foster public awareness and understanding of computing, related technologies, and their consequences.
    * 2.8 Access computing and communication resources only when authorized or when compelled by the public good.
    * 2.9 Design and implement systems that are robustly and usably secure.
* 3. PROFESSIONAL LEADERSHIP PRINCIPLES.
    * 3.1 Ensure that the public good is the central concern during all professional computing work.
    * 3.2 Articulate, encourage acceptance of, and evaluate fulfillment of social responsibilities by members of the organization or group.
    * 3.3 Manage personnel and resources to enhance the quality of working life.
    * 3.4 Articulate, apply, and support policies and processes that reflect the principles of the Code.
    * 3.5 Create opportunities for members of the organization or group to grow as professionals.
    * 3.6 Use care when modifying or retiring systems.
    * 3.7 Recognize and take special care of systems that become integrated into the infrastructure of society.
* 4. COMPLIANCE WITH THE CODE.
    * 4.1 Uphold, promote, and respect the principles of the Code.
    * 4.2 Treat violations of the Code as inconsistent with membership in the ACM.

First reflections
-----------------

A _TPS activity._

### Which principles did you find surprising (or most surprising)?  Why?

### Which are your "favorite" principles?

### Which principles do you expect to be hardest to follow?

A case study
------------

_Modified from <https://ethics.acm.org/code-of-ethics/using-the-code/case-dark-ux-patterns/>.  (Please don't look there for analysis.)_

The change request Stewart received was simple enough: replace the web site’s rounded rectangle buttons with arrows and adjust the color palette to one that mixes red and green text. But when Stewart looked at the prototype, he found it confusing. The left arrow suggested that the web site would go back to a previous page or cancel some action; instead, this arrow replaced the button for accepting the company’s default product. The right arrow, on the other hand, upgraded the user to the more expensive category; it also silently added a protection warranty without asking for confirmation. Stewart suggested to his manager that this confusing design would probably trick users into more expensive options that they didn’t want. The response was that these were the changes requested by the client.

Shortly after the updates were released into their production system, Stewart’s team was invited to a celebration. As a result of these changes, revenues at their client had increased significantly over the previous quarter. At the celebration, Stewart overheard some of the client’s managers discussing the small increase for refunds by users who claimed that they didn’t want the protection plan, but there weren’t many. One manager noted several complaints from visually impaired users, who noted that the mixture of red and green text obscured important disclaimers about the product. “So what you’re saying, then, is that the changes worked as planned,” quipped one of the managers.

_TPS: What should Stewart do (or have done)?_

Another case study
------------------

_Modified from <https://ethics.acm.org/code-of-ethics/using-the-code/case-malware-disruption/>.  Please don't read the analysis._

Rogue Services advertised its web hosting services as “cheap, guaranteed uptime, no matter what.” While some of Rogue’s clients were independent web-based retailers, the majority were focused on malware and spam. Several botnets used Rogue’s reliability guarantees to protect their command-and-control servers from take-down attempts. Spam and other fraudulent services leveraged Rogue for continuous delivery. Corrupted advertisements often linked to code hosted on Rogue to exploit browser vulnerabilities to infect machines with ransomware.

Despite repeated requests from major ISPs and international organizations, Rogue refused to intervene with these services, citing their “no matter what” pledge to their customers. Furthermore, international pressure from other governments failed to induce national-level intervention, as Rogue was based in a country whose laws did not adequately proscribe such hosting activities.

Ultimately, Rogue was forcibly taken offline through a coordinated effort from multiple security vendors working with several government organizations. This effort consisted of a targeted worm that spread through Rogue’s network. This denial-of-service attack successfully took Rogue’s machines offline, destroying much of the data stored with the ISP in the process. All of Rogue’s clients were affected. No other ISPs reported any impact from the worm, as it included mechanisms to limit its spread. As a result of this action, spam and botnet traffic immediately dropped significantly. In addition, new infections of several forms of ransomware ceased.

_TPS: Was the response appropriate?  Ethical?  What principles would permit the security vendors and government organizations to write such software.  Which might suggest that they behaved unethically?_


