---
title: Analyzing procedures
summary: |
  Once you develop procedures, it becomes useful to have some
  sense as to how efficient the procedure is. For example, when working
  with a list of values, some procedures take a constant number of steps
  (e.g., `car`), some take a number of steps proportional to the length
  of the list (e.g., finding the last element in the list), some take
  a number of steps proportional to the square of the length of the list
  (e.g., finding the closest pair of colors in a list). In this reading, we
  consider ways in which you might analyze how slow or fast a procedure is.
---

## Introduction

At this point in your career, you know the basic tools to build
algorithms, including conditionals, recursion, variables, and subroutines
(procedures). You've also found that you can often write several
procedures that all solve the same problem and even produce the same
results. How do you then decide which one to use? There are many criteria
we use. One important one is *readability* - can we easily understand
the way the algorithm works? A more readable algorithm is also easier
to correct if we ever notice an error or to modify if we want to expand
its capabilities.

However, most programmers care as much or more about *efficiency*---how
many computing resources does the algorithm use? (Pointy-haired
bosses care even more about such things.) Resources include memory
and processing time. Most analyses of efficiency focus on running
time, the amount of time the program takes to run.  Running time,
in turn depends on both how many steps the procedure executes and
how long each step takes. Since almost every step in Scheme involves
a procedure call, to get a sense of the approximate running time
of Scheme algorithms, we can usually count procedure calls.

In this reading and the corresponding lab, we will consider some
techniques for figuring out how many procedure calls are done.

## Some examples to explore

As we explore analysis, we'll start with a few basic examples. First,
consider two versions of the `alphabetically-first` procedure, which
finds the alphabetically first string in a list.  (You're probably
quite familiar with procedures that find some extreme value in a list,
such as one that finds the largest integer; this is just another that
follows that pattern.)

<pre class="scamper source-only">
;;; (alphabetically-first string) -> string
;;;   strings: both (listof string?) nonempty?
;;; Find the alphabetically first string in the list.
(define alphabetically-first-1
  (lambda (strings)
    (cond
      [(null? (cdr strings))
       (car strings)]
      [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
       (car strings)]
      [else
       (alphabetically-first-1 (cdr strings))])))

;;; (first-of-two str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Find the alphabetically first of str1 and str2.
(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))

(define alphabetically-first-2
  (lambda (strings)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))
</pre>

The two versions are fairly similar. Does it really matter which we
use? We'll see in a bit.

As a second example, consider how we might write the famous `reverse`
procedure ourselves, rather than using the built-in version. In this
example, we'll use two very different versions.

<pre class="scamper source-only">
;;; (list-append l1 l2) -> list?
;;;   l1, l2 : list?
;;; Returns the list formed by placing the elements of l2 after the elements
;;; of l1, preserving the order of the elements of l1 and l2.
(define list-append
  (lambda (l1 l2)
    (cond
      [(null? l1)
       l2]
      [else
       (cons (car l1)
             (list-append (cdr l1) l2))])))

;;; (list-reverse lst) -> list?
;;;   lst : list?
;;; Returns a list with the elements of lst in the opposite order.
(define list-reverse-1
  (lambda (lst)
    (match lst
      [null null]
      [(cons head tail)
       (list-append (list-reverse-1 tail) (list head))])))

(define list-reverse-2-helper
  (lambda (so-far remaining)
    (match remaining
      [null so-far]
      [(cons head tail)
       (list-reverse-2-helper (cons head so-far) tail)])))

(define list-reverse-2
  (lambda (lst)
    (list-reverse-2-helper null lst)))
</pre>

You'll note that we've used `list-append` rather than `append`. Why? Because we know that the `append` procedure is recursive, so we want to make sure that we can count the calls that happen there, too. We've used the standard implementation strategy for `append` in defining `list-append`.

## Strategy one: Counting steps through the explorations pane

