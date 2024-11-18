;; CSC-151-NN (SEMESTER)
;; Lab: Structs (structs.scm)
;; Authors: YOUR NAMES HERE
;; Date: THE DATE HERE
;; Acknowledgements:
;;   ACKNOWLEDGEMENTS HERE

(import lab)
(import test)

;; In the reading, you learned about data abstraction and precondition
;; verification. In particular, you saw how we design a custom data type, e.g.,
;; a name, and separate the implementation of that data type from how we use
;; it.
;;
;; In today's lab, we'll introduce one last Scheme construct, the struct, which
;; allows us to define our own data types in a concise, elegant manner!

;; -----------------------------------------------------------------------------
(problem "Problem 1: Introduction to Structs")

;; (Partner A drives!)
;;
;; Recall from the reading that we developed a data type to represent a name.
;; We defined a name as a collection of strings: 
;;
;; A prefix (optional)
;; A given name (required)
;; A middle name (optional)
;; A family name (optional)
;; A suffix (optional)
;;
;; Only the given name is required to create a name. We implemented this
;; data type as a list of strings, a vector of strings, and finally an
;; association list mapping strings to strings. To do so, we had to implement
;; a number of functions over our name data type:
;;
;; (name prefix given middle family suffix) -> name?
;; (name? value) -> boolean?
;; (name-prefix name) -> string?
;; (name-given name) -> string?
;; (name-middle name) -> string?
;; (name-family name) -> string?
;; (name-suffix name) -> string?
;;
;; It was laborious to implement these functions by hand regardless of the
;; implementation we chose. Ideally, we could specify what was contained inside
;; of our data type and Scheme would take care of the rest. Luckily, Scheme
;; has a construct that does this! A struct declaration defines a custom data
;; type that is composed of a number of named values, called fields. Here is
;; the struct declaration for our name:

(struct name (prefix given middle family suffix))

