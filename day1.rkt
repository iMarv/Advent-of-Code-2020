#lang racket

(require threading)

(define (day1-1 expenses)
    (~> expenses
        (get-pair 2020 _)
        multiply-list))

(define (day1-2 expenses)
    (~>> expenses
        get-triplet
        multiply-list))

(define (get-triplet expenses)
    (let([first-expense (first expenses)])
        (match (get-pair (- 2020 first-expense) (list-tail expenses 1))
            [(list a b) (list first-expense a b)]
            [_ (if (> (length expenses) 2)
                (get-triplet (list-tail expenses 1))
                '()
            )])
        ))

(define (get-pair target expenses)
    (if (> (length expenses) 0)
        (check-to-target target (first expenses) (list-tail expenses 1))
        '()))

(define (check-to-target target el trailing)
    (match (find-match target el trailing)
        [(list m) (list el m)]
        [_ (if (> (length trailing) 0)
                (check-to-target target (first trailing) (list-tail trailing 1))
                '())]))

(define (find-match target el trailing)
    (let ([t (- target el)])
        (filter
            (lambda (num) (= num t))
            trailing)))

(define (multiply-list p)
    (foldl * 1 p))

(provide day1-1 day1-2 find-match get-pair get-triplet)
