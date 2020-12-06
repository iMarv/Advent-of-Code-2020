#lang racket

(require rackunit "day4.rkt")

(define day4-test-input '(
    "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd"
    "byr:1937 iyr:2017 cid:147 hgt:183cm"
    ""
    "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884"
    "hcl:#cfa07d byr:1929"
    ""
    "hcl:#ae17e1 iyr:2013"
    "eyr:2024"
    "ecl:brn pid:760753108 byr:1931"
    "hgt:179cm"
    ""
    "hcl:#cfa07d eyr:2025 pid:166559648"
    "iyr:2011 ecl:brn hgt:59in"
))

(define day4-2-test-input '(
    "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980"
    "hcl:#623a2f"
    ""
    "eyr:2029 ecl:blu cid:129 byr:1989"
    "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm"
    ""
    "hcl:#888785"
    "hgt:164cm byr:2001 iyr:2015 cid:88"
    "pid:545766238 ecl:hzl"
    "eyr:2022"
    ""
    "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
    ""
    "eyr:1972 cid:100"
    "hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926"
    ""
    "iyr:2019"
    "hcl:#602927 eyr:1967 hgt:170cm"
    "ecl:grn pid:012533040 byr:1946"
    ""
    "hcl:dab227 iyr:2012"
    "ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277"
    ""
    "hgt:59cm ecl:zzz"
    "eyr:2038 hcl:74454a iyr:2023"
    "pid:3556412378 byr:2007"
))

(define day4-tests
    (test-suite "Day4"
        (test-suite "validate-entries"
            (test-equal? "false if some invalid"
                (validate-entries (list (list "hgt" "100") (list "pid" "012345678"))) #f)
            (test-equal? "true if all valid"
                (validate-entries (list (list "hgt" "179cm") (list "pid" "012345678"))) #t))

        (test-suite "validate-entry"
            (test-equal? "false if invalid entry"
                (validate-entry "hgt" "100") #f)
            (test-equal? "true if correct entry"
                (validate-entry "hgt" "179cm") #t))

        (test-suite "entry-to-pair"
            (test-equal? "split parts into cons"
                (entry-to-pair "pid:166559648") (list "pid" "166559648"))
            (test-equal? "split parts into cons"
                (entry-to-pair "hgt:179cm") (list "hgt" "179cm")))

        (test-suite "validate-between"
            (test-equal? "false if not between"
                ((validate-between 1000 2000) "3000") #f)
            (test-equal? "true if correct length"
                ((validate-between 1000 2000) "1000") #t)
            (test-equal? "false if too short"
                ((validate-between 1000 2000) "130") #f))

        (test-suite "validate-hgt"
            (test-equal? "true with correct in"
                (validate-hgt "76in") #t)
            (test-equal? "true with correct cm"
                (validate-hgt "150cm") #t)
            (test-equal? "false if no suffix"
                (validate-hgt "12") #f))

        (test-suite "string-contains-all?"
            (test-equal? "false if missing a partial"
                (string-contains-all? "abc" '("a" "b" "c" "d")) #f)
            (test-equal? "true if all partials are in string"
                (string-contains-all? "abc" '("a" "b" "c")) #t))
        (test-suite "Puzzle2"
            (test-equal? "find correct number"
                (day4-2 day4-2-test-input) 4))
        (test-suite "Puzzle1"
            (test-equal? "find correct number"
                (day4-1 day4-test-input) 2))))

(provide day4-tests)