How do we figure out how many steps these procedures take? One obvious
way is to use the explorations pane and count the number of procedure
calls each function makes. What happens when we call the first set of
procedures, `alphabetically-first`, on a simple list of strings?  Let's
see! Below, we give a trace of the calls themselves, but we encourage
you to step through the trace and identify when these calls appear.

```racket
> (define animals (list "armadillo" "badger" "capybara" "donkey" "emu"))
> (alphabetically-first-1 animals)
--> (alphabetically-first-1 (list "armadillo" "badger" "capybara" "donkey" "emu"))
--> (alphabetically-first-1 (list "badger" "capybara" "donkey" "emu"))
--> (alphabetically-first-1 (list "capybara" "donkey" "emu"))
--> (alphabetically-first-1 (list "donkey" "emu"))
--> (alphabetically-first-1 (list "emu"))
--> "armadillo"
> (alphabetically-first-2 animals)
--> (alphabetically-first-2 (list "armadillo" "badger" "capybara" "donkey" "emu"))
--> (alphabetically-first-2 (list "badger" "capybara" "donkey" "emu"))
--> (alphabetically-first-2 (list "capybara" "donkey" "emu"))
--> (alphabetically-first-2 (list "donkey" "emu"))
--> (alphabetically-first-2 (list "emu"))
--> "armadillo"
```

So far, so good. Each has about five calls for a list of length
five. Let's try a slightly different list.

```racket
> (alphabetically-first-1 (reverse animals))
--> (alphabetically-first-1 (list "emu" "donkey" "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "donkey" "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "donkey" "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "capybara" "badger" "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "badger" "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> (alphabetically-first-1 (list "armadillo"))
--> "armadillo"
```

**Wow!** That's a lot of lines to count, 31 if we've counted correctly. That
seems like a few more than one might expect. That may be a problem. So,
how many does the other version take?

```racket
> (alphabetically-first-2 (reverse animals))
--> (alphabetically-first-2 ("emu" "donkey" "capybara" "badger" "armadillo"))
--> (alphabetically-first-2 ("donkey" "capybara" "badger" "armadillo"))
--> (alphabetically-first-2 ("capybara" "badger" "armadillo"))
--> (alphabetically-first-2 ("badger" "armadillo"))
--> (alphabetically-first-2 ("armadillo"))
--> "armadillo"
```

Still five calls for a list of length five. Clearly, the second one is
better on this input. Why and how much? That's an issue for a bit later.

In case you haven't noticed, we've now tried two special cases, one in
which the list is organized first to last and one in which the list
is organized last to first. In the first case, the two versions are
equivalent in terms of the number of recursive calls. In the second case,
the second implementation is significantly faster. Clearly, the cases
you test for efficiency matter a lot. We should certainly try some others.

Let's try the other example of exploring costs, reversing lists.
We'll start by reversing a list of length five.

```racket
> (list-reverse-1 animals)
--> (list-reverse-1 (list "armadillo" "badger" "capybara" "donkey" "emu"))
--> (list-reverse-1 (list "badger" "capybara" "donkey" "emu"))
--> (list-reverse-1 (list "capybara" "donkey" "emu"))
--> (list-reverse-1 (list "donkey" "emu"))
--> (list-reverse-1 (list "emu"))
--> (list-reverse-1 (list))
(list "emu" "donkey" "capybara" "badger" "armadillo")
> (list-reverse-2 animals)
--> (list-reverse-2 (list "armadillo" "badger" "capybara" "donkey" "emu"))
--> (list-reverse-2-helper (list) (list "armadillo" "badger" "capybara" "donkey" "emu"))
--> (list-reverse-2-helper (list "armadillo") (list "badger" "capybara" "donkey" "emu"))
--> (list-reverse-2-helper (list "badger" "armadillo") (list "capybara" "donkey" "emu"))
--> (list-reverse-2-helper (list "capybara" "badger" "armadillo") (list "donkey" "emu"))
--> (list-reverse-2-helper (list "donkey" "capybara" "badger" "armadillo") (list "emu"))
--> (list-reverse-2-helper (list "emu" "donkey" "capybara" "badger" "armadillo") (list))
--> (list "emu" "donkey" "capybara" "badger" "armadillo")
```

