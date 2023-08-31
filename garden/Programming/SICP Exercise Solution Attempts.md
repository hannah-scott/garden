## Purpose

This is a longpost of annotated solutions to problems in [Structure and Interpretation of Computer Programs](https://mitp-content-server.mit.edu/books/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book.html). I'll add to it as I progress, and hopefully finish the whole book at some point.

Obviously, spoilers for SICP exercises.

Links to all exercises are [here](https://mitp-content-server.mit.edu/books/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-37.html#%_chap_Temp_850).

## 1.

### Exercise 1.1

```plain
10                                  =   10
(+ 5 3 4)                           =   12
(- 9 1)                             =   8
(/ 6 2)                             =   3
(+ (* 2 4) (- 4 6))                 =   6
(define a 3)                        =>  Value: a
(define b (+ a 1))                  =>  Value: b
(+ a b (* a b))                     =>  (+ 3 4 (* 3 4)) 
                                    =>  (+ 3 4 12)
                                    =   16
(= a b)                             =   #f
(if (and (> b a) (< b (* a b)))      
    b
    a)                              =   4
(cond ((= a 4) 6)                    
      ((= b 4) (+ 6 7 a))
      (else 25))                    =   16
(+ 2 (if (> b a) b a))              =   6
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))                         =>  (* (cond ((> 3 4) 3)
                                                 ((< 3 4) 4)
                                                 (else -1))
                                            (+ 3 1))
                                    =>   (* 4 4)
                                    =    16
```

### Exercise 1.2

```plain
(/ (+ 5 4 (- 2
             (- 3 
                (+ 6 
                   (/ 4 3))))
   (* 3 
      (- 6 2) 
      (- 2 7)))
```

### Exercise 1.3

Define a procedure that takes three arguments and returns the sum of the squares of the two larger numbers.

```plain
(define (sum-of-squares a b)
        (+ (* a a) (* b b)))
        
(define (solution a b c)
        (cond ((and (< a b) (< a c)) (sum-of-squares b c))
              ((and (< b a) (< b c)) (sum-of-squares a c))
              (else (sum-of-squares a b))))
```

### Exercise 1.4

Describe

```plain
(define (a-plus-abs-b a b)
				((if (> b 0) + -) a b))
```

When b is less than 0, this will return a - b. Otherwise, it will return a + b. This is just a + |b|.

### Exercise 1.5

In applicative order we evaluate the arguments of functions **before** the function is expanded. So attempting to evaluate this expression, we would have

```plain
(test 0 (p)) => (test 0 (p))
             => (test 0 (p))
             => ...
```

The expression never changes when evaluating the arguments. The process would continuously evaluate `(p) => (p)` and never terminate.

But in normal order evaluation the function is expanded first. Therefore we would have

```plain
(test 0 (p)) 
=>
(if (= 0 0)
    0
    (p))
```

Since the condition is true, we will never return `(p)` - so there is no need to evaluate it. This would simply return 0.

### Exercise 1.6

Eva is mistaken.

In applicative order evaluation, all arguments are evaluated before a function itself is expanded. From the structure of Alyssa's code, we see that the alternative to `new-if` (`sqrt-iter`) itself contains a call to `new-if`. Attempting to use this code will result in a never-ending nest of `new-if`s.

Why doesn't this happen with regular `if` expressions? My understanding is that `if` is a special form where

1. The condition is evaluated first
2. And based on this, *only* the consequent or alternative are evaluated

For well-formed recursion where the condition will eventually be true, this allows recursive calls to `if` where `if` itself is in the alternative.