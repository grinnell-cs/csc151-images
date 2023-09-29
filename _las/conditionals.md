---
title: "Sample LA: Conditionals"
---
# {{ page.title }}

_Utilize boolean expressions and values in a program to produce conditional behavior._

As you know, we often associate words with students' standing in college.  At Smileyville College, Those who have completed fewer than four terms are "freshlings", those who have completed between four and seven terms (inclusive) are "wise fools", those who have completed between eight and eleven terms (inclusive) are "subordinates", and those who have completed at least twelve terms are "elders".

Write a procedure, `(status terms)`, that, given the number of terms a student has completed as input, produces a string that describes the student using the terms above.

---

_Utilize boolean expressions and values in a program to produce conditional behavior._

Write a procedure, `(numeric-type num)`, that takes a number as input and produces the most specific description of the number it can: "exact" or "inexact" followed by "integer", "real", or "complex".  Do not use "rational".

You'll find a simple test suite immediately after the answer box.  Make sure to check your procedure in DrRacket before submitting it! 

```racket
(test-equal? "an exact integer"
             (numeric-type 3)
             "exact integer")
(test-equal? "an inexact integer"
             (numeric-type 5.0)
             "inexact integer")
(test-equal? "an exact real"
             (numeric-type 3/2)
             "exact real")
(test-equal? "an inexact real"
             (numeric-type 1.234)
             "inexact real")
(test-equal? "an exact complex"
             (numeric-type 3+4i)
             "exact complex")
(test-equal? "a complex number with an inexact real part"
             (numeric-type 3.2+4i)
             "inexact complex")
(test-equal? "a complex number with an inexact imaginary part"
             (numeric-type 3+4.3i)
             "inexact complex")
(test-equal? "a complex number with both parts inexact"
             (numeric-type 3.3+4.1i)
             "inexact complex")
(test-equal? "a negative exact integer"
             (numeric-type -7)
             "exact integer")
(test-equal? "a negative inexact integer"
             (numeric-type -11.0)
             "inexact integer")
(test-equal? "a negative exact real"
             (numeric-type -11/7)
             "exact real")
(test-equal? "a negative inexact real"
             (numeric-type -5.6789)
             "inexact real")
(test-equal? "an exact complex with negative components"
             (numeric-type 3-4i)
             "exact complex")
```