So far, so good. The two seem about equivalent. But what about the
other procedures that each calls? The `helper` of `reverse-2` calls
`cdr`, `cons`, and `car` once for each recursive call. Hence, there
are probably five times as many procedure calls as we just counted. On
the other hand, `reverse-1` calls `list-append` and `list`. The `list`
procedure is not recursive, so we don't need to worry about it. But what
about `list-append`? It is recursive, so we need to count those calls, too!
Now, what happens?

```racket
> (list-reverse-1 animals)
--> (list-reverse-1 (list "armadillo" "badger" "capybara" "donkey" "emu"))
--> (list-reverse-1 (list "badger" "capybara" "donkey" "emu"))
--> (list-reverse-1 (list "capybara" "donkey" "emu"))
--> (list-reverse-1 (list "donkey" "emu"))
--> (list-reverse-1 (list "emu"))
--> (list-reverse-1 (list))
--> (list-append (list) (list "emu"))
--> (list-append (list "emu") (list "donkey"))
--> (list-append (list) (list "donkey"))
--> (list-append (list "emu" "donkey") (list "capybara"))
--> (list-append (list "donkey") (list "capybara"))
--> (list-append (list) (list "capybara"))
--> (list-append (list "emu" "donkey" "capybara") (list "badger"))
--> (list-append (list "donkey" "capybara") (list "badger"))
--> (list-append (list "capybara") (list "badger"))
--> (list-append (list) (list "badger"))
--> (list-append (list "emu" "donkey" "capybara" "badger") (list "armadillo"))
--> (list-append (list "donkey" "capybara" "badger") (list "armadillo"))
--> (list-append (list "capybara" "badger") (list "armadillo"))
--> (list-append (list "badger") (list "armadillo"))
--> (list-append (list) (list "armadillo"))
--> (list "emu" "donkey" "capybara" "badger" "armadillo")
```

Hmmm, that's a few calls to `list-append`. Not the 31 we saw for the
alphabetically first element in a list, but still a lot. Let's see ... fifteen, if
we count correctly. Now, let's see what happens when we make the list
one element longer.

