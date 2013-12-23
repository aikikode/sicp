#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "Features:\n(cont-frac n d k) - calculate value of k-term fraction in N1 / (D1 + N2 / (D3 + ...))\n\n")

(define (cont-frac n d k)
  (define (calc frac count)
    (if (= count 1)
     frac
     (let ((nk (n count))
           (dk (d count)))
       (calc (/ nk (+ dk frac)) (- count 1)))))
  (calc 0 k))

(display "Golden ratio using cont-frac = ")
; k = 13 - the smallest k such that golden ratio is accurate to 4 decimal
; places
(display (/ 1 (cont-frac (lambda (i) 1.0)
                         (lambda (i) 1.0)
                         13)))
(newline)
