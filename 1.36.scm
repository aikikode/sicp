#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(fixed-point f first-guess) - find fixed-pointe of function f\n\n")

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b) 2))

(display "x^x = 1000\nWithout average: x = ")
(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
(display "\nWith average: x = ")
(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))
(newline)
