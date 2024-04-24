---
title: "EBoard 29: Dictionaries, maps, and hash tables"
number: 29
section: eboards
held: 2024-04-10
link: true
---
# {{ page.title }}

**Warning! You are being recorded** (and transcribed). 

_Approximate overview_

* Administrative stuff [5 min]
* Questions [15 min]
* Lab [55 min]
* Turn in labs [5 min]

Administrative stuff
--------------------

* As you preregister for next semester, please consider taking CSC-161.
  (You might also consider MAT/CSC-208, but space is currently limited.)
* Happy Scarlet and Give Back Day!

### Token opportunities

Academic/Scholarly

* Thursday, 2024-04-11, 4pm, HSSC 1231 (the Kernel).
  _CS Poster Session_.
* Thursday, 2024-04-11, 7pm, Science 3819
  _Mentor Session_.
* Tuesday, 2024-04-16, noon, some PDR
  _CS Table (topic TBD)_.

Cultural

* Thursday, 2024-04-11, 4:15-5:30pm, HSSC S1325
  _Writers@Grinnell_.
* Thursday, 2024-04-11, 8:00-9:30pm, JRC 101
  _Writers@Grinnell_.
* Friday, 2024-04-12, 4:00-5:00pm, HSSC N1170
  _Middle of Everywhere_.

Peer

Wellness

* Friday, 2024-04-12, 3:00--5:00pm, JRC Courtyard
  _Get Nostalgic_.
* Tuesday, 2024-04-16, noon-1pm, BRAC P103.
  _HIIT and Strength Fitness Class._
* Tuesday, 2024-04-16, 12:15--12:50, Bucksbaum 131.
  _Yoga in the Museum._
* Tuesday, 2024-04-16, 4pm, BRAC P103 (Multipurpose Dance Studio):
  _Yoga_.

Misc

### Other good things (no tokens)

### Upcoming work

* Wednesday, 2024-04-10, 8:30am, [MP7](../mps/mp07) assigned
* Wednesday, 2024-04-10, 11:00pm, [SoLA 3](../las/) due
* Thursday, 2024-04-11, 11:00pm, [Reading on data abstraction](../readings/data-abstraction) due.
    * [_Submit reading response on data abstraction on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4340977)
* Friday, 2024-04-12, 8:00am, Quizzes
    * Dictionaries (new, covered today)
    * Diagramming structures (old)
    * Tracing (old)
* Friday, 2024-04-12, 8:30am, [Lab writeup](../labs/hash-tables)
    * [_Submit todays's lab on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4340999)
    * Preferred: Finish it during class today.
* Friday, 2024-04-12, 11:00pm, [SoLA 3](../las/) post-reflection
    * [_Submit SoLA 3 post-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248183)
* Friday, 2024-04-12, 11:00pm, MP7 pre-reflection due
    * [_Submit MP7 pre-reflection on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4330325)
* Sunday, 2024-04-14, 11:00pm, [MP5](../mps/mp05) Redo
    * [_Submit MP5 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4248212)
* Sunday, 2024-04-14, 11:00pm, [MP2](../mps/mp02) Second Redo
    * [_Submit MP2 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323413)
* Sunday, 2024-04-14, 11:00pm, [MP3](../mps/mp03) Second Redo
    * [_Submit MP3 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323418)
* Sunday, 2024-04-14, 11:00pm, [MP1](../mps/mp01) Third Redo
    * [_Submit MP1 redo on Gradescope_](https://www.gradescope.com/courses/690100/assignments/4323410/)
* Don't forget to submit the `CHANGES.rkt` file (summarizes your changes).

### MP7

* Vectors! Yay!
* In particular, how you think about an image as a vector of RGB colors.
* Note: The pixel at (c,r) in an image would be at `(+ c (* r w))` in 
  the vector.
* Part one: 
    * `(set-column! pixels width height c color)`
    * `(set-row! pixels width height r color)`.
    * etc.
* [Listen to the recording.]

Questions
---------

### Dictionaries / Maps / Hash Tables

Is there any way to make tables with more than one value for each
key? Reading hints at it but doesn't share how.

> You could associate a list, vector, or hash table with each key.

```
> (define classes (make-hash))
> (hash-set! classes "SamR" (list "CSC-151-01" "CSC-207-02"))
> (hash-set! classes "Maddy" (list "CSC-151-01" "GWS-395-01" "JPN-495-11"))
```

Can "hash-ref" refer to the first element when given the second element as an input?

> Unfortunately, `hash-ref` only looks things up using the first element.
  If you really need to look things up by the reverse, you can make a new
  hash table that swaps the key and value.  (I think we'll do that in
  lab.)

How comparatively fast are hash-tables compared to linear search of a 
list in scheme?

> In general, hash tables are much faster than searching a list of
  key/value pairs.

Why a hash table? Why not just a very large excel spreadsheet or something 
similar?

> Because we want to process information quickly within the application. 
  Communicating with an external application, such as Excel, will be 
  expensive.

> Note that we can save an Excel table as a `.csv` file and then load
  it into a hash table, and we can save a hash table as a `.csv` file
  and load it into Excel.

### Administrative

Can we please start the lab?

> Yes.

### Registration

### MP7

What's an alpha channel?

> How transparent or opaque the color/pixel is. (0 is "completely transparent"
  255 is "completely opaque").

This looks like so much fun. You must really care about us to give us such a
great assignment!

> Yes.

If you cared about us, you'd give us less work.

> Really? I think you have that backwards. In any case, you now only need
  to do one of Part Three or Part Four for an M.

Lab!
----

Yay! We get almost 45 minutes to do the lab.

### Questions

Why is it called a hash table?

> The term "hash" generally means "to chop up and mix together". In
  the CS world, a "hash function" converts a value to an integer in
  such a way that (a) the same value always hashes to the same integer
  and (b) different values are unlikely to hash to the same integer.

> Hash tables use hash functions and the remainder function to convert 
  keys to indices in a (hidden) vector.

Is there a difference between `hash-set!` (with an exclamation point)
and `hash-set` (no exclamation point)?

> Yes. `hash-set!` changes a *mutable* hash table, either adding a key/value
  pair or replacing a key/value pair.

> In contrast, `hash-set` takes an *immutable* hash table as an input
  and creates a new immutable hash table (either adding a key/value pair or 
  replacing a key/value pair).

> Note: Building a new hash table is expensive!

> Note: Since `hash-set` and `hash-remove` create new hash tables, they
  do not change the original hash table. It's like if we had
  define a color, `fave`, and wrote `(rgb-darker fave)`: We get
  a new color, but `fave` is still the same.

> In general, procedures that end with a bang (!) change their parameter
  (or something) and those that don't end with a bang don't.

Why do you say "bang" instead of "exclamation mark"?

> Syllables. One vs. five.

What will Friday's quiz look like?

> That's a great question.

> Here's our sample problem: 
  <https://rebelsky.cs.grinnell.edu/Courses/CSC151/2024Sp/las/dictionaries.html>

> I like exercises 6 and 7 on this lab.

You know the drill

`; MADDY SAID THAT I CAN STOP HERE. SAM AGREES.`
