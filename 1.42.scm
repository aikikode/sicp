#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(compose f g) - generate composition of functions f ang g: f(g(x)), e.g. ((compose square inc) 6)\n(repeated f n) - apply f function n times, e.g. ((repeated square 2) 5)\n\n")

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

;((repeated square 2) 5)
(define (repeated f n)
  (cond
    ((= n 1) f)
    (else (compose f (repeated f (- n 1))))))
