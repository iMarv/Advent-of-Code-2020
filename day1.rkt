#lang racket

(require threading "util.rkt")

(define (day1-1 expenses)
    (~> expenses
        (get-pair 2020 _)
        multiply-list))

(define (day1-2 expenses)
    (~>> expenses
        get-triplet
        multiply-list))

(define (get-triplet expenses)
    (match-let ([(cons first-expense trail) (pop-first expenses)])
        (match (get-pair (- 2020 first-expense) trail)
            [(list a b) (list first-expense a b)]
            [_ (if (> (length trail) 1)
                (get-triplet trail)
                '())])))

(define (get-pair target expenses)
    (if (> (length expenses) 0)
        (check-to-target target (first expenses) (drop-first expenses))
        '()))

(define (check-to-target target el trailing)
    (match (find-match target el trailing)
        [(list m) (list el m)]
        [_ (if (> (length trailing) 0)
            (check-to-target target (first trailing) (drop-first trailing))
            '())]))

(define (find-match target el trailing)
    (let ([t (- target el)])
        (filter
            (lambda (num) (= num t))
            trailing)))

(provide day1-1 day1-2 find-match get-pair get-triplet)
