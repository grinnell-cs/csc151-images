---
title: "EBoard 22: Numeric recursion"
number: 22
section: eboards
held: 2023-10-13
link: true
---
# {{ page.title }}

**Warning** This class is being recorded (and transcribed).

_Approximate overview_

* Quiz
* Administrivia
* Questions
* Lab

Quiz
----

Or quizzes.

You know the drill.

Administrivia
-------------

* Beware!  Friday the 13th falls on a Friday this month.
* I hope you have wonderful fall breaks.  Don't get broken.
* Please make sure to read comments from your graders (e.g., on MP3).
* The graders plan to get redos and MP4 graded over break.
* MP5 will be released over break.

### Upcoming Token activities

Academic

* Friday: Talk and movie on security (1pm, Strand 3).
  <https://forms.office.com/r/u34bDgj8w2>

Cultural

Peer

* Football, 1pm, Saturday 21 October 2023.

Wellness

* Have a relaxing and rejuvinating fall break.

Misc

### Other good things

### Upcoming work

* Saturday night: MP4 (w/o late penalty)
* Sunday night: MP4 post-assessment (w/o late penalty)
* Break: Nothing (or MP redos)
* THERE IS NO READING FOR THE MONDAY AFTER BREAK

Questions
---------

### Administrative

### Numeric recursion

Will we have to always write a "helper" definition to control the parameters for a recursion procedure or can we nest that? Would you accept either format?

> You will often find helper procedures useful.  But you can generally
  choose whichever form seems the most natural.

> Some folks find some vesions of the helper procedures more readable.
  We'll return to that idea later.

Can we write recursive procedures that work with strings?

> Certainly.  You can write recursive procedures with anything you
  can "simplify".  For strings, we might use the empty string as 
  the base case and simplify by taking substrings.

        (define string-to-list
          (lambda (str)
            (if (equal? str "")
                null
                (cons (string-ref str 0)
                      (substring str 1)))))

        (define string-reverse
          (lambda (str)
            (if (equal? str "")
                ""
                (string-append (string-reverse (substring str 1))
                               (substring str 0 1)))))

        (define reverse-string
          (lambda (str)
            (reverse-string-helper str "")))

        (define reverse-string-helper
          (lambda (remaining so-far)
            (if (equal? remaining "")
                so-far
                (reverse-string-helper (substring remaining 1)
                                       (string-append (substring str 0 1)
                                                      so-far)))))

> Let's trace those last two.

            (string-reverse "abc")
        --> (string-append (string-reverse "bc") "a")
        --> (string-append (string-append (string-reverse "c") "b") "a")
        --> (string-append (string-append (string-append (string-reverse "") "c") "b") "a")
        --> (string-append (string-append (string-append "" "c") "b") "a")
        --> (string-append (string-append "c" "b") "a")
        --> (string-append "cb" "a")
        --> "cba"

            (reverse-string "abc")
        --> (reverse-string-helper "abc" "")
        --> (reverse-string-helper "bc" (string-append "a" ""))
        --> (reverse-string-helper "bc" "a")
        --> (reverse-string-helper "c" (string-append "b" "a")
        --> (reverse-string-helper "c" "ba")
        --> (reverse-string-helper "" (string-append "c" "ba"))
        --> (reverse-string-helper "" "cba")
        --> "cba"

How do we identify the part-of procedure, the simplify procedure,
and the combine procedure?

> "part-of" is something we can grab immediately from the parameters:
  a number, the car of the list, etc.

> "simplify" is something that makes the input "simpler" (closer to
  the base case).  For numbers, that's adding or multiplying if we're
  counting up, subtracting or dividing if we're counting down.  For
  lists, that's almost always the cdr.  For strings, it might be a
  substring.

> The "combine" procedure is what we do with the part and the result
  of the recursive call.

I'm confused as to how the "partof" label applies to numeric
recursion. I understand how it applies in regard to lists, but it
just doesn't make sense to me in the examples given from the reading.

> "part-of" is usually the number itself, or something easily calculable
  from the number.

### Other

Lab
---