```racket
> (list-reverse-1 (list 1 2 3 4 5 6))
--> (list-reverse-1 (list 1 2 3 4 5 6))
--> (list-reverse-1 (list 2 3 4 5 6))
--> (list-reverse-1 (list 3 4 5 6))
--> (list-reverse-1 (list 4 5 6))
--> (list-reverse-1 (list 5 6))
--> (list-reverse-1 (list 6))
--> (list-reverse-1 (list))
--> (list-append (list) (list 6))
--> (list-append (list 6) (list 5))
--> (list-append (list) (list 5))
--> (list-append (list 6 5) (list 4))
--> (list-append (list 5) (list 4))
--> (list-append (list) (list 4))
--> (list-append (list 6 5 4) (list 3))
--> (list-append (list 5 4) (list 3))
--> (list-append (list 4) (list 3))
--> (list-append (list) (list 3))
--> (list-append (list 6 5 4 3) (list 2))
--> (list-append (list 5 4 3) (list 2))
--> (list-append (list 4 3) (list 2))
--> (list-append (list 3) (list 2))
--> (list-append (list) (list 2))
--> (list-append (list 6 5 4 3 2) (list 1))
--> (list-append (list 5 4 3 2) (list 1))
--> (list-append (list 4 3 2) (list 1))
--> (list-append (list 3 2) (list 1))
--> (list-append (list 2) (list 1))
--> (list-append (list) (list 1))
--> (list 6 5 4 3 2 1)

> (list-reverse-2 (list 1 2 3 4 5 6))
--> (list-reverse-2 (list 1 2 3 4 5 6))
--> (list-reverse-2-helper (list) (list 1 2 3 4 5 6))
--> (list-reverse-2-helper (list 1) (list 2 3 4 5 6))
--> (list-reverse-2-helper (list 2 1) (list 3 4 5 6))
--> (list-reverse-2-helper (list 3 2 1) (list 4 5 6))
--> (list-reverse-2-helper (list 4 3 2 1) (list 5 6))
--> (list-reverse-2-helper (list 5 4 3 2 1) (list 6))
--> (list-reverse-2-helper (list 6 5 4 3 2 1) (list))
--> (list 6 5 4 3 2 1)
```
Hmmm ... we added one element to the list, and we added six calls to
`list-append` (we're now up to 21). In the case of `list-reverse-2`, we seem
to have added only one call.

What if there are ten elements? You probably don't want to count that
high. However, we're pretty sure the we'll end up with 55 total calls to
`list-append`, and only ten recursive calls to the helper.

## Strategy two: Automating the counting of steps

We've seen a few problems in the previous strategy for analyzing the
running time of procedures. First, it's a bit of a pain to add the
output annotations to our code. Second, it's even more of a pain to count
the number of lines those annotations produce. Finally, there are some
procedure calls that we didn't count. So, what should we do? We want to
transition from *manual* to *automatic* counting.

Just as we updated the code to print lines, we will update our code just
a bit to do the counting. At least the counting will be automatic.

What do we do? We'll create a _ref cell_ to keep track how many times each
procedure is called. A ref cell is, in essence, a single-element vector
with a simplified interface for getting and setting the single value it
contains. Why use ref cells? Because ref cells are mutable, we can
update the number of procedure calls made as a _side-effect_ of each
function's execution. This allows us to minimally change the behavior of
the code and still be able to counter the number of calls made.

We'll first introduce two helper functions. The first increments the value
at one of vector's indices and the second resets the vector's values back
to 0.

<pre class="scamper source">
(define inc
  (lambda (r)
    (ref-set! r (+ (deref r) 1))))

(define reset
  (lambda (r)
    (ref-set! r 0)))

(define ex (ref 0))

(ignore (inc ex))
(ignore (inc ex))
(ignore (inc ex))

(display ex)

(ignore (reset ex))

(display ex)
</pre>

Next, we update the code to `alphabetically-first-1` and `alphabetically-first-2`
to increment the first and second indices of our vector, respectively, which
will be defined globally. With the updated functions, we can do some analysis:

<pre class="scamper source">
(define inc
  (lambda (r)
    (ref-set! r (+ (deref r) 1))))

(define reset
  (lambda (r)
    (ref-set! r 0)))

(define count (ref 0))

(define count-ops
  (lambda (func)
    (begin
      (reset count)
      (func)
      (deref count))))

(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2)
        str1
        str2)))

(define alphabetically-first-1
  (lambda (strings)
    (begin
      (inc count)
      (cond
        [(null? (cdr strings))
         (car strings)]
        [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
         (car strings)]
        [else
         (alphabetically-first-1 (cdr strings))]))))

(define alphabetically-first-2
  (lambda (strings)
    (begin
      (inc count)
      (if (null? (cdr strings))
          (car strings)
          (first-of-two (car strings)
                        (alphabetically-first-2 (cdr strings)))))))

; The examples that we traced by hand.
(define animals (list "armadillo" "badger" "capybara" "donkey" "emu"))

(display
  (count-ops
    (lambda () (alphabetically-first-1 animals))))

(display
  (count-ops
    (lambda () (alphabetically-first-2 animals))))

(display
  (count-ops
    (lambda () (alphabetically-first-1 (reverse animals)))))

(display
  (count-ops
    (lambda () (alphabetically-first-2 (reverse animals)))))


