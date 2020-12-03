#lang racket

(require "util.rkt")

(define (day3-1 rows)
    (traverse-forest 0 0 3 1 0 rows))

(define tree #\#)

(define (traverse-forest posx posy stepx stepy trees rows)
    (if (< posy (- (length rows) 1))
        (traverse-forest
            (+ posx stepx)
            (+ posy stepy)
            stepx
            stepy
            (if-tree++ posx posy rows trees)
            rows)
        (if-tree++ posx posy rows trees)))

(define (if-tree++ posx posy rows trees)
    (if (is-tree? posx posy rows)
        (+ 1 trees)
        trees))

(define (is-tree? posx posy rows)
    (is-char-at-wrap? posx tree
        (list-ref rows posy)))

(provide day3-1)
