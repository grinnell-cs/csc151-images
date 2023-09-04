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

*   Defining names: `(define <name> <expression>)`.
*   Function expressions: `(lambda (<parameters>) <expression>)`.
*   Defining functions: `(define <name> (lambda (<parameters>) <expression>))`

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


Remember to employ good pair programming practices as discussed in the [previous lab]({{ "/labs/decomposition.html" | relative_url }})!

> +   One person, the *driver*, will share their screen via MS Teams and is in control of keyboard.
>     They focus on the immediate task of designing and coding a solution, speaking aloud about their design thoughts as they work.
> +   The other person, the *navigator*, acts as a reviewer.
>     They observe and think more about strategic architectural issues.
>     They look for potential issues and raise them with the driver.
>     They are also responsible for keeping track of the time spent on the problem.

## Work


{% if site.online %}
**All of the instructions are in the two files!  Switch over to those now.**
{% else %}
**All of the instructions are in the file.  Switch to that now.**
{% endif %}

## Acknowledgements

The checkerboard example comes from a very old version of CSC 151.
We are no longer sure which member or members of the department wrote it.

Bits and parts of this lab come from procedure labs from other versions of CSC 151.
