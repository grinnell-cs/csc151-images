---
title: Recursion Over Lists
---

As a first example of recursion, we designed a function that computes the sum of the elements of an input list.

<pre class="scamper source">
(define sum
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (car numbers) (sum (cdr numbers))))))

(sum (list 91 85 96 82 89))
(sum (list -17 17 12 -4))
(sum (list 9.3))
(sum null)
</pre>

This program embodies the following decomposition of the `sum` problem:

> `numbers` is either an empty list or a non-empty list.
> +   The sum of an empty list is `0`.
> +   The sum of a non-empty list is the head of the list added to the sum of the tail.

And we derive this recursive decomposition from our recursive definition of a list:

> A list is either:
> +   Empty or
> +   Non-empty with a head element and a sublist, its tail.

In this sense, the recursive decomposition serves as a _basic skeleton_ for how to design recursive functions over lists!
In this reading, we'll the practical considerations of applying this skeleton to decompose problems.

# A Second Example: List Length

Next, let's take a look at another list problem---computing the length of a list---and see how we can systematically decompose the problem using our skeleton.

## Case Analysis

Because our recursive definition of list is in terms of case, we expect that our decomposition of the problem should follow these cases.
Thus, to compute the length of the list, we must consider what the length of a list is when:

+   The list is empty and
+   The list is non-empty.

We'll call the empty case the _base case_ of our recursive decomposition because we expect this is where execution of our eventual recursive function will "bottom out" or end.
We'll call non-empty case the _recursive case_ of our recursive decomposition as it contains the recursive occurrence of the structure we're performing recursion over, a sublist.

Importantly, we can solve these sub-problems _independently_, _i.e._, we don't need to think about the non-empty case when solving the empty case or vice versa.
Because the base case is over a concrete list, namely `null`, it is usually easier to solve, so we'll start there.

>   What is the length of an empty list?

Don't overthink this case!
You may feel like that the question is some sort of trick, however, its simplicity comes from the fact that an empty list is very simple.
The length of an empty list is `0`---that's it!
This gives us the first part of our recursive decomposition:

>   The length of the list is defined as follows:
>   + If the list is empty, then its length is 0.
>   + If the list is non-empty, ... .

## The Recursive Case and the Recursive Assumption

Now, let's tackle the non-empty case.
Whereas the base case is simple because it is a concrete, simple list, the recursive case is seemingly more complex because it concerns an arbitrary list!
To wrangle this complexity, we force ourselves in our recursive decomposition to utilize only what the recursive definition of a list tells us exists:

>   + A non-empty list is composed of a head element and a sublist, its tail.

This non-empty list may have 20 elements, five elements, or just one element; we don't care what the precise number is!
We only care about the fact that it has an element on the front, the `head`, and the remainder of its elements, its `tail`.
Pictorally, we can view the situation as follows:

~~~
[ head ][ --------tail-------- ]
~~~

Our goal now is to _express the length of the list in terms of its `head` and `tail`_.
This gives us two sub-goals to consider:

+   What is length of the `tail`?
+   How does the `head` contribute to the overall length?

Let's tackle each of these questions in turn.
First, what is the length of the `tail`?
This is immediately problematic to compute directly because the only thing that we know about `tail` is that it is a list---we don't know whether it is empty or non-empty.
However, we recognize that computing the length of the `tail` is precisely the problem we are trying to solve in the first place, but for a smaller part of the overall list.
Consequently, for the purposes of our decomposition, we make the following assumption:

> We know how to compute the length of the `tail` of the list.

This assumption---we can solve our problem for a smaller list---is called our _recursive assumption_.
It is the backbone of our recursive design!
Whenever we decompose a problem recursively over lists, we assume that we can solve our problem for the tail of the list in question.

Now, we tackle the second question: how does the `head` contribute to the overall length?
Again, this question is easy to overthink, so resist the temptation to do so!
The `head` contributes `1` unit to the overall length!

Finally, once we solve these two sub-goals, our final task is _combining_ these two answers into an answer for the overall list.
In other words:

