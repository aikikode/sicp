#!/usr/bin/env guile
!#
; -*-scheme-*-
;
; Exercise 2.2. Consider the problem of representing line segments in a plane.
; Each segment is represented as a pair of points: a starting point and an
; ending point. Define a constructor make-segment and selectors start-segment
; and end-segment that define the representation of segments in terms of
; points. Furthermore, a point can be represented as a pair of numbers: the x
; coordinate and the y coordinate.  Accordingly, specify a constructor
; make-point and selectors x-point and y-point that define this representation.
; Finally, using your selectors and constructors, define a procedure
; midpoint-segment that takes a line segment as argument and returns its
; midpoint (the point whose coordinates are the average of the coordinates of
; the endpoints).

(display "Features:\n")
(display "(make-point x y)\n")
(display "(make-segment start-point end-point)\n")
(display "(midpoint-segment segment)\n")
(display "(print-point p)\n")
(newline)
(display "(make-rect segment-a segment-b)\n")
(display "(perimeter-rect rectangle)\n")
(display "(area-rect rectangle)\n\n")

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment segment)
  (define (avg x-start x-end) (/ (+ x-start x-end) 2))
  (make-point
    (avg (x-point (start-segment segment)) (x-point (end-segment segment)))
    (avg (y-point (start-segment segment)) (y-point (end-segment segment)))))

;-----------------------------------------------------------------------------
; Exercise 2.3. Implement a representation for rectangles in a plane. (Hint:
; You may want to make use of exercise 2.2.) In terms of your constructors and
; selectors, create procedures that compute the perimeter and the area of a
; given rectangle. Now implement a different representation for rectangles. Can
; you design your system with suitable abstraction barriers, so that the same
; perimeter and area procedures will work using either representation?
(define (make-rect segment-a segment-b) (cons segment-a segment-b))
(define (get-rect-segment-a rectangle) (car rectangle))
(define (get-rect-segment-b rectangle) (cdr rectangle))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (square x)
  (* x x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (* guess 0.0000001)))
(define (sqrt x)
  (sqrt-iter 1 x))

(define (get-segment-length segment)
 (define (square-delta point segment)
  (square (- (point (start-segment segment)) (point (end-segment segment)))))
 (sqrt (+ (square-delta x-point segment) (square-delta y-point segment))))

(define (get-rect-width rectangle)
 (get-segment-length (get-rect-segment-a rectangle)))
(define (get-rect-height rectangle)
 (get-segment-length (get-rect-segment-b rectangle)))

(define (perimeter-rect rectangle)
 (* 2 (+ (get-rect-width rectangle) (get-rect-height rectangle))))

(define (area-rect rectangle)
 (* (get-rect-width rectangle) (get-rect-height rectangle)))
