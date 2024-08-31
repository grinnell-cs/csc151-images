---
title: An introduction to Scamper
summary: |
  In this laboratory, you will begin to type Scamper expressions.
  Scamper is the language in which we will express many of our algorithms this semester.
  Scamper is a particular implementation of Scheme (which varies a bit from the Scheme standard).
link: false
---

## Introduction

Many of the fundamental ideas of computer science are best learned by reading, writing, and executing small computer programs that illustrate those ideas.
One of our most important tools for this course, therefore, is a *program-development environment*, a computer program designed specifically to make it easier to read, write, and execute other computer programs.
In this class, we will often use a program development environment named Visual Studio Code along with the programming language [Scamper](https://github.com/slag-plt/scamper), a dialect of a language called [Scheme](https://en.wikipedia.org/wiki/Scheme_(programming_language)), which is itself a dialect of a language called [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)).
Although Scamper is a dialect of Scheme, we will often refer to our language of choice as either "Scamper" or "Scheme."
(And you may hear us also refer to the language as "Racket" which is a more full-featured dialect of Scheme that was used in previous version of the course!)

In this lab, we explore the Scamper language and the Visual Studio Code program development environment.

## Preparation

Scamper is available online and works on any machine with access to a modern web browser (_i.e._, Chrome, Firefox, Edge, or Safari):

+ <https://scamper.cs.grinnell.edu>

Unlike many other web applications you have encountered, Scamper exists as a pure _front-end web application_.
This means that your files are saved locally in your browser rather than on a server.
The corollary to this fact is that if you move between web browsers or machines, you will need to manually shuffle your programs around!

Right now, this isn't an issue, but later in the course once we have writte a number of programs, we'll talk about backing up and transferring your work between machines.

## Exercises

For many of our in-class lab activities, you will work with a partner.
To help you manage the work between yourself and your partner, the lab instructions will specify how you should work with your partner for each exercise.

+   When working collaboratively, make sure to actively engage your partner.
    Ask questions, share thoughts, and come to a common consensus on the problem.
    We will have more to share about productive collaborative work in future labs.
    For now, keep in mind the golden rules of collaborative learning:

    > **Create an environment where your partner feels comfortable sharing, failing, and ultimately learning.**
    > **You will find that you will also learn better in this environment, even if you think you know the answers already!**

The technique we use in this class is a variant of "pair programming", a commonly used technique for programming and for learning computer science.
In pair programming, we designate the person at the keyboard as the "driver" and the person working with them as the "navigator".
As in most driver/navigator situations, both driver and navigator play important roles.
You should designate one of the two of you "A" and one of you as "B".  Each problem will designate whether A or B drives.

You should plan to spend about five minutes on each exercise, perhaps a little less.
If you begin to exceed this estimated time for an exercise, grab your instructor or class mentor and ask for help.

In this lab, you will eventually work in a Scamper source file that you create and save called `shapes.scm`.
You will build that file starting with exercise 7.
When turning in your work for this lab, you only need to turn in one copy of this file to Gradescope.
However, you should make sure to include both your name and your partner's name in the Gradescope submission!

### Exercise 1: Discovering Scamper's interactions pane

**Driver: A**

As you may remember from [the reading on VSCode]({{ "/readings/vscode.html" | relative_url }}), the Scamper extension has a program exploration window for interactively executing program snippets.
Just as in the reading, we'll begin by using the program exploration window.

As described in the reading:

+   Make a `csc151` directory in your MathLAN home directory that will contain your work for the course
+   Open that directory in VSCode.
+   Make a new file called `shapes.scm` in that directory.

From there, let's avoid entering text into the file and just open the explorations panel immediately (the bug icon in the top-right of the editor panel).

let's try a few examples in the exploration panel.
Type each of the following code snippets into the "Additional Statements" textbox at the bottom of the panel.
Remember that in these code listings:

+  The line starting with a `>` symbol is the code snippet.
+  The following line without a `>` symbol is the output of that code snippet.

See if you get the same values as us!

(_Note_: make sure to _type_ these snippets into the Additional Statements textbox rather than copy-paste them in.
It is important to get a programming language, literally speaking, _in_ you fingertips rather than just in your head!)

```drracket
> (sqrt 144)
12
> (+ 3 4)
7
> (+ 3 (* 4 5))
23
> (* (+ 3 4) 5)
35
> (string-append "Hello" " " "World!")
"Hello World!"
> (string-split "Twas brillig and the slithy toves" " ")
'("Twas" "brillig" "and" "the" "slithy" "toves")
> (length (string-split "Twas brillig and the slithy toves" " "))
6
```

Of course, one should not just thoughtlessly type expressions and see what value they get.
Particularly as you learn Scheme, it is worthwhile to think a bit about the expressions and the values you expect.
The self-check in the reading asked you to predict some values.
Determine whether your prediction matches what Scamper computes.

```
> (* (+ 4 2) 2)
?
> (- 1 (/ 1 2))
?
> (string-length "Snicker snack")
?
> (string-split "Snicker snack" "ck")
?
> (circle 10 "solid" "teal")
?
```

If you get an unexpected error message in one or more cases, that may be part of the intent of this exercise!
Feel free to go on to the next exercise, but if you are confused by any of the output that you get, ask the instructor!

### Exercise 2: Libraries

**Driver: A**

As you may have noted, you get an error when you try to make a circle.

```
> (circle 10 "solid" "teal")
:1:0: Scope error:
    Variable circle is not defined


    In program: circle 
```

Why do you get an error?
Because the `circle` procedure is not immediately available in Scheme!
Some library functions are automatically included in every program.
The set of these functions is typically called the language's _prelude_ or _standard library_.
Instead, `circle` and other image-drawing functions are part of the `image` library.
We need to tell Scheme that we would like to *include* this module with a `import` statement.
At the top of your `shapes.scm` file, add the following line:

```
(import image)
```

Click the bug button and try making the circle again.
If you get an error message still make sure to ask for help!

### Exercise 3: Experimenting with images

**Driver: B**

Now that we've told Scheme to load the image library, let's
check the image examples from [the reading]({{ "/readings/scamper.html" | relative_url}}).
Enter each of the following in the interactions pane and ensure that you get the expected output.

```drracket
> (above (circle 40 "outline" "blue")
         (circle 60 "outline" "red"))
?
> (beside (circle 40 "solid" "blue")
          (circle 40 "outline" "blue"))
?
> (above (rectangle 60 40 "solid" "red")
         (beside (rectangle 60 40 "solid" "blue")
                 (rectangle 60 40 "solid" "black")))
?
```

Why did we have you check these examples, given that they already appear in the reading?
For a few reasons:

1.  To remind you that you should not always trust what you read.
    (We will generally not intentionally deceive you, but there may be times in which we make a mistake.)
2.  The same program may not behave the same for all users, depending on how their system is configured.
3.  You learn a bit by typing the text by hand and reminding yourself of what you expect.
    Part of learning how to program is getting the language "under your fingers" in a very tactile, physical sense.

### Exercise 4: Reflection: How do you know a result is correct?

**Driver: B**

Of course, the computer is using some algorithm to compute values for the expressions you enter.
How do you know that the algorithm is correct?
One reason that you might expect it to be correct is that Scheme is a widely-used programming language (and one that we've asked you to use).
However, there are bugs even in widely-used programs.
For example, a number of years ago, a bug was discovered that was causing a [common computer chip to compute a few specific values incorrectly](https://en.wikipedia.org/wiki/Pentium_FDIV_bug#:~:text=The%20Pentium%20FDIV%20bug%20is,in%201994%20by%20Thomas%20R.) triggering a costly recall of the silicon.
Another bug in Microsoft Excel produced the [wrong output for a few values](https://www.joelonsoftware.com/2007/09/26/explaining-the-excel-bug/).
And you may have some evidence that your faculty like to trick you.
Hence, you might be a bit suspicious.

Each time you do a computation, particularly a computation for which you have designed the algorithm, you should consider how you might verify the result.
(You need not verify every result, but you should have an idea of how you might do so.)
When writing an algorithm, you can then also use the verification process to see if your algorithm is right.

Let's start with a relatively simple example.
Suppose we ask you to ask Scamper to compute the square root of 137641.
You should be able to do so by entering an appropriate Scheme expression:

```
> (sqrt 137641)
```

Scamper will give you an answer.
How can you test the correctness of this answer?
What if you don't trust Scamper's multiplication procedure?

Discuss this question with your partner and come up with common definition of how to test your answer in this context.
Once you have a common definition, check your answer with a member of the course staff.

### Exercise 5: Writing Scheme source code

**Driver: B**

(*Note*: In the labs and reading, code intended to be entered in the exploration panel will generally be written with greater-than sign prompts (`>`).
If you don't see such prompts and we don't tell you otherwise, assume that code belongs in the source file you are currently editing.)

As you may recall from the reading, we enter program text into a source file via the Visual Studio Code editor, like a word processor.
Instead of processing what you type line by line, as in the exploration panel, Scamper will execute the contents of the current file when you to click Run button, _i.e._, the green arrow in the upper-right corner.
If you never click on that button, your program is never executed!

Let's try using the definitions pane instead.

{:type="a"}
1.  Enter the following definitions from the reading in that pane.

    ```drracket
    (define trial01 11.2)
    (define trial02 12.5)
    (define trialO3 8.5)
    (define trial04 10.6)
    ```

2.  Open the exploration panel and try computing the average of the four trials as an additional statement.
    What do you think will happen?
    Try to predict the result before hitting <kbd>Enter</kbd>!

    ```
    > (* 1/4 (+ trial01 trial02 trial03 trial04))
    ```

3.  It is likely that you got an error message.
    Discuss with your partner why this might be the case.

4.  As you've likely hypothesized, the definition for `trial03` was mistakenly typed as `trialO3`.
    (That is, it contains the letter "`O`" rather than the numeral "`0`".)
    Correct the definition in your file, reopen the exploration panel, and try entering the expression again.

8.  Congratulations, you've successfully computed the average trial score!  (At least you should have.)
    If not, review the error and try to fix it on your own with your partner's help.
    If you get stuck, hail down an instructor or mentor!

9.  Observe that you've copied code from elsewhere!
    That means that you have a responsibility to insert a _comment_ that cites the original authors.
    A comment is a part of a Scheme program that has no effect on the execution of the program.
    We use comments in programs to *explain* our code or *document* different aspects of it, an important part of the software engineering process that we will discuss in more detail later in the semester.

    In Scheme, comments start with a semicolon and extend to the end the line.
    Here's one possible citation.

    ```
    ; From the CSC 151 course materials:
    ;   _URL_.
    ```

    Insert that citation into `shapes.scm`, using the appropriate URL for this webpage.

_Note:_ You may encounter different expectations about the appropriate form of citations.
Make it a habit to start by copying and pasting the URL of a document whenever you copy and paste code.
Doing so shows that you have the appropriate intent.
If you are expected to provide a full citation, you can go back later and add it.

### Exercise 6: Definitions, revisited

**Driver: A**

Let's try another definition. Define `name` as your name in quotation marks. For example,

```
(define name "Student")
```

(Replace `Student` with your own name for the proper effect.)
Click **Run** and then find the value of the following expression using the interactions pane.

```
> (string-append "Hello " name)
```

Next, find the number of characters in the string with the following expression.

```
> (string-length name)
```

Note how this definition acts as shorthand: where ever `name` appears in the code, the string `"Student"` is substituted instead.
We'll discuss these definitions---which define *variables*---in detail in a subsequent class!

### Exercise 7: Image definitions

**Driver: A**

{:type="a"}
1.  Clear the current contents of your `shapes.scm` file.

2.  In `shapes.scm`, write definitions for `blue-circle`, a solid circle of radius 40, `red-square`, a solid red square of edge-length 80, and `black-rectangle`, an outlined black rectangle of width 120 and height 40.

    ```
    (import image)
    ; shapes.scm
    ; A file from the first lab for CSC-151-NN SEMESTER
    ; Authors: 
    ;   STUDENT ONE
    ;   STUDENT TWO
    ; Acknowledgements:
    ;   Any help you got

    (define blue-circle
      ???)

    (define red-square
      ???)

    (define black-rectangle
      ???)
    ```

3.  Run the program and verify the output is what you expect.
    If you run into any issues, please make sure to ask a member of the course staff.

4.  You may recall that we can combine images with `above` and `beside`.
    Predict the output of each of the following.

    ```drracket
    > (beside blue-circle red-square)
    ?
    > (beside red-square blue-circle)
    ?
    > (beside blue-circle blue-circle)
    ?
    > (beside blue-circle red-square blue-circle red-square blue-circle)
    ?
    > (beside red-square black-rectangle)
    ?
    > (above blue-circle black-rectangle)
    ?
    > (beside red-square (above black-rectangle black-rectangle) red-square)
    ?
    > (above black-rectangle (beside red-square blue-circle))
    ?
    ```

    After you have made your predictions, try out each line in the explorations panel.
    Were you correct in your predictions?
    If not, try to identify the cause of your mistake.
    Ask your partner questions or ask the instructor!

### Exercise 8: Another image definition

**Driver: A**

Define a simple image (which you define as `image` using `define`) by combining those three basic shapes with `above` and `beside`.

### Exercise 9: Saving to files

**Driver: B**

Let's make sure that you can save and restore the work you do in the definitions pane.
The source and destination names are displayed as _paths_ below, but Visual Studio Code uses a file browser to help you choose a file to load or save.
Remember that the `~` character is shorthand for your home directory, which you can access by clicking the _Home_ button on the left of the file browser VSCode shows when you are saving or loading files.

+   Save your file with the name `shapes.scm` in a folder of your choice (_e.g._, a folder you've created for this course).
+   Quit VSCode
+   Restart VSCode
+   Open `shapes.scm` in your work folder.
+   In the exploration panel, enter this expression to verify that everything is working `(above black-rectangle (beside red-square blue-circle))`.

### Exercise 10: Other notations

**Driver: B**

<a name="anchor-starting-scheme-10"></a>

As you've learned, Scheme expects you to use parentheses and prefix notation when writing expressions.
What happens if you use more traditional mathematical notation? Let's explore that question.

Type each of the following expressions at the Scheme prompt and see what reaction you get.

+   `(2 + 3)`
+   `7 * 9`
+   `sqrt(49)`
+   `(+ (87) (23))`

You may wish to read the [notes on this problem](#anchor-starting-scheme-10-notes) for an explanation of the results that you get.

## Turning it in

Turn in the `shapes.scm` file to Gradescope under the appropriate lab assignment.
When doing so, please make sure that you submit the assignment as a group assignment and *include your partner's name* in the submission!

## For those with extra time

_If you find that you have finished this laboratory before the end of class, you may try any of the following exercises._

### Extra 1: Compound images

Add code to `shapes.scm` to make an image of a simple house.
If you are so inclined, you can use the `(triangle edge-length 'solid "color")` procedure to create a triangle for the roof.

### Extra 2: Definitions, revisited

As you observed in the primary exercises for this laboratory, you can use the definitions pane to name values that you expect to use again (or that you simply find it more convenient to refer to with a mnemonic).
So far, the only numbers we've named are simple values.
However, you can also name the results of expressions.

{:type="a"}
1.  In `shapes.scm`, write a definition that assigns the name `seconds-per-minute` to the value 60.

2.  In `shapes.scm`, write a definition that assigns the name `minutes-per-hour` to the value 60.

3.  In `shapes.scm`, write a definition that assigns the name `hours-per-day` to the value 24.

4.  In `shapes.scm`, write a definition that assigns the name `seconds-per-day` to the product of those three values.
    Note that you should use the following expression to express that product.

    ```drracket
    (* seconds-per-minute minutes-per-hour hours-per-day)
    ```

5. Run your definitions and confirm in the exploration panel that
`seconds-per-day` is defined correctly.

## Notes on the exercises

<a name="anchor-starting-scheme-10-notes"></a>

### Notes on Exercise 10: Other notations

```
> (2 + 3)
Error! application: not a procedure;
Error! expected a procedure that can be applied to arguments
Error!   given: 2
Error!   arguments...:
```

When Scamper sees the left parenthesis at the beginning of the expression `(2 + 3)`, it expects the expression to be a procedure call, and it expects the procedure to be identified right after the left parenthesis. But `2` does not identify a procedure; it stands for a number. (A "procedure application" is the same thing as a procedure call.)

```
> 7 * 9
7
#<procedure:*>
9
```

In the absence of parentheses, the Scamper sees `7 * 9` as
three separate and unrelated expressions -- the numeral `7`; `*`, a name
for the primitive multiplication procedure; and `9`, another numeral. It
interprets each of these as a command to evaluate an expression:
"Compute the value of the numeral `7`! Find out what the name `*`
stands for! Compute the value of the numeral `9`!" So it performs the
first of these commands and displays `7`; then it carries out the second
command, reporting that `*` is the name of the primitive procedure `*`;
and finally it carries out the third command and displays the result,
`9`. This behavior is confusing, but it's strictly logical if you look
at it from the computer's point of view (remembering, of course, that
the computer has absolutely no common sense).

```
> sqrt(49)
#<procedure:sqrt>
Error! application: not a procedure;
Error! expected a procedure that can be applied to arguments
Error!   given: 49
Error!   arguments...: [none]```
```

As in the preceding case, Scamper sees `sqrt(49)` as two separate
commands: `sqrt` means "Find out what `sqrt` is!" and `(49)` means
"Call the procedure `49`, with no arguments!" Scamper responds to
the first command by reporting that `sqrt` is the primitive procedure for
computing square roots and to the second by pointing out that the number
`49` is not a procedure.

[Return to the problem](#anchor-starting-scheme-10)
