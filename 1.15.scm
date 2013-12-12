#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; The sine of an angle (specified in radians) can be computed by making use of
; the approximation sin x x if x is sufficiently small, and the trigonometric
; identity
; sin(x) = 3sin(x/3) - 4(sin(x/3))^3

(display "Features:\n(sine angle) - compute sin of angle in radians\n\n")

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))
