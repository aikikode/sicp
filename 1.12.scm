#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; The following pattern of numbers is called Pascal's triangle.
; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1
; The numbers at the edge of the triangle are all 1, and each number inside the
; triangle is the sum of the two numbers above it. 35 Write a procedure that
; computes elements of Pascal's triangle by means of a recursive process.

(display "Features:\n(get-elem row col) - get the elem of Pascal triangle (numeration if from 1)\n\n")

(define (get-elem row col)
 (cond ((> col row) 0)
       ((= col 1) 1)
       (else (+ (get-elem (- row 1) (- col 1)) (get-elem (- row 1) col)))))
