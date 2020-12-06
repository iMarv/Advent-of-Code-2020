#lang racket

(require rackunit "util.rkt")

(define util-tests
    (test-suite "util"
        (test-suite "join-groups"
            (test-equal? "correctly join groups"
                (join-groups '("a b" "c" "" "d" "e f") "" (list)) '("a b c" "d e f")))
        (test-suite "string-drop-first"
            (test-equal? "returns string without first char"
                (string-drop-first "hallo") "allo"))
        (test-suite "some?"
            (test-equal? "false if no matches"
                (some? (curry = 1) '(3 2 3)) #f)
            (test-equal? "true if one or more matches"
                (some? (curry = 1) '(1 2 1)) #t)
            (test-equal? "true if one matches"
                (some? (curry = 1) '(1 2 3)) #t))
        (test-suite "substring-from-tail"
            (test-equal? "return amount of char from tail"
                (substring-from-tail "hallohi" 2) "hi"))
        (test-suite "every?"
            (test-equal? "false if any procs false"
                (every? (curry = 1) '(1 2 1)) #f)
            (test-equal? "true if all procs true"
                (every? (curry = 1) '(1 1 1)) #t))
        (test-suite "get-strchar-at"
            (test-equal? "return char at given pos"
                (get-strchar-at 1 "testo") "e"))))

(provide util-tests)
