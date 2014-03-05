#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; Exercise 2.5. Show that we can represent pairs of nonnegative integers using
; only numbers and arithmetic operations if we represent the pair a and b as
; the integer that is the product 2^a*3^b . Give the corresponding definitions
; of the procedures cons, car, and cdr.

(display "(print-rat x)\n")

; Additional functions
(define (pow b n)
  (cc b n 1))
(define (cc b n a)
  (cond ((= n 0) a)
        ((even? n) (cc (* b b) (/ n 2) a))
        (else (cc b (- n 1) (* a b)))))
(define (even? n)
  (= (remainder n 2) 0))

;-------------------------------------------------------------------------------
(define (cons a b)
  (* (pow 2 a) (pow 3 b)))

(define (next-iter x n a)
  (if (= (remainder x n) 0)
    (next-iter (/ x n) n (+ a 1))
    a))
(define (car x) (next-iter x 2 0))
(define (cdr x) (next-iter x 3 0))
