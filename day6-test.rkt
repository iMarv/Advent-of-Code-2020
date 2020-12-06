#lang racket

(require rackunit "day6.rkt")

(define day6-test-input '(
    "abc"
    ""
    "a"
    "b"
    "c"
    ""
    "ab"
    "ac"
    ""
    "a"
    "a"
    "a"
    "a"
    ""
    "b"))

(define day6-tests
    (test-suite "Day6"
        (test-suite "fold-equal"
            (test-equal? "fold to same chars"
                (fold-equal "ab abc bc") "b"))
        (test-suite "Puzzle2"
            (test-equal? "get corect amount of answers"
                (day6-2 day6-test-input) 6))
        (test-suite "Puzzle1"
            (test-equal? "get corect amount of answers"
                (day6-1 day6-test-input) 11))))

(provide day6-tests)
