#!/usr/bin/env guile
!#
; -*-scheme-*-

(display "(fast-prime-mil? n times) - perform 'times' checks whether number 'n' is prime using Miller-Rabin algo\n\n")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (= 1 (remainder (square (expmod base (/ exp 2) m)) m))
          (if (or (= 1 (expmod base (/ exp 2) m)) (= (- m 1) (expmod base (/ exp 2) m))) 1 0)
          (remainder (square (expmod base (/ exp 2) m)) m)))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                      m))))

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime-mil? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime-mil? n (- times 1)))
        (else #f)))
