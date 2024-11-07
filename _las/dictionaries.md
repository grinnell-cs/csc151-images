---
title: "Sample LA: Dictionaries"
---
# {{ page.title }}

_Design and write functions that utilize dictionaries._

Suppose `counts` is a dictionary that whose keys are words and whose values are integers that represent how many times the word appears in a text.  Write a procedure, `(frequent-words counts n)`, that makes a list of all words in the hash that appear at least `n` times.

> _Space for an answer._

## Association List

(For semesters that are using association lists) Here's a sample dictionary to get you started.

``` 
(define word-counts
  (list (pair "sentient" 20)
        (pair "triskaidecaphobia" 2)
        (pair "malicious" 20)
        (pair "hello" 1021)
        (pair "optimism" -1)
        (pair "um" 82531)
        (pair "fail" 0)))
```

```
; list out words with a frequency of at least 100
(frequent-words word-counts 100)
> (list "um" "hello")

; list out words with a frequency of at least 10000
(frequent-words word-counts 100)
> (list)

```
  


## Hash Set

(For semesters that are using hash sets) Here's a sample dictionary to get you started.

```
(define sam-counts (make-hash))
(hash-set! sam-counts "sentient" 20)
(hash-set! sam-counts "triskaidecaphobia" 2)
(hash-set! sam-counts "malicious" 20)
(hash-set! sam-counts "hello" 1021)
(hash-set! sam-counts "optimism" -1)
(hash-set! sam-counts "um" 82531)
(hash-set! sam-counts "fail" 0)
```
```
; list out words with a frequency of at least 100
(frequent-words sam-counts 100)
> (list "um" "hello")

; list out words with a frequency of at least 10000
(frequent-words word-counts 100)
> (list)
```


_Note/hint: As you may recall, `(hash-keys hash)` returns the list of all the keys in a hash table._

