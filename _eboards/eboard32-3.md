---
title: "EBoard 32: Tail recursion (Section 3)"
number: 32
section: eboards
held: 2025-04-21
link: true
---
# {{ page.title }}

**Warning! You are being recorded** and transcribed, provided the technology
is working correctly.

_Approximate optimistic overview_

* Administrative stuff 
* Tail recursion
* Q&A
* Lab

Administrative stuff
--------------------

### Introductory notes

* We will be forming groups for mini-project 9 on Wednesday. PLEASE COME TO
  CLASS! (It's also okay if you decide to work alone.)
* To help make the semester a bit more manageable, I will permit Es
  on second redos (except for MP1).
    * If that affects the work you put into the MP2 and MP3 redo, let me know.
* I've extended the MP4, MP5, and MP6 redos another week.
* Please please please submit mentor and evening tutor evaluations.
    * <https://grinnell.co1.qualtrics.com/jfe/form/SV_1YUJY7nJqaj9AtU>
    * A token for everyone if at least 30 people fill it out.

### Upcoming activities

Scholarly

* Tuesday, 22 April 2025, noon--1pm, White PDR.
  _CS Table: Big Tech and AntiTrust_ 
    * Hannibal Hanschke. [Google loses online ad monopoly case. But it’s just one of many antitrust battles against big tech. The Conversation. April 18, 2025](https://theconversation.com/google-loses-online-ad-monopoly-case-but-its-just-one-of-many-antitrust-battles-against-big-tech-254602)
    * Steve Lohr. [Google Makes History With Rapid-Fire Antitrust Losses. The New York Times. April 18, 2025.](https://www.nytimes.com/2025/04/18/technology/google-antitrust-losses-history.html?unlocked_article_code=1.BE8.eEHB.2i-a4_DsoEIb&smid=url-share)
    * Steven Levy. [Meta’s Monopoly Made It a Fair-Weather Friend. Wired. April 18, 2025.](https://www.wired.com/story/plaintext-ftc-meta-trial-mark-zuckerberg/)
* Thursday, 24 April 2025, 4pm, HSSC 2231.
  _Annual McKibben Lecture: Love in a Time of Bankruptcy: Calculations
   in Catullus_

Artistic

* Monday, 21 April 2025, 4:00--5:00 p.m., GCMoA.
  _Poetry Reading by Lívia Stein Freitas_
* All week (I think.) Bucksbaum Basement.
  _Art Exhibit: If you woke up and you were a fish, what would you do?_

Multicultural

* Friday, 25 April 2025, 4:00--5:00 p.m., HSSC N1170 (Global Living Room).
  _Middle of Everywhere: Road Trip Around Spain_
* Saturday, 26 April 2025, 1:00--8:30 p.m., Cleveland Beach.
  _Holi_

Peer

_Musical, theatric, sporting, and academic events involving this section's
students are welcome._

* Read articles by your fellow CSC-151 students and comment on them online.

Wellness

* Monday, 21 April 2025, 6:30--8:00 p.m. Dance Studio.
  _Brazilian Jiu-Jitsu_
* Tuesday, 22 April 2025, 12:00--12:45 p.m., Dance Studio.
  _HIIT Training_.
* Tuesday, 22 April 2025, 12:15--12:50 p.m., GCMoA.
  _Yoga in the Museum_.
* Tuesday, 22 April 2025, 4:30--6:30 p.m., 
  BRAC P103 (Multipurpose Dance Studio).
  _Wellness Yoga_.
* Wednesday, 16 April 2025, 6:30--8:00 p.m., Dance Studio.
  _Brazilian Jiu-Jitsu_
* Thursday, 17 April 2025, 12:00--12:45 p.m., Dance Studio.
  _HIIT Training_.
* Thursday, 17 April 2025. 4:30--6:30 p.m., Off Campus.
  _Forest Bathing._
    * Sign ups are required.
* Friday, 25 April 2025, 6:00--8:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Friday, 25 April 2025, 6:30--8:00 p.m. Dance Studio.
  _Brazilian Jiu-Jitsu_
* Friday, 25 April 2025, 9:00 p.m., Noyce Elbow.
  _Nerf at Noyce_.
* Saturday, 26 April 2025, 4:00--6:00 p.m., Aux Gym.
  _Badminton Club_ (Smash that bird!)
* Tuesday, 29 April 2025, 5:00--6:00 p.m., HSSC Atrium.
  _Therapy Dogs_.
* Tuesday, 29 April 2025, 7:15--8:15 p.m., HSSC Atrium.
  _Therapy Dogs_.

Misc

* Tuesday, 22 April 2025, 7:00--8:00 p.m., Science 3820.
  _Mentor Session: Quizzes_
* Wednesday, 23 April 2025, Noon--1:00 p.m., HSSC A2231 (Auditorium)
  _Community Forum_
    * "Weekly discussion on legal protections and recourse on issues 
      that higher education and Grinnell College face."
    * Also online.
    * This week: Disability Law
* Sunday, 27 April 2025, 7:30--8:30 p.m., Science 3819. 
  _Mentor Session_

### Other good things

_These do not earn tokens, but are worth your consideration._

* Saturday, 25 April 2025, Noon, Baseball field.
  _Baseball vs. Ripon_
* Saturday, 25 April 2025, 2:30 p.m., Baseball field.
  _Baseball vs. Ripon_
* Sunday, 26 April 2025, Noon, Baseball field.
  _Baseball vs. Ripon_
* Saturday, 25 April 2025, 1pm, Softball field.
  Softball vs. Cornell_ 
* Saturday, 25 April 2025, 3:30 p.m., Softball field.
  Softball vs. Cornell_ 

### Upcoming work

* Monday, 21 April 2025
    * [SoLA 3](../las) distributed
        * Topics from phase one: Decomposition, Primitive types, Collaboration,
          Lambda-free anonymous procedures (aka cut and compose).
        * Topics from phase two: Conditionals, Documentation, Testing,
          Lists (and "the big three"), Program Style, Ethical Considerations
        * Topics from phrase three you've done quizzes on: List recursion,
          local bindings
        * New topics from phase three: Numeric recursion, vectors, randomness.
* Tuesday, 22 April 2025
    * [Submit today's lab on Gradescope](...)
    * Readings
        * [Mini-project 9](../mps/mp09)
        * _No reading response!_
* Wednesday, 23 April 2025 
    * Quiz: Data abstraction / structs
    * Makeup quiz: Dictionaries
    * Makeup quiz: Diagramming structures (paper only)
    * _Don't forget that you can bring a page of hand-written notes for
      each quiz._
* Thursday, 24 April 2025
    * No lab writeup from Wednesday
    * Reading:
        * [Trees](../readings/trees-ex)
        * Submit reading response on Gradescope
    * [SoLA 3](../las) due
        * Topics from phase one: 
          [Decomposition](https://www.gradescope.com/courses/948769/assignments/6115453), 
          [Primitive types](https://www.gradescope.com/courses/948769/assignments/6115460),
          [Collaboration](https://www.gradescope.com/courses/948769/assignments/6115123),
          [Lambda-free anonymous procedures (aka cut and compose)](https://www.gradescope.com/courses/948769/assignments/6115471)
        * Topics from phase two: 
          [Conditionals](https://www.gradescope.com/courses/948769/assignments/6115491), 
          [Documentation](https://www.gradescope.com/courses/948769/assignments/6115479), 
          [Testing](https://www.gradescope.com/courses/948769/assignments/6115536),
          [Lists (and "the big three")](https://www.gradescope.com/courses/948769/assignments/6115524),
          [Program Style](https://www.gradescope.com/courses/948769/assignments/6115543), 
          [Ethical Considerations](https://www.gradescope.com/courses/948769/assignments/6115122)
        * Topics from phrase three you've done quizzes on: 
          [List recursion](https://www.gradescope.com/courses/948769/assignments/6115644),
          [Local bindings](https://www.gradescope.com/courses/948769/assignments/6115642)
        * New topics from phase three: 
          [Numeric recursion](https://www.gradescope.com/courses/948769/assignments/6115757), 
          [Vectors](https://www.gradescope.com/courses/948769/assignments/6115682), 
          [Randomness](https://www.gradescope.com/courses/948769/assignments/6115783)
* Friday, 25 April 2025
    * [Submit pre-reflection for MP9 on Gradescope]()
* Sunday, 27 April 2025
    * [Submit first redo for MP6 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6097560)
    * [Submit second redo for MP4 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6045580)
    * [Submit second redo for MP5 on Gradescope](https://www.gradescope.com/courses/948769/assignments/6045581)
    * Submit first redo for MP7 on Gradescope (maybe)
* Friday, 16 May 2025
    * Submit final redo for MP1 on Gradescope
    * Submit final redo for MP2 on Gradescope
    * Submit final redo for MP3 on Gradescope
    * Submit final redo for MP4 on Gradescope
    * Submit final redo for MP5 on Gradescope

### Brain dumps

* I would have liked to have seen more brain dumps of things like vector 
  recursion on the SoLA pre-reflections. 
* That could be "here's a vector recursive procedure I've written" (as
  best you recall) 
* Or "here's a pattern"
* Or just something like "the base case is normally ..."; "the
  recursive case is normally ...".
* Let's try that now. 

#### Vector recursion

```
(define vector-increment-odd!
  (lambda (vec)
    (vio-helper! vec 0)))
(define vio-helper!
  (lambda (vec pos)
    (when (< pos (vector-length vec))
      (wen (odd (vector-ref vec pos))
        (vector-set! vec pos 
                     (+ 1 (vector-ref vec pos))))
      (vio-helper! vec (+ pos 1)))))
```

#### Randomness

* We had that 7/11 thing. It turned out that calling `pair-a-dice` twice
  was a bad idea. Using `let` fixed it.
* We should check whether we get the right distribution of values when we
  design something random.

```
(define tests
  (lambda (n)
    (if (zero? n)
        0
        ...)))
```

Tail Recursion
--------------

Would it be possible for you to run through how to do the reading
question. I understand that tail recursion requires that all
functions and procedures be done before the recursive call, but I'm
not sure how to implement that.

### General principles

* Goal: Write recursive procedures such that there's nothing "around"
  any recursive call. (Once the recursive call finishes, we're done.)
* One technique: Add a helper.
* Associated technique: Add an "accumulator" to the helper which builds
  up an answer as we go.

### `factorial`

Normal recursion

```
(define factorial
  (lambda (n)
    (if (zero? n)
        1
        (* n (factorial (- n 1))))))
```

_This is not tail recursive!_

Tail recursion

```
(define factorial
  (lambda (n)
    (helper n 1)))

(define helper
  (lambda (n so-far)
    (if (zero? n)
        so-far
        (helper (- n 1) (* n so-far)))))
```

How does it work?

```
    (factorial 5)
--> (helper 5 1)
--> (helper (- 5 1) (* 5 1))
--> (helper 4 5)
--> (helper (- 4 1) (* 4 5))
--> (helper 3 20)
--> (helper (- 3 1) (* 3 20))
--> (helper 2 60)
--> (helper (- 2 1) (* 2 60))
--> (helper 1 120)
--> (helper (- 1 1) (* 1 120))
--> (helper 0 120)
120
```

### `make-list`

Normal recursion

```
;;; Make a list of `n` copies of `val.
(define make-list
  (lambda (n val)
    (if (zero? n)
        null
        (cons val (make-list (- n 1) val)))))
```

Tail recursion

```
(define helper
  (lambda (n val so-far)
    (if (zero? n)
        so-far
        (helper (- n 1) val (cons val so-far)))))

(define make-list
  (lambda (n val)
    (helper n val null)))
```

Trace

```
    (make-list 3 'um)
--> (helper 3 'um '())
--> (helper 2 'um (cons 'um '()))
--> (helper 2 'um '(um))
--> (helper 1 'um (cons 'um '(um)))
--> (helper 1 'um '(um um)))
--> (helper 0 'um (cons 'um '(um um)))
--> (helper 0 'um '(um um um))
--> '(um um um)
```

Observations

* The base case test is the same. `(if (zero n) ...)`
    * In the original, we return a base value of null
    * In the tail-recursive version, we return a base value of `so-far`.
* There's a recursive call that takes `(- n 1)` and `val`.
  The tail-recursive helper adds a third parameter (`so-far`)
* In the original, we cons val onto the recursive call, in the tail-recursive
  version, we cons val onto `so-far`. (Same operation, moved from outside
  the recursive call to inside the recursive call.)
* The base case value in the original becomes the starting value for
  `so-far` in the tail-recursive version.

### `filter`

Normal recursion

```
(define filter
  (lambda (lst pred?)
    (if (null? lst)
        null
        (if (pred? (car lst))
            (cons (car lst) (filter (cdr lst) pred?))
            (filter (cdr lst) pred?)))))
```

Tail recursion

```
(define filter
  (lambda (lst pred?)
    (helper lst pred? null)))

(define helper
  (lambda (lst pred? so-far)
    (if (null? lst)
        so-far
        (if (pred? (car lst))
            (helper (cdr lst) pred? (cons (car lst) so-far))
            (helper (cdr lst) pred? so-far)))))
```

Trace

```
    (filter '(1 2 3 4 5) odd?)
--> (helper '(1 2 3 4 5) odd? null)
--> (helper '(2 3 4 5) odd? (cons 1 null))
--> (helper '(2 3 4 5) odd? '(1))
--> (helper '(3 4 5) odd? '(1))
--> (helper '(4 5) odd? (cons 3 '(1)))
--> (helper '(4 5) odd? '(3 1))
```

Questions
---------

### Administrative

### Readings

I do not quite understand how list recursion can be generalized
using tail recursion.

> We can often build up the list _backwards_ as we go, and then reverse it
  in the last step.

Are we expected to memorize the recursion templates provided in the
reading? They seem much more specific than the other procedures we
have been given templates for, which didn't necessarily require
memorizing and more so logic.

> You don't have to memorize the templates. But they may help to
  have in your notes.

What’s the difference between `letrec` and `let*`?

> `let*` defines things in sequence. `letrec` builds recursive procedures.
  You can't build a recursive procedure with `let*`.

Lab
---

