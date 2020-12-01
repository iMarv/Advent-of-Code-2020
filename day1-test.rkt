#lang racket

(require rackunit "day1.rkt")

(define day1-tests
    (test-suite "Day 1"
        (test-suite "Helpers"
            (test-suite "find-match"
                (test-equal? "return empty list if no entry gets to target"
                    (find-match 2020 1721 '(121 342 289 41)) '())
                (test-equal? "return first match that gets to target"
                    (find-match 2020 1721 '(121 342 299 41)) '(299)))
            (test-suite "get-pair"
                (test-equal? "find first two numbers which add to target"
                    (get-pair 1041 '(366 299 675 1456)) '(366 675))
                (test-equal? "find first two numbers which add to target"
                    (get-pair 10 '(4 11 6)) '(4 6))
                (test-equal? "find first two numbers which add to target"
                    (get-pair 5 '(1 2 3 6)) '(2 3))
                (test-equal? "return empty list if none is found"
                    (get-pair 10 '(1 2 3 6)) '())
                )
            (test-suite "get-triplet"
                (test-equal? "find first three numbers which add up to 2020"
                    (get-triplet '(2010 4 11 6)) '(2010 4 6))))
        (test-suite
            "Puzzle 2"
            (let ([coins '(1721 979 366 299 675 1456)])
                (test-equal? "find correct number"
                    (day1-2 coins) 241861950)))
        (test-suite
            "Puzzle 1"
            (let ([coins '(1721 979 366 299 675 1456)])
                (test-equal? "find correct number"
                    (day1-1 coins) 514579)))))

(provide day1-tests)
