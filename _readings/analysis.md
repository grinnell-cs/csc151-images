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
(procedures). You've also found that you can often write several different
procedures that all solve the same problem and even produce the same
results. How do you then decide which one to use? There are many criteria
we use. One important one is *readability* - can we easily understand
the way the algorithm works? A more readable algorithm is also easier
to correct if we ever notice an error or to modify if we want to expand
its capabilities.

However, most programmers care as much or more about *efficiency*
- how many computing resources does the algorithm use? (Pointy-haired
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

```drracket
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

(define alphabetically-first-2
  (lambda (strings)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))

;;; (first-of-two str1 str2) -> string?
;;;   str1 : string?
;;;   str2 : string?
;;; Find the alphabetically first of str1 and str2.
(define first-of-two
  (lambda (str1 str2)
    (if (string-ci<=? str1 str2) 
        str1
        str2)))
```

The two versions are fairly similar. Does it really matter which we
use? We'll see in a bit.

As a second example, consider how we might write the famous `reverse`
procedure ourselves, rather than using the built-in version. In this
example, we'll use two very different versions.

```drracket
;;; (list-reverse lst) -> list?
;;;   lst : list?
;;; Returns a list with the elements of lst in the opposite order.
(define list-reverse-1
  (lambda (lst)
    (match lst
      ['() 
       null]
      [(cons head tail) 
       (list-append (list-reverse-1 tail) (list head))])))

(define list-reverse-2
  (lambda (lst)
    (letrec ([helper
              (lambda (so-far remaining)
                (match remaining
                  ['() 
                   so-far]
                  [(cons head  tail) 
                   (helper (cons head so-far) tail)]))])
      (helper null lst))))
```

You'll note that we've used `list-append` rather than `append`. Why? Because we know that the `append` procedure is recursive, so we want to make sure that we can count the calls that happen there, too. We've used the standard implementation strategy for `append` in defining `list-append`.

```drracket
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
```

## Strategy one: Counting steps through output

How do we figure out how many steps these procedures take? One obvious
way is to add a bit of code to output something for each procedure
call. While you may not know the details of output yet, all you need
to know right now is that `write` prints its parameter, and `newline`
prints a carriage return. To annotate the procedures for output, we
simply add appropriate calls. For example, here are the first few lines
of the annotated versions of `alphabetically-first-1` and `alphabetically-first-2`.

```drracket
(define alphabetically-first-1
  (lambda (strings)
    (writeln (list 'alphabetically-first-1 strings))
    (cond
      [(null? (cdr strings))
       (car strings)]
      [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
       (car strings)]
      [else
       (alphabetically-first-1 (cdr strings))])))

(define alphabetically-first-2
  (lambda (strings)
    (write (list 'alphabetically-first-2 strings)) (newline)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))
```

What happens when we call the two procedures on a simple list of 
strings?  Let's see.

```drracket
> (define animals (list "armadillo" "badger" "capybara" "donkey" "emu"))
> (alphabetically-first-1 animals)
(alphabetically-first-1 ("armadillo" "badger" "capybara" "donkey" "emu"))
(alphabetically-first-1 ("badger" "capybara" "donkey" "emu"))
(alphabetically-first-1 ("capybara" "donkey" "emu"))
(alphabetically-first-1 ("donkey" "emu"))
(alphabetically-first-1 ("emu"))
"armadillo"
> (alphabetically-first-2 animals)
(alphabetically-first-2 ("armadillo" "badger" "capybara" "donkey" "emu"))
(alphabetically-first-2 ("badger" "capybara" "donkey" "emu"))
(alphabetically-first-2 ("capybara" "donkey" "emu"))
(alphabetically-first-2 ("donkey" "emu"))
(alphabetically-first-2 ("emu"))
"armadillo"
```

So far, so good. Each has about five calls for a list of length
five. Let's try a slightly different list.

```drracket
> (alphabetically-first-1 (reverse animals))
(alphabetically-first-1 ("emu" "donkey" "capybara" "badger" "armadillo"))
(alphabetically-first-1 ("donkey" "capybara" "badger" "armadillo"))
(alphabetically-first-1 ("capybara" "badger" "armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("capybara" "badger" "armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("donkey" "capybara" "badger" "armadillo"))
(alphabetically-first-1 ("capybara" "badger" "armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("capybara" "badger" "armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("badger" "armadillo"))
(alphabetically-first-1 ("armadillo"))
(alphabetically-first-1 ("armadillo"))
"armadillo"
```

**Wow!** That's a lot of lines to count, 31 if we've counted correctly. That
seems like a few more than one might expect. That may be a problem. So,
how many does the other version take?

```drracket
> (alphabetically-first-2 (reverse animals))
(alphabetically-first-2 ("emu" "donkey" "capybara" "badger" "armadillo"))
(alphabetically-first-2 ("donkey" "capybara" "badger" "armadillo"))
(alphabetically-first-2 ("capybara" "badger" "armadillo"))
(alphabetically-first-2 ("badger" "armadillo"))
(alphabetically-first-2 ("armadillo"))
"armadillo"
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
First, we'll annotate the procedures to display each call.

```drracket
(define list-reverse-1
  (lambda (lst)
    (writeln (list 'list-reverse-1 lst))
    (match lst
      ['() 
       null]
      [(cons head tail) 
       (list-append (list-reverse-1 tail) (list head))])))

(define list-reverse-2
  (lambda (lst)
    (writeln (list 'list-reverse-2 lst))
    (letrec ([helper
              (lambda (so-far remaining)
                (writeln (list 'list-reverse-2-kernel so-far remaining))
                (match remaining
                  ['() 
                   so-far]
                  [(cons head  tail) 
                   (helper (cons head so-far) tail)]))])
      (helper null lst))))
```

We'll start by reversing a list of length five.

```drracket
> (list-reverse-1 animals)
(list-reverse-1 ("armadillo" "badger" "capybara" "donkey" "emu"))
(list-reverse-1 ("badger" "capybara" "donkey" "emu"))
(list-reverse-1 ("capybara" "donkey" "emu"))
(list-reverse-1 ("donkey" "emu"))
(list-reverse-1 ("emu"))
(list-reverse-1 ())
'("emu" "donkey" "capybara" "badger" "armadillo")
> (list-reverse-2 animals)
(list-reverse-2 ("armadillo" "badger" "capybara" "donkey" "emu"))
(list-reverse-2-kernel () ("armadillo" "badger" "capybara" "donkey" "emu"))
(list-reverse-2-kernel ("armadillo") ("badger" "capybara" "donkey" "emu"))
(list-reverse-2-kernel ("badger" "armadillo") ("capybara" "donkey" "emu"))
(list-reverse-2-kernel ("capybara" "badger" "armadillo") ("donkey" "emu"))
(list-reverse-2-kernel ("donkey" "capybara" "badger" "armadillo") ("emu"))
(list-reverse-2-kernel ("emu" "donkey" "capybara" "badger" "armadillo") ())
'("emu" "donkey" "capybara" "badger" "armadillo")
```

So far, so good. The two seem about equivalent. But what about the
other procedures that each calls? The `helper` of `reverse-2` calls
`cdr`, `cons`, and `car` once for each recursive call. Hence, there
are probably five times as many procedure calls as we just counted. On
the other hand, `reverse-1` calls `list-append` and `list`. The `list`
procedure is not recursive, so we don't need to worry about it. But what
about `list-append`? It is recursive, so let's add an output annotation
to that procedure, too. Now, what happens?

```drracket
> (list-reverse-1 animals)
(list-reverse-1 ("armadillo" "badger" "capybara" "donkey" "emu"))
(list-reverse-1 ("badger" "capybara" "donkey" "emu"))
(list-reverse-1 ("capybara" "donkey" "emu"))
(list-reverse-1 ("donkey" "emu"))
(list-reverse-1 ("emu"))
(list-reverse-1 ())
(list-append () ("emu"))
(list-append ("emu") ("donkey"))
(list-append () ("donkey"))
(list-append ("emu" "donkey") ("capybara"))
(list-append ("donkey") ("capybara"))
(list-append () ("capybara"))
(list-append ("emu" "donkey" "capybara") ("badger"))
(list-append ("donkey" "capybara") ("badger"))
(list-append ("capybara") ("badger"))
(list-append () ("badger"))
(list-append ("emu" "donkey" "capybara" "badger") ("armadillo"))
(list-append ("donkey" "capybara" "badger") ("armadillo"))
(list-append ("capybara" "badger") ("armadillo"))
(list-append ("badger") ("armadillo"))
(list-append () ("armadillo"))
'("emu" "donkey" "capybara" "badger" "armadillo")
```

Hmmm, that's a few calls to `list-append`. Not the 31 we saw for the
brightest element in a list, but still a lot. Let's see ... fifteen, if
we count correctly. Now, let's see what happens when we make the list
one element longer.

```drracket
> (list-reverse-1 (list 1 2 3 4 5 6))
(list-reverse-1 (1 2 3 4 5 6))
(list-reverse-1 (2 3 4 5 6))
(list-reverse-1 (3 4 5 6))
(list-reverse-1 (4 5 6))
(list-reverse-1 (5 6))
(list-reverse-1 (6))
(list-reverse-1 ())
(list-append () (6))
(list-append (6) (5))
(list-append () (5))
(list-append (6 5) (4))
(list-append (5) (4))
(list-append () (4))
(list-append (6 5 4) (3))
(list-append (5 4) (3))
(list-append (4) (3))
(list-append () (3))
(list-append (6 5 4 3) (2))
(list-append (5 4 3) (2))
(list-append (4 3) (2))
(list-append (3) (2))
(list-append () (2))
(list-append (6 5 4 3 2) (1))
(list-append (5 4 3 2) (1))
(list-append (4 3 2) (1))
(list-append (3 2) (1))
(list-append (2) (1))
(list-append () (1))
'(6 5 4 3 2 1)
> (list-reverse-2 (list 1 2 3 4 5 6))
(list-reverse-2 (1 2 3 4 5 6))
(list-reverse-2-kernel () (1 2 3 4 5 6))
(list-reverse-2-kernel (1) (2 3 4 5 6))
(list-reverse-2-kernel (2 1) (3 4 5 6))
(list-reverse-2-kernel (3 2 1) (4 5 6))
(list-reverse-2-kernel (4 3 2 1) (5 6))
(list-reverse-2-kernel (5 4 3 2 1) (6))
(list-reverse-2-kernel (6 5 4 3 2 1) ())
'(6 5 4 3 2 1)
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

What do we do? We'll create a hash table to keep track of how many times
each procedure is called.  Why a hash table?  Because hash tables are
mutable and we've seen that hash tables can be helpful in keeping track
of counts.  We're also going to associate a name with the counter.  To
store two values, we'll use a struct

```drracket
(struct counter-kernel (name counts)
  #:reflection-name 'counter)

;;; (counter name) -> counter?
;;;   name : string
;;; Create a new counter that can be used for the other counter procedures.
(define counter 
  (lambda (name)
    (let ([counts (make-hash)])
      (hash-set! counts "" 0)
      (counter-kernel name counts))))
```

What's the call to `hash-set!`?  We're using the empty string as a
key to store the total number of counts.

We don't really want our clients to extract the portions of the
counter, our helper procedures may do so.

Now, let's create some procedures that we can use with that
counter. First, we want to be able to get the number of times
a procedure has been called.

```drracket
;;; (counter-get counter procname) -> integer?
;;;   counter : counter?
;;;   procname : symbol?
;;; Get the number of times that counter-increment! has been called
;;; with procname since (a) the counter was created or (b) counter-reset!
;;; has been called with that procedure name.
(define counter-get
  (lambda (counter procname)
    ; hash-ref lets us supply a default value
    (hash-ref (counter-kernel-counts counter) procname 0)))
```

We can now write a procedure to increment counters.

```drracket
;;; (counter-increment! counter procname) -> void?
;;;   counter : counter?
;;;   procname : symbol?
;;; Increment the count for a particular procedure.
(define counter-increment!
  (lambda (counter procname)
    (let ([counts (counter-kernel-counts counter)])
      (hash-set! counts procname (+ 1 (hash-ref counts procname 0)))
      (hash-set! counts "" (+ 1 (hash-ref counts "" 0))))))
```

As the documentation for `counter-get` suggests, we may, on occasion,
want to reset the counter.  We will have separate procedures for
resetting the counts for a single procedure and all of the counts.

```drracket
;;; (counter-reset! counter procname) -> void?
;;;   counter : counter?
;;;   procname : symbol?
;;; Purpose:
;;;   Reset the counter for the given procedure.
(define counter-reset!
  (lambda (counter procname)
    (let ([counts (counter-kernel-counts counter)])
      (hash-set! counts "" (- (hash-ref counts "" 0)
                              (hash-ref counts procname 0)))
      (hash-remove! counts procname))))
```

```drracket
;;; (counter-reset-all! counter) -> void?
;;;   counter : counter?
;;; Reset the elements of counter.
(define counter-reset-all! 
  (lambda (counter)
    (hash-clear! (counter-kernel-counts counter))))
```

Finally, it may be useful to print out the values of the counter.

```drracket
;;; (display-counter counter) -> void?
;;;   counter : counter?
;;; Print all the values in a counter in a semi-useful way.
(define display-counter
  (lambda (counter)
    (let ([counts (counter-kernel-counts counter)])
      (display "Counts for ")
      (display (counter-kernel-name counter))
      (newline)
      (display "  Total: ")
      (display (hash-ref counts "" 0))
      (newline)
      (hash-for-each counts
                     (lambda (proc count)
                       (when (not (eq? proc ""))
                         (display "  ")
                         (display proc)
                         (display ": ")
                         (display count)
                         (newline)))))))
```

Now, we can try another analysis of the `alphabetically-first`
procedures and even do a bit less manual counting.

First, we create the counters.  

```drracket
(define AF (make-counter "experiments with alphabetically-first"))
```

Next, we update the code to `alphabetically-first-1` and `alphabetically-first-2`.

```drracket
(define alphabetically-first-1
  (lambda (strings)
    (counter-increment! AF 'alphabetically-first-1)
    (cond
      [(null? (cdr strings))
       (car strings)]
      [(string-ci<=? (car strings) (alphabetically-first-1 (cdr strings)))
       (car strings)]
      [else
       (alphabetically-first-1 (cdr strings))])))

(define alphabetically-first-2
  (lambda (strings)
    (counter-increment! AF 'alphabetically-first-2)
    (if (null? (cdr strings))
        (car strings)
        (first-of-two (car strings)
                      (alphabetically-first-2 (cdr strings))))))
```

We are now ready to do some analysis.

```drracket
> (counter-reset-all! AF)
> (alphabetically-first-1 animals)
"armadillo"
> (display-counter AF)
Counts for experiments with alphabetically-first
  Total: 5
  alphabetically-first-1: 5
>  (alphabetically-first-2 animals)
"armadillo"
> (display-counter AF)
Counts for experiments with alphabetically-first
  Total: 10
  alphabetically-first-1: 5
  alphabetically-first-2: 5
> (counter-reset-all! AF)
> (display-counter AF)
Counts for experiments with alphabetically-first
  Total: 0
> (alphabetically-first-1 (reverse animals))
"armadillo"
> (alphabetically-first-2 (reverse animals))
"armadillo"
> (display-counter AF)
Counts for experiments with alphabetically-first
  Total: 36
  alphabetically-first-1: 31
  alphabetically-first-2: 5
```

What if we try a slightly bigger list? We didn't really want to do so
when we were counting by hand, but now the computer can count for us.

```drracket
> (define letters (map (o (section make-string 2 <>)
                          integer->char
                          (section + <> (char->integer #\a)))
                       (range 16)))
> letters
'("aa" "bb" "cc" "dd" "ee" "ff" "gg" "hh" "ii" "jj" "kk" "ll" "mm" "nn" "oo" "pp")
> (counter-reset-all! AF)
> (alphabetically-first-1 letters)
"aa"
> (alphabetically-first-2 letters)
"aa"
> (display-counter AF)
Counts for experiments with alphabetically-first
  Total: 32
  alphabetically-first-1: 16
  alphabetically-first-2: 16
> (counter-reset-all! AF)
> (alphabetically-first-1 (reverse letters))
"aa"
> (alphabetically-first-2 (reverse letters))
"aa"
> (display-counter AF)
Counts for experiments with alphabetically-first
  Total: 65551
  alphabetically-first-1: 65535
  alphabetically-first-2: 16
```

As we said, we really didn't want to count more than 64,000+ calls by hand.

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
- `cddr`
- `list-ref`
- `vector-ref`
- `map`
- `range`

### Check 2: Manual analysis

Here's some code to help you see the process of reversing lists.

```
;;; (list-append l1 l2) -> list?
;;;   l1, l2 : list?
;;; Returns the list formed by placing the elements of l2 after the elements
;;; of l1, preserving the order of the elements of l1 and l2.
(define list-append
  (lambda (l1 l2)
    (writeln (list 'list-append l1 l2))
    (cond
      [(null? l1)
       l2]
      [else
       (cons (car l1)
             (list-append (cdr l1) l2))])))

;;; (list-reverse l) -> list?
;;;   l : list?
;;; Returns l with the elements in the opposite order.
(define list-reverse-1
  (lambda (l)
    (writeln (list 'list-reverse-1 l))
    (match l
      ['() 
       null]
      [(cons x tail) 
       (list-append (list-reverse-1 tail) (list x))])))

(define list-reverse-2
  (lambda (l)
    (write (list 'list-reverse-1 l)) (newline)
    (letrec ([helper
              (lambda (l so-far)
                (write (list 'helper l so-far)) (newline)
                (match l
                  ['() 
                   so-far]
                  [(cons x tail) 
                   (helper tail (cons x so-far))]))])
      (helper l null))))
```

a. Determine how many times `list-append` is called when reversing
lists of lengths five, six, and seven using `list-reverse-1`.

b. Determine how many times the helper is called when reversing lists of
of lengths fix, six, seven using `list-reverse-2`.

c. Predict approximately how many times `list-append` will be called
when reversing a list of length eight using `list-reverse-1`.

d. Predict approximately how many times the helper will be called when
reversing a list of length eight using `list-reverse-2`.

