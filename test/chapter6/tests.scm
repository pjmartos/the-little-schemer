#lang scheme/base

(require schemeunit "../../src/chapter2/functions.scm" "../../src/chapter6/functions.scm")

; quote
(check-equal? (quote a) 'a)
(check-equal? (quote +) '+)
(check-equal? (quote x) 'x)
(check-true (eq? (quote a) 'a))
(check-true (eq? 'a 'a))

; numbered?
(check-true (numbered? 1))
(check-true (numbered? '(3 + (4 exp 5))))
(check-false (numbered? '(2 x sausage)))

; value
(check-equal? (value 13) 13)
(check-equal? (value '(1 + 3)) 4)
(check-equal? (value '(1 + (3 exp 4))) 82)
; value no está definido para atoms no numéricos
; (check-equal? (value 'cookie) null)

; zub1
; zub1 no está definido para listas vacías
; (check-equal? (zub1 '()) null)

; lat?
(check-true (lat? '(1 2 3)))
(check-false (lat? '((()) (()()) (()()()))))