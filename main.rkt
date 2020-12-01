#lang racket

(require racket/cmdline "inputs.rkt" "day1.rkt")

(command-line
    #:args (day-script)
    (match day-script
        ["day1-1" (day1-1 day1-input)]
        ["day1-2" (day1-2 day1-input)]
        [_ (printf "No solution for ~s~n" day-script)]))
