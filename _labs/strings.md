---
title: Characters and strings
summary: |
  We continue to explore some of the basic types that many 
  implementations of Scheme, including Racket, support.  Today,
  we focus on characters and strings.
---

## Useful functions and notation

In the reading, we introduced a score of new functions for processing the basic types of Racket.
Think of them as an *essential vocabulary* for expressing basic computation in Racket, similar to the new vocabulary you might encounter when learning a foreign language.
However, unlike a foreign language, there isn't an expectation that you get a deck of flash cards and memorize these function names.
Instead, the expectation is that you will eventually memorize these functions by *consistently building programs* that use these functions, *i.e.*, practice.

To this end, we'll try to provide concise references to the functions that we introduce in the reading to aid you in your task.
Feel free to note the location of these sections and use them to quickly look up the appropriate functions when needed.
(Also feel free to write them down on flash cards for easy reference.)

### Characters

Constant notation: `#\ch` (character constants) 

Character constants: `#\a` (lowercase a) ... `#\z` (lowercase z); `#\A`
(uppercase A) ... `#\Z` (uppercase Z); `#\0` (zero) ... `#\9` (nine);
`#\space` (space); `#\newline` (newline); and `#\?` (question mark).

Character conversion: `char->integer`, `integer->char`, `char-downcase`, `char-upcase`

Character predicates: `char?`, `char-alphabetic?`, `char-numeric?`,
`char-lower-case?`, `char-upper-case?`, `char-whitespace?`

Character comparison: `char<?`, `char<=?`, `char=?`, `char>=?`, `char>?`,
`char-ci<?`, `char-ci<=?`, `char-ci=?`, `char-ci>=?`, and `char-ci>?`.

### Strings

Constant notation: `"string"` (string constants).

String predicates: `string?`

String constructors: `make-string`, `string`, `string-append`

String extractors: `string-ref`, `substring`

String conversion: `number->string`, `string->number`, `symbol->string`,
`string->number`

String analysis: `string-length`

String comparison: `string<?`, `string<=?`, `string=?`, `string>=?`, `string>?`, `string-ci<?`, `string-ci<=?`, `string-ci=?`, `string-ci>=?`, `string-ci>?`

### Lists

Constant notation: `'(val val val)`

List operations: `take`, `drop`, `list-ref`, `length`

## The lab

{% if site.online %}
Your team should decide who will take the A-side and B-sides of the lab.
Each member should download the appropriate code:

+ [strings-a.rkt]({{ "/code/labs/strings-a.rkt" | relative_url }})
+ [strings-b.rkt]({{ "/code/labs/strings-b.rkt" | relative_url }})

**After you've downloaded the code, follow the instructions in your respective files!**

When you are done, combine the files, rename the result to `strings.rkt`, and upload the completed lab to Gradescope.
{% else %}
The person closer to the board is the B-side.  The person further from the board is the A-side.

Download the appropriate code.

+ [strings.rkt]({{ "/code/labs/strings.rkt" | relative_url }})

**After you've downloaded the code, follow the instructions in the file.**

When you are done, upload your `strings.rkt` file to Gradescope.
{% endif %}

## Acknowledgements

This laboratory is based on [a similar laboratory from a prior version of CSC 151](https://www.cs.grinnell.edu/~rebelsky/Courses/CSC151/2018S/labs/basic-types).
At some point, it included problems on lists and files.  It no longer does.

In Spring 2024, we split the numeric problems and the string problems into separate labs.

