---
title: "EBoard 31: Data abstraction"
number: 31
section: eboards
held: 2023-11-10
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Quizzes
* Administrivia
* Questions
* Summarizing the ACM Code of Ethics

Administrivia
-------------

* Happy Friday!
* I hope you had a good Wednesday with Prof. Curtsinger.

### Upcoming Token activities

Academic

* Tuesday, 2023-11-14, Noon, Day PDR:
* Wednesday, 2023-11-15, 4pm, HSSC Kernel: _Madison Van Oort ’08 speaks
  Frictions in the Future of Work_.
* Thursday, 2023-11-16, 11-noon, JRC 101: _Convocation: Richard Robinson
  on Nanoparticles 101._
* Thursday, 2023-11-16, 4:15pm, JRC 101:  _CS Poster Session_.

Cultural

Peer

* Friday, 2023-11-10, 7-9pm: _Volleyball at Cornell_ (not the Ithaca one)
* Saturday, 2023-11-11: _Drag._ Cheer the performers and the illuminating
  lighting design.
* Wednesday, 2023-11-15. 7-9pm, Darby: _Women's Basketball vs. Central_.
* Friday, 2023-11-17. 7-9pm, Darby: _Women's Basketball vs. Coe._

Wellness

Misc

* Saturday, 2023-11-11, Noon: _Football vs. Cornell_.
* Sunday, 2023-11-12, 2-3:30 pm, Sebring-Lewis: _Grinnell Singers_.
* Monday, 2023-11-13, 4-5:30pm, HSSC N1112: _Politics of AI Info Session_.

### Other good things (no tokens)

* Friday, 2023-11-10, 7:30 pm, Darby: _Men's Basketball vs. Barclay_.
* Friday, 2023-11-10, 7:00 pm, Loose Lounge: _RHPS_.  Is RHPS misogynistic
  or a wonderful embrace of LGBTQ ideals?  Perhaps both?  Perhaps neither?

### Upcoming work

_Please put these in your notes!_

* Tonight: MP6 post-assessment
* Sunday night: Reading on higher-order programming.
* Sunday night: Late MP6
* Sunday night: MP7 pre-assessment
* Monday night: Late MP6 post-assessment
* Thursday: MP7
* Friday: MP7 post-assessment, quizzes

### Friday PSA

About MP7
---------

Either straightforward or complicated, I'm not sure which.

Questions
---------

### Administrative

Will you give a makeup quiz on _X_?

> Perhaps.  Once I see where everyone stands on LAs, I'll try to focus
  on the ones that have the most missing (plus the ones that are better
  to do on paper).

What work do we have left this semester?

> MP7 is your last mini-project.

> Next week, you'll get a multi-week open-ended group project.  That
  project includes a presentation at the end (Monday of week 14).

> SoLA 3 will be week 14.

> SoLA 4 will be finals week.

> Regular quizzes, readings, etc.

What will our ethics LA look like?

> An updated version of today's reading responses.

### Data abstraction

What was I supposed to take from the data abstraction reading/lab?

> It is generally important to distinguish _what_ we do with data
  from _how_ the data are represented.  (You could uses lists before
  we learned pairs, you can use numbers even though you don't know
  how the numbers are represented.)

> Ideally, the _what_ is dictated by the procedures you provide to
  manipulate the data structure.

> When we design our own "data structures", we should think about what
  people might want to do with our data and design appropriate procedures.
  Clients of our structures should access them through the procedures
  and not through the underlying implementation.

> Data abstraction, like procedural abstraction and decomposition, is a 
  key aspect of computational thinking.

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


