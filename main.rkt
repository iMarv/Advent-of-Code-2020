#lang racket

(require racket/cmdline "inputs.rkt" "day1.rkt" "day2.rkt" "day3.rkt")

(command-line
    #:args (day-script)
    (match day-script
        ["day1-1" (day1-1 day1-input)]
        ["day1-2" (day1-2 day1-input)]
        ["day2-1" (day2-1 day2-input)]
        ["day2-2" (day2-2 day2-input)]
        ["day3-1" (day3-1 day3-input)]
        ["day3-2" (day3-2 day3-input)]
        [_ (printf "No solution for ~s~n" day-script)]))
