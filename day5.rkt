#lang racket

(require threading "util.rkt")

(define (to-bin code)
    (~> code
        (map-chars (lambda (c) (match c
            [(or #\F #\L) #\0]
            [(or #\B #\R) #\1])) _)
        (string->number _ 2)))

(define (get-seat-id pass)
    (match-let ([(cons row col) (string-split-at pass 7)])
        (+  (* 8 (to-bin row))
            (to-bin col))))

(define (find-gap lst)
    (if (> (- (second lst) (first lst)) 1)
        (+ 1 (first lst))
        (find-gap (drop-first lst))))

(define (day5-1 lst)
    (~> lst
        (map get-seat-id _)
        (foldl (lambda (a b) (if (> a b) a b)) 0 _)))

(define (day5-2 lst)
    (~> lst
        (map get-seat-id _)
        (sort _ <)
        (find-gap _)))

(provide day5-1 day5-2 get-seat-id)
