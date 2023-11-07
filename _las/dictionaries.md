---
title: "Sample LA: Dictionaries"
---
# {{ page.title }}

_Design and write functions that utilize dictionaries._

Suppose `counts` is a dictionary that whose keys are words and whose values are integers that represent how many times the word appears in a text.  Write a procedure, `(frequent-words counts n)`, that makes a list of all words in the hash that appear at least `n` times.

> _Space for an answer._

Here's a sample dictionary to get you started.

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


_Note/hint: As you may recall, `(hash-keys hash)` returns the list of all the keys in a hash table._

