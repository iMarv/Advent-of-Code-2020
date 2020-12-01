#lang racket

(define (pop-first l)
    (cons (first l) (drop-first l)))

(define (drop-first l)
    (list-tail l 1))

(provide pop-first drop-first)
