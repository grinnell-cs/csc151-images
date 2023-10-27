---
title: "EBoard 25: Vectors"
number: 25
section: eboards
held: 2023-10-27
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed), provided
Sam remembered to hit the "Record" button.

_Approximate overview_

* Quiz
* Administrivia
* Questions
* About vectors
* Vector recursion

Administrivia
-------------

* Registration starts next Wednesday.  I hope that you consider going on to 
  CSC-161.
    * Check the priority registration page at <https://grinco.sharepoint.com/sites/Registrars_Office/SitePages/PriorityRegistration.aspx> for our latest registration processes.
    * Check out the the priority rules for each class at <https://grinco.sharepoint.com/:x:/s/Registrars_Office/EQfHJD0_kHlMgqJDvkATg18B8k6Sc5C_SOtUiQ51Ig2LZg?e=HQS7zq>.  CSC's were not yet up-to-date when I last checked.
* I lost one of my hearing aids yesterday.  I will hear you even less 
  well than normal.  (The time looking for it also put me behind.)
* The mentors and I would like to remind you that you should write 
  documentation *before* you write code.  Documentation helps you 
  think through the problem.
* See our Teams channels for a survey on the time for future mentor sessions.
* I'm going to run today's class as a talk/TPS day.

### Announcement: CPUs

* See the posters
* Pair students in intro classes with students further along in the major.
* A chance to talk to someone about CS (what should I do next, how do I
  handle Sam's snarkiness, etc.).
* Free food (or whatever they serve in the Spencer Grill), too.
* Sign up by Thursday Nov. 2 to get a mentor.

### Upcoming Token activities

Academic

* Mentor Session, Sunday at 1pm (unless our mentors have changed it)
    * Review for the SoLA

Cultural

Peer

* Get a library card this Friday 3:00-4:30 in HSSC A1231
* Swimming vs. Coe college, Friday at 6pm.
* Awesome physics talk next Wednesday at noon on making pretty pictures
  of galaxys.  "It's cold in space."  Physics usually serves Jimmy Johns
  or Pizza.
* Women's Volleyball vs. Cornell, November 1 at 7pm.

Wellness

Misc

### Other good things (no tokens)

* Women's soccer, Saturday, 11am

### Upcoming work

* Sunday night: MP5 (try to get it in earlier)
* Sunday night: NO ADDITIONAL READING
* Next Wednesday: SoLA 2
    * Most of the leftover LAs from SoLA 1.
         * Decomposition
         * Procedural abstraction
         * Primitive types
         * Conditionals
         * Documentation
         * Testing
    * All of the following
         * Code style (new)
         * Lists and the big three (quizzes)
         * Cut and Compose (new)
         * List recursion (quizzes)
         * Local bindings (quizzes)
         * Numeric recursion (new, quiz Friday)
         * Vectors (really new, coming Friday)
         * Diagramming structures (really new, coming today and Friday)
* A week from Sunday: Various redos (posted to Gradescope)

### Friday PSA

* You're awesome.  People care about you.  Take care of yourself.  And
  take 161!

Questions
---------

### Registration

Do you need help?  I built a system that helps you see combinations
of schedules.

> http://www.unconflictgrinnell.com/

Can you sign up for multiple sections in round 1 under the new registration system?

> Yes.

Can you join the wait list for conflicting classes?

> I think so.

If you put yourself on the wait list for multiple sections of the same class, how many credits does it count against the "no more than 8 credits in round 1".

> I've been told that all the sections of the same class count together as 
  one four-credit class.

### The reading

### Administrative

How do we know which LAs we still have to do?

> Bad answer: You can look on gradescope.

> Less bad answer: Sam will send out new grade reports after he finishes
  grading these quizzes.

### MP5

The autograder is incorrect.

> You are correct.

The rubric says "Explain how the image was created."  What do you mean?

> I want the procedure call that generated the image.

#|
I created the sample image using `(my-fractal ___ ___ ___)`.
|#

Whe does `image-save` save the image?

> In the same directory/folder as your Racket program.

> Or you can use a full path name if you want it elsewhere.

### Other

About vectors
-------------

What are the key ideas in vectors?

* You can find each element in a vector in about the same amount of time.
  (In contrast, lists require you to cdr through the list, so the amount
  of time to find something depends on how far in the list it is.)
* The appear somewhat differently in Racket.  You see an octothorpe in
  front of the open paren that gives the elements.
* Vectors do not immediately support a `map` operation.  (There may
  be a `vector-map`.
* Unlike lists, which you can't change, you can change a vector in place.
  There are benefits and downsides to being able to change vectors.
* Lists are easy to expand/shrink.  Vectors have a fixed size.

Some new concepts

* Mutable structures
* Operations that return nothing; we call them only for some side effect.

Key vector operations

* `(vector-set! vec pos value)` -> changes the value and returns *nothing*
* `(vector-ref vec pos)` -> returns the value at the given position
* `(vector val1 ... valn)` -> make a new vector
* `(vector-length vec)` -> determine how many values are in the vector

Additional vector operation

* `(vector-copy vec)` -> returns a *copy* of the vector.
* `(vector-append vec1 vec2)` -> make a new copy of the vector.

Warning!  Mutation is dangerous.

```
> (define vec (vector "a" "b" "c"))
> (vector-set! vec 1 "bee")
> vec
'#("a" "bee" "c")
> (define cev vec)
> cev
'#("a" "bee" "c")
> (vector-set! cev 2 "see")
> cev
'#("a" "bee" "see")
> vec
'#("a" "bee" "see")  ; whaaaa?
```

If we want to create a new copy of the vector, we should use `vector-copy`.

### Questions

What do you call the `#`?

* Historically, "pound"
* Number sign.
* Internet denizens "hash tag" or "hash"
* Mesh
* Sam calls it an octothorpe (Bell labs originated it when they put
  it on the telephone)
* Microsoft is confused and calls it a "sharp"

Why would I want two names for the same vector?

* Unfortunately, you get similar behavior with procedure calls, so
  it's often unavoidable.
* Copying is expensive.

Is there a way to combine vectors?

> Yes, it's called `vector-append` and it builds a new vector.

If we mutate the result of `vector-append`, does it affect the original vectors?

> No.

If we mutate the original vectors, does it affect the appended vector?

> No.

Vector efficiency
-----------------

What does this do?

```
(define size 20000)
(define list-of-values (range size))
(define list-result
  (time (map (cut (list-ref list-of-values <>)) list-of-values)))
```

* `list-of-values` is the list `'(0 1 2 3 ... 19999)`.
* `(cut (list-ref list-of-values <>))` takes one input and looks for it
  in `list-of-values` (returning the index)
* The `map` does that lookup for every value in the list; we're doing
  20,000 lookups (one for element 0, one for element 1, one for element 2,
  ...).

If I change the 20000 to 40000, what effect will it have on the time it takes?

If I change the 20000 to 80000, what effect will it have on the time it takes?

For 20,000, about 313 milliseconds on my computer
For 40,000, about 1189 milliseconds on my computer (about 4 times)
For 80,000, I guess 5000 milliseconds on my computer 4881 

```
(define size 80000)
(define rounds 50000)
(define list-of-values (range size))
(define vector-of-values (list->vector list-of-values))
(define list-result
  (time (map (cut (vector-ref vector-of-values <>)) list-of-values)))
```

WIth 80000, it's one millisecond.
With 800000, it's 790 milliseconds
With 1600000, we're doubling the number of calls, so it should double

Vector recursion
----------------

### Form one: Extracting information

### Form two: Modifying information
