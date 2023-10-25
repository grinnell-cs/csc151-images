---
title: "Sample LA: Program style"
---
# {{ page.title }}

_Write and structure program code in ways that makes it easier to understand._

Although it is early in the semester, you have already started to learn some basic approaches to making your code more readable.  Here are a few.

* Put all of the parameters to a procedure on the same line, or all
  on separate lines.
    * Similarly, when writing an if statement, put the test,
      consequent, and alternate all on the same line or all
      on separate lines.
* Use Ctrl-i to reindent the text.
* When defining a procedure, place the `lambda` and the parameters on
  a separate line from the `define`, and start the body on a separate
  line from the from the lambda and the parameters.
* Follow "The Zen of Booleans": Avoid explicitly using #t and #f in
  expressions if you can write them more clearly with `and` or `or`.
* Avoid repeated code.
* Avoid unnecessary code.
* Choose descriptive names for variables and procedures.

a. Using those principles, as well as others you have learned, clean up
the following code.

```
(define rab (lambda
(int
str)
(if (if (equal? #t (integer? (string->number (substring int str))))
#t #f) (string->number (substring int str))
(if (if (equal? (integer?
(string->number (substring int 0 str))) #f) #f
#t
) (string->number (substring int 0
str)) #f))))
```

b. In English, describe what `rab` does.

Here are some sample calls to help get you started.

```
> (rab "876xy12" 0)
#f
> (rab "876xy12" 1)
8
> (rab "876xy12" 2)
87
> (rab "876xy12" 3)
876
> (rab "876xy12" 4)
#f
> (rab "876xy12" 5)
12
> (rab "876xy12" 6)
2
> (rab "876xy12" 7)
#f
> (rab "876xy12" 8)
. . substring: starting index is out of range
  starting index: 8
    valid range: [0, 7]
      string: "876xy12"
```

