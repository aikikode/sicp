#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(crt x) - cube root of x\n\n")

(define (crt-iter guess x)
  (if (good-enough? guess x)
    guess
    (crt-iter (improve guess x) x)))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

; guess = (x/y^2 + 2y) / 3
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (* guess 0.0000001)))

(define (crt x)
  (crt-iter 1 x))
