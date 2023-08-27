---
title: An introduction to Racket and DrRacket (in MathLAN)
summary: |
  In this laboratory, you will begin to type Scheme/Racket expressions, using DrRacket.  Scheme is the language in which we will express many of our algorithms this semester.  Racket is a particular implementation of Scheme (which varies a bit from the Scheme standard).  DrRacket is the environment in which we will write those programs.
---

## Introduction

Many of the fundamental ideas of computer science are best learned by reading, writing, and executing small computer programs that illustrate those ideas.
One of our most important tools for this course, therefore, is a *program-development environment*, a computer program designed specifically to make it easier to read, write, and execute other computer programs.
In this class, we will often use a program development environment named DrRacket along with the programming language [Racket](https://en.wikipedia.org/wiki/Racket_(programming_language)), a dialect of a language called [Scheme](https://en.wikipedia.org/wiki/Scheme_(programming_language)), which is itself a dialect of a language called [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)).
Although Racket is a dialect of Scheme, we will often refer to our language of choice as either "Racket" or "Scheme."

In this lab, we explore the Racket language and the DrRacket program development environment.

## Preparation

Start by comparing your answers on the self-check from [the reading on DrRacket](../readings/drracket) with your partner's answers.  After you've done the comparison and discussed any differences in your responses, you are ready to begin the computer work.

If you successfully completed [the MathLAN laboratory](../labs/mathlan.html), you should have an icon for DrRacket at the bottom of your screen. Click on that icon to start DrRacket.

DrRacket comes with a comprehensive standard *library* of functions that we will use throughout the course.  However, we have created additional functionality for you to support your exploration into the Digital Humanities in Racket in the form of the `csc151` package.  To install this package in your `DrRacket` installation:

* Go to `File` → `Package Manager...` in the menu.
* Enter the following URL into the "Package Source" textbox: <https://github.com/grinnell-cs/csc151.git#main>
* Click `Install` to install the package.

Occasionally, we will ask you to update this package as we add functionality to support new activities in the course.  To do this:

* Go to `File` → `Package Manager...` in the menu.
* Click the "Currently Installed" tab.
* Scan the (long) list of installed packages for the `csc151` package.
  Sorting by name by clicking the `Name` header in the table may be useful here.
*  Click the line containing the `csc151` package and then click the `Update` button.

If you haven't done so already today, please do so now to make sure you have the latest version of the library.  We'll be continuing to update it throughout the semester!

One final point of setup you will need to do with a fresh DrRacket installation is set the language you will work it.  To do this, do the following:

+   Go to `Language` → `Choose language...` in the menu.
+   Ensure that the first radio button corresponding to "The Racket Language" is selected and press Ok.
+   Press the "Run" button in the top-right corner to reload the IDE's interpreter with the updated language selection.

Once you are done, your screen should look as follows:

![A DrRacket window.
  There is a lambda in a circle at the top-left corner of the screen.
  The window is titled "Untitled - DrRacket".
  The top pane says "#lang racket".
  The bottom pane begins "Welcome to DrRacket, version 7.1 [3m]."
  Below the bottom pane, it says "Determine language from source.](../images/drracket-window.png){: width="50%" }

You can tell if you are good to go if the top pane has the text `#lang racket` or something similar and the bottom left says "Determine language from source".

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

In this lab, you will eventually work in a Racket source file that you create and save called `shapes.rkt`.
You will build that file starting with exercise 7.
When turning in your work for this lab, you only need to turn in one copy of this file to Gradescope.
However, you should make sure to include both your name and your partner's name in the Gradescope submission!

### Exercise 1: Discovering DrRacket's interactions pane

**Driver: A**

As you may remember from [the reading on DrRacket]({{ "/readings/drracket.html" | relative_url }}), the DrRacket window has two panes, one for definitions and one for interactions.
Just as in the reading, we'll begin by considering the interactions pane.

The best way to understand the interactions pane is to use it.
So, let's try a few examples.
Type each in the interactions pane, hit <kbd>Return</kbd> or <kbd>Enter</kbd>, and see if you get the same value.

```drracket
> (sqrt 144)
12
> (+ 3 4)
7
> (+ 3 (* 4 5))
23
> (* (+ 3 4) 5)
35
> (string-append "Hello" " " "PM")
"Hello PM"
> (string-split "Twas brillig and the slithy toves" " ")
'("Twas" "brillig" "and" "the" "slithy" "toves")
> (length (string-split "Twas brillig and the slithy toves" " "))
6
```

Of course, one should not just thoughtlessly type expressions and see what value they get.
Particularly as you learn Scheme, it is worthwhile to think a bit about the expressions and the values you expect.
The self-check in the reading asked you to predict some values.
Determine whether your prediction matches what DrRacket computes.

```
> (* (+ 4 2) 2)
?
> (- 1 (/ 1 2))
?
> (string-length "Snicker snack")
?
> (string-split "Snicker snack" "ck")
?
> (circle 10 'solid "teal")
?
```

If you get an unexpected error message in one or more cases, that may be part of the intent of this exercise!
Feel free to go on to the next exercise, but if you are confused by any of the output that you get, ask the instructor!

### Exercise 2: Libraries

**Driver: A**

As you may have noted, you get an error when you try to make a circle.

```
> (circle 10 'solid "teal")
Error! circle: undefined;
Error!  cannot reference an identifier before its definition
```

Why do you get an error?
Because the `circle` procedure is not built-in to standard Racket.
Instead, `circle` and other image-drawing functions are part of the `2hdtp/image` library (also called a *module* in Racket).
We need to tell Racket that we would like to *include* this module with a `require` statement.
At the top of the definitions pane (but after `#lang racket`), add a line that reads:

```
(require 2htdp/image)
```

Click the **Run** button and try making the circle again.
If you get an error message, make sure that you followed the instructions for configuring DrRacket.
If you still get errors, ask for help.

### Exercise 3: Experimenting with images

**Driver: B**

Now that we've configured DrRacket to load the image library, let's
check the image examples from [the reading]({{ "/readings/racket-intro.html" | relative_url}}).
Enter each of the following in the interactions pane and ensure that you get the expected output.

```drracket
> (circle 15 'outline "blue")
?
> (circle 10 'solid "red")
?
> (above (circle 10 'outline "blue")
         (circle 15 'outline "red"))
?
> (beside (circle 10 'solid "blue")
          (circle 10 'outline "blue"))
?
> (above (rectangle 15 10 'solid "red")
         (beside (rectangle 15 10 'solid "blue")
                 (rectangle 15 10 'solid "black")))
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
One reason that you might expect it to be correct is that Racket is a widely-used programming language (and one that we've asked you to use).
However, there are bugs even in widely-used programs.
You may recall a controversy a few years back in which it was discovered that a common computer chip computed a few specific values incorrectly, and no one had noticed.
More recently, it was found that the output routine in Microsoft Excel produced the wrong output for a few values.
And you may have some evidence that your faculty like to trick you.
Hence, you might be a bit suspicious.

Each time you do a computation, particularly a computation for which you have designed the algorithm, you should consider how you might verify the result.
(You need not verify every result, but you should have an idea of how you might do so.)
When writing an algorithm, you can then also use the verification process to see if your algorithm is right.

Let's start with a relatively simple example.
Suppose we ask you to ask DrRacket to compute the square root of 137641.
You should be able to do so by entering an appropriate Scheme expression:

```
> (sqrt 137641)
```

DrRacket will give you an answer.
How can you test the correctness of this answer?
What if you don't trust DrRacket's multiplication procedure?

Discuss this question with your partner and come up with common definition of how to test your answer in this context.
Once you have a common definition, check your answer with a member of the course staff.

### Exercise 5: DrRacket's definitions pane

**Driver: B**

(*Note*: In the labs and reading, code intended to be entered in the interactions pane will generally be written with greater-than sign prompts (`>`).
If you don't see such prompts and we don't tell you otherwise, assume that code belongs in the definitions pane.)

As you may recall from the reading, the upper text area in the DrRacket window, which is called the _definitions pane_, is used when you want to prepare a program "off-line", that is, without immediately executing each step.
Instead of processing what you type line by line, DrRacket waits for you to click on the button labeled *Run* (the second button from the right, in the row just below the menu bar) before starting to execute the program in the definitions pane.
If you never click on that button, your program is never executed!

Let's try using the definitions pane instead.

{:type="a"}
1.  Enter the following definitions from the reading in that pane.

    ```drracket
    #lang racket

    (define trial01 11.2)
    (define trial02 12.5)
    (define trialO3 8.5)
    (define trial04 10.6)
    ```

2.  Try computing the average of the four trials in the interactions pane.

    ```
    > (* 1/4 (+ trial01 trial02 trial03 trial04))
    Error! trial01: undefined;
    Error!  cannot reference an identifier before its definition
    ```

3.  It is likely that you will get an error message, just as the example suggests.
    Discuss with your partner why this might be the case.

4.  DrRacket does not know about the information in the definitions pane until you click the **Run** button.
    Do so now.
    What do you think will happen if you enter the expression again?

    ```
    > (* 1/4 (+ trial01 trial02 trial03 trial04))
    ```

5.  Enter the expression again.
    (Remember, <kbd>Crtl</kbd>-<kbd title="up arrow">&uarr;</kbd> will bring back the previous expression.)
    Then type <kbd>Enter</kbd> or <kbd>Return</kbd> to evaluate it.

6.  It is likely that you got an error message.
    Discuss with your partner why this might be the case.

7.  As you've likely hypothesized, the definition for `trial03` was mistakenly typed as `trialO3`.
    (That is, it contains the letter "`O`" rather than the numeral "`0`".)
    Correct the definition and click **Run** again.
    Then try entering the expression again.

8.  Congratulations, you've successfully computed the average trial score!  (At least you should have.)
    If not, review the error and try to fix it on your own with your partner's help.
    If you get stuck, hail down an instructor or mentor!

9.  You've copied code from elsewhere.
    That means that you have a responsibility to insert a "comment" that cites the original authors.
    A comment is a part of a Scheme program that has no effect on the execution of the program.
    We use comments in programs to *explain* our code or *document* different aspects of it, an important part of the software engineering process that we will discuss in more detail later in the semester.

    In Scheme, comments start with a semicolon and extend to the end the line.
    Here's one possible citation.

    ```
    ; The following definitions are taken from
    ;   Curtsinger, C., Davis, J., Eikmeier, N., Hamid, F., Johnson, B., Klinge, T., Osera, P.M., Rebelsky, S.A, and Weinman, J. (2022).
    ;   An introduction to Racket and DrRacket.  Online document available at
    ;   _URL_.
    ```

    Insert that citation, using the appropriate URL for this webpage.

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
1.  Open a new definitions tab with **File** > **New Tab** or <kbd>Ctrl</kbd>-<kbd>T</kbd>.

2.  In the definitions pane, write definitions for `blue-circle`, a solid circle of radius 10, `red-square`, a solid red square of edge-length 20, and `black-rectangle`, an outlined black rectangle of width 30 and height 10.

    ```
    #lang racket
    (require 2htdp/image)
    ; shapes.rkt
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

3.  Click **Run** and make sure that each of those values is defined correctly.

    ```
    > blue-circle
    ?
    > red-square
    ?
    > black-rectangle
    ?
    ```

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

    After you have made your predictions, try out each line in the interactions pane.
    Were you correct in your predictions?
    If not, try to identify the cause of your mistake.
    Ask your partner questions or ask the instructor!

### Exercise 8: Another image definition

**Driver: A**

Define a simple image (which you define as `image` using `define`) by combining those three basic shapes with `above` and `beside`.

### Exercise 9: Saving to files

**Driver: B**

Let's make sure that you can save and restore the work you do in the definitions pane.
The source and destination names are displayed as _paths_ below, but DrRacket uses a file browser to help you choose a file to load or save.
Remember that the `~` character is shorthand for your home directory, which you can access by clicking the _Home_ button on the left of the file browser DrRacket shows when you are saving or loading files.

+   Save your definitions with the name `shapes.rkt` in a folder of your choice (e.g., a folder you've created for this course).
+   Quit DrRacket.
+   Restart DrRacket.
+   In DrRacket, open `shapes.rkt` in your work folder.
+   Click **Run**
+   In the interactions pane, enter this expression to verify that everything is working `(above black-rectangle (beside red-square blue-circle))`.

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

Turn in the `shapes.rkt` file to Gradescope under the appropriate lab assignment.
When doing so, please make sure that you submit the assignment as a group assignment and *include your partner's name* in the submission!

## For those with extra time

_If you find that you have finished this laboratory before the end of class, you may try any of the following exercises._

### Extra 1: Compound images

Write instructions to make an image of a simple house.
If you are so inclined, you can use the `(triangle edge-length 'solid "color")` procedure to create a triangle for the roof.

### Extra 2: Definitions, revisited

As you observed in the primary exercises for this laboratory, you can use the definitions pane to name values that you expect to use again (or that you simply find it more convenient to refer to with a mnemonic).
So far, the only numbers we've named are simple values.
However, you can also name the results of expressions.

{:type="a"}
1.  In the definitions pane, write a definition that assigns the name `seconds-per-minute` to the value 60.

2.  In the definitions pane, write a definition that assigns the name `minutes-per-hour` to the value 60.

3.  In the definitions pane, write a definition that assigns the name `hours-per-day` to the value 24.

4.  In the definitions pane, write a definition that assigns the name `seconds-per-day` to the product of those three values.
    Note that you should use the following expression to express that product.

    ```drracket
    (* seconds-per-minute minutes-per-hour hours-per-day)
    ```

5. Run your definitions and confirm in the interactions pane that
`seconds-per-day` is defined correctly.

6. Optionally, create a `.rkt` file to store those definitions.

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

When the Scheme interpreter sees the left parenthesis at the beginning of the expression `(2 + 3)`, it expects the expression to be a procedure call, and it expects the procedure to be identified right after the left parenthesis. But `2` does not identify a procedure; it stands for a number. (A "procedure application" is the same thing as a procedure call.)

```
> 7 * 9
7
#<procedure:*>
9
```

In the absence of parentheses, the Scheme interpreter sees `7 * 9` as
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

As in the preceding case, DrRacket sees `sqrt(49)` as two separate
commands: `sqrt` means "Find out what `sqrt` is!" and `(49)` means
"Call the procedure `49`, with no arguments!" DrRacket responds to
the first command by reporting that `sqrt` is the primitive procedure for
computing square roots and to the second by pointing out that the number
`49` is not a procedure.

[Return to the problem](#anchor-starting-scheme-10)
