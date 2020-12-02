#lang racket

(require threading)

(define (pop-first l)
    (cons (first l) (drop-first l)))

(define (drop-first l)
    (list-tail l 1))

(define (string-tochar s)
    (~> s
        string->list
        first))

(define (is-between? min max num)
    (and (>= num min) (<= num max)))

(provide pop-first drop-first string-tochar is-between?)
