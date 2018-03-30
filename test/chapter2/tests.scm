#lang scheme/base

(require schemeunit "../../src/chapter1/functions.scm" "../../src/chapter2/functions.scm")

; lat?
(check-true (lat? '(Jack Sprat could eat no chicken fat)))
(check-false (lat? '((Jack) Sprat could eat no chicken fat)))
(check-false (lat? '(Jack (Sprat could) eat no chicken fat)))
(check-true (lat? '()))
(check-true (lat? '(bacon and eggs)))
(check-false (lat? '(bacon (and eggs))))
; lat? -> Acepta una lista
;      -> Devuelve #t si la lista no contiene ninguna otra lista; #f en cualquier otro caso

; or
(check-true (or (null? '()) (atom? '(d e f g))))
(check-true (or (null? '(a b c)) (null? '())))
(check-false (or (null? '(a b c)) (null? '(atom))))
; or -> Acepta dos de S-expressions
;    -> Devuelve #t si la primera S-expression evalúa a #t; en caso de evaluar a #f devuelve el resultado de evaluar
;       la segunda S-expressions

; member?
(check-true (member? 'tea '(coffee tea or milk)))
(check-false (member? 'poached '(fried eggs and scrambled eggs)))
(check-true (member? 'meat '(mashed potatoes and meat gravy)))
(check-false (member? 'liver '(bagels and lox)))
; member? -> Acepta un Atom y una lista de Atoms
;         -> Devuelve #t si alguno de los Atoms de la lista son idénticos al Atom proporcionado; #f en cualquier otro
;            caso
