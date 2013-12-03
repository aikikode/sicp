#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(sqrt x) - square root of x with improved precision\n\n")

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (* guess 0.0000001)))

(define (sqrt x)
  (sqrt-iter 1 x))
