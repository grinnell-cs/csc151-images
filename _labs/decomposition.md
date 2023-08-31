---
title: Image and algorithmic decomposition
summary: |
  In this laboratory, you will practice algorithmic decomposition by analyzing and writing code to draw basic pictures in Racket.
---

In the reading, we introduced the foundational technique of *algorithmic decomposition* where we express a complex problem in terms of smaller, easier-to-solve problems.
We can decompose *any* problem, no matter the domain.
However, the image-drawing facilities of Racket give us a natural way of *visualizing* decomposition.
We will, therefore, begin our journey into programming by practicing algorithmic decomposition with images.
This lab will give you some experience decomposing problems as well as typing out basic Racket code.

### Introducing Pair Programming

For these next four exercises, we will continue to try out *pair programming*.
Pair programming is a particular discipline of collaborative programming that we will be using extensively in our lab work.
We'll have more to say in the coming weeks about the nitty-gritty of working in pairs, but we would like you to dive head-first into the experience.

+ One person, the *driver*, will be in control of keyboard.  
  They will often take the lead on designing and coding a solution, speaking aloud about their design thoughts as they work.
+ The other person, the *navigator*, helps keep them from going too far off track.
  They observe and consider strategic design issues.
  They look for potential problems and raise them with the driver.
  If they happen to have a separate computer, they can serve as a resource to look things up, such as the syntax of an operation.
  They try to keep track of time.

Between each exercise, you will swap driver and navigator roles so that you and your partner get experience with both roles.
If you are in a group of three, you will have two navigators and one driver!
Make sure to rotate roles so that everyone gets a turn as the driver.

To encourage appropriate swapping, we have labeled each problem as "A" and "B" for pairs.
Whoever is closer to the board is partner "A"
Whoever is further from the board is partner "B".
Partner A or Partner B drives as indicated in the lab.
If there is a third partner, ignore the labels and rotate appropriately.

You should begin by copying and opening the file
[decomposition.rkt]({{ "/code/labs/decomposition.rkt" | relative_url }}) (click on it) which contains spaces to answer the instructions you will find here.
In future labs, the file may contain instructions, code, and places to enter your answers.

<!--
Online, pair programming is relatively straightforward.

+   One person, the *driver*, will share their screen via MS Teams and is in control of keyboard.
    They focus on the immediate task of designing and coding a solution, speaking aloud about their design thoughts as they work.
+   The other person, the *navigator*, acts as a reviewer.
    They observe and think more about strategic architectural issues.
    They look for potential issues and raise them with the driver.
    They are also responsible for keeping track of the time spent on the problem.

Between each exercise, you will swap driver and navigator roles so that you and your partner get experience with both roles.
If you are in a group of three, you will have two navigators and one driver!
Make sure to rotate roles so that everyone gets a turn as the driver.

To help facilitate quick swaps between driver-navigator roles, we have created **A- and B-side starter files** for you to edit in and share with your partner when you are driver.
Because this lab involves images (which we can't embed in a plaintext source file), the remainder of this write-up will contain lab instructions.
However, in future labs, you will see more of the instruction text shifted to the starter files rather than the lab's webpage, so that you have everything you need to complete the lab in one place.
At the end of lab, you will combine and submit your two files as `decomposition.rkt`.

For this exercise, decide who will be the driver first.
The driver should download the A-side file:

+ [decomposition-a.rkt]({{ "/code/labs/decomposition-a.rkt" | relative_url }})

The navigator should download the B-side file:

+ [decomposition-b.rkt]({{ "/code/labs/decomposition-b.rkt" | relative_url }})

And the driver should open up DrRacket, share their screen and drive code entry.
The other person will be the navigator and direct program design.

Finally please note these guidelines when working in pairs:

+   Only the driver should be typing in code.
    The navigator **should not be** implementing the required programs in parallel to the driver.
    As navigator, you should be practicing your *problem solving* skills, not your program writing skills.
+   In addition, as the navigator, **please do not work ahead in your file**.
    Focus entirely on the current problem that your driver-partner is working through.

If your partner is not following these guidelines, please let a member of the course staff know so that we can resolve the situation.
-->

In general, you will find that all of the instructions for the lab are in the linked file or files.
However, we'd prefer not to include images in Racket files.
Hence, for this lab, you'll need to have this file up, too.

## Images for the Exercises

### Exercise 1: Party

Here's the sample image that you should try to replicate.
It is fine if your party people do not exactly match ours.

![A line of people with party hats.]({{ "/images/decomposition-line-example.png" | relative_url }}).

### Exercise 2: Cottage

Here's the sample image.
It is fine if your cottage in the woods does not exactly match ours.

![A cottage in a forest.]({{ "/images/decomposition-forest.png" | relative_url }}).

### Exercise 3: Falling dominoes

Here's the sample image, which looks a bit like falling dominoes.
Once again, it's fine if you don't match exactly.  However, all the dominoes should be on the "baseline".

![A series of black-and-white falling dominoes.]({{ "/images/decomposition-falling-dominoes.png" | relative_url }})

### Extra 1: Sun Triangles

Yup, it's another image!

![A collection of transparent yellow triangles on top of an orange circle]({{ "/images/decomposition-sun-triangles.png" | relative_url }})
