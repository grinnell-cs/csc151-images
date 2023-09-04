---
title: "EBoard 05 (Section 1): Procedures"
number: 5
section: eboards
held: 2023-09-04
link: true
---
# {{ page.title }}

_Reminders to Self_

* **Warning** This class is being recorded.
* Post link to Otter.ai.

_Getting started_ (this will be our normal start-of-class sequence)

* Grab a card.  The card will have a computer name and a location.
* Remember the name and location.
* Drop the card back in the jar.
* Navigate to the computer.
* If you arrive first, log in and bring up the lab.
* When both partners arrive, introduce yourselves.

_Approximate overview_

* Administrative stuff [5 min]
* Questions on the readings [5-10 min]
* Questions on the mini-project [5-10 min]
* Lab [~60 min] (really 55 min)

Administrivia
-------------

### Introductory notes

* Mentor sessions: Sundays 1-2 in Science 3813.
* Sorry that I could not be here on Friday.  (I'm not recording the reason on
  the eboard.)
    * As I said, this is a personally difficult semester/year.
* Normal office hours are in-person (unless you'd prefer to do them
  remotely).
    * Tuesdays, 9:30-11:00 am
    * Wednesdays: 1:00-3:00 pm
    * Thursdays: 1:00-2:30 pm
    * Book at <https://bit.ly/book-samr>
    * You can also suggest other meeting times using the Outlook scheduling 
      assistant
* Our class site is still under development.  Let me know if you find
  things missing, including images.
    * Those slash things on the syllabus usually indicate something
      that I plan to post.  If they show up for a reading, let me know.
* To deal with some of the terminology confusion from last Wednesday, I've
  added a [terminology handout](../handouts/terminology).
* I went through all the responses for today's reading and will respond
  to the questions in a few minutes.  You should see a grade for the
  reading on gradescope.
    * My goal is that you spend about an hour on each day's readings.  I see
      that a few of you spent two hours.  We might discuss ways to make you
      more efficient (or more willing to have less mastery).
    * A few of you did not turn in the reading responses.  Please try 
      to be prompt on those.

### Upcoming Token activities

Academic

* CS Table, Tuesday, Noon, Day PDR (second floor of marketplace).
  Topic: Controversy over the CHI conference in Hawai'i.  Readings
    * https://chi2024.acm.org
    * https://www.chiinhawaii.info
    * Two PDFs that you can ask me for

Cultural

* Org Fair, Thursday, 4pm-7pm, "Outside"

Peer

* Volleyball vs. Buena Vista, 7pm Tuesday 5 Sept 2023
    * Detour: Iowa Pronunciation (Buena Vista, Nevada)
* Football vs. Rippon, 1pm Saturday, 9 Sept 2023

Wellness

### Upcoming work

* Two readings for Wednesday; Complete the reading assignment on Gradescope by 
  Tuesday night.
* Lab writeup(s) due before class on Wednesday.
* MP01 pre-assessment due last night.
    * It appears I screwed it up on Gradescope, so it's fine to turn
      it in tonight.
* MP01 one due Thursday night.
    * Gradescope submission form should appear this afternoon.

Questions on the readings
-------------------------

How does Scheme handle multi-parameter operations in which order matters,
such as subtraction or division?

> Left to right.  

> `(- 1 2 3)` is the same as `(- (- 1 2) 3)`.

> `(/ 1 2 3)` is the same as `(/ (/ 1 2) 3)`.

Are 2/5 and 0.4 the same?  How about 1/2 and 0.5?

> Nope.  You'll learn more about that in the readings for Wednesday.

Can I write my trace as follows?

```
(add-3 (* 2 3) (+ 8 3) (/ 1 2))
(* 2 3) = 6
(+ 8 3) = 11
(/ 1 2) = 0.5
Apply add-3: (add-3 6 11 0.5)
(+ 6 11) = 17
(+ 17 0.5) = 17.5
Result: 17.5
```

> No.  We really do want to see the full expression at every step.
  Past experience suggests that it's easy to get lost in more
  complex expressions if you don't do so.

```
    (add-3 (* 2 3) (+ 8 3) (/ 1 2))
--> (add-3 6 (+ 8 3) (/ 1 2))
--> (add-3 6 11 (/ 1 2))
--> (add-3 6 11 1/2)
--> (+ (+ 6 11) 1/2)
--> (+ 17 1/2)
--> 17 1/2
```

