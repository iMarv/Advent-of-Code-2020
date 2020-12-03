#lang racket

(require rackunit "util.rkt")

(define util-tests
    (test-suite "util"
        (test-suite "get-strchar-at"
            (test-equal? "return char at given pos"
                (get-strchar-at 1 "testo") "e"))))

(provide util-tests)
