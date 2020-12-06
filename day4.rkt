#lang racket

(require threading "util.rkt")

(define req-entries (list
    "byr"
    "iyr"
    "eyr"
    "hgt"
    "hcl"
    "ecl"
    "pid"))

(define (str-is-between? min max str)
    (is-between? min max (string->number str)))

(define (validate-between min max)
    (lambda (val)
        (and
            (= 4 (string-length val))
            (str-is-between? min max val))))

(define (validate-hgt val)
    ((match (substring-from-tail val 2)
        ["cm" (curry str-is-between? 150 193)]
        ["in" (curry str-is-between? 59 76)]
        [_ (lambda (_) #f)]) (substring val 0 (- (string-length val) 2))))

(define (validate-hcl val)
    (and
        (= 7 (string-length val))
        (is-char-at? 0 #\# val)))

(define valid-ecls '(
    "amb" "blu" "brn" "gry" "grn" "hzl" "oth"
))

(define (validate-ecl val)
    (some? (lambda (ecl) (string=? ecl val)) valid-ecls))

(define (validate-pid val)
    (= 9 (string-length val)))

(define (validate-entry name value)
    ((match name
        ["byr" (validate-between 1920 2002)]
        ["iyr" (validate-between 2010 2020)]
        ["eyr" (validate-between 2020 2030)]
        ["hgt" validate-hgt]
        ["hcl" validate-hcl]
        ["ecl" validate-ecl]
        ["pid" validate-pid]
        ["cid" (lambda (_) #t)]) value))

(define (entry-to-pair e)
    (list
        (substring e 0 3)
        (substring e 4)))

(define (passport-list-to-pair-list lst)
    (map entry-to-pair lst))

(define (passport-to-list passport)
    (string-split passport " "))

(define (validate-entries entry-list)
    (every? (lambda (entry)
        (validate-entry (first entry) (second entry)
    )) entry-list))

(define (string-contains-all? str partials)
    (every? (curry string-contains? str) partials))

(define (count-valid lst)
    (count (curryr string-contains-all? req-entries) lst))

(define (filter-valid lst)
    (filter (curryr string-contains-all? req-entries) lst))

(define (day4-1 passports)
    (~> passports
        (join-groups _ "" '())
        count-valid))

(define (day4-2 passports)
    (~> passports
        (join-groups _ "" '())
        filter-valid
        (map passport-to-list _)
        (map passport-list-to-pair-list _)
        (count validate-entries _)))

(provide day4-1 day4-2 string-contains-all? validate-hgt
    validate-between entry-to-pair validate-entries validate-entry)
