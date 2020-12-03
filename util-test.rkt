#lang racket

(require rackunit "util.rkt")

(define util-tests
    (test-suite "util"
        (test-suite "get-strchar-at"
            (test-equal? "return char at given pos"
                (get-strchar-at 1 "testo") "e"))
        (test-suite "get-strchar-at-wrap"
            (test-equal? "return char wrapping around"
                (get-strchar-at-wrap 6 "testo") "e"))
        (test-suite "list-ref-wrap"
            (test-equal? "return element wrapping around"
                (list-ref-wrap '(1 2 3) 3) 1))))

(provide util-tests)
