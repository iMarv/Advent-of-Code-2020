#lang racket

(require rackunit/text-ui racket/cmdline "day1-test.rkt")

(command-line
    #:args (day)
    (match day
        ["day1" (run-tests day1-tests)]
        [_ (printf "No day matching '~s'~n" day)]))


