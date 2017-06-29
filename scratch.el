;; In the expressions, the parentheses tell the Lisp interpreter
;; to treat buffer-name and buffer-file-name as functions;
;; without the parentheses, the interpreter would attempt to
;; evaluate the symbols as variables. See Variables.

;; The single apostrophe, ', that I put in front of some of the
;; example lists in preceding sections is called a quote; when it
;; precedes a list, it tells Lisp to do nothing with the list,
;; (prevent symbol from being evaluated)
;; other than take it as it is written. But if there is no quote
;; preceding a list, the first item of the list is special: it is
;; a command for the computer to obey.
(This is a list)

(concat "The"
        (number-to-string (+ 2 fill-column))
        "red foxes")

;; a marker, which is a specific feature of Emacs Lisp. (In Emacs,
;; locations in a buffer are recorded as markers. When the mark is
;; set with the C-@ or C-<SPC> command, its position is kept as a
;; marker. The mark can be considered a number—the number of
;; characters the location is from the beginning of the buffer.)

(+ 2 'hello)

;; The ‘p’ stands for “predicate”. In the jargon used by the
;; early Lisp researchers, a predicate refers to a function to
;; determine whether some property is true or false. So the ‘p’
;; tells us that number-or-marker-p is the name of a function
;; that determines whether it is true or false that the argument
;; supplied is a number or a marker.

(message "This message appears in the echo area!")

(buffer-file-name)
(buffer-name)

;; False: nil and () True: all the other
;; In Emacs Lisp, the symbol nil has two meanings. First, it
;; means the empty list. Second, it means false and is the value
;; returned when a true-or-false-test tests false. nil can be
;; written as an empty list, (), or as nil. As far as the Lisp
;; interpreter is concerned, () and nil are the same. Humans,
;; however, tend to use nil for false and () for the empty list.


;; The word “buffer”, by the way, comes from the meaning of the
;; word as a cushion that deadens the force of a collision. In
;; early computers, a buffer cushioned the interaction between
;; files and the computer's central processing unit. The drums or
;; tapes that held a file and the central processing unit were
;; pieces of equipment that were very different from each other,
;; working at their own speeds, in spurts. The buffer made it
;; possible for them to work together effectively. Eventually,
;; the buffer grew from being an intermediary, a temporary
;; holding place, to being the place where work is done.
(current-buffer)
(switch-to-buffer (other-buffer))
(buffer-size)


;; The argument list is followed by the documentation string that
;; describes the function. This is what you see when you type C-h
;; f and the name of a function. Incidentally, when you write a
;; documentation string like this, you should make the first line
;; a complete sentence since some commands, such as apropos,
;; print only the first line of a multi-line documentation
;; string. Also, you should not indent the second line of a
;; documentation string, if you have one, because that looks odd
;; when you use C-h f (describe-function). The documentation
;; string is optional, but it is so useful, it should be included
;; in almost every function you write.

(defun m-7 (number)
  "string. Also, you should not indent the second line of a
      ;; doapfeojapj apewojfea
      jafpweojapjwfpajfappaewjfpa"
  (+ 7 number))

;; the expression, (interactive "p"), is a list of two elements.
;; The "p" tells Emacs to pass the prefix argument to the
;; function and use its value for the argument of the function.
(defun mi7 (number)
     (interactive "p")
     (message "jafpweifji %d" (* 7 number)))

;; More formally, a function with two or more arguments can have
;; information passed to each argument by adding parts to the
;; string that follows interactive. When you do this, the
;; information is passed to each argument in the same order it is
;; specified in the interactive list. In the string, each part is
;; separated from the next part by a ‘\n’, which is a newline.
;; For example, you can follow ‘p’ with a ‘\n’ and an ‘cZap to
;; char: ’. This causes Emacs to pass the value of the prefix
;; argument (if there is one) and the character.

;; "p\ncSomeCharacters: " p 和 c 是命令，SomeCharacters 只是字符
;; 命令间只需要\n分隔，如果连写只读取第一个

;; 如果 (interactive) 为空，则表示该函数可以通过 M-x 调用，但不接
;; 受interactive参数


;; let can create more than one variable at once. Also, let gives
;; each variable it creates an initial value, either a value
;; specified by you, or nil.

;; After let has created and bound the variables, it executes the
;; code in the body of the let, and returns the value of the last
;; expression in the body, as the value of the whole let
;; expression.

;; If the varlist is composed of two-element lists, as is often
;; the case, the template for the let expression looks like this:

;; (let ((variable value) ; / variable
;;       (variable value)
;;       ...)
;;   body...)

;; The `let*` function allows you to reference other variables
;; that have previously been defined.

(let* ((a 1) (b (+ a 1)))
  (message "%s" a))



;; know: The part of the buffer between point and mark is called
;; the region. Numerous commands work on the region, including
;; center-region, count-lines-region, kill-region, and
;; print-region.



;; Cons Cell car cdr true-list dotted-list circular-list
;; nil terminated list

;; car: first item in the list
;; cdr: the rest of the list

;; Name orgigination (deprecated):
;; cons: the word “construct”.
;; car: is an acronym from the phrase “Contents of the Address
;; part of the Register”
;; cdr: (pronounced “could-er”) is an acronym from the phrase
;; “Contents of the Decrement part of the Register”.

;; Lists in Lisp are not a primitive data type; they are built up
;; from cons cells (see Cons Cell Type). A cons cell is a data
;; object that represents an ordered pair. That is, it has two
;; slots, and each slot holds, or refers to, some Lisp object.
;; One slot is known as the car, and the other is known as the
;; cdr. (These names are traditional; see Cons Cell Type.) cdr is
;; pronounced “could-er”.

;; We say that “the car of this cons cell is” whatever object its
;; car slot currently holds, and likewise for the cdr.

;; A list is a series of cons cells chained together, so that
;; each cell refers to the next one. There is one cons cell for
;; each element of the list. By convention, the cars of the cons
;; cells hold the elements of the list, and the cdrs are used to
;; chain the list (this asymmetry between car and cdr is entirely
;; a matter of convention; at the level of cons cells, the car
;; and cdr slots have similar properties). Hence, the cdr slot of
;; each cons cell in a list refers to the following cons cell.

;; Also by convention, the cdr of the last cons cell in a list is
;; nil. We call such a nil-terminated structure a true list. In
;; Emacs Lisp, the symbol nil is both a symbol and a list with no
;; elements. For convenience, the symbol nil is considered to
;; have nil as its cdr (and also as its car).

;; Hence, the cdr of a true list is always a true list. The cdr
;; of a nonempty true list is a true list containing all the
;; elements except the first.

;; If the cdr of a list's last cons cell is some value other than
;; nil, we call the structure a dotted list, since its printed
;; representation would use dotted pair notation (see Dotted Pair
;; Notation). There is one other possibility: some cons cell's
;; cdr could point to one of the previous cons cells in the list.
;; We call that structure a circular list.

;; For some purposes, it does not matter whether a list is true,
;; circular or dotted. If a program doesn't look far enough down
;; the list to see the cdr of the final cons cell, it won't care.
;; However, some functions that operate on lists demand true
;; lists and signal errors if given a dotted list. Most functions
;; that try to find the end of a list enter infinite loops if
;; given a circular list.

;; Because most cons cells are used as part of lists, we refer to
;; any structure made out of cons cells as a list structure.


;; A ‘\\’ is used before the first square bracket of this
;; expression. This ‘\\’ tells the Lisp interpreter to substitute
;; whatever key is currently bound to the ‘[...]’. In the case of
;; universal-argument, that is usually C-u, but it might be
;; different.

(car '(pine fir oak maple))
(cdr '(pine fir oak maple))

;; progn is a special form that causes each of its arguments to
;; be evaluated in sequence and then returns the value of the
;; last one. The preceding expressions are evaluated only for the
;; side effects they perform. The values produced by them are
;; discarded. (todo: Even (point) be moved will be discarded?)

;; The value returned by evaluating a while is the value of the
;; true-or-false-test. An interesting consequence of this is that
;; a while loop that evaluates without error will return nil or
;; false

(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

(print-elements-of-list animals)


(defun triangle-recursively-bugged (number)
  "Return sum of numbers 1 through NUMBER inclusive.
     Uses recursion."
  (if (= number 1)
      1
    (+ number
       (triangle-recursively-bugged
        (1= number)))))

(triangle-recursively-bugged 4)
















