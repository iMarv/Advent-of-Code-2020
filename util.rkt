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

(define multiply-list (compose
    (curry foldl * 1)))

(define (get-strchar-at pos str)
    (substring str pos (+ pos 1)))

(define (get-strchar-at-wrap pos str)
    (get-strchar-at (modulo pos (string-length str)) str))

(define (is-char-at? pos char str)
    (~> str
        (get-strchar-at pos _)
        (string->char _)
        (char=? _ char)))

(define (is-char-at-wrap? pos char str)
    (is-char-at? (modulo pos (string-length str)) char str))

(define text-matrix-height length)

(define (text-matrix-width m)
    (string-length (first m)))

(define (list-ref-wrap lst pos)
    (list-ref lst (modulo pos (length lst))))

(provide pop-first drop-first
    string->char is-between?
    is-char-at? multiply-list
    text-matrix-height text-matrix-width
    get-strchar-at get-strchar-at-wrap
    list-ref-wrap is-char-at-wrap?)
