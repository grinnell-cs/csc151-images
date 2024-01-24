---
title: Data types
summary: |
  We consider the role of "types" in Scheme.
---

As you may recall from [our short introduction to algorithms](../readings/algorithms), some of the core building blocks of algorithms are the basic kinds of values provided by the language and the operations you perform on those values.  Computer scientists tend to refer to kinds of values as "types".  What types are there?  Most programming languages support one or more kinds of numbers (e.g., integers or real numbers) and some representation of text (which we tend to call "strings").  Others may include more sophisticated types, such as representations of user interface components (windows, buttons, etc.) or even "real world" objects (e.g., elevators).

Types serve a number of roles.  Most importantly, they provide a way to represent kinds of data that we might want to use in our algorithms.  But they also put limits on the uses of those kinds of data.  For example, while you can multiply two numbers together, you would not normally multiply two pieces of text together.  Similarly, while you might want to concatenate two pieces of text in sequence (e.g., "Hello" and "World" to create "HelloWorld"), you rarely want to concatenate two numbers together (e.g., 3.1415 and 42 to create 3.141542).

It is, of course, difficult to write algorithms and programs without some basic types and even some more complicated types.  Throughout the semester, you will encounter a variety of types.  Each time you encounter a type, you should ask yourself the following questions (or try to identify answers to those questions in the materials you receive).

What is the type's *name*?  That is, how do we refer to the type.  For example, most languages have *integers*, *strings*, and *characters*. Integers are numbers that do not have a fractional component and which can be positive, negative, or zero.  Strings are sequences of basic characters.  Characters are the building blocks of strings.

What is the *purpose* of the type?  That is, why do we have the type in the language.  We use integers to represent a variety of numeric quantities.  (In some languages, integers are the only kind of number that are guaranteed to be precise.)  We use strings to represent text in natural language.

How do you *express* values of the type?  For example, integers are simply written as sequences of digits: 4124.  While you may be used to including commas in larger numbers, such as 1,512,843 for "one million, five hundred twelve thousand, eight hundred and forty three", most programming languages will not allow you to include those commas.  In many languages, strings are represented as letters you would type on the keyboard, surround by double quotation marks (").

How does the computer *respond* when it computes a value of the type.  In general, the way you express values to the computer is the same as the way it expresses them to you.  But there are times that you will find that the computer chooses a different representation.  Here's an example.

```
> 100000000000000000000.0
1e+20
```

What *operations* are available for values in the type?  For example, you expect to be able to add, subtract, multiply, and divide integers.  You might expect to be able to concatenate strings or to extract parts of strings.  Learning what you can do with different types is both challenging and empowering.

As we start the course, you will learn a variety of key types, including [a range of numeric types](numbers), [characters and strings](strings), and [a strange type that Schemers refer to as "symbols"](symbols).

## Self Checks

### Check 1: Integer operations

List three operations (other than addition, subtraction, multiplication,
and division) that would be useful to have for integers.

### Check 2: Another type

Pretend you were called upon to design a programming language that
includes geographic locations as a core data type.  How would you
choose to answer the questions above for that type?
