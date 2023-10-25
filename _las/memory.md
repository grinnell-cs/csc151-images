---
title: "Sample LA: Mental models of memory"
---
# {{ page.title }}

_Describe or diagram the layout of memory for lists and vectors/arrays._

Consider the following pair structure represented in ASCII art.

```
+---+---+  +---+---+  +---+---+  +---+---+
| * | *--->| * | *--->| * | *--->| * | / |
+-|-+---+  +-|-+---+  +-|-+---+  +-|-+---+
  v          |          v          v
 "a"         |         "e"        "f"
             v
           +---+---+  +---+---+  +---+---+
           | * | *--->| / | *--->| * | / |
           +-|-+---+  +---+---+  + | +---+
             v                     v
           +---+---+             +---+---+
           | * | / |             | * | * |
           +-|-+---+             +-|-+-|-+
             v                     v   v
           +---+---+              "c" "d"
           | / | * |
           +---+-|-+
                 v
                "b"
```

Write the Racket expression to build this structure.  (And yes,
you can use `cons`.)

Here's an approximate key for ASCII-art pair structures.

```
(cons "x" "y"):    +---+---+
                   | * | * |
                   +-|-+-|-+
                     v   v
                    "x" "y"

(cons "z" null):   +---+---+
                   | * | / |
                   +-|-+---+
                     v
                    "z"

(cons null "w"):   +---+---+
                   | / | * |
                   +---+-|-+
                         v
                        "w"

(cons null null):  +---+---+
                   | / | / |
                   +---+---+

(cons "t" (cons "u" null)): +---+---+  +---+---+
                            | * | *--->| * | / |
                            +-|-+---+  +-|-+---+
                              v          v
                             "t"        "u"

(vector 'a 'b 'c):          /-+---+---+---+
                            |3| * | * | * |
                            \-+-|-+-|-+-|-+
                                v   v   v
                                a   b   c

(vector 'a 'b 'c 'd):       /-+---+---+---+---+
                            |4| * | * | * | * |
                            \-+-|-+-|-+-|-+-|-+
                                v   v   v   v
                                a   b   c   d
```

## Bonus question

Suppose the diagram above is named `stuff`.  Give expressions that
extract the following elements of `stuff`.

* `"b"`
* `"c"`
* `"f"`

## Bonus question

Draw a box-and-pointer diagram for the following structure, named `stuff`.

```
(define stuff
  (list (cons 'a 'b)
        (cons 'c (cons 'd 'e))
        (cons (cons null 'f) 'g)))
```
