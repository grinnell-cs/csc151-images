---
title: Spam from Sam
---
# {{ page.title }}

_Here you will find most of the email that I sent out this semester, with the newest email at the top and the oldest at the bottom._

## [CSC-151 2025Sp] LAs and MPs and quizzes, oh my! (Sunday, 2025-03-30)

Dear Self-Reflexive Thinkers,

I hope that you are having a good weekend and that you are enjoying the sun. This evening, I have a bunch of updates.

### SoLA 2

1\. I have completed the grading of SoLA 2 and your grades are now available on Gradescope. In a few cases, I marked your answer as "needs minor fixes" or something like that. In those cases, you can submit a regrade request with the minor fix and, if it's appropriate, your work will suffice.

2\. I am sad to report that there were academic honesty issues on this SoLA. At least one of you let your classmate down by giving them your answers on some problems, presumably because you were worried about their stress. But now they will be more stressed because they will have to deal with CAS. I also saw at least one submission that looks like it was written by ChatGPT and, as I indicated, I must now report it to CAS. I'd really prefer not to report cases. And, as I tried to indicate, you're better off asking me for help than copying from a colleague or an LLM.

3\. Some of you haven't filled out the post-reflection for this SoLA. Please do so ASAP.

### MP 6

4\. I think I've fixed the typos in MP6. Please let me know if you see others. 

5\. Don't forget to submit the pre-reflection by this evening. I believe I've responded to all the ones that have been submitted.

6\. The autograder should appear tonight or tomorrow night.

### Other MPs

7\. As I mentioned in class, I'm happy to give you extensions on any of the MP redos that are due tonight. When asking for an extension (preferably on Teams), please let me know which MPs you want extensions on and when you want those extensions to be until.

### Quizzes

8\. There will be four quizzes available on Wednesday.

* a. A new quiz on list recursion.

