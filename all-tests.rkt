#lang racket

(require rackunit/text-ui racket/cmdline "util-test.rkt"
    "day1-test.rkt" "day2-test.rkt" "day3-test.rkt"
    "day4-test.rkt")

(command-line
    #:args (day)
    (match day
        ["util" (run-tests util-tests)]
        ["day1" (run-tests day1-tests)]
        ["day2" (run-tests day2-tests)]
        ["day3" (run-tests day3-tests)]
        ["day4" (run-tests day4-tests)]
        ["all"
            (run-tests util-tests)
            (run-tests day1-tests)
            (run-tests day2-tests)
            (run-tests day3-tests)
            (run-tests day4-tests)
        ]
        [_ (printf "No day matching '~s'~n" day)]))


