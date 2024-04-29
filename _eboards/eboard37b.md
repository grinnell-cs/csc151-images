---
title: "EBoard 37: Tree recursion and binary search trees (section 2)"
number: 37
section: eboards
held: 2024-04-29
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff
* Questions
* Lab

Administrative stuff
--------------------

* The CS picnic is coming up. Make sure to sign up.

### The wonders of English

We considered my favorite "stupid valid English sentence" in my other
class on Friday. I thought I'd share it with you.

> Buffalo buffalo Buffalo buffalo buffalo buffalo Buffalo buffalo Buffalo buffalo buffalo.

Wasn't that amazing? You can read about it [on my 'blog](https://rebelsky.cs.grinnell.edu/musings/buffalo-2024-04-28).

### Upcoming work

* Tuesday, 2024-04-30, **No reading**
* Wednesday, 2024-05-01, Today's [Lab on tree recursion](../labs/tree-recursion)
    * _Submit tree recursion lab on Gradescope_
* Thursday, 2024-05-03, **No reading**
* Friday, 2024-05-03, 3:30pmish, Quizzes
    * New topic: Tree recursion
    * Old topic: Binary search (most likely tracing)
    * Old topic: Diagramming structures (last chance)
* Sunday, 2024-05-05, 11:00pm, [MP9](../mps/mp09)
    * _Submit MP9 on Gradescope_
* Sunday, 2024-05-05, 11:00pm, [Reading on Sorting](../readings/sorting)
    * _Reading response not yet available._
    * **Our final reading response.**
* Monday, 2024-05-06, 4:00pm, [SoLA 4](../las) distributed.
* Tuesday, 2024-05-07, 11:00pm, Post reflection on [MP9](../mps/mp09)
    * _Submit MP9 post-reflection on Gradescope_
* Wednesday, 2024-05-08, 8:00am, [Lab on Sorting](../labs/sorting)
    * _Lab not yet available._
    * **Our final lab.**
* Wednesday, 2024-05-08, 2:30pm, Presentations from [MP9](../mps/mp09)
    * _Nothing to submit._
* Wednesday, 2024-05-8, 11:00pm, [SoLA 4](../las) due.
    * _Submit individual LAs on Gradescope_.
* Monday, 2024-05-13, 4:00pmish, [SoLA 5](../las) released.
* Friday, 2024-05-17, 5:00pm, Ultimate Redo for everything
    * [SoLA 5](../las)

Questions
---------

### Administrative

### MP9

### BSTs

Can you go over the examples from the reading?

> Sure.

### Misc

Can we start lab now?

> Sure.

Lab
---

Don't forget that we have a `display-binary-tree` procedure which shows
the trees as indented/bulleted lists.

Sam's analysis for how many random trees of size 5 there are.

* **Size 0**: We can only have **one** tree of size 0.
* **Size 1**: We can only have **one** tree of size 1.
* **Size 2**: We can have **two** trees of size 2: The one in which the
  left subtree is nonempty and the one in which the right subtree is
  nonempty.
* **Size 3**: Things start to get complicated here. We could have two
  values on the left (2 versions), we could have two values on the right
  (2 versions), or we could have one value on each side (1 version).
  That gives us **five** trees of size 3.
* **Size 4**: Things get even more complicated here. We could have three
  values on the left (5 versions) and zero on the right (1 version). We could 
  have two values on the left (2 versions) and one on the right (1 version).
  We could have one value on the left (1 version) and two on the right
  (2 versions). And we could have zero values on the left (1 version) and
  three values on the right (5 versions). 5 + 2 + 2 + 5 = **fourteen**
  different trees of size 4.
* **Size 5**: Things are complicated enough that I'm switching to a bulleted
  list.
    * Four on the left (14 versions), zero on the right (1 version): 14 versions.
    * Three on the left (5 versions), one on the right (1 version): 5 versions
    * Two on the left (2 versions), two on the right (2 versions): 4 versions
    * One on the left (1 version), three on the right (5 versions): 5 versions
    * Zero on the left (1 version), four on the right (14 versions): 14 versions
    * If I count right, that gives us **forty-two** different trees of size 5.
    * Life, the universe, and everything!

### Searching trees

What procedures did we see to search trees?

> `bst-find`

> `binary-tree-contains?`