;; A struct declaration has the following syntax:
;;
;; (struct <identifier> (<identifier> ... <identifier>))
;;
;; The first identifier is the name of the data type we are constructing. The
;; remaining identifiers are the names of the fields of the data type. The
;; struct declaration automatically generates all of the functions that we
;; previous implemented by hand, yay!
;;
;; Let's first observe and appreciate this first point! Complete the
;; definition of an example name from the reading:
;;
;; Admiral Grace Murray Hopper
;; ↑       ↑     ↑      ↑
;; prefix  │     │      │
;;         given │      │
;;               middle │
;;                      family
;;
;; And the name has no suffix (so it is #f).

(description "Admiral Grace Hopper test cases")

(define admiral-hopper
  ;; TODO: fill me in with a call to the name function.
  0)

;; And now, write test cases validating that all of the remaining
;; name functions work for this example name:
;;
;; (name? value) -> boolean?
;; (name-prefix name) -> string?
;; (name-given name) -> string?
;; (name-middle name) -> string?
;; (name-family name) -> string?
;; (name-suffix name) -> string?

;; TODO: write your test-case definitions here, one per function!

;; -----------------------------------------------------------------------------
(problem "Problem 2: Printing Names")

;; (Partner B drives!)
;;
;; In the reading exercise for today, you were tasked to write a function
;; (name->string name) that returns the string representation of a name.
;; Because your implementation of this function only depended on the
;; interface of the name data type and not its implementation, it should
;; "just work" for our new struct-based name!
;;
;; Additionally, give a few additional examples of names and test-cases for
;; name->string. Include different names that include some fields of the
;; struct but not others. Recall that our data type says that any such
;; fields that are not present should be marked #f.

(define name->string
  (lambda (name)
    ; TODO: fill me in!
    ""))

(test-case "admiral-hopper"
  equal? "Admiral Grace Murray Hopper"
  (lambda ()
    (name->string admiral-hopper)))

(description "name->string test cases")

; TODO: include at least 2 other test cases here.

;; -----------------------------------------------------------------------------
(problem "Problem 3: Pattern Matching with Structs")

;; (Partner A drives!)
;;
;; One benefit of using structs to define our data types is that we can use
;; pattern matching to get the components of the struct instead of using the
;; name-* functions (i.e., projection functions). For example, the following
;; code snippet uses a match to retrieve just the given name of the person:

(define mr-wick
  (name "Mr." "John" #f "Wick" #f))

(description "Fetching a name via pattern matching")

(match mr-wick
  [(name _ given _ _ _) given])

;; Note how the pattern for our name mimics the call to its constructor
;; function. We use underscores to ignore the fields we don't care about and
;; name the fields that we want with fresh identifiers. This match is
;; equivalent to the following let-binding:

(description "Fetching a name via a projection function")

(let ([given (name-given mr-wick)])
     given)

;; You can imagine that for one field, we can simply use the projection
;; functions provided by the struct declaration. But if we need to access
;; more of the fields, a pattern match leads to less to write code.
;;
;; With this in mind, try rewriting your name->string function from the
;; previous problem to use pattern matching instead of the accessor functions.

(define name->string-match
  (lambda (name)
    ; TODO: fill me in!
    ""))

(description "name->string-match test cases")

(test-case "admiral-hopper (match)"
  equal? "Admiral Grace Murray Hopper"
  (lambda ()
    (name->string-match admiral-hopper)))

; TODO: include your previous test cases but specialized to name->string-match.
;       they should all still work!

;; -----------------------------------------------------------------------------
(problem "Problem 4: Husking")

;; (Partner B drives!)
;;
;; In the reading, you learned about verifying preconditions of functions
;; explicitly so that we can produce good error messages when those
;; preconditions are not satisified. This leads to a particular programming
;; pattern where we decompose a function into a "husk" that verifies the
;; preconditions and a "kernel" that implements the actual function under
;; the assumption that the preconditions are satisfied.
;;
;; From the struct declaration above, we can see that it is likely that
;; none of our intended preconditions are being checked. Indeed, the following
;; call to the name function is valid:

(define bad-name
  (name "King" 0 "Bad" #t (list "Not good")))

;; And generates a name that breaks our invariants about what a name should
;; look like: each field should be a string or #f.
;;
;; To solve this, let's take the name function as our "kernel" and build a
;; "husk" function that validates the preconditions of the arguments before
;; calling the name function itself.
;;
;; Implement, document, and test this function, make-name, below:

; TODO: add documentation for this function here!
(define make-name
  ; TODO: implement me here!
  "")

; TODO: add test-cases for this function here!

;; -----------------------------------------------------------------------------
(problem "Problem 5: Time")

;; (Partner A drives!)
;;
;; Another example of an object amendable to representation as a struct is
;; a time. Create a structured type, time, that represents a time of the day
;; such as "7:35:45 PM" or "12:00:00 AM" where the three numbers represent the
;; hours, minutes, and seconds, respectively. With your partner, you should
;; choose what fields best capture a time!

;; TODO: fill in your implementation of time here!

;; -----------------------------------------------------------------------------
(problem "Problem 6: Temporal Husks")

;; (Partner B drives!)
;;
;; Implement a husk for your time struct as a function, make-time. Ensure that
;; make-time validates its arguments appropriately.

;; TODO: fill in your make-time implementation here! Make sure to include
;; documentation and test cases as well!

;; -----------------------------------------------------------------------------
(problem "Problem 7: Printing Time")

;; (Partner A drives!)
;;
;; Write a procedure, `(time->string atime)`, that takes a time as
;; a parameter and returns the time as a string of the form
;; HH:MM:SS with time represented in 24-hour format.

(define time->string
  (lambda (atime)
    ; TODO: fill me in!
    ""))

;; Also, write a procedure `(string->time str)`, that takes a string 
;; of the form `HH:MM:SS` as a parameter and returns an appropriate time
;; value.

(define string->time!
  (lambda (str)
    ; TODO: fill me in!
    0))

;; Finally, time->string and string->time should be inverses of each other.
;; In other words, calling one function with a value and passing that result
;; to the other function returns the original value!
;;
;; Use this fact to write a collection of test-cases for both of these
;; functions.

;; TODO: insert your test cases here!

;; -----------------------------------------------------------------------------
(problem "Problem 8: Comparing Time")

;; (Partner B drives!)
;;
;; Once we define a data type, we often want to define additional functions
;; that operates over that data type. For example, it is useful to be able
;; to compare two times to see which comes first.
;;
;; Write a function (time<? t1 t2) that returns #t if t1 represents a time
;; that comes before t2 and #f otherwise.

;; TODO: insert your implementation of time<? below. Make sure to include
;; documentation and test cases!

;; -----------------------------------------------------------------------------
(problem "Extra Problem: Chirps")

;; *Chirp* is a new Internet startup that lets you send notes to your
;; friends, which they call "chirps".  (Creativity is not their strong
;; suit.)  Create a structured type, `chirp`, with the following
;; fields.

;; * `id`, a string we'll use to identify the chirp.
;; * `author`, a string that identifies the author of the chirp.
;; * `contents`, a string that contains the body of the chirp.
;; * `tags`, a list of strings
;; * `date`, a date that represents when the chirp was chirped.
;; * `time`, a string that represents the time the chirp was chirped.
;;
;; Note, we have a time struct! You may also want to create an analogous
;; date struct to capture the date of a chirp.

;; TODO: write your definition of chirp here!

;; Create an appropriate husk, `make-chirp`, for this struct that validates
;; its fields. Feel free to represent the various fields of a chirp using
;; whatever types make the most sense to you!

;; TODO: write your definition of make-chirp here!

;; Finally, try writing a function, 'chirp<?' that takes two chirps and
;; determines which of the two chirps was chirped first. (Hey, this almost
;; sounds like a viable business!)

;; TODO: write your definition of chirp<? here!