* b. A makeup quiz on tracing. (Unfortunately, there are still some folks who haven't completed that one.)

* c. A makeup quiz on local bindings.

* d. A makeup quiz on style. As I noted, there were many struggles on the style LA, so this one will be more straightforward. Or at least I hope it will.

9\. I will *not* provide you with a list of style issues to address on the style makeup quiz. I'd recommend that you review the style guidelines at 

<https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/handouts/style-guide>

Perhaps you will also find it useful to bring a page of *hand-written* notes.

### Grade reports

10\. I expect to send out your latest grade reports some time this evening. I might even manage to get tokens incorporated (or at least some of the tokens).

11\. As is my practice, I will be submitting Academic Alerts for people who seem to be struggling. Signs of struggle include under 60% of LAs completed (in our case, 6 or fewer out of the 13), a failure to attempt SoLA 2, or missing MPs.

### Other issues

12\. There's a new reading available on mutual recursion, https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/readings/mutual-recursion . I wrote it primarily in response to a request for more explanation of mutual recursion.

13\. Don't forget we have a mentor session tonight! It will be a chance to review topics that you struggled on and to prepare for the next quiz. Maybe they'll even talk a bit about mutual recursion.

-- SamR

## [CSC-151 2025Sp] Some notes on MP4 (Sunday, 2025-02-23)

Dear Conditioners of Colors,

I hope that you are having a wonderful weekend and that you've found time to get some relaxation.

I've updated MP4 to incorporate more examples. I've also added answers to the questions I've received. There are also a few changes from my own attempts to do the assignment. (It took me about an hour to do the assignment from scratch, which seems like an okay time.)

Some additional notes.

1\. If you started the assignment early, you may be missing a few updates that I've made to the starter code. The first one is just a reminder in the "Acknowledgements" section. You should include a similar comment in your own.

```
;;; * I took the image I used in part four from …
```

2\. I realized that not all of you may have written `rgb-set-hue`, so I've added it to the starter code. Here's the code (in case you've started early).

```
;;; (rgb-set-hue color hue) -> rgb?
;;;   color : rgb?
;;;   hue : non-negative integer? (in the range 0-359)
;;; Set the hue of `color` to `hue`.
(define rgb-set-hue
  (lambda (color hue)
    (hsv->rgb (hsv-set-hue (rgb->hsv color) hue))))

;;; (hsv-set-hue color hue) -> hsv?
;;;   color : hsv?
;;;   hue : non-negative integer? (in the range 0-359)
;;; Set the hue of `color` to `hue`.
(define hsv-set-hue
  (lambda (color hue)
    (hsv hue (hsv-saturation color) (hsv-value color) (hsv-alpha color))))
```

3\. Enough of the early pre-reflectors comment on cut and compose being a focus of the assignment (they weren't supposed to be) that I've elminated that part of the rubric. You'll benefit from cut on 1b, but that's about it.

4\. Don't forget to submit the pre-reflections! I may not be able to look at them again today, but I'll get responses out as soon as I have time.

<https://www.gradescope.com/courses/948769/assignments/5815256>

5\. At least one student has told me that the dopamine rush that they got from writing image transformations made them spend extra time on part four. Please be careful!

6\. The autograder probably won't be available until tomorrow night.

As always, I'm happy to answer questions on Teams or via email.

And don't forget that we have a mentor session tonight!

Regards,

-- SamR

p.s. Grading the SoLA is next on my schedule for the weekend, so you may get another email from me in a few hours.

## [CSC-151 2025Sp] Schedule, MP1, Quizzes, Etc. (Wednesday, 2025-02-05)

Dear Producers of Playful Polygons,

As normal, I'm writing to you about a variety of things. And, as usual, you should feel free to reach out with comments and questions.

SCHEDULE UPDATE

Anonymous procedures, particularly cut and compose, are important enough that I've decided we should continue today's (Wednesday's) lab on Friday. You'll see that the schedule has been rearranged. Fortunately, I'd included a "Pause for breath" a week from Friday, so we'll slip into that. Because of the change, you don't have readings for tomorrow night! I'll reserve some extra time for questions on Friday, too.

MINI-PROJECT ONE

a. Mini-project one is now graded. Your grade and comments are available on Gradescope. Ignore the fractional part of your grade, which is assigned by the autograder; the whole number is what matters. 4 is an E (Exemplary), 3 is an M (Meets Expectations), 2 is an R (Redo), and 1 is an I (Incomplete). If you have no score, we don't seem to have evidence that you turned it in.

b. If you didn't turn it in, I'll be turning in an Academic Alert. AA's are not intended as punitive; rather, they exist to start a dialogue with Academic Affairs to ensure that you do well. (Starting with MP2, I'll also send in Academic Alerts for those who get I's.)

c. Everyone gets a free chance to redo mini-project one (or to do it, if you didn't turn it in). The redo is posted on Gradescope and is due on Sunday, 16 February 2025. Ideally, there's enough guidance on your mini-project to ensure that you can bring your score up to an E next time. Feel free to ask me about any comments you received. When you turn in a redo, you must include a file called "CHANGES.txt" that summarizes the problems from last time and the changes you've made. For example,

```
Mini-Project 1 Redo
Your Name Here
Sunday, 15 February 2025

In this redo, I've made the following changes in response to comments.

I was told that the cards in part 4 don't match the cards in part 1. I changed how I defined the cards in part 1, and they now match.

I only used three subimages in the cards in part 1. My cards in part 1 now have four subimages.
```

Please only submit the `CHANGES.txt` file when you are ready to have your revised mini-project graded. If you're just submitting to get feedback from the autograder, leave out the `CHANGES.txt` file.

TODAY'S QUIZZES

Graded versions of today's quizzes are also available on Gradescope. Please take the time to read over any comments. In many cases, folks did not sufficiently decompose the code, so there is still a lot of repeated code. We'll go over the quizzes in class on Friday, too.

ANOTHER TOKEN ACTIVITY

Thursday at 11:00, the Rosenfield Program will hold a roundtable on the first two weeks of the new Trump administration, in which experts from campus will discuss new executive orders, tariffs, and administrative policies since the inauguration. The event will take place on Thursday, February 6, at 11:00 in the second-floor HSSC auditorium. News is breaking quickly, but we expect to cover at least four themes: tariff policy, efforts to defund/demoralize the federal bureaucracy, federal grants and science funding, and criticism of so-called "radical indoctrination" by K-12 schools.

OTHER THINGS

I forgot to mention: In the US, it's 2/5/25. Isn't that cool?

-- SamR

## [CSC-151 2025Sp] Lab write-ups, Quizzes, MP1, and more (Monday, 2025-01-27)

Dear Virtual house builders,

I hope you enjoyed your first exposures to procedures in Scheme! I thought I'd fill in answers to a few questions people have been asking via email, on teams, or in person.

LAB WRITE-UPS

All you are required to submit for any lab-writeup is the work you complete in class. (I would prefer that you get the code runnable, which may require "commenting-out" the last procedure you wrote.)

However, I encourage you to at least skim through the remaining exercises. Doing so will give you a sense of the kinds of things you can do or that you may need to consider as you do homework assignments (or even learning assessments). For example, the later problems on today's lab ask you to think about how you ensure that an image you create is a particular size.

If you don't think you could solve the remaining exercises on a lab, I'd recommend that you chat with me or the evening tutors.

QUIZZES

Quizzes are in-class, on paper. Most ask you to write code. You need not write perfectly correct code. (In contrast, SoLAs are take-home, electronic, and generally expect correct code.) 

The normal model is that you grab the quiz when you show up to class and work until fifteen minutes after the start of class. Hence, if you show up early, you can work longer. Since it's not possible to show up early to all of my classes, if you are in section 2 or 3 you can also turn in your quiz and then get it back at the end of class.

You may bring one sheet of hand-written notes to the quiz. (Please stick to 8.5 x 11 inch or A4 paper. You can write on both sides.)

If you want to prepare for the quiz, you can look at sample problems on the LAs page: <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/las/>. You can also attend a mentor session (to be announced). You might also write your own sample problems of about the same complexity as the sample LA problems and then try to solve those.

MP1

You CAN use `define` in part one. You just can't define procedures. But individual parts are fine. For example,

```
(define my-circle-a 
  (overlay (solid-circle 256 "white")
           (solid-circle 512 "red")))

(define my-background-a
  (solid-square 512 "blue"))

(define my-piece-a
  (overlay my-circle-a
           my-background-a))
```

REFERENCE PAGES

You should be able to find some reference pages via the "Reference" link at the top of every page in the course web. The reference pages are even more of a work-in-progress than the main course web, but I'll do my best to fill in details for any prodedure if you ask.

---

As always, feel free to ask questions on Teams (Q&A channel or chat), via Email, or in class.

Regards,

-- SamR

## [CSC-151 2025Sp] CS Tutor Hours + MP 1 Q&A (Sunday, 2025-01-26)

Dear Students of Many Layers,

I hope that you have been enjoying the sunny weekend.

I mentioned this on the first day, but I thought I should re-emphasize it: We have "evening tutors" available in our classroom on Sundays from 3--5 p.m. and Sunday through Thursday evenings from 7--10 p.m. Evening tutors can answer questions and help with homework (mini-projects).

I've read through the first few pre-assessments for MP1 and added answers to your questions to the assignment. Feel free to keep asking questions (via email, on Teams, whatever).

Check the eboard or the schedule for other details of what work is due tonight.

Regards,

-- SamR

## [CSC-151 2025Sp] Homework for Friday's class (Wednesday, 2025-01-22)

Dear Sandwich Specifiers,

I enjoyed meeting you today. I hope you learned something useful today. I look forward to seeing you again on Friday.

I had promised to send you this week's homework assignments, so here goes.

Read the following:

* <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/readings/mathlan.html>
* <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/readings/algorithm-building-blocks.html>
* <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/readings/drracket.html>
* <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/readings/intro-scheme.html>

Answer the double-dagger questions at the end of the intro scheme reading. (You can answer the questions at the end of the other readings, too, but you need not submit them.) 

Submit your answers at <https://www.gradescope.com/courses/948769/assignments/5641394> by 10:30 p.m. on Thursday evening.

---

The two assignments I distributed earlier are due on Friday night, although I'd prefer that you do them earlier.

Course details: <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/mps/syllabus.html>
  Submit at: <https://www.gradescope.com/courses/948769/assignments/5638758>
Intro survey: <https://www.gradescope.com/courses/948769/assignments/5638761>

Feel free to reach out via email or Teams if you have questions.

Regards,

-- SamR


## [CSC-151 2025Sp] Welcome to the course! (Tuesday, 2025-01-21)

Dear CSC-151 2025Sp Students,

Welcome to the course! I hope you had a wonderful winter break and that you are finding ways to cope with our terrifyingly cold weather.

Just so you know, I do not use Blackboard. Most of the material for the course will be posted online on our course web site at <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2025Sp/>.

Your first assignments, due at 10:30 p.m. this Thursday, are to review the course syllabus and accompanying documents, to report on what you've learned from reading them, and to tell me a bit about yourself. You will submit these assignments via Gradescope.

Course details: <https://www.gradescope.com/courses/948769/assignments/5638758>

Introductory survey: <https://www.gradescope.com/courses/948769/assignments/5638761>

Please let me know if you have difficulty accessing any of these resources. You will also receive some reading assignments to do by Thursday night.

We will also use Microsoft Teams for the course. I believe I have added you to the Course Team. If not, please let me know.

I'm also happy to take questions and comments in person (usually after class or during office hours), via email, or via Teams (chat or our Q&A channel).

Regards,

-- SamR

