#lang racket

(require rackunit/text-ui racket/cmdline "util-test.rkt" "day1-test.rkt" "day2-test.rkt")

(command-line
    #:args (day)
    (match day
        ["util" (run-tests util-tests)]
        ["day1" (run-tests day1-tests)]
        ["day2" (run-tests day2-tests)]
        [_ (printf "No day matching '~s'~n" day)]))


