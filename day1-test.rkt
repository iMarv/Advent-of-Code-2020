#lang racket

(require rackunit "day1.rkt")

(define day1-tests
    (test-suite
        "Day 1"
        (test-suite
            "Puzzle 1"
            (let ([coins '(1721 979 366 299 675 1456)])
                (test-equal? "find correct number"
                    (day1-1 coins) 514579)))))

(provide day1-tests)
