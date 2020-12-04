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

(define (is-char-at? pos char str)
    (~> str
        (get-strchar-at pos _)
        (string->char _)
        (char=? _ char)))

(define (is-char-at-wrap? pos char str)
    (is-char-at? (modulo pos (string-length str)) char str))

(define (every? proc lst)
    (= (length lst) (count proc lst)))

(define (some? proc lst)
    (> (count proc lst) 0))

(define (substring-from-tail str amount)
    (substring str (- (string-length str) amount)))

(provide pop-first drop-first
    string->char is-between?
    is-char-at? multiply-list
    get-strchar-at is-char-at-wrap?
    every? substring-from-tail some?)
