---
title: "EBoard 19: Local bindings"
number: 19
section: eboards
held: 2023-10-06
link: true
---
# {{ page.title }}

**Warning** This class is being recorded.

_Approximate overview_

* Quiz (or quizzes)
* Administrivia
* Questions
* Lab

Administrivia
-------------

### Upcoming Token activities

Academic

* Mentor Session Sunday at 1pm.

Cultural

Peer

* Volleyball vs. Lawrence Saturday at 1pm (Senior Day).
* Play this weekend.  _Everybody_.  Friday and Saturday
  at 7:30 p.m. in Flanagan.  Sunday at 2:00 also in Flanagan.  Get
  tickets at the box office starting at noon on Thursday.  (Maybe
  before.)  The box office is in Bucksbaum, near the courtyard.

Wellness

Misc

* Fireman's breakfast, Sunday 6am-noon at the firehouse.  Free will donation.
    * I will reimburse you up to $10.

### Other good things

### Upcoming work

* Sunday night: Next reading due
* Monday morning: Today's lab due
* Thursday night: MP4

### Friday PSA


Questions
---------

### Administrative

### MP4

Do I have to use "the big three" or can I just solve things with
recursion?

> You can solve things with recursion.

Do I have to use recursion, or can I solve things with the big three?

> I'm not sure how you write the most general procedures without
  some kind of recursion or recursive thinking.

Can you give me an example of something that's really deep?

> Here's a procedure that will build a nested list of approximately
  `n` levels.

        (define deep
          (lambda (stuff n)
            (if (zero? n)
                (list stuff stuff)
                (deep-helper stuff (deep stuff (- n 1))))))

        (define deep-helper
          (lambda (stuff more-stuff)
            (list stuff more-stuff)))

> Sam will attempt to demo.

Lab
---

