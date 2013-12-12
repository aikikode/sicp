#!/usr/bin/env guile
!#
; -*-scheme-*-

; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1)
; + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means
; of a recursive process. Write a procedure that computes f by means of an
; iterative process.

(display "Features:\nImplementation of the function: f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) otherwise\n(f-rec n) - recursive function\n(f-iter n) - iterative same function\n\n")

(define (f-rec n)
 (if (< n 3)
  n
  (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (define (cc a b c count)
    (if (< count 3)
      c
      (cc b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (if (< n 3)
    n
    (cc 0 1 2 n)))
