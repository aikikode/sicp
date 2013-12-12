#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; Design a procedure that evolves an iterative exponentiation process that uses
; successive squaring and uses a logarithmic number of steps

(display "Features:\n(fast-expt-iter b n) - compute b in power n\n\n")

(define (fast-expt-iter b n)
  (cc b n 1))

(define (cc b n a)
  (cond ((= n 0) a)
        ((even? n) (cc (* b b) (/ n 2) a))
        (else (cc b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))
