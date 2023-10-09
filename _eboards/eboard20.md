---
title: "EBoard 20: List recursion, revisited"
number: 20
section: eboards
held: 2023-10-09
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed).

_Approximate overview_

* Administrivia
* Questions
* A quick review of one of the recent double dagger questions
* Lab

Administrivia
-------------

* Grade summaries distributed over the weekend.  
    * Let me know if you have questions.
    * I haven't charged "redo costs" yet.
    * I've turned in some academic alerts.
* Folks seem to be struggling with recursion.  I think it's because we
  haven't had enough practice.  So we'll be practicing with list recursion
  one more time today.
* Please don't assume that I'll read your reading questions promptly.  Ask
  questions in class if you're not sure.
    * I'll go over numeric recursion questions on Wednesday.
* Today's lab is new.  Fingers crossed.
    * I may need a few minutes at the start of class to check over the
      autograder.

### Upcoming Token activities

Academic

* CS Extras Thursday (unknown topic)

Cultural

* Intertribal Pow-Wow, Today, 1:30-4:30, Kington Plaza (30 min suffices)
* "Growing Up Native in Iowa" by Stephanie BadSoldier Snow, Drake Library,
  5:30-6:30 pm.

Peer

Wellness

Misc

### Other good things

### Upcoming work

* Tuesday night: NO READING DUE! (unless you didn't do the numeric recursion
  reading already)
* Wednesday morning: Today's lab due (normal policy)
* Thursday night: MP4
* Thursday night: Reading for Friday
* Friday Quiz

Questions
---------

### Administrative

Will I be charged a token for redoing an MP?

> See [the token policies](https://rebelsky.cs.grinnell.edu/Courses/CSC151/2023Fa/handouts/tokens) for details.

> If you got an R or an M, there is no charge for the first redo
  (unless you turn it in late).

> If you got an I or did not turn in the mini-project, you must
  spend one token to turn in the redo (and a second if you turn it
  in late).

> Second redos cost two tokens.  If you didn't turn in the first
  redo, the second redo stil counts as a second redo.

Will I be charged a token for redoing an LA?

> No.

When will I have the opportunity to make up an LA I missed on SoLA 1?

> On SoLA 2.

When will I have a chance to make up the LAs on the big three and list
recursion?

> The original plans was that if you missed an LA on a quiz, you'd get to
  try again on the SoLA.  However, in a lapse of judgement, I seem to 
  have started to give weekly quiz makeups.  You can try then or you can
  wait for the next SoLA.

When will I have a chance to make up the LA on documentation?

> On the next SoLA.

What is this Friday's quiz topic?

> Local bindings (and using local bindings to simplify code).

### MP4

Can you explain a bit about mutual recursion?

> Normal recursion occurs when a procedure uses itself as a helper.

> Mutual recursion occurs when one procedure uses another as a helper,
  and that procedure uses the first as a helper.

> For example, suppose we wanted to alternate doubling values and halving
  them.

> When thinking about recursion, we identify: (a) base-case test;
  (b) base value; (c) simplify the parameter; (d) recursive call; 
  (e) how do we use the result of the recursive call

```
;;; (double-then-halve nums) -> list-of number?
;;;   nums : list-of number?
;;; Double the first element of nums, halve the second, double the
;;; third, etc etc.
(define double-then-halve
  (lambda (nums)
    (if (null? nums)
        null
        (cons (* 2 (car lst)) (halve-then-double (cdr nums))))))

;;; (halve-then-double nums) -> list-of number?
;;;   nums : list-of number?
;;; Halve the first element of nums, double the second, halve the
;;; third, etc etc.
(define halve-then-double
  (lambda (nums)
    (if (null? nums)
        null
        (cons (* 1/2 (car lst)) (double-then-halve (cdr nums))))))
```

Can we trace this?  (Using speed trace, where we don't show all the steps.)

    (double-then-halve (list 1 2 3 4 5))
--> (cons (* 2 1) (halve-then-double (list 2 3 4 5)))
--> (cons 2 (halve-then-double (list 2 3 4 5)))
--> (cons 2 (cons (* 1/2 2) (double-then-halve (list 3 4 5))))
--> (cons 2 (cons 1 (double-then-halve (list 3 4 5))))
--> (cons 2 (cons 1 (cons (* 2 3) (halve-then-double (list 4 5)))))
--> (cons 2 (cons 1 (cons 6 (halve-then-double (list 4 5)))))
--> (cons 2 (cons 1 (cons 6 (cons (* 1/2 4) (double-then-halve (list 5))))))
--> (cons 2 (cons 1 (cons 6 (cons 2 (double-then-halve (list 5))))))
--> (cons 2 (cons 1 (cons 6 (cons 2 (cons (* 2 5) (halve-then-double (list)))))))
--> (cons 2 (cons 1 (cons 6 (cons 2 (cons 10 (halve-then-double (list)))))))
--> (cons 2 (cons 1 (cons 6 (cons 2 (cons 10 null)))))
--> (cons 2 (cons 1 (cons 6 (cons 2 (list 10)))))
--> (cons 2 (cons 1 (cons 6 (list 2 10))))
--> (cons 2 (cons 1 (list 6 2 10)))
--> (list 2 1 6 2 10)
```

On MP4, you'll be doing similar, alternating between beside and above.
That is, `stacked-ss` will probably call `sequenced-ss` on each sublist
and `sequenced-ss` will probabl call `stacked-ss` on each sublist.

### Other

Quick review
------------

Check 2: Some base cases (‡)

a. Suppose you want to count how many elements are in a list. What’s
a list that’s so simple that even a cs prof can figure out how many
elements are in the list?

> `null`

b. And how many elements are in that list?

> 0

c. Suppose you want to find the last element of a list. What’s a list that’s so simple that even a cs prof can figure out the last element?

> A one-element list.

d. How do they get that last element?

> `(car lst)`

e. Suppose we want to count how many times a value, val, appears in a list. What’s a list that’s so simple that even a CS prof can count the number of appearances of val?

> `null`

f. And how many times does val appear in the list?

> 0

g. Suppose we want to take the drop the first n elements of a list. What’s a value of n that’s so simple that even a cs prof can figure out how to drop n elements?

> 0

h. And how do they drop those n elements?

> Return the same list

Lab
---

Note: Here's another way to think about `select-odds`.

```
(define select-odds
  (lambda (nums)
    (if (null? nums)
        null
        (let ([remaining-odds (select-odds (cdr nums))])
          ...))))
```
