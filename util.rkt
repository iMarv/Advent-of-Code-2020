#lang racket

(require threading)

(define (pop-first l)
    (cons (first l) (drop-first l)))

(define drop-first (compose
    (curryr list-tail 1)))

(define string->char
    (compose first string->list))

(define (is-between? min max num)
    (and (>= num min) (<= num max)))

(define (is-char-at? pos char str)
    (~> str
        ; Pos index starts at 1 rather than 0
        (substring _ (- pos 1) pos)
        (string->char _)
        (char=? _ char)))

(provide pop-first drop-first string->char is-between? is-char-at?)
