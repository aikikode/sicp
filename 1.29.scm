#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:
(integral f a b n) - calculate the integral of f in range from a to b using
Simpson's Rule. The larger n the more precise is the result

The following functions are predefined:
(define (square x) (* x x))
(define (cube x) (* x x x))\n\n")

(define (square x) (* x x))
(define (cube x) (* x x x))

; Iterative sum (compare with recursive sum in 1.3.1.csm)
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (integral f a b n)
  (define (summand y)
    (*
      (if (or (= y a) ( = y b))
        1
        (+ (* (remainder (/ (- y a) (/ (- b a) n)) 2) 2) 2))
      (f y)))
  (define (next x) (+ x (/ (- b a) n)))
  (* (sum summand a next b) (/ (- b a) (* 3 n))))
