#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(fixed-point f first-guess) - find fixed-pointe of function f\n\n")

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(display "Golden ratio = ")
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
(display "\n")
