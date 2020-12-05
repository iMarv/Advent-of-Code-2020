#lang racket

(require threading "util.rkt")


(define (split-recur lst code)
    (if (= (length lst) 1)
        (first lst)
        (split-recur
            (match (get-strchar-at 0 code)
                [(or "F" "L") (pop-left lst)]
                [(or "B" "R") (pop-right lst)])
            (string-drop-first code))))

(define (find-middle max code)
    (split-recur (sequence->list (in-range max)) code))

(define (get-seat-id pass)
    (let (
        [row (find-middle 128 (substring pass 0 7))]
        [col (find-middle 8 (substring-from-tail pass 3))])
            (+ col (* row 8))))

(define (find-gap lst)
    (if (> (- (second lst) (first lst)) 1)
        (+ 1 (first lst))
        (find-gap (drop-first lst))))

(define (day5-1 lst)
    (~> lst
        (map get-seat-id _)
        (foldl (lambda (a b) (if (> a b) a b)) 0 _)))

(define (day5-2 lst)
    (~> lst
        (map get-seat-id _)
        (sort _ <)
        (find-gap _)))

(provide day5-1 day5-2 get-seat-id find-middle)
