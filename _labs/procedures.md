---
title: Writing your own procedures
summary: |
  We explore techniques for writing proceres in Racket.
preimg: true
notes: |
  In spring 2022, 60 minutes was not quite enough.  The lab may need
  a bit more shortening.  Push students to go on to the coding problems
  after about fifteen minutes.
---

## Syntax to remember

* Binding names to values: `(define <name> <expression>)`.
* Function expressions: `(lambda (<parameters>) <expression>)`.
* Defining functions: `(define <name> (lambda (<parameters>) <expression>))`

## Introducing Pair Programming

For today's exercises, we will continue to try out *pair programming*.  Pair programming is a particular discipline of collaborative programming that we will be using extensively in our lab work.  We'll have more to say in the coming weeks about the nitty-gritty of working in pairs, but we would like you to dive head-first into the experience.

* One person, the *driver*, will be in control of keyboard.  They will often take the lead on designing and coding a solution, speaking aloud about their design thoughts as they work.  
* The other person, the *navigator*, helps keep them from going too far off track.  They observe and consider strategic design issues.  They look for potential problems and raise them with the driver.  If they happen to have a separate computer, they can serve as a resource to look things up, such as the syntax of an operation. (They do not, however, work on their own computer.) They try to keep track of time.

Between each exercise, you will swap driver and navigator roles so that you and your partner get experience with both roles.  If you are in a group of three, you will have two navigators and one driver!  Make sure to rotate roles so that everyone gets a turn as the driver.

To encourage appropriate swapping, we have labeled each problem as "A" and "B" for pairs.  Whoever is closer to the board is partner "A" Whoever is further from the board is partner "B".  Partner A or Partner B drives as indicated in the lab.  If there is a third partner, ignore the labels and rotate appropriately.

You should begin by copying and opening the file
[procedures.rkt]({{ "/code/labs/procedures.rkt" | relative_url }}) (click on it) which contains both instructions and spaces for your answers.

## The lab

{% if site.online %}
As in the previous lab, you will be working with a randomly assigned partner with 

*   [procedures-a.rkt]({{ "/code/labs/procedures-a.rkt" | relative_url }})
*   [procedures-b.rkt]({{ "/code/labs/procedures-b.rkt" | relative_url }})

One person should download the `a` file and the other person should download the `b` file.
You can both follow the directions in your respective files which will direct you both when to take driver and navigator roles.
Note that in addition to the programming components of this lab, there are also discussion questions where you will write your conclusion/results in the provided comment.
{% else %}
As in the previous lab (and future labs), you will work with a randomly assigned
partner using a starter file.

* [procedures.rkt](../code/labs/procedures.rkt)
{% endif %}

## Work
{% if site.online %}
**All of the instructions are in the two files!  Switch over to those now.**
{% else %}
**All of the instructions are in the file.  Switch to that now.**
{% endif %}

Here's the "Party Person" picture referenced in one of the exercises.

![A stick figure with a purple hat and red bowtie](../images/party-person.png).

## Acknowledgements

The checkerboard example comes from a very old version of CSC 151.
We are no longer sure which member or members of the department wrote it.

Bits and parts of this lab come from procedure labs from other versions of CSC 151.
