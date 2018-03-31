#lang scheme/base

(require schemeunit "../../src/chapter4/functions.scm" "../../src/chapter5/functions.scm" "../../src/chapter6/functions.scm" "../../src/chapter8/functions.scm")

; rember-f
(check-equal? ((rember-f =) 5 '(6 2 5 3)) '(6 2 3))
(check-equal? ((rember-f eq?) 'jelly '(jelly beans are good)) '(beans are good))
(check-equal? ((rember-f equal?) '(pop corn) '(lemonade (pop corn) and (cake))) '(lemonade and (cake)))

; eq?-c
(check-true (eq?-salad 'salad))
(check-false (eq?-salad 'tuna))
(check-false ((eq?-c 'salad) 'tuna))

; rember-eq?
(check-equal? (rember-eq? 'tuna '(tuna salad is good)) '(salad is good))
(check-equal? (rember-eq? 'tuna '(shrimp salad and tuna salad)) '(shrimp salad and salad))
(check-equal? ((rember-f eq?) 'eq? '(equal? eq? eqan? eqlist? eqpair?)) '(equal? eqan? eqlist? eqpair?))

; atom-to-function
(check-equal? (atom-to-function (operator '(+ 5 3))) o+)

; multirember-f
(check-equal? ((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna)) '(shrimp salad salad and))

; multiremberT
(check-equal? (multiremberT eq?-tuna '(shrimp salad tuna salad and tuna)) '(shrimp salad salad and))

; multirember&co
(check-false (multirember&co 'tuna '(strawberries tuna and swordfish) a-friend))
(check-true (multirember&co 'tuna '() a-friend))
(check-false (multirember&co 'tuna '(tuna) a-friend))
(check-false (multirember&co 'tuna '(and tuna) a-friend))
(check-equal? (multirember&co 'tuna '(strawberries tuna and swordfish) last-friend) 3)

; evens-only*
(check-equal? (evens-only* '((9 1 2 8) 3 10 ((9 9) 7 6) 2)) '((2 8) 10 (() 6) 2))

; evens-only*&co
(check-equal? (evens-only*&co '((9 1 2 8) 3 10 ((9 9) 7 6) 2) the-last-friend) '(38 1920 (2 8) 10 (() 6) 2))