#lang racket

(require threading "util.rkt")

(define (fold-equal str)
    (let ([spl (string-split str)])
        (foldl (lambda (curr next) (~> curr
            string->list
            (map string _)
            (filter (lambda (s) (string-contains? next s)) _)
            (string-join _ "")
        )) (first spl) spl)))

(define (day6-1 lst)
    (~> lst
        (join-groups _ "" '())
        (map (curryr string-replace " " "") _)
        (map string->list _)
        (map remove-duplicates _)
        (map length _)
        (foldl + 0 _)))

(define (day6-2 lst)
    (~> lst
        (join-groups _ "" '())
        (map fold-equal _)
        (map string-length _)
        (foldl + 0 _) ))

(provide day6-1 day6-2 fold-equal)
