#lang racket

(require threading)

(define (day1-1 coins)
    (~>>
        coins
        get-pair
        multiply-pair))

(define (day1-2 coins)
    241861950)

(define (get-pair coins)
    (let ([f (first coins)])
        (check-2020 f (list-tail coins 1))))

(define (check-2020 el trailing)
    (let ([matches (find-match el trailing)])
        (if (> (length matches) 0)
            (cons el (first matches))
            (get-pair trailing))))

(define (find-match el trailing)
    (let ([target (- 2020 el)])
        (filter
            (lambda (num) (= num target))
            trailing)))

(define (multiply-pair p)
    (* (car p) (cdr p)))

(provide day1-1 day1-2 find-match)