> Provided that we know the length of the `tail` and we know how `head` contributes to the overall length, how can we express the length of the overall list?

Pictorally, we have:

~~~
[ head ][ --------tail-------- ]
    1  ???   (length tail)
~~~

In other words, how do we combine `1` and the length of the `tail` to obtain the overall length of the list?
In this case, we do so with addition!

~~~
[ head ][ --------tail-------- ]
    1   +   (length tail)
~~~

This gives us a final recursive decomposition for the length of a list:

>   The length of the list is defined as follows:
>   + If the list is empty, then its length is 0.
>   + If the list is non-empty, then its length is one plus the length of the tail of the list.

## Translating the Recursive Decomposition Into Code

With our complete decomposition in-hand, we can now translate our `length` function into code.
We spent much of our discussion explicating all the little bits of reasoning that go into designing a recursive decomposition to a problem.
This is because, once we have the decomposition in-hand, translating it into code is, more or less, a mechanical process!

With the [pattern matching]({{ "\readings\pattern-matching.html" | relative_url }}) facilities of Scamper, we can express the decomposition as follows:

+   The case analysis becomes a `match` on the input list.
+   Each case's solution is translated into an expression that computes that solution.
+   In the recursive case, our recursive assumption becomes a _recursive call_ to the function we are writing!

Just like with `sum`, observe how the definition of `length` mirrors the decomposition we designed:

<pre class="scamper source">
(import test)
(define list-length
  (lambda (l)
    (match l
      [null 0]
      [(cons _ tail) (+ 1 (list-length tail))])))

(test-case "empty list length"
  equal? 0
  (lambda ()
    (list-length null)))

(test-case "non-empty list length"
  equal? 15
  (lambda ()
    (list-length (make-list 15 "q" ))))
</pre>

## Low-level Mechanics Versus High-level Design

Our function seems work with the limited testing we have done.
However, it is instructive to trace its execution so that we can appreciate how our design mechanical executes in Scamper.
Let's trace expression of the following expression, `(list-length (list "c" "a" "t"))`.
We'll also take the shortcuts of evaluating a call to `list-length` directly to the `match` branch that is selected as well as carrying out the eventual multi-step addition in a single step.

~~~racket
    (list-length (list "c" "a" "t"))
--> (+ 1 (list-length (list "a" "t")))
--> (+ 1 (+ 1 (list-length (list "t"))))
--> (+ 1 (+ 1 (+ 1 (list-length null))))
--> (+ 1 (+ 1 (+ 1 0)))
--> 3
~~~

We can physically how the base case "bottoms out" our recursive function calls, _i.e._, it ends the chain of calls.
If we never reached the base case, we would have never stopped!

In this sense, our _low-level mechanics_—substitutive evaluation of code—allows us to _check_ that our implementation is correct.
However, in designing our recursive decomposition, we employed _high-level design tactics_—the recursive skeleton for lists—to systematize the process.
Consequently, both tools, low-level mechanics and high-level design tactics, are necessary components to succeed at recursive program design.
If you are lacking in tactics, you will not be able to design recursive functions quickly and effectively.
If you are lacking in mechanics, you will not be able to debug your implementations.
Make sure that you practice and hone both skills in the coming weeks!

## Summary: How to Apply the Recursive Skeleton

When recursively decomposing a problem involving lists, we employ the recursive definition of lists as a skeleton:

+   To solve the problem for an arbitrary list, we identify a solution to the problem when:
    -   The list is empty, the base case.
    -   The list is non-empty, the recursive case.
        In this case, we know that the list has a head and a tail.

Importantly, in the recursive case, we express the solution in terms of the following sub-goals:

+   How do I solve the problem for the tail of the list?
    To do so we invoke our recursive assumption and simply assume that we can solve the problem for the tail recursively.
+   How do I integrate the head of the list into the solution to the problem?

Finally, we then combine these two solutions into a solution for the overall list.

# A Third Example: List Append

