#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:(fact x) - factorial
(pi/4 n) - calc pi/4 with precision n (the larger, the better)\n\n")

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (fact x)
  (define (next y) (+ y 1))
  (define (same y) y)
  (product same 1 next x))

(define (pi/4 n)
  (define (next a) (+ a 1))
  (define (f a)
    (if (= 0 (remainder a 2))
      (/ (+ a 2) (+ a 3))
      (/ (+ a 3) (+ a 2))))
  (product f 0 next n))
