#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(double proc) - apply proc twice, e.g. (((double (double double)) inc) 5)\n\n")

(define (inc x)
  (+ x 1))

(define (double proc)
  (lambda (x)
    (proc (proc x))))
