---
title: "EBoard 34: Algorithm analysis"
number: 34
section: eboards
held: 2024-04-22
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [5 min]
* A bit about binary search [10 min]
* Questions [10 min]
* Lab [50 min]
* Turn in lab [5 min]

Administrative stuff
--------------------

* Happy Passover!
* Our graders have been dilligently grading. Most of the redos on MPs
  1--5 have been returned. They are now working on MP7 and the redo for
  MP6.
* I've posted examples for [MP8](../mps/mp08).
* I've posted an autograder for [MP8](../mps/mp08).

### Token opportunities

Academic/Scholarly

* Tuesday, 2024-04-23, noon, some PDR.
  _CS Table (topic TBD)_.
* Tuesday, 2024-04-23, 7pm, Science 3819.
  _Mentor Session_.
* Thursday, 2024-04-25, 11am, JRC 101.
  _Scholars' Convocation: Jonathan Rosa on Languages & Identities Beyond Borders_.
* Thursday, 2024-04-25, 7pm, Science 3819.
  _Mentor Session_.

Cultural

* Friday, 2024-04-26, 4:00--5:00pm, HSSC N1170.
  _Middle of Everywhere_.

Peer

* Wednesday, 2024-04-24, 7:30--8:30pm, Bucksbaum.
  _Cornelia Di Gioia Presentation with GSO_.

Wellness

Misc

* Wednesday, 2024-04-24, 4:00--5:00pm, JCC Lower-Level Conference Room.
  _Leveraging LinkedIn_.

### Other good things (no tokens)

### Upcoming work

* Tuesday, 2024-04-23, 11:00pm, Read the instructions for [(Mini-)Project 9](../mps/mp09)
    * [_Submit reading response on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4392317)
* Wednesday, 2024-04-42, 8:30am, [Lab on searching and algorithm analysis](../labs/searching)
    * [_Submit lab on Gradescope_](...)
    * Please try to submit by the end of class.
* Wednesday, 2024-04-24, 11:00pm, [MP8](../mps/mp08)
    * [_Submit MP8 on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371686)
* Friday, 2024-04-26, 8:00am, Quizzes
    * New topic: Binary search
    * Old topic: Diagramming structures
* Friday, 2024-04-26, 11:00pm, Post reflection for [MP8](../mps/mp08)
    * [_Submit MP8 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4371689)
* Friday, 2024-04-26, 11:00pm, Pre reflection for [MP9](../mps/mp09)
    * [_Submit MP9 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4392328)
* Sunday, 2024-04-28, 11:00pm, Second Redo for [MP4](../mps/mp04)
    * [_Submit MP4 second redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4367977)
* Sunday, 2024-05-05, 11:00pm, Nth Redo for a few things
* Sunday, 2024-05-12, 11:00pm, Nth Redo for a few things
* Friday, 2024-05-17, 5:00pm, Ultimate Redo for everything

A bit about binary search
-------------------------

Big picture: We want to find something in a collection of things.

* We are fortunate that the things are "in order" (numeric order, alphabetical,
  height, ...)
* Rather than looking at them one by one or randomly, we can use a more
  systematic approach that ends up being faster.

Systematic approach

* If you have nothing left, give up!
* Otherwise, look in the middle.
    * If we're lucky, the thing we're searching for is in the middle. Stop
    * Otherwise,
        * If the thing we're searching for is less than the middle, throw
          away the bigger stuff (middle and beyond) and try again
        * If the thing we're searching for is bigger than the middle, throw
          away the smaller stuff (middle and bleow) and try again.

Is this more efficient than just starting at the beginning and looking
at each element in turn?

* Let's say we had 1000 things to look for.
* One step to get to 500
* One step to get to 250
* One step to get to 125
* One step to get to 62
* One step to get to 31
* One step to get to 15
* One step to get to 7
* One step to get to 3
* One step to get to 1
* One step to get to 0

What if we had 2000?

* One step to get to 1000
* Ten steps to get to 0

Doubling the input only added one step.

By "fancy math", if we had 1000000 things to look through, we can search
in only 20 steps!

On the computer ...

* Assume the elements are in a vector.
* Rather than making new vectors (slow), we're going to keep track of the
  range of elements of interest.
    * As computer scientists, we like to represent ranges as lower-bound
      (inclusive) and upper-bound (exclusive).
* Algorithm is:
    * Average lower-bound and upper-bound. That gives us the middle.
    * Look at the middle.
    * If the middle is "just right", stop.
    * If the middle is too large, we want to throw away the upper half.
      We can set the upper-bound to the middle. (The middle is
      excluded)
    * If the middle is too small, we want to throw away the lower half
      We can set the lower-bound to middle+1.

### Questions

Why did we set the upper-bound to middle, but the lower-bound to
middle+1?

> The upper-bound is *exclusive*. Setting the upper-bound to middle
  says "look from lower-bound to middle-1 (inclusive)"

> The lower-bound in *inclusive*. If we set lower-bound to middle, there's
  a chance we'll look at the middle again. So we set it to middle+1

> Here's what that's dangerous. Suppose we set lower-bound to middle instead
  of middle+1. We'll look for F in [A,C,E,G]

> Initially, lower is 0 upper is 4

> We look in the middle (2). That's E. F comes after E.

> So, lower is 2 (in the bad approach), upper is still 4

> We look in the middle (3). That's G. F comes before G. We set upper to (3).

> So, lower is 2, upper is 3.

> Middle is 2. That's E. F comes after E. Set lower to middle. 

> So, lower is 2, upper is 3.

> Middle is 2. That's E. F comes after E. Set lower to middle. 

> Whoops! We'll recurse forever.

Questions
---------

### Administrative

### Analysis

Could you go over the double-dagger problems?

> `cdr` - **constant** time. Following the `cdr` arrow from a pair
  always takes the same time, whethere it's followed by one element
  or a thousand elements.

> `cddr` - **constant** time. We follow two arrows, rather than one,
  but it doesn't matter how many things come after.

> `list-ref` - **linear** - the more elements we have to cdr through, the longer it takes.

> `vector-ref` - **constant** (Sam said that it is).  Basically, we can quickly compute where something is in the vector.

> `map` - **linear** because we have to do something to each element in the vector.

> `range` - **linear** in the result because we have to build all of the pairs in the result.

### Searching

Could you go over d and e?

> Done. I hope.

### MP 8

One of the autograder tests says "The hash table should refresh after
each image". What does that mean?

> Let's say I call `(word-cloud "words-csc151.txt")`.

> Then I call `(word-cloud "jane-eyre.txt")`.

> The word cloud I get for the second should not include things like 
  "recursion", since Bronte only knew about iteration (or at least
  "recursion" doesn't appear in _Jane Eyre_.

> Make sure that your `file->hash` (or whatever you call it) procedure 
  builds a new hash table.

### SoLA 4

### Misc

Lab!
----

For the initial problem, what should I use for `get-key`?

> The vector seems to be arranged by given name. Each entry in the
  vector is a student. Hence, you should find a way to extract the 
  given name from from a student.

> **DO NOT use `vector-ref`**

For the initial problem, what should I use for `less-equal?`?

> The names are strings. You need a procedure that you can use
  to compare strings. There are a few procedures that you can use
  to compare strings.

> Web search "Racket compare strings"

> <https://docs.racket-lang.org/reference/strings.html#%28part._.String_.Comparisons%29>

Why is `alphabetically-first-1` so slow on backwards lists?

> ...
