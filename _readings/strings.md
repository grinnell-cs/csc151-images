---
title: Characters and strings
summary: |
  We consider *characters* and *strings*, two of the important
  primitive data types in many languages. Characters are the building blocks
  of strings. Strings, conversely, are combinations of characters. Both
  characters and strings are useful for input and output.
---
Although early computers primarily processed numbers, computer users and designers quickly moved on to other data types.  One of the most common is "text", the things we write.  Computer scientists refer to text in many ways.  A *text file* is a document stored on the filesystem in a computer that contains text.  A *string* is a piece of text available within a computer program.  And a *character* is the basic building block that we use to create strings.  In this reading, we explore the representation of characters and strings in Scheme.  In a subsequent reading, we will consider files.

As you may recall, there are five issues we typically consider as we encounter a new type: The *name* of the type, the *purpose* of the type, the way you *express* elements of the type, the way DrScheme *displays* elements of the type, and the *operations* of the type.  We will consider each for both characters and strings.

## About characters

A *character* is a small, repeatable unit within some system of writing -- a letter or a punctuation mark, if the system is alphabetic, or an ideogram in a writing system like Han (Chinese). Characters are usually put together in sequences that computer scientists call *strings*.

Although early computer programs focused primarily on numeric processing, as computation advanced, it grew to incorporate a variety of algorithms that incorporated characters and strings. Some of the more interesting algorithms we will consider involve these data types. Hence, we must learn how to use this building blocks.

## Characters in Scheme

We've covered the name of this type (character) and its purpose (to
represent the individual components of a string or other piece of text).
What's next?  How to represent characters.

As you might expect, Scheme needs a way to distinguish between many different but similar things, including: characters (the units of writing), strings (formed by combining characters), symbols (which look like strings, but are treated as *atomic* and also cannot be combined or separated), and identifiers (names of values). Similarly, Schemes needs to distinguish between numbers (which you can compute with) and digit characters (which you can put in strings).

In Scheme , a name for any of the text characters can be formed by writing `#\` (prounounced "pound backslash" or "octothorpe backslash" or "character") before that character. For instance, the expression `#\a` denotes the lower-case a. Of course, lower-case a should be distinguished from the upper-case A character, (denoted by `#\A`), from the symbol that you obtain with `'a`, from the string `"a"`, and from the name `a`. Similarly, the expression `#\3` denotes the character 3 (to be distinguished from the number 3) and the expression `#\?` denotes the question mark (to be distinguished from a symbol and a name that look quite similar).

In addition, some characters are named by pound, backslash, and a longer name. In particular, the expression `#\space` denotes the space character, and `#\newline` denotes the newline character (the one that is used to terminate lines of text files stored on Unix and Linux systems).

## Collating sequences

In any implementation of Scheme, it is assumed that the available characters can be arranged in sequential order (the "*collating sequence*" for the character set), and that each character is associated with an integer that specifies its position in that sequence. In ASCII, the American Standard Code of Information Interchange, the numbers that are associated with characters run from 0 to 127; in Unicode, a more extensive character set intended to support most languages, they lie within the range from 0 to 65535\. (Fortunately, Unicode includes all of the ASCII characters and associates with each one the same collating-sequence number that ASCII uses.) Applying the built-in `char->integer` procedure to a character gives you the collating-sequence number for that character; applying the converse procedure, `integer->char`, to an integer in the appropriate range gives you the character that has that collating-sequence number.

The importance of the collating-sequence numbers is that they extend the notion of alphabetical order to all the characters. Scheme provides five built-in predicates for comparing characters (`char<?`, `char<=?`, `char=?`, `char>=?`, and `char>?`). They all work by determining which of the two characters comes first in the collating sequence (that is, which one has the lower collating-sequence number).

The Scheme specification requires that if you compare two capital letters to each other or two lower-case letters to each other, you'll get standard alphabetical order: `(char<? #\A #\Z)` must be true, for instance. If you compare a capital letter with a lower-case letter, though, the result depends on the design of the character set. In ASCII, every capital letter (even `#\Z`) precedes every lower-case letter (even `#\a`). Similarly, if you compare two digit characters, the specification guarantees that the results will be consistent with numerical order: `#\0` precedes `#\1`, which precedes `#\2`, and so on. But if you compare a digit with a letter, or anything with a punctuation mark, the results depend on the character set.

## Handling case

