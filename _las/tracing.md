---
title: "Sample LA: Tracing"
---
# {{ page.title }}

_Trace the execution of a Racket program using a substitutive model of computation._

Consider the following procedure definitions.

```racket
(define f
  (lambda (x y)
    (string-append x "-" (string-reverse x))))

(define g
  (lambda (x y)
    (string-append (f x x) " " (f y x)))))

(define h
  (lambda (x y)
    (string-append (g x y) "&" (g y x))))
```

Using our mental/substitutive model of computation for Racket programs,
give a step-by-step evaluation of the following Racket expression.

```racket
    (h "foo" "bar")
```

