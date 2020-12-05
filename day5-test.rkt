#lang racket

(require rackunit "day5.rkt")

(define day5-tests
    (test-suite "Day5"
        (test-suite "find-middle"
            (test-equal? "RLR"
                (find-middle 8 "RLR") 5)
            (test-equal? "FBFBBFF"
                (find-middle 128 "FBFBBFF") 44))
        (test-suite "get-seat-id"
            (test-equal? "BBFFBBFRLL"
                (get-seat-id "BBFFBBFRLL") 820)
            (test-equal? "FFFBBBFRRR"
                (get-seat-id "FFFBBBFRRR") 119)
            (test-equal? "BFFFBBFRRR"
                (get-seat-id "BFFFBBFRRR") 567))
        (test-suite "Puzzle1"
            (test-equal? "get highest id"
                (day5-1 '("BFFFBBFRRR" "FFFBBBFRRR" "BBFFBBFRLL")) 820))))

(provide day5-tests)
