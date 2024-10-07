---
title: Mini-Project 5
subtitle: Musical Copyright
summary: |
  In this mini-project, you'll use recursion to generate all possible songs under a set of constraints. You'll then reflect on the implications of this program for _musical copyright_.
link: true
preimg: true
---

# {{ page.title }} : {{ page.subtitle }}

[Copyright](https://en.wikipedia.org/wiki/Copyright) is a legal "intellectual property" that gives owner exclusive rights to "copy, distribute, display, or perform" their own creative works.
Copyright was developed in the 15th and 16th centuries in response to the printing press.
Before the printing press, it was prohibitively time-consuming and expensive to copy a book---you had to do it by-hand!
With the rise of the printing press, there were concerns that the work of an author would be copied and distributed without their consent, thus robbing them of the benefits---monetary and social---of developing that work.
Copyright law was, therefore, developed to protect creators and incentive them to go through the effort of developing new work.

While copyright law was originally intended to protect book authors from the perils of the printing press, it has extended to virtually all creative industries, including music.
For example, if you download a song from the Internet, _e.g._, from a torrent, you are likely violating the copyright of the artist and/or publishing company for that song.
However, copyright law has had other chilling effects on the music industry.
In, perhaps, the most infamous court case of its kind, [_Bright Tunes Music v. Harrisongs Music_](https://blogs.law.gwu.edu/mcir/case/bright-tunes-music-v-harrisongs-music/), the judge found that [Beatles](https://en.wikipedia.org/wiki/The_Beatles) member [George Harrison](https://en.wikipedia.org/wiki/George_Harrison) had "unconsciously copied" [The Chiffons](https://en.wikipedia.org/wiki/The_Chiffons) song [He's So Fine](https://en.wikipedia.org/wiki/He%27s_So_Fine) in his song [My Sweet Lord](https://en.wikipedia.org/wiki/My_Sweet_Lord).
Similar cases of questionable quality have come up over the years, most recently between [pop artist Katy Perry and Christian rap artist Flame](https://www.youtube.com/watch?v=QPtynHTDlC0).
In that case, the judge ordered Perry and her associates to pay Flame 2.78 million dollars in damages although the ruling was eventually overturned.

In response to these copyright cases, lawyer Damien Rihel and technologist Noah Rubin took an extreme measure: they created a computer program to enumerate all possible melodies under a set of constraints (eight note songs drawn from a diatonic scale) and write them to disk.
By writing them to disk, they, in theory, have infringed on the copyright of every existing song and copyrighted any song that has yet to be written!

+   [Why All Melodies Should Be Free for Musicians to Use (TEDx Minneapolis Talk)](https://www.youtube.com/watch?v=rjpTBHjeZ_0)
+   [All The Music LLC](http://allthemusic.info)

We will follow in Rihel and Rubin's footsteps and write a small recursive program capable of enumerating all the songs of a given length drawn from a set of notes.
We will briefly then reflect on the nature of computers, copyright, and creativity.

## Logistics and Formatting

For this assessment, write your code and reflection in a file called `all-songs.scm`.
Make sure to include the following header at the top of your file:

<pre class="scamper source-only">
;;; all-songs.scm
;;;   A program that enumerates all the songs of a given length
;;;   drawn from a set of notes.
;;;   CSC-151-XX 24fa.
;;;
;;; Author: Your Name Here
;;; Date submitted: YYYY-MM-DD
;;;
;;; Acknowledgements:
;;; 
;;; * ... 
</pre>

Additionally, use the `lab` library as used throughout the labs and prior assessments to properly label your work.

+   `(title text)` displays the given `text` as a title heading (level 1) in the output.
+   `(part text)` displays `text` as a part heading (level 2) in the output.
+   `(problem text)` displays `text` as a problem heading (level 3) in the output.
+   `(description text)` displays `text` as a description (italicized label) in the output.

In particular, give a `title` to your program (the name of this assessment!) and label the various parts and problems accordingly.

## Recursive Decomposition, Documentation, and Testing

For all the functions you write in this mini-project, make sure you:

{:type="a"}
1.  Provide a recursive decomposition of the function in a comment above the function's definition if the function is recursive.
2.  Provide an appropriate docstring.
3.  Write a test suite adequately exercising the behavior of that function.
    Each function has examples of its execution; definitely use these examples as a starting point for your tests.
    Add more to ensure that you are covering all possible paths of execution in your function.

## Primer: The Music Library



We can think of a rectangle as a datatype made up of four primitive types: two numbers and two strings.

This week, we will look at another datatype aligned with the audio theme of this course: _musical compositions_.
The `music` library provides a number of functions for creating and manipulating musical compositions.
In this part, we'll introduce the basic functionality of the library.

(By the way, don't worry if you don't know anything about music. We'll explain everything along the way!)

### The `music` Library

When drawing shapes, the `image` library provides a number of functions for building up bigger images in terms of smaller ones:

<pre class="scamper source">
(import image)

(display
  (rectangle 100 100 "solid" "aqua"))

(display
  (beside (solid-circle 100 "red")
          (solid-circle 100 "blue")))
</pre>

The `music` library of Scamper provides similar sorts of functionality for building musical compositions!

In the `image` library, the various shape functions were the basic drawings we could create.
Similarly, the most important function that the `music` library provides is the `note` function which creates a `composition` consisting of a single note.

<pre class="scamper source">
(import music)
(note 60 qn)
</pre>

The note function takes two arguments:

+   A number corresponding to the _MIDI note value_ of the note to be played.
    MIDI, short for [Musical Instrument Digital Interface](https://en.wikipedia.org/wiki/MIDI), is a standard for allowing digital instruments to interface with computers.
    The value `60` here corresponds to _middle C_ on the keyboard.

+   A _duration value_ that will be the duration of the note to be played.
    We express durations in terms of _ratios_ of notes.
    `qn` is a variable of type `duration?` that is a _quarter note_, _i.e._, the ratio \\( \frac{1}{4} \\).
    For the purposes of this assessment, we only need quarter notes!

Taken together, `(note 60 qn)` is a musical composition consisting of a single note that is a middle C played for the length of a quarter note.
You can try out the note in the output window above!

With images, shapes like `rectangle` and `circle` can be combined to form larger images with functions like `above`, `beside`, and `overlay`.
With compositions, we have two options for creating smaller compositions from larger ones:

+   We can play compositions _sequentially_, _i.e._, one after the other, with the `seq` function.
+   We can play compositions _in parallel_, with the `par` function.

For example, a B♭ major chord consists of three notes: B♭, D, and F.
These correspond to MIDI notes 58, 62, and 65, respectively.
With this information, we can play these three notes in sequence or parallel, with `seq` and `par`, respectively:

<pre class="scamper source">
(import music)
(seq (note 58 qn)
     (note 62 qn)
     (note 65 qn))

(par (note 58 qn)
     (note 62 qn)
     (note 65 qn))
</pre>

Surprisingly, there's not much left to the music library!
With just three functions---`note`, `par`, and `seq`---we can write and explore music in our Scamper programs!

## Part 1: Cartesian Product

As a warm-up to writing a function that produces all combinations of musical notes of a certain size, we'll focus on the case where our compositions only have 2 notes.
From there we'll apply the technique developed in this part and _generalize_ it to the case where the number of notes in the composition is arbitrary.

### Problem 1a: `all-list2`

First, write a recursive function, `(all-list2 v lst)` that takes a value `v` and a list of values and creates a list of all possible lists of size 2 where the first element is `v` and the second element is a value from `lst`.
For example:

~~~racket
(all-list2 "q" (range 5))
> (list (list "q" 0) (list "q" 1) (list "q" 2) (list "q" 3) (list "q" 4))

(all-list2 "q" null)
> null
~~~

Begin by using these examples to derive the recursive decomposition:

> To generate all the lists of size two where the first element is `v` and the second element is drawn from a list `lst`:
>
> + When `lst` is empty, …
> + When `lst` is non-empty, …

Remember that in your recursive decomposition, you _assume you can recursively "do the operation"_ on the tail of the list you are recursively decomposing.
Use this assumption to write out what to do in the non-empty case.
After you are done, create an appropriate docstring for `all-list2` and implementation from this decomposition.

### Problem 1b: `cartesian-product`

Next, use `all-list2` to write a recursive function, `(cartesian-product l1 l2)` that takes two lists and produces the _Cartesian Product_ of the elements drawn from lists `l1` and `l2`.
The Cartesian Product of two lists is a list that contains all the possible lists of size 2 `(list x y)` where `x` is drawn from `l1` and `y` is drawn from `l2`.

~~~racket
(cartesian-product (range 3) (list "a" "b"))
> (list (list 0 "a") (list 0 "b")
        (list 1 "a") (list 1 "b")
        (list 2 "a") (list 2 "b"))

(cartesian-product null null)
> null
~~~

Again, begin with the recursive decomposition for this function.
Like `append`, we have a choice of two lists to perform recursion over; let's choose the first:

> To form all pairs of values whose first component is drawn from `l1` and second component is drawn from `l2`:
>
> + When `l1` is empty, …
> + When `l2` is non-empty, …

When design your recursive decomposition, ask yourself: "what is the "recursive assumption" that I can utilize in writing the recursive case?"
After you have completed your recursive design, make sure to write a docstring and implementation for `cartesian-product`.
When you go to implementation, you should use `all-list2` to perform the work necessary in the non-empty case and combine this work with the work done in the recursive call with the `append` from the standard library.

### Problem 1c: `all-two-note-songs`

Finally, use `cartesian-product` and a (small) list pipeline to write a function `(all-two-note-songs notes)` that takes a list of notes (as MIDI note values) as input and produces all the possible two note songs drawn from the list of provided `notes`.
The duration of the notes should be quarter notes `qn`.
For this function, think about what you should pass to `cartesian-product` to get the "effect" of all combinations of two notes drawn from `notes` and then how to transform that collection into a list of compositions using `map`.

### Problem 1d: `two-note-example`

In addition to the tests that you create for your functions, demonstrate that `all-two-note-songs` works by defining and `display`ing a list called `two-note-example` containing all 2 note songs drawn from the notes C (MIDI note 60) and A (MIDI note 69).
You should have $2 \times 2 = 4$ compositions in your resulting list.

## Part 2: All Combinations

In part 1, you wrote a function that generates all two-note melodies drawn from a collection of notes.
Now, we will generalize these functions to write a function to generate all `n`-note melodies for any natural number `n`.
While we will follow the same pattern of implementation from part 1, we will _not reuse_ implementation, _i.e._, these functions will not call on `all-list2` or `cartesian-product`.

### Problem 2a: `cons-all`

First, implement a recursive function `(cons-all x lsts)` that takes a single value `x` and a _list of lists_, `lsts`, and returns `lsts` but with `x` added to the front of every list.

~~~racket
(cons-all 0 (list (list 1 2)
                  (list 3 4 5)
                  (list 6 7)))
> (list (list 0 1 2)
        (list 0 3 4 5)
        (list 0 6 7))
(cons-all 0 null)
> null
~~~

### Problem 2b: `combinations`

Now, use `cons-all` to implement `(combinations lsts)` that returns a list of lists.
For each list returned in the result, the `i`th element of the list is drawn from `i`th list of `lsts`.
The result, therefore, contains all the ways we can combine the elements of the lists found in `lsts`.

~~~racket
(combinations (list (list 1 2)
                    (list 3 4 5)
                    (list 6 7)))
> (list
    (list 1 3 6) (list 1 3 7)
    (list 1 4 6) (list 1 4 7)
    (list 1 5 6) (list 1 5 7)
    (list 2 3 6) (list 2 3 7)
    (list 2 4 6) (list 2 4 7)
    (list 2 5 6) (list 2 5 7))

(combinations null)
> (list null)
~~~

Note that when given the empty list, `combinations` produces a _list containing `null`_, not `null` itself!
This is a little bit strange, but intuitively, there is one way to form a valid list when we are given nothing---just `null` itself!
Also note that if the list passed to `combinations` only contains two lists, then the function returns the same output as `cartesian-product`!

~~~racket

(combinations (list (range 3)
                    (list "a" "b")))
> (list (list 0 "a") (list 0 "b")
        (list 1 "a") (list 1 "b")
        (list 2 "a") (list 2 "b"))

(combinations (list null null))
> null
~~~

To implement `combinations`, you need to be _very_ careful about types!
You are manipulating three levels of objects here:

+   Individual values.
+   Lists of values.
+   Lists of lists of values.

In your recursive decomposition, be clear about which of three types you are manipulating at every step in your reasoning.

You will likely find it useful to also try the recursive decomposition out on concrete examples to get a sense of how to proceed.
Choose a number of small examples, say 3--5 of them, stick to what our recursive decomposition gets you, _i.e._, a case analysis in terms of empty/non-emptiness, and once you have written then out, see if you can generalize the pattern of behavior you see in them

Finally, use `combinations` to write a function `(all-songs n notes)` that takes a non-negative number `n` and a list of notes (as MIDI note values) as input and produces all the possible songs of `n` notes drawn from the list of provided `notes`.
The duration of the notes should be quarter notes `qn`.
You may implement this function with either recursion or a list transformation pipeline.

Demonstrate that `all-songs` works by defining a list called `five-note-example` containing all 5 note songs drawn from the notes C (MIDI note 60), B♭ (MIDI note 58), and F (MIDI note 65).

## Part 3: Reflection

Once you have finished your `all-songs` implementation, let's reflect on what we have done.
You hopefully noticed that your recursive implementation of `all-songs` is simple and elegant (although, perhaps, difficult to have derived in the first place).
But yet, it is capable of generating, literally, _all the songs_, according to the opinion of Rihel and Rubin.
The fact that such a simple thing is capable of so much calls into question _why_ we value music in the first place.
Computers can play music---we wrote all that in the first two mini-projects---and now we can compose music ("all the music"!) as well.
Of course, this does not apply only to music; other creative endeavors such as [writing](https://www.chronicle.com/article/will-artificial-intelligence-kill-college-writing), [art](https://www.nytimes.com/2022/09/02/technology/ai-artificial-intelligence-artists.html), and [dance](https://arxiv.org/abs/2203.13055) are, to varying degrees, already being challenged by computation.

In a few paragraphs (at most one page of text), respond to the following prompt:

> Do you think music should still be valued in light of modern-day computation's ability to "do it all?"
> What do you personally value about music in spite of this assignment (if anything?)?
> Why do you feel that music has lost its value (if at all)?

You should leave your response as a comment at the bottom of `all-songs.scm`.
In formatting your text, feel free to use line breaks within a paragraph to avoid making lines that are too long, _e.g._, favor this style of formatting:

~~~racket
; Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet
; porta massa. Proin fermentum mi eu magna tristique, nec gravida sapien luctus.
; Vivamus ut tincidunt dolor, a ultrices velit. Curabitur volutpat augue mollis
; dictum maximus. Maecenas magna enim, euismod a mauris sed, convallis blandit
; dui. Suspendisse ut nisl vitae tellus malesuada vehicula. Cras tincidunt
; commodo libero, ut lacinia sem. Donec sit amet convallis ante. Vivamus cursus
; nec massa eget finibus. Integer mattis ac mi ac blandit. Cras ligula felis,
; rhoncus sit amet facilisis non, gravida quis justo.
~~~

versus this style of formatting:

~~~ racket
; Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet porta massa. Proin fermentum mi eu magna tristique, nec gravida sapien luctus. Vivamus ut tincidunt dolor, a ultrices velit. Curabitur volutpat augue mollis dictum maximus. Maecenas magna enim, euismod a mauris sed, convallis blandit dui. Suspendisse ut nisl vitae tellus malesuada vehicula. Cras tincidunt commodo libero, ut lacinia sem. Donec sit amet convallis ante. Vivamus cursus nec massa eget finibus. Integer mattis ac mi ac blandit. Cras ligula felis, rhoncus sit amet facilisis non, gravida quis justo.
~~~

Where all the text of a paragraph appears on a single line.

This is, of course, not a writing course, so we are not scrutinizing your response to the degree we would if this were Tutorial.
But we will be checking that (a) you actually answer the prompt at hand and (b) your response demonstrates that you have put some genuine thought about the nature of computation in relation to music.

## Rubric

### Redo or above

Submissions that lack any of these characteristics will get an N.

+ Displays a good faith attempt to complete every required part of the assignment.

### Meets expectations or above

Submissions that lack any of these characteristics but have all the
prior characteristics will get an R.

+   Includes the specified file, `all-songs.scm`.
+   Includes an appropriate header on all submitted files that includes the course, author, etc.
+   **Correctness**
    +   Code runs without errors.
    +   Basic functionality of all core functions is present and correct:
        *   Part 1:
            +   `(all-list2 v l)`
            +   `(cartesian-product l1 l2)`
            +   `(all-two-note-songs notes)`
            +   `two-note-example`
        *   Part 2:
            +   `(cons-all v lsts)`
            +   `(combinations lsts)`
            +   `(all-songs n notes)`
            +   `five-note-example`
    +   Code includes required tests for all functions.
+   **Design**
    +   Documents and names all core procedures correctly.
    +   Code generally follows style guidelines.
+   Reflection is complete.

### Exemplary / Exceeds expectations

Submissions that lack any of these characteristics but have all the
prior characteristics will get an M.

+   **Correctness**
    - Implementation of all core functions is completely correct.
    - Each set of tests includes at least one edge case (e.g., an empty list, if appropriate).
+   **Design**
    - Function documentation is complete and appropriately evocative of each function's behavior.
    - Code follows style guidelines completely, with at most _three_ minor errors present.
    - Code is well-designed, avoiding repeated work through decomposition and appropriate language constructs.
+   Reflection reflects thoughtful engagement with the prompt both in terms of length (at least 2 paragraphs) and content.
