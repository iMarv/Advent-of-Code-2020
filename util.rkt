#lang racket

(require threading)

(define (pop-first lst)
    (cons (first lst) (drop-first lst)))

(define (pop-left lst)
    (drop-right lst (/ (length lst) 2)))

(define (pop-right lst)
    (take-right lst (/ (length lst) 2)))

(define drop-first (compose
    (curryr list-tail 1)))

(define (string-drop-first str)
    (substring str 1))

(define (string-split-at str pos)
    (cons (substring str 0 pos) (substring str pos)))

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
        (char=? char _)))

(define (is-char-at-wrap? pos char str)
    (is-char-at? (modulo pos (string-length str)) char str))

; Could be more efficient by stopping as soon as it hits false
(define (every? proc lst)
    (= (length lst) (count proc lst)))

; Could be more efficient by stopping as soo nas it hits true
(define (some? proc lst)
    (> (count proc lst) 0))

(define (substring-from-tail str amount)
    (substring str (- (string-length str) amount)))

(define (map-chars proc str)
    (~> str
        string->list
        (map proc _)
        list->string))

(define (join-groups rem-lines curr-pass joined-pass)
    (if (not (empty? rem-lines))
        (match-let ([(cons next rem) (pop-first rem-lines)])
            (if (non-empty-string? next)
                (join-groups rem
                    (string-trim (string-join (list curr-pass next)))
                    joined-pass)
                (join-groups rem
                    next
                    (append joined-pass (list curr-pass)))))
        (append joined-pass (list curr-pass))))


(provide pop-first drop-first
    string->char is-between?
    is-char-at? multiply-list
    get-strchar-at is-char-at-wrap?
    every? substring-from-tail some?
    string-drop-first pop-left pop-right
    map-chars string-split-at join-groups)
