#lang racket

(require rackunit "day1.rkt")

(define day1-tests
    (test-suite
        "Day 1"
        (test-suite
            "Helpers"
            (test-equal? "find-match no match"
                (find-match 1721 '(121 342 289 41)) '())
            (test-equal? "find-match success"
                (find-match 1721 '(121 342 299 41)) '(299)))
        (test-suite
            "Puzzle 2"
            (let ([coins '(979 1721 366 299 675 1456)])
                (test-equal? "find correct number"
                    (day1-2 coins) 241861950)))
        (test-suite
            "Puzzle 1"
            (let ([coins '(979 1721 366 299 675 1456)])
                (test-equal? "find correct number"
                    (day1-1 coins) 514579)))))

(provide day1-tests)
