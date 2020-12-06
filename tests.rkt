#lang racket

(require rackunit rackunit/text-ui racket/cmdline "util-test.rkt"
    "day1-test.rkt" "day2-test.rkt" "day3-test.rkt"
    "day4-test.rkt" "day5-test.rkt" "day6-test.rkt")

(command-line
    #:args (day)
    (match day
        ["util" (run-tests util-tests)]
        ["day1" (run-tests day1-tests)]
        ["day2" (run-tests day2-tests)]
        ["day3" (run-tests day3-tests)]
        ["day4" (run-tests day4-tests)]
        ["day5" (run-tests day5-tests)]
        ["day6" (run-tests day6-tests)]
        ["all"
            (run-tests (test-suite "all"
                util-tests
                day1-tests
                day2-tests
                day3-tests
                day4-tests
                day5-tests
                day6-tests
            ))
        ]
        [_ (printf "No day matching '~s'~n" day)]))


