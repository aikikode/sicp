#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; One can perform integer multiplication by means of repeated addition. suppose
; we include, together with addition, operations double, which doubles an
; integer, and halve, which divides an (even) integer by 2. Using these, design
; a multiplication procedure that uses a logarithmic number of steps.

(display "Features:\n(* a b) - custom multiply a and b\n\n")

(define (* a b)
  (cc a b 0))

(define (cc a b n)
  (cond ((= b 0) n)
        ((even? b) (cc (double a) (half b) n))
        (else (cc a (- b 1) (+ n a)))))

(define (double a) (+ a a))

(define (half a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))
