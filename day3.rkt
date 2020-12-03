#lang racket

(require "util.rkt")

(define (day3-1 rows)
    (traverse-forest 0 0 3 1 0 rows))

(define (day3-2 rows)
    (multiply-list (list
        (traverse-forest 0 0 1 1 0 rows)
        (traverse-forest 0 0 3 1 0 rows)
        (traverse-forest 0 0 5 1 0 rows)
        (traverse-forest 0 0 7 1 0 rows)
        (traverse-forest 0 0 1 2 0 rows)
    )))

(define tree #\#)

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

(provide day3-1 day3-2)
