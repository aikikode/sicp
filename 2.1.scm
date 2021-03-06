#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; Exercise 2.1. Define a better version of make-rat that handles both positive
; and negative arguments.  Make-rat should normalize the sign so that if the
; rational number is positive, both the numerator and denominator are positive,
; and if the rational number is negative, only the numerator is negative.

(display "Features:\n(make-rat n d) - create rational number")
(newline)
(display "(add-rat x y)\n")
(display "(mul-rat x y)\n")
(display "(sub-rat x y)\n")
(display "(div-rat x y)\n")
(display "(equal-rat? x y)\n")
(display "(print-rat x)\n")

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

;(define (make-rat n d) (cons n d)) - improve it
(define (make-rat n d)
  (let ((g (* (gcd n d) (if (< (* n d) 0) (- 1) 1 ))))
    (cons (/ n g) (/ d g))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))