Now that we have seen how to recursively decompose problems in terms of our recursive skeleton, let's try another example.
We'll write a function that _appends two lists together_.
The prelude provides this function as `append`:

<pre class="scamper source">
(append (list 1 2) (list 3 4 5))
</pre>

We'll write an version of this function, `list-append`, using recursion.
`(list-append l1 l2)` takes two lists and returns a single list that is the result of appending `l1` onto the front of `l2`.

To do this, we must come up with a recursive decomposition of the problem and then translate it into a recursive function.
An immediate concern here is that `list-append` takes _two_ lists as input.
Which one do we perform recursion over?

It is not immediately obvious which list to choose, so we would simply have to try one list versus the others.
Ultimately, because of how we decompose a list (as a head _followed_ by its tail), we will find success by choosing the first list.
So for the sake of clear exposition, let's make that choice.
In our self-checks for this reading, you will explore what happens when you choose the second list instead.

Now that we have identified the first list `l1` as the subject of our recursion, we will now solve the list append problem in the case where `l1` is empty and `l1` is non-empty.
In the base case, we are left with the question:

> In the case where `l1` is empty, how do we append it onto the front of list `l2`?

This is a little bit of a brain teaser.
What does it mean to append an empty list onto the front of another list?
Because the empty list is just that---empty---we expect not to add any elements onto the front of `l2`!
Thus, the result in this case is just `l2`!

> In the case where `l1` is empty, appending the empty list onto `l2` results in `l2` itself.

Now we tackle the recursive case:

> In the case where `l1` is non-empty with a head and a tail, how do we append it onto the front of `l2`?

Let's visualize this situation:

~~~
        l1                         l2
[head][ ----tail---- ]   [ ------------------ ]
~~~

In this case we know `l1` is composed of a head element and a sublist, its tail.
In contrast, we don't know _anything_ about `l2`.
It could be empty or non-empty; we don't care!

We first invoke our recursive assumption to solve the list append problem with `tail`.
We know from this assumption that we can recursively append `tail` onto the front of `l2`.
This leads to the following updated diagram:

~~~
[head]   [ ----tail----------------l2---------]
                  (append tail l2)
~~~

Next, how do we integrate the `head` into this result?
`head` is a single element that should go onto the front of the list resulting from appending `tail` onto `l2`.
We simply attach the `head` onto the front of this list and we're done!

~~~
[head-------tail-----------------l2--------]
~~~

Putting together these two cases yields our recursive decomposition:

> To append list `l1` onto the front of `l2`:
> +   When `l1` is empty, we simply produce `l2`.
> +   When `l1` is non-empty with a `head` and `tail`, we attach `head` onto the front of the list resulting from recursively appending `tail` onto `l2`.

Translating this decomposition into code, we use `cons` to attach the `head` to the front of the desired list:

<pre class="scamper source">
(import test)

(define list-append
  (lambda (l1 l2)
    (match l1
      [null l2]
      [(cons head tail) (cons head (list-append tail l2))])))

(test-case "append empty"
  equal? (list 1 2 3)
  (lambda ()
    (list-append null (list 1 2 3))))

(test-case "append empty"
  equal? (list 1 2 3 4 5)
  (lambda ()
    (list-append (list 1 2) (list 3 4 5))))
</pre>

# Self-check

## Problem: The Other Direction (‡)

We designed `(list-append l1)` recursively on the first argument `l1`.
What happens instead if we choose the second argument `l2` instead?
To explore why this approach will not work, try to fill out the recursive decomposition for this situation:

> To append a list `l1` onto the front of `l2`:
> +   If `l2` is empty, then...
> +   If `l2` is non-empty with a `head` and `tail`, then...

You should be able to successful fill out the base case of the recursive decomposition.
However, you should find that you can't come up with an easy solution for the recursion case!
In particular, for the recursive case of this decomposition explain in a sentence or two:

{:type="a"}
1.  What is the recursive assumption that we get to make in solving the recursive case?
2.  What about the nature of `cons` and your recursive assumption make it so that you can't simply `cons` the `head` onto the result of the recursive assumption?