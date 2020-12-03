#lang racket

(require rackunit "day3.rkt")

(define day3-test-input '(
    "..##......."
    "#...#...#.."
    ".#....#..#."
    "..#.#...#.#"
    ".#...##..#."
    "..#.##....."
    ".#.#.#....#"
    ".#........#"
    "#.##...#..."
    "#...##....#"
    ".#..#...#.#"
))

(define day3-tests
    (test-suite "Day3"
        (test-suite "Puzzle2"
            (test-equal? "find correct number"
                (day3-2 day3-test-input) 336))
        (test-suite "Puzzle1"
            (test-equal? "find correct number of trees"
                (day3-1 day3-test-input) 7))))

(provide day3-tests)