; Now let's try a bigger example!
(define letters (|> (range 16)
                    (lambda (l) (map (lambda (n) (+ n (char->integer #\a))) l))
                    (lambda (l) (map integer->char l))
                    (lambda (l) (map (lambda (c) (make-string 2 c)) l))))

(display letters)

(display
  (count-ops
    (lambda () (alphabetically-first-1 letters))))

(display
  (count-ops
    (lambda () (alphabetically-first-2 letters))))

(display
  (count-ops
    (lambda () (alphabetically-first-1 (reverse letters)))))

(display
  (count-ops
    (lambda () (alphabetically-first-2 (reverse letters)))))
</pre>

With our mutable counter implementation, we can even be braver and try larger lists
as the last example shows us. We didn't really want to do so when we were counting by
hand, but now the computer can count for us!

Now that we've done some preliminary exploration of these procedures, which one would you prefer to use?

You may be waiting for us to analyze the two forms of `reverse`, but we'll leave that as a task for the lab.

## Interpreting results

You now have a variety of ways to count steps. But what should you do
with those results in comparing algorithms? The strategy most computer
scientists use is to look for patterns that describe the relationship
between the size of the input and the number of procedure calls. We find
it useful to look at what happens when you add one to the input size
(e.g., go from a list of length 4 to a list of length 5) or when you
double the input size (e.g., go from a list of length 4 to a list of
length 8, or go from the number 8 to the number 16).

The most efficient algorithms generally use a number of procedure calls
that does not depend on the size of the input. For example, `car` always
takes one step, whether the list of length 1, 2, 4, or even 1024. Computer
scientists refer to those as *constant time* algorithms.

At times, we'll find algorithms that add a constant number of steps when
you double the input size (we haven't seen any of those so far). Those
are also very good. (Computer scientists and mathematicians say that
these algorithms are *logarithmic* in the size of the input.)

However, for most problems, the best we'll be able to do is write
algorithms that take twice as many steps when we double the size of
the input. For example, in processing a list of length n, we probably
have to visit every element of the list. In fact, we'll probably do
a few steps for each element. If we double the length of the list, we
double the number of steps. Most of the list problems you face in this
class should have solutions that have this form. For these algorithms,
we say that the running time is *linear* in the size of the input.

However, there are times that the running time grows much more
quickly. For example, you may notice that when you double the input,
the number of steps seems to go up by about a factor of four. Such
algorithms are sometimes necessary, but get very slow as input size
increases. When the running time grows by the square of the growth in
input size, we say that algorithms are *quadratic*.

But there are even worse cases. At times, you'll find that when you
double the input size, the number of steps goes up much more than
a factor of four. (For example, that happens in the first version of
`alphabetically-first-1`.) If you find your code exhibiting that behavior,
it's probably time to write a new algorithm.

*Note:* While we generally don't like to use algorithms that exhibit worse
behavior than quadrupling steps for doubled input, there are cases in
which these slow algorithms are the best that any computer scientist has
developed. There are even some problems for which we have slow algorithms
but theorize that there cannot be a fast algorithm. To make life even more
confusing, there are some problems for which it has been proven that no
algorithm can exist. If you continue your study of computer science, you
will have the opportunity to explore these puzzling but powerful ideas.

## What went wrong?

We started the reading by considering pairs of algorithms for the
same problem, and found that one of each pair was much slower than
the other. Why are the slower versions of the two algorithms above so
slow? In the case of `alphabetically-first-1`, there is a case in which
one call spans two identical recursive calls. That doubling gets painful
fairly quickly. From 1 to 3 to 7 to 15 to 31 to 63 to ....

If you notice that you are doing multiple identical recursive calls,
see if you can apply a helper to the recursive call, as we did in
`alphabetically-first-2`. Rewriting your procedure using the primary
tail recursion strategy (that is, accumulating a result as you go)
may also help.

In the case of `reverse-1`, the difficulty is only obvious when we include
`list-append`. And what's the problem? The problem is that `list-append`
is not a constant-time algorithm, but one that needs to visit every
element in the first list. Since `reverse` keeps calling `list-append`
with larger and larger lists, we spend a lot of time appending.

## Self checks

### Check 1: Categorizing algorithms (‡)

For each function, explain whether it is a constant time or linear
time algorithm.

- `cdr`
- `list-ref`
- `vector-ref`
- `map`
- `range`