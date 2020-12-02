#lang racket

(require rackunit "day2.rkt")

(define day2-tests
    (test-suite "Day2"
        (test-suite "clean-pass"
            (test-equal? "remove unneeded chars from password"
                (clean-pass '("1" "3" "a" "abcde")) '("1" "3" "a" "a") ))
        (test-suite "split-pass"
            (test-equal? "Split password into list"
                (split-pass "1-3 a: abcde") '("1" "3" "a" "abcde")))
        (test-suite "Puzzle 1"
            (test-equal? "find correct amount"
                (day2-1 '(
                    "1-3 a: abcde"
                    "1-3 b: cdefg"
                    "2-9 c: ccccccccc"
                    )) 2))
    ))

(provide day2-tests)
