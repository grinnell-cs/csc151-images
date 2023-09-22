---
title: "Sample LA: Lists"
---
# {{ page.title }}

_Manipulate lists with fundamental higher-order list functions._

Write a procedure, `(acronym string-of-words)`, that takes as input
a string of words separated by spaces and produces as output an
acronym that consists of the first letter of each word.

```racket
> (acronym "International Business Machines")
"IBM"
> (acronym "Grinnell's Underground Magazine")
"GUM"
> (acronym "Sam's Assorted Musings and Rants")
"SAMaR"
```

You may rely on this following helper function.

```racket
;;; (first-char str) -> character
;;;   str: A non-empty string
;;; Extracts the first character of a string
(define first-char
  (lambda (str)
    (string-ref str 0)))
```

```racket
> (first-char "hello")
#\h
> (first-char "International")
#\I
```


