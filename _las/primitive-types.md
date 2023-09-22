---
title: "Sample LAs: Primitive types"
---
# {{ page.title }}

_Express basic computations over primitive values and their associated standard library functions._

As you may recall, Racket uses the Unicode collating sequence to assign a number to each character (or vice versa).  Fortunately, Unicode puts the standard American letters (A, B, C, ..., Z) in order, perhaps because it draws about the ASCII standard.

Write two procedures, `uc->num` and `num->uc` that convert uppercase letters to numbers and back again.  Both should use the "standard" numbering system for letters  in which "A" is letter number 1, "B" is letter number 2, ... "Z" is letter number 26.  That is, they should not use the collating sequence number.

You should be able to write both procedures without knowing the collating sequence number for `#\A`.  (You can, of course, write code that asks for it.)

You may assume that the inputs are "correct".  That is, `uc->num` will only receive uppercase letters and `num->uc` will only receive numbers in the range 1 through 26, inclusive.

```drracket
> (uc->num #\A)
1
> (uc->num #\E)
5
> (uc->num #\I)
9
> (uc->num #\O)
15
> (uc->num #\U)
21
```

```drracket
> (num->uc 5)
#\E
> (num->uc 10)
#\J
> (num->uc 15)
#\O
> (num->uc 20)
#\T
> (num->uc 25)
#\Y
```

---

_Express basic computations over primitive values and their associated standard library functions._

As you may know, some children enjoy using a language called "Pig Latin" (or Igpay Atlinlay).  The normal rules for Pig Latin are as follows:

* If the word starts with a consonant, move the consonant and any subsequent consonants to the end of the word and add "ay" to the end.
* If the word starts with a vowel, add "yay" to the end of the string.

We're going to do a simpler version of Pig Latin.  For any word, we'll strip the first letter from the beginning of the word, add the letter to the end, and add "ay".

```racket
> (simplified-pig-latin "pig")
"igpay"
> (simplified-pig-latin "slurp")
"lurpsay" ; It's "uprslay" in traditional Pig Latin
> (simplified-pig-latin "append")
"ppendaay" ; It's "appendyay" in traditional Pig Latin
```

Write the `simplified-pig-latin` procedure.

---

_Express basic computations over primitive values and their associated standard library functions._

As you've learned by now, the Unicode collating sequence assigns different numbers to the letters of the alphabet than humans do.  We think #\a is the first letter of the alphabet; Racket calls it number 97.

Write a procedure, `(nth-capital-letter n)` that takes an integer between 1 and 26 as a parameter and returns the corresponding capital letter in English.  (`#\A` is 1, `#\B` is 2, and so on and so forth.)

You may not write a huge conditional; you should write this procedure using the appropriate computation.

You should not use magic numbers; don't rely on a particular collating sequence.  (You may, however, assume that the letters appear in sequence in the collating sequence.)

```racket
> (nth-capital-letter 1)
#\A
> (nth-capital-letter 5)
#\E
> (nth-capital-letter 11)
#\K
```


