---
title: Tracing basic procedure calls
section: handouts
---
# {{ page.title }}

Some students have struggled somewhat with tracing procedure calls. This handout is intended to provide an additional example to help those striving to get things right.

We'll start with a few reminders.

* The primary goal of tracing is to use your mental model of Scheme evaluation to understand how the Scheme interpreter gets the result it does.
* We use a "replacement model".
    * For basic expressions, you replace each expression with the value of the expression.
    * For procedure calls with user-defined procedures, you replace each formal parameter in the body of the procedure with the argument in the call, and then replace the procedure call with the updated body.
    * There are also rules for conditionals, `let` bindings, and more. We'll leave those for other examples.
* We generally evaluate each argument to a procedure before doing the procedure call. This policy holds for both built-in and user-defined procedures.
    * We also tend to evaluate arguments from left to right.
    * We'll see some other policies for conditionals.
* Particularly as you are beginning tracing, we want you to be especially careful in your traces.
    * _Do only one step at a time._ While it is tempting to do multiple things at once, we've found that often leads to errors/confusion.
    * _Make sure to use the rule above for calls to user-defined procedures._ While you may be confident that you can just replace a procedure call with the "obvious" answer, part of the goal of tracing is to see how that answer is obtained.
    * _Include the full expression at every step._ While we might be tempted to do a procedure call as a side-step, we've seen that this often leads to mistakes.
    * _Make sure that you have a valid Scheme expression at each step._

Let's consider an example, similar to one has appeared on various learning assessments.

We'll start with some definitions.

```
(define a "A")
(define b "B")

(define f
  (lambda (x)
    (string-append x "-" x)))

(define g
  (lambda (y)
    (string-append "(" y ")")))

(define p
  (lambda (x y)
    (g (string-append (f y)
                      "/"
                      (g x)))))

```

And we need something to evaluate.  Here goes.

```
    (p (f a) (g b))
```

Where do we start? Well, before we can apply `p`, we must evaluate both arguments. We'll start with the `(f a)`. Before we can apply `f`, we must evaluate `a`.  Our definitions tell us that `a` is `"A"`, so we subtitute.

```
--> (p (f "A") (g b))
```

Can we evaluate that `"A"` any further? Nope. So we plug `"A"` in for `x` in the body of `f`, giving us `(string-append "A" "-" "A")`. We replace `(f "A")` with that new expression.

```
--> (p (string-append "A" "-" "A") (g b))
```

All three arguments to `string-append` are fully evaluated. Hence, we can append the three strings.

```
--> (p "A-A" (g b))
```

We've gone as far as we can with the first argument to `p`, so we move on to the second argument. Before we call `g`, we must evaluate `b`. Our definitions tell us that `b` is `"B"`.

```
--> (p "A-A" (g "B"))
```

Now, we need to substitute `"B"` in for `y` in the body of `g`. That gives us `(string-append "(" "B" ")")`. We replace `(g "B")` with that new expression.

```
--> (p "A-A" (string-append "(" "B" ")"))
```

The three parameters to `string-append` are now all evaluated, so we're able to append them.

```
--> (p "A-A" "(B)")
```

Both parameters to `p` are now fully evaluated. We can then substitute `"A-A"` for `x` in the body of `p` and substitute `"(B)"`  for `y`.

```
--> (g (string-append (f "(B)") "/" (g "A-A")))
```

We can't yet evaluate the outer `g` until we evaluate the `string-append`. We can't evaluate the `string-append` until we evaluate the calls to `f` and `g`.

Fortunately, the argument to `f` is already evaluated. So we substitute `"(B)"` for `x` in the body of `f`.

```
--> (g (string-append (string-append "(B)" "-" "(B)") "/" (g "A-A")))
```

All the parameters to the inner `string-append` are now evaluated, so we can just append them.

```
--> (g (string-append "(B)-(B)" "/" (g "A-A")))
```

The first argument to the outer-string append is now complete. The second argument (the `"/"`) is also complete. We move on to the inner call to `g`. We substitute `"A-A"` for `y` in the body of `g` and then plug the result in for the call to `g`.

```
--> (g (string-append "(B)-(B)" "/" (string-append "(" "A-A" ")")))
```

All the arguments to the inner `string-append` are complete. We can apply that procedure.

```
--> (g (string-append "(B)-(B)" "/" "(A)"))
```

We're getting close. The outer call to `string-append` can now be evaluated.

```
--> (g "(B)-(B)/(A)")
```

We now substitute `"(B)-(B)/(A)"` for `y` in `g`.

```
--> (string-append "(" "(B)-(B)/(A)" ")")
```

Finally, we append those strings.

```
--> "((B)-(B)/(A))"
```

And we're done.

Putting it all together, we get the following.

```
    (p (f a) (g b))
--> (p (f "A") (g b))
--> (p (string-append "A" "-" "A") (g b))
--> (p "A-A" (g b))
--> (p "A-A" (g "B"))
--> (p "A-A" (string-append "(" "B" ")"))
--> (p "A-A" "(B)")
--> (g (string-append (f "(B)") "/" (g "A-A")))
--> (g (string-append (string-append "(B)" "-" "(B)") "/" (g "A-A")))
--> (g (string-append "(B)-(B)" "/" (g "A-A")))
--> (g (string-append "(B)-(B)" "/" (string-append "(" "A-A" ")")))
--> (g (string-append "(B)-(B)" "/" "(A)"))
--> (g "(B)-(B)/(A)")
--> (string-append "(" "(B)-(B)/(A)" ")")
--> "((B)-(B)/(A))"
```

Now, you may say to yourself "I could tell that `g` surrounds its parameter with parentheses and that `f` makes two copies and separates them with a dash. And you'd be right. However, for tracing (at least for LAs), our goal is that you can work out the steps, not just that you get the right answer for these procedures. Why? Because tracing is important when you *can't* figure out what a procedure does. And if you don't master the skill of tracing straightforward procedures, you won't be able to transfer more subtle ones
