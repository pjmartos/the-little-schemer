#lang scheme/base

(require schemeunit "../../src/chapter1/functions.scm" "../../src/chapter4/functions.scm")

; atom?
(check-true (atom? 14))

; number?
(check-true (number? -3))
(check-true (number? 3.14159))

; add1
(check-equal? (add1 67) 68)

; sub1
(check-equal? (sub1 5) 4)
(check-equal? (sub1 0) -1)

; zero?
(check-true (zero? 0))
(check-false (zero? 1492))

; o+
(check-equal? (o+ 46 12) 58)

; o-
(check-equal? (o- 14 3) 11)
(check-equal? (o- 17 9) 8)
(check-equal? (o- 18 25) -7)

; tup?
(check-true (tup? '(2 11 3 79 47 6)))
(check-true (tup? '(8 55 5 555)))
(check-false (tup? '(1 2 8 apple 4 3)))
(check-false (tup? '(3 (7 4) 13 9)))
(check-true (tup? '()))

; addtup
(check-equal? (addtup '(3 5 2 8)) 18)
(check-equal? (addtup '(15 6 7 12 3)) 43)

; x
(check-equal? (x 5 3) 15)
(check-equal? (x 13 4) 52)
(check-equal? (x 12 3) 36)

; tup+
(check-equal? (tup+ '(3 6 9 11 4) '(8 5 2 0 7)) '(11 11 11 11 11))
(check-equal? (tup+ '(2 3) '(4 6)) '(6 9))
(check-equal? (tup+ '(3 7) '(4 6)) '(7 13))
(check-equal? (tup+ '(3 7) '(4 6 8 1)) '(7 13 8 1))
(check-equal? (tup+ '(3 7 8 1) '(4 6)) '(7 13 8 1))

; >
(check-false (> 12 133))
(check-true (> 120 11))
(check-false (> 3 3))

; <
(check-true (< 4 6))
(check-false (< 8 3))
(check-false (< 6 6))

; exp
(check-equal? (exp 1 1) 1)
(check-equal? (exp 2 3) 8)
(check-equal? (exp 5 3) 125)

; quotient
(check-equal? (quotient 15 4) 3)

; length
(check-equal? (length '(hotdogs with mustard sauerkraut and pickles)) 6)
(check-equal? (length '(ham and cheese on rye)) 5)

; pick
(check-equal? (pick 4 '(lasagna spaghetti ravioli macaroni meatball)) 'macaroni)
; pick no está definido para índices menores que 1
; (check-equal? (pick 0 '(a)))

; rempick
(check-equal? (rempick 3 '(hotdogs with hot mustard)) '(hotdogs with mustard))

; number?
(check-true (number? 76))

; no-nums
(check-equal? (no-nums '(5 pears 6 prunes 9 dates)) '(pears prunes dates))