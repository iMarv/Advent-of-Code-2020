#lang racket

(require threading "util.rkt")

(define (split-pass p)
    (match-let ([(list amount char pass) (string-split p)])
        (append
            (string-split amount "-")
            (list (substring char 0 1))
            (list pass))))

(define (remove-chars c l)
    (filter (lambda (char) (char=? c char)) l))

(define (clean-pass p)
    (match-let ([(list min max char pass) p])
        (list min max char
            (~> pass
                string->list
                (remove-chars (string->char char) _)
                list->string))))

(define (is-valid-pass1? p)
    (match-let ([(list min max char pass) p])
        (is-between?
            (string->number min)
            (string->number max)
            (string-length pass))))

(define (is-valid-pass2? p)
    (match-let ([(list min max char pass) p])
        (xor
            (is-char-at? (string->number min) (string->char char) pass)
            (is-char-at? (string->number max) (string->char char) pass))))

(define (day2-1 passwords)
    (~> passwords
        (map split-pass _)
        (map clean-pass _)
        (filter is-valid-pass1? _)
        (length _)))

(define (day2-2 passwords)
    (~> passwords
        (map split-pass _)
        (filter is-valid-pass2? _)
        (length _)))

(provide day2-1 day2-2 split-pass clean-pass)
