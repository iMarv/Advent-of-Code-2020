#lang racket

(require threading)

(define (pop-first l)
    (cons (first l) (drop-first l)))

(define (drop-first l)
    (list-tail l 1))

(define (string->char s)
    (~> s
        string->list
        first))

(define (is-between? min max num)
    (and (>= num min) (<= num max)))

(define (is-char-at? pos char str)
    (~> str
        (substring _ (- pos 1) pos)
        (string->char _)
        (char=? _ char)))

(provide pop-first drop-first string->char is-between? is-char-at?)