Do we have to write out the "x is 6, y is 11, z is 1/2"?

> No.  But you might find it useful.

Why parenthesize `(+ x y)` in the definition of `add-3`?

> `(define add-3 (lambda (x y z) (+ (+ x y) z)))`

> For the time being, we're pretending that addition only takes two
  parameters.  We also want you to practice dealing with nested
  expressions.

Why define `triple` in reference to `add-3`?

> `(define triple (lambda (x) (add-3 x x x)))`

> We want you to practice multi-step traces.

> It's a good habit to build procedures on top of others you've built
  in the past.

Don't both these choices add more steps to the overall evaluation
and make the code for `triple` less resilient (if the `add-3`
function is removed or altered)?

> The first choice should not affect the steps.  Multi-parameter
  plus usually just does a series of two-parameter additions.

> We normally build more complex procedures in terms of procedures
  we've already built.  In this case, we didn't gain much, but we'll
  see gains elsewhere.

> If we define a procedure that others may rely on, we have a
  responsibility to ensure that any alterations preserve its overall
  functionality.

Can I simplify `(+ 1 2)` to `(3)`?

> `(+ 1 2)` is `3`, not `(3)`.  Parentheses generally signal to Racket 
  that you have an expression that you want evaluated.

Questions on the mini-project
-----------------------------

Can you explain part four?

> I can try.

> Let's suppose we've made an awesome picture.

```
(define my-image
  (above
    (overlay (circle 20 "outline" "black")
             (circle 20 "solid" "grey"))
    (beside (overlay (circle 20 "outline" "black")
                     (circle 20 "solid" "purple"))
            (overlay (circle 20 "outline" "black")
                     (circle 20 "solid" "teal")))
    (beside (overlay (circle 20 "outline" "black")
                     (circle 20 "solid" "red"))
            (overlay (circle 20 "outline" "black")
                     (circle 20 "solid" "blue"))
            (overlay (circle 20 "outline" "black")
                     (circle 20 "solid" "green")))))
```

> We might want to change the size of the circles, the outline color,
  the colors of the individiaul circles, etc.

> So we'll write a procedure to do that.  (I am not showing our hard
  work writing this in DrRacket.)

```
(define generate-my-image
  (lambda (size top-color)
    (above
     (overlay (circle size "outline" "black")
              (circle size "solid" top-color))
     (beside (overlay (circle size "outline" "black")
                      (circle size "solid" "purple"))
             (overlay (circle size "outline" "black")
                      (circle size "solid" "teal")))
     (beside (overlay (circle size "outline" "black")
                      (circle size "solid" "red"))
             (overlay (circle size "outline" "black")
                      (circle size "solid" "blue"))
             (overlay (circle size "outline" "black")
                      (circle size "solid" "green"))))))
```

Provide a call to your procedure that generates the same image you used in part 2. Call it my-image-alt.

> (define my-image-alt (generate-my-image 20 "grey"))

Provide a call to your procedure that generates a substantially different image. Call it my-other-image.

> (define my-other-image (generate-my-image 5 "green"))

Lab
---

The person nearest the board is "A".  The other person is "B".  If there
are three of you, adjust as best you can.

Where should we put our trace?

Between the `#|` and the `|#`.

```
#| 
a.
     (my-func-1 (+ 1 1) 5)
 --> (my-func-1 2 5)
 --> (...)
|#
```

If you want to check your trace, use `(require csc151/trace)` (in addition
to your main trace).  (Except that you can't really check tracing of functions
(yet).)

```
(define snowman
  (lambda (size)
    (above (circle (* size 1/2) "outline" "black")
           (circle (* size 3/4) "outline" "black")
           (circle (* size 1) "outline" "black"))))
```

The height of that snowman is 

```
  2 * (1/2 + 3/4 + 1) * size
= 2 * (2/4 + 3/4 + 4/4) * size
= 2 * (9/4) * size
= 18/4 * size
= 9/2 * size
```

So here's one way to revise

```
(define snowman-revisited
  (lambda (height)
    (snowman (* height 2/9))))
```

Yay! Math!

Submit what you have!  It's enough for credit.  Do more stuff as you'd like.
