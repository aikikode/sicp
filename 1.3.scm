#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(ssum a b c) - sum of the squares of the two larger numbers\n\n")

(define (ssum a b c)
  (+
    (* a a)
    (* b b)
    (* c c)
    (- (* (min a b c) (min a b c)))))
