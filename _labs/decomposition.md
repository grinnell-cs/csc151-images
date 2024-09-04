---
title: Image and algorithmic decomposition
summary: |
  In this laboratory, you will practice algorithmic decomposition by analyzing and writing code to draw basic pictures in Scamper.
---

In the reading, we introduced the foundational technique of *algorithmic decomposition* where we express a complex problem in terms of smaller, easier-to-solve problems.
We can decompose *any* problem, no matter the domain.
However, the image-drawing facilities of Scamper give us a natural way of *visualizing* decomposition.
We will, therefore, begin our journey into programming by practicing algorithmic decomposition with images.
This lab will give you some experience decomposing problems as well as typing out basic Scamper code.

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
[decomposition.scm]({{ "/code/labs/decomposition.scm" | relative_url }}) (click on it) which contains spaces to answer the instructions you will find here.
In future labs, the file may contain instructions, code, and places to enter your answers.

In general, you will find that all of the instructions for the lab are in the linked file or files.
However, we'd prefer not to include images in Scamper files.
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

### Exercise 3: The planets

Here's the sample image, which is an abstract representation of the planets of the solar system!
Once again, it's fine if you don't match exactly.  However, you should emulate the drop shadows
behind each planet and try to approximate the relative size and colors of the planets.

![The planets of the solar system in abstract.]({{ "/images/planets.png" | relative_url }})

### Exercise 4: Triangles

Yup, it's another image!

![A series of three configurations of triangles in order of increasing complexity.]({{ "/images/powerful-triangles.png" | relative_url }})
