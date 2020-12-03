#lang racket

(require "util.rkt")

(define tree #\#)

(define (traverse stepx stepy rows)
    (traverse-forest 0 0 stepx stepy 0 rows))

(define (traverse-forest posx posy stepx stepy trees rows)
    (let ([curr-tree (if-tree++ posx posy rows trees)])
        (if (< posy (- (length rows) 1))
            (traverse-forest
                (+ posx stepx)
                (+ posy stepy)
                stepx
                stepy
                curr-tree
                rows)
            curr-tree)))

(define (if-tree++ posx posy rows trees)
    (if (is-tree? posx posy rows)
        (+ 1 trees)
        trees))

(define (is-tree? posx posy rows)
    (is-char-at-wrap? posx tree
        (list-ref rows posy)))

(define day3-1 (curry traverse 3 1))

(define slopes (list
    '(1 1)
    '(3 1)
    '(5 1)
    '(7 1)
    '(1 2)))

(define (day3-2 rows)
    (multiply-list (for/list ([step slopes])
        (traverse (first step) (second step) rows))))

(provide day3-1 day3-2)
