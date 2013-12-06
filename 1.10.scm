#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(A x y) - Ackermann's function\n\n")

; Version from the book. Unfortunately, it is not correct.
;(define (A x y)
;  (cond ((= y 0) 0)
;        ((= x 0) (* 2 y))
;        ((= y 1) 2)
;        (else (A (- x 1)
;                 (A x (- y 1))))))

(define (A m n)
  (cond ((= m 0) (+ n 1))
        ((> m 0)
         (if (= n 0)
           (A (- m 1) 1)
           (A (- m 1) (A m (- n 1)))))))
