#lang racket

(require threading)

(define (day1-1 coins)
    (~> coins
        (get-pair 2020 _)
        multiply-list))

(define (day1-2 coins)
    (~>> coins
        get-triplet
        multiply-list))

(define (get-triplet coins)
    (let([f (first coins)])
        (let ([pair (get-pair (- 2020 f) (list-tail coins 1))])
          (if (> (length pair) 0)
            (append (list f) pair)
            (if (> (length coins) 2)
                (get-triplet (list-tail coins 1))
                '()
            ))
        )))

(define (get-pair target coins)
    (if (> (length coins) 0)
        (check-to-target target (first coins) (list-tail coins 1))
        '()))

(define (check-to-target target el trailing)
    (let ([matches (find-match target el trailing)])
        (if (> (length matches) 0)
            (list el (first matches))
            (if (> (length trailing) 0)
                (check-to-target target (first trailing) (list-tail trailing 1))
                '()))))

(define (find-match target el trailing)
    (let ([t (- target el)])
        (filter
            (lambda (num) (= num t))
            trailing)))

(define (multiply-list p)
    (foldl * 1 p))

(provide day1-1 day1-2 find-match get-pair get-triplet)
