---
title: "MathLAN: Grinnell's GNU/Linux environment"
summary: |
  We explore our basic "lab equipment" for the course.  That is,
  we examine the operating system we will use and the graphical
  user interface for that operating system
---

## Introduction

This course is conducted using a workshop format (a.k.a. a constructivist,
collaborative, computing format); on most class days you will
find yourself working on the computers in our classroom. You will
quickly discover that while these computers have many similarities
to the computers you have used in the past, there are also some
differences. (When we started teaching this course, many students hadn't
used computers at all and we had to teach things like how to use a Web
browser and what the Web was. You will occasionally find comments in
the readings and labs that reflect that different perspective.) In this
document, we will explore some of the key issues you may need to consider
as you work with the GNU/Linux computers that we prefer in computer science.

## Operating systems and graphical user interfaces

A modern computer is much more than a bunch of circuitry. Most of us think
of computers in terms of the _operating system_ that they run and the
_graphical user interface_ that accompanies the operating system. Those
terms may be new to you, so let us consider them briefly.

As its name suggests, an operating system (also "OS") is the system
used for operating the computer. It is a large computer program that
manages and simplifies most of the underlying hardware. The operating
system is responsible for managing files, managing other programs,
dealing with the keyboard, screen, and other peripherals, and much more.

In the old days of computing (e.g., when the more senior of the CSC
151 instructors started programming), you interacted with the operating
systems almost exclusively by typing on a keyboard and seeing results on
a screen (yes, we had evolved beyond punchcards). There was no mouse. To
us, the operating system referred to the underlying capabilities.

These days, you interact with computers through a graphical user interface
(also "GUI"). Its name is similarly clear: A GUI is an interface through
which you use the computer, and it's a graphical (as opposed to textual
or auditory) interface. Modern graphical user interfaces stem from work
at Xerox PARC, although they were introduced to the broader consumer
world through the Apple Macintosh. To most modern users, the GUI is
indistinguishable from the OS. (Programmers may still find it useful to
distinguish between them.)

## The GNU/Linux operating system

In Grinnell's computer science department, we use an operating system
called _GNU/Linux_. GNU/Linux is distinguished by being an _Open_
operating system, which means that anyone who has the knowledge and
desire to make modifications to the program code of the operating system
is permitted to do so, and a _Free_ operating system, which means that
it doesn't have to cost you anything to install it on your computer,
in contrast to the Macintosh OS, which used to have a list price of about
$100 and which you can only legally install on a Macintosh computer,
or the Microsoft Windows OS, which still has a list price of about
$100. In fact, the GNU/Linux community uses "Free" in two ways, in
the way we used it above (as in "Free Lemonade") and in the way we
used "Open" (as in "Freedom").

Why do we use GNU/Linux rather than Macintosh OS or Windows, particularly
since ITS seems to prefer Windows? One reason is that we consider
GNU/Linux to be technically superior: It is less likely to crash, it
is freer from viruses and other irritants, it has a much longer history
of separating what the average user can do from what the administrator
can do. More importantly, it is much more portable. You can sit down
at any GNU/Linux computer on our network and have the same set of
files naturally available. (Think about how many times you save a file
on one Windows box on campus, forget to move it to your OneDrive, and
then cannot access it elsewhere on campus. That will never happen on
the GNU/Linux network.)

Many members of the department also have a philosophical preference for
the Open Source and Free Software movements, of which GNU/Linux is an
important part. We believe that good software should be free, in both
senses of the word.

## Xfce

GNU/Linux, unlike Macintosh OS X or Microsoft Windows, permits you to
use a variety of GUIs on top of the same underlying OS. Our system
administrator has chosen to use a GUI called _Xfce_ as the default. Our
experience suggests that Xfce provides an appropriate balance of power,
configurability, and usability.

Xfce, like Microsoft Windows, provides a taskbar at the bottom of the
screen. You will click icons on the taskbar to start applications. You
may use a popup menu on the taskbar to "log out" when you are done with
your work.

If you want to explore other GUIs (sometimes called Window managers), you
can select your GUI when you log in to the MathLAN. Do so with caution,
as some Window managers are _very_ strange, and it may be difficult to
figure out how to escape from them.

If you are interested, you can also find many ways to modify Xfce, such
as moving the taskbar elsewhere.

## Using GNU/Linux

So, what does this all mean for you, other than that the computer
scientists at Grinnell worry about these things? It means that you will
have to use an unfamiliar GUI in this course and in most future computer
science courses you take. Fortunately, our configuration of Xfce is
similar enough to other operating systems, particularly to Microsoft
Windows, that you should find it fairly natural to use.

Like the Microsoft Windows workstations on campus, the GNU/Linux
workstations require you to log in to use them. Although our GNU/Linux 
network once used an independent password system, it now uses the same
system as the other computer systems on campus.  The password system
is designed so that no one, not even the MathLAN system administrator or
your faculty member, will have access to your password.

## Important GNU/Linux programs

In this course, you will be using a variety of programs. There are three
that we consider particularly important.

* _Visual Studio Code_ is a program development environment that supports the
  Scamper programming language, which we use in this course.  Scamper
  is a variant of Scheme, which is itself a variant of Lisp, one of 
  the first computer languages.
*  _Firefox_ is the preferred Web browser in this course.  You should be 
  able to access Firefox through the icon in the taskbar that shows a 
  small red animal holding a sphere.
* The _terminal window_ supports textual interaction with the operating 
  system.  That is, it provides a kind of "textual user interface" (TUI)
  rather than a graphical user interface.  At times, the terminal
  window provides the most convenient way to interact. You should
  be able to access the terminal window through the picture of the
  screen in the taskbar.

## Making the most of the GNU/Linux environment

This is a class in computer science, not in using GNU/Linux. Hence, we
will provide you with only the basic instructions for using GNU/Linux. It
is, of course, possible to use the GNU/Linux system in more advanced
ways. You may find it useful to talk to other folks who use the systems
to learn particular tricks that they find valuable. We will also point
out a few from time to time.

Here's one: Xfce supports multiple _desktops_. You can see a two-by-two
grid of desktops in your taskbar, with small representations of each
window. You can switch desktops by clicking on any of the four. You
can also drag windows between desktops. Many people find it helpful
to use separate desktops for separate tasks, such as one desktop for
documentation and information and another desktop for programming. It's
also useful to keep one desktop clear, so you can use it for looking
at files. The [corresponding lab](../labs/linux) will give you
some opportunities to explore desktops.

## Self checks

### Self check 1: Terminology

Make a list of three important terms we used in this document and their
meanings.

### Self Check 2: Free and Freedom

What are the two meanings of "Free" associated with GNU/Linux?  Why is
each important?