Because there are many applications in which it is helpful to ignore the distinction between a capital letter and its lower-case equivalent in comparisons, Scheme also provides *case-insensitive* versions of the comparison procedures: `char-ci<?`, `char-ci<=?`, `char-ci=?`, `char-ci>=?`, and `char-ci>?`. These procedures essentially convert all letters to the same case before comparing them.

There are also two procedures for converting case, `char-upcase` and `char-downcase`. If its argument is a lower-case letter, `char-upcase` returns the corresponding capital letter; otherwise, it returns the argument unchanged. If its argument is a capital letter, `char-downcase` returns the corresponding lower-case letter; otherwise, it returns the argument unchanged.

## More character predicates

Scheme provides several one-argument predicates that apply to characters: (We'll explain more about predicates in [a subsequent reading](../readings/booleans).)

* `char-alphabetic?` determines whether its argument is a letter (`#\a` through `#\z` or `#\A` through `#\Z`, in English).
* `char-numeric?` determines whether its argument is a digit character (`#\0` through `#\9` in our standard base-ten numbering system).
* `char-whitespace?` determines whether its argument is a "whitespace character", one that is conventionally stored in a text file primarily to position text legibly. In ASCII, the whitespace characters are the space character and four specific control characters: tab, line feed, form feed, and carriage return. On most systems, `#\newline` is a whitespace character. On our Linux systems, `#\newline` is the same as line feed and counts as a whitespace character.
* `char-upper-case?` determines whether its argument is a capital letter.
* `char-lower-case?` determines whether its argument is a lower-case letter.

It may seem that it's easy to implement some of these operations. For example, you might want to implement `char-alphabetic?` using a strategy something like the following.

> A character is alphabetic if it is between `#\a` through `#\z` or between `#\A` through `#\Z`

However, that implementation is not necessarily correct for all versions of Scheme: Since the Scheme specification does not guarantee that the letters are collated without gaps, it's possible that this algorithm treats some non-letters as letters. The alternative, comparing to each valid letter in turn, seems inefficient. It is also biased toward American English, making it inappropriate for languages with different alphabets.  By making this procedure built-in, the designers of Scheme have encouraged programmers to rely on a correct (and, presumably, efficient) implementation.

```drracket
> (char<=? #\a #\n #\z)
#t
> (char-lower-case? #\n)
#t
> (char<=? #\a #\N #\z)
#f
> (char-lower-case? #\N)
#f
> (char<=? #\a #\ñ #\z)
#f
> (char-lower-case? #\ñ)
#t
```

Note that all of these predicates assume that their parameter is a character. Hence, if you don't know the type of a parameter, you will need to first ensure that it is a character. For example,

```drracket
> (char-lower-case? #\a)
#t
> (char-lower-case? #\5)
#f
> (char-lower-case? 23)
Error! char-lower-case?: expects argument of type <character>; given 23
Error! Interactions:1:0: (char-lower-case? (quote 23))
> (and (char? 23) (char-lower-case? 23))
#f
> (define lower-case-char? (lambda (x) (and (char? x) (char-lower-case? x))))
> (lower-case-char? 23)
#f
> (lower-case-char? #\a)
#t
```

## String basics

We've now covered the five primary issues for the character type: Its name, its purpose, its representation and display (with pound and backslash), and some important operations.  It is now time to turn our attention to strings, the longer pieces of text we can build with characters.

Once again, we've covered the name and the purpose quickly.  Strings provide a mechanism for representing text by joining together a sequence of characters.  (We even allow that sequence to have no characters; in that case, we call it the empty string.)

How do we express strings?   Most strings can be expressed by enclosing the characters they contain between plain double quotation marks, to produce a *string literal*. For instance, `"periwinkle"` is the nine-character string consisting of the characters `#\p`, `#\e`, `#\r`, `#\i`, `#\w`, `#\i`, `#\n`, `#\k`, `#\l`, and `#\e`, in that order. Similarly, `""` is the zero-character string (the
*null string* or the *empty string*).

String literals may contain spaces and newline characters; when such characters are between double quotation marks, they are treated like any other characters in the string. There is a slight problem when one wants to put a double quotation mark into a string literal: To indicate that the double quotation mark is part of the string (rather than marking the end of the string), one must place a backslash character immediately in front of it. For instance, `"Say \"hi\""` is the eight-character string consisting of the characters `#\S`, `#\a`, `#\y`, `#\space`, `#\"`, `#\h`, `#\i`, and `#\"`, in that order. The backslash before a double quotation mark in a string literal is an *escape* character, present only to indicate that the character immediately following it is part of the string.

This use of the backslash character causes yet another slight problem: What if one wants to put a backslash into a string? The solution is similar: Place another backslash character immediately in front of it. For instance, `"a\\b"` is the three-character string consisting of the characters `#\a`, `#\\`, and `#\b`, in that order. The first backslash in the string literal is an escape, and the second is the character that it protects, the one that is part of the string.

## String operations

Scheme provides several basic procedures for working with strings:

The `(string? val)`{:.signature} predicate determines whether its argument is or is not a string.

The `(make-string count char)`{:.signature} procedure constructs and returns a string that consists of *`count`* repetitions of a single character. Its first argument indicates how long the string should be, and the second argument specifies which character it should be made of. For instance, the following code constructs and returns the string `"aaaaa"`.

```
> (make-string 5 #\a)
"aaaaa"
```

The `(string ch_1 ... ch_n)`{:.signature} procedure takes any number of characters as arguments and constructs and returns a string consisting of exactly those characters. For instance, `(string #\H #\i   #\!)` constructs and returns the string `"Hi!"`. This procedure can be useful for building strings with quotation marks. For example, `(string #\" #\")` produces `"\"\""`. (Isn't that ugly?)

The `(string->list str)`{:.signature} procedure converts a string into a list of characters. The `(list->string char-list)`{:.signature} procedure converts a list of characters into a string. It is invalid to call `list->string` on a non-list or on a list that contains values other than characters.

```
> (string->list "Hello")
(#\H #\e #\l #\l #\o)
> (list->string (list #\a #\b #\c))
"abc"
> (list->string (list 'a 'b))
Error! list->string: expects argument of type <list of character>; given (a b)
Error! Interactions:1:0: (list->string (list (quote a) (quote b)))
```

The `(string-length str)`{:.signature} procedure takes any string as argument and returns the number of characters in that string. For instance, the value of `(string-length "magenta")` is 7 and the value of `(string-length "a\\b")` is 3.

The `(string-ref str pos)`{:.signature} procedure is used to select the character at a specified position within a string. Like `list-ref`, `string-ref` presupposes *zero-based indexing*; the position is specified by the number of characters that precede it in the string. (So the initial character in the string is at position 0, the next at position 1, and so on.) For instance, the value of `(string-ref "ellipse" 4)` is `#\p` -- the character that follows four other characters and so is at position 4 in zero-based indexing.

Strings can be compared for "lexicographic order", the extension of alphabetical order that is derived from the collating sequence of the local character set. Once more, Scheme provides both case-sensitive and case-insensitive versions of these predicates: `string<?`, `string<=?`, `string=?`, `string>=?`, and `string>?` are the case-sensitive versions, and `string-ci<?`, `string-ci<=?`, `string-ci=?`, `string-ci>=?`, and `string-ci>?` the case-insensitive ones.

The `(substring str start end)`{:.signature} procedure takes three arguments. The first is a string and the second and third are non-negative integers not exceeding the length of that string. The `substring` procedure returns the part of its first argument that starts after the number of characters specified by the second argument and ends after the number of characters specified by the third argument. For instance: `(substring   "hypocycloid" 3 8)` returns the substring `"ocycl"`---the substring that starts after the initial `"hyp"` and ends after the eighth character, the `l`. (If you think of the characters in a string as being numbered starting at 0, `substring` takes the characters from `start` to `end` - 1.)

The `(string-append str1  str2  ... strn)`{:.signature} procedure takes any number of strings as arguments and returns a string formed by concatenating those arguments.

```
> (string-append "al" "fal" "fa")
"alfalfa"
```

The `(number->string num)`{:.signature} procedure takes any Scheme number as its argument and returns a string that denotes the number.

```
> (number->string 23)
"23"
> (number->string 1.2)
"1.2"
> (number->string pi)
"3.141592654"
```

The `(string->number str)`{:.signature} procedure provides the inverse operation. Given a string that represents a number, it returns the corresponding number. On some implementations of Scheme, when you give `string->number` an inappropriate input, it returns the value `#f` (which represents "no" or "false"). You are then responsible for checking the result.

```
> (string->number "23")
23
> (string->number "1.2")
1.2
> (string->number "0.000000000000000000000000001")
1e-27
> (string->number "")
#f
> (string->number "two")
#f
> (string->number "3 + 4i")
#f
> (string->number "3+4i")
3+4i
```

The `string-upcase` and `string-downcase` procedures convert all of the letters in the string to uppercase or lowercase..

```
> (string-upcase "aLpHaBeTiCAL")
"ALPHABETICAL"
> (string-downcase "aLpHaBeTiCAL")
"alphabetical"
```

## Appendix: Representing characters

When a character is stored in a computer, it must be represented as a sequence of *bits* ("binary digits", that is, zeroes and ones). However, the choice of a particular bit sequence to represent a particular character is more or less arbitrary. In the early days of computing, each equipment manufacturer developed one or more "character codes" of its own, so that, for example, the capital letter A was represented by the sequence `110001` on an IBM 1401 computer, by `000001` on a Control Data 6600, by `11000001` on an IBM 360, and so on. This made it troublesome to transfer character data from one computer to another, since it was necessary to convert each character from the source machine's encoding to the target machine's encoding. The difficulty was compounded by the fact that different manufacturers supported different characters; all provided the twenty-six capital letters used in writing English and the ten digits used in writing Arabic numerals, but there was much variation in the selection of mathematical symbols, punctuation marks, etc.

### ASCII

In 1963, a number of manufacturers agreed to use the American Standard Code for Information Interchange (ASCII), which is currently the most common and widely used character code. It includes representations for ninety-four characters selected from American and Western European text, commercial, and technical scripts: the twenty-six English letters in both upper and lower case, the ten digits, and a miscellaneous selection of punctuation marks, mathematical symbols, commercial symbols, and diacritical marks. (These ninety-four characters are the ones that can be generated by using the forty-seven lighter-colored keys in the typewriter-like part of a MathLAN workstation's keyboard, with or without the simultaneous use of the <kbd>Shift</kbd> key.) ASCII also reserves a bit sequence for a "space" character, and thirty-three bit sequences for so-called *control characters*, which have various implementation-dependent effects on printing and display devices -- the "newline" character that drops the cursor or printing head to the next line, the "bell" or "alert" character that causes the workstation to beep briefly, and such.

In ASCII, each character or control character is represented by a sequence of exactly seven bits, and every sequence of seven bits represents a different character or control character. There are therefore 2<sup>7</sup> (that is, 128) ASCII characters altogether.

### Unicode

Over the last quarter-century, non-English-speaking computer users have grown increasingly impatient with the fact that ASCII does not provide many of the characters that are essential in writing other languages. A more recently devised character code, the [Unicode Worldwide Character Standard](http://www.unicode.org/), supports many more characters. At the time we first added Unicode to this reading, the standard defined bit sequences for at least 49194 characters for the Arabic, Armenian, Bengali, Bopomofo, Canadian Aboriginal Syllabics, Cherokee, Cyrillic, Devanagari, Ethiopic, Georgian, Greek, Gujarati, Gurmukhi, Han, Hangul, Hebrew, Hiragana, Kannada, Katakana, Khmer, Latin, Lao, Malayalam, Mongolian, Myanmar, Ogham, Oriya, Runic, Sinhala, Tamil, Telugu, Thaana, Thai, Tibetan, and Yi writing systems, as well as a large number of miscellaneous numerical, mathematical, musical, astronomical, religious, technical, and printers' symbols, components of diagrams, and geometric shapes. You can view many of the options at <http://www.unicode.org/charts/>.

Unicode uses a sequence of sixteen bits for each character, allowing for 2<sup>16</sup> (that is, 65536) codes altogether. Many bit sequences are still unassigned and may, in future versions of Unicode, be allocated for some of the numerous writing systems that are not yet supported. The current version of Unicode The designers have completed work on the Deseret, Etruscan, and Gothic writing systems, although it appears that only Deseret and Gothic have been added to the standard. Characters for the Shavian, Linear B, Cypriot, Tagalog, Hanunoo, Buhid, Tagbanwa, Cham, Tai, Glagolitic, Coptic, Buginese, Old Hungarian Runic, Phoenician, Avenstan, Tifinagh, Javanese, Rong, Egyptian Hieroglyphic, Meroitic, Old Persian Cuneiform, Ugaritic Cuneiform, Tengwar, Cirth, tlhIngan Hol (that is, "Klingon"; can you tell that CS folks are geeks, even CS folks who work on international standards?), Brahmi, Old Permic, Sinaitic, South Arabian, Pollard, Blissymbolics, and Soyombo writing systems are under consideration, in preparation, or already added to the standard.

Although most Scheme implementations use and presuppose the ASCII or Unicode character sets, the Scheme language specification does not require this, and Scheme programmers should try to write their programs in such a way that they could easily be adapted for use with other character sets (particularly Unicode). 

## Summary of notation and procedures

- Constant notation: `#\ch` (character constants) `"string"` (string constants).
- Character constants: `#\a` (lowercase a) ... `#\z` (lowercase z); `#\A` (uppercase A) ... `#\Z` (uppercase Z); `#\0` (zero) ... `#\9` (nine); `#\space` (space); `#\newline` (newline); and `#\?` (question mark).
- Character conversion: `char->integer`, `integer->char`, `char-downcase`, and `char-upcase`
- Character predicates: `char?`, `char-alphabetic?`, `char-numeric?`, `char-lower-case?`, `char-upper-case?`, `char-whitespace?`, `char<?`, `char<=?`, `char=?`, `char>=?`, `char>?`, `char-ci<?`, `char-ci<=?`, `char-ci=?`, `char-ci>=?`, and `char-ci>?`.
- String predicates: `string?`
- String constructors: `make-string`, `string`, `string-append`
- String extractors: `string-ref`, `substring`
- String conversion: `list->string`, `number->string`, `string->list`, `string-upcase`, `string-downcase`
- String analysis: `string-length`
-   String comparison: `string<?`, `string<=?`, `string=?`, `string>=?`, `string>?`, `string-ci<?`, `string-ci<=?`, `string-ci=?`, `string-ci>=?`, `string-ci>?`

## Self Checks

### Check 1: Establishing types

Identify the type of each of the following Scheme values.

```
"a"
a
'a
#\a
```

### Check 2: Collating sequences (‡)

As you may recall, Scheme uses a *collating sequence* for the letters,
assigning a sequence number to each letter. Many implementations of
Scheme, including MediaScript, use the Unicode collating sequence. (ASCII,
the American Standard Code for Information Interchange, is a subset
of Unicode.)

a. Using `char->integer`, determine the Unicode collating-sequence numbers for the capital letter A and for the lower-case letter a. 
Then determine the Unicode collating-sequence numbers for the capital letter B and the lower-case letter b.
Finally, determine the Unicode collating-sequence numbers for the capital letter X and the lower-case letter x. 
Do you notice any patterns?

b. Using `integer->char`, find out what Unicode character is in position
38 in the collating sequence.

c. Do the digit characters *precede* or *follow* the capital letters in
the collating sequence?

d. If you were designing a character set, where in the collating sequence
would you place the space character? Why?

e. What position does the space character occupy in Unicode? (*Hint:* See the character constants in the summary above.)

f. What character occupies position 477 in Unicode?

### Check 3: Character predicates

Review the list of character predicates listed in the summary above.

a. Determine whether our implementation of Scheme considers `#\newline` a whitespace character.

b. Determine whether our implementation of Scheme indicates that capital B precedes or follows lower-case a.

c. Verify that the case-insensitive comparison operation, `char-ci<?`, gives the expected result for the previous comparison.

d. Determine whether our implementation of Scheme indicates that `#\a` and `#\A` are the same letter. (It should not.)

e. Find an *equality* predicate that returns `#t` when given `#\a` and `#\A` as parameters.

## Q&A

Could you explain the `(char<=? #\a #\n #\z)` example?

> Sure.  Just like `(<= 1 2 3)` checks if 2 is between 1 and 3,
`(char<=? #\a #\n #\z)` checks if `#\n` is between `#\a` and
`#\z`, at least according to the collating sequence.  What we
see in the sample code is that lowercase n is between lowercase a 
and lowercase z (inclusive), but uppercase N is not.  Lower
n with a tilde (ñ) is not between lowercase a and lowercase z.

> The `#t` you see is shorthand for "true".

What's an equality predicate?

> A predicate is something that returns true or false.  An equality predicate is something that checks whether two things are the same.

What significance does the number related to the character have in the unicode `char->integer`? Why does the order matter?

> The numbers matter primarily in that we use the numbers in comparing characters (e.g., with `char<=?`).  We'll also find some convenient ways of using the numbers.  For example, you might notice that each lowercase letter is 32 more than the corresponding uppercase letter.

Why does `(char->integer #\ )` also produce the same result as `(char->integer #\space)`? I get that they are more or less the same thing, but why did the creators of Scheme want this to be so?

> Both `#\ ` and `#\space` represent the space character.  Most of us find the latter easier to read than the former.  I'm not sure why the designers of Scheme permitted `#\ ` (with the space), since it's almost impossible to read.

Why is the value of `(string-length "a\\b")` 3 rather than 4?

> `"\\"` is how we write the backslash character in the middle of a string.  (Yes, that's right, we use two characters to represent a single character.)  So `"a\\b"` is the character a, the backslash character, and the character b.

