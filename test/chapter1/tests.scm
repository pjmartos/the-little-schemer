#lang scheme

(require schemeunit "../../src/chapter1/functions.scm")

; Atoms
(check-true (atom? (quote atom)))
(check-true (atom? 'atom))
(check-true (atom? 1492))
(check-true (atom? 'u))
(check-true (atom? '*abc$))

; Listas
(check-true (sequence? (quote (atom))))
(check-true (sequence? '(atom)))
(check-true (sequence? '(atom turkey or)))
; Lo siguiente no es una lista, son dos S-expresiones distintas
; (check-false (sequence? '(atom turkey) 'or))
(check-true (sequence? '((atom turkey) 'or)))
(check-true (sequence? '(how are you doing so far)))
(check-true (sequence? '(((how) are) ((you) (doing so)) far)))
(check-true (sequence? '()))
(check-false (atom? '()))
(check-true (sequence? '(() () () ())))

; car
(check-equal? (car '(a b c)) 'a )
(check-equal? (car '((a b c) x y z)) '(a b c))
; car no está definido para Atoms
; (check-equal? null (car 'hotdog))
; car no está definido para listas vacías
; (check-equal? null (car '()))
(check-equal? (car '(((hotdogs)) (and) (pickle) relish)) '((hotdogs)))
(check-equal? (car (car '(((hotdogs)) (and)))) '(hotdogs))
; car -> Acepta una lista no vacía
;     -> Devuelve la primera S-expression de la lista

; cdr
(check-equal? (cdr '(a b c)) '(b c))
(check-equal? (cdr '((a b c) x y z)) '(x y z))
(check-equal? (cdr '(hamburguer)) '())
(check-equal? (cdr '((x) t r)) '(t r))
; cdr no está definido para Atoms
; (check-equal? '() (cdr 'hotdogs))
; cdr no está definido para listas vacías
; (check-equal? '() (cdr '()))
(check-equal? (car (cdr '((b) (x y) ((c))))) '(x y))
(check-equal? (cdr (cdr '((b) (x y) ((c))))) '(((c))))
; cdr no está definido para Atoms -> (car l) devuelve un Atom
; (check-equal? '(((c))) (cdr (car '(a (b (c)) d))))
; cdr -> Acepta una lista no vacía
;     -> Devuelve una lista con todos los elementos de la lista original salvo la primera S-expression

; cons
(check-equal? (cons 'peanut '(butter and jelly)) '(peanut butter and jelly))
(check-equal? (cons '(banana and) '(peanut butter and jelly)) '((banana and) peanut butter and jelly))
(check-equal? (cons '((help) this) '(is very ((hard) to learn))) '(((help) this) is very ((hard) to learn)))
(check-equal? (cons '(a b (c)) '()) '((a b (c))))
(check-equal? (cons 'a '()) '(a))
(check-equal? (cons '((a b c)) 'b) '(((a b c)) . b))
(check-equal? (cons 'a 'b) '(a . b))
(check-equal? (cons 'a (car '((b) c d))) '(a b))
(check-equal? (cons 'a (cdr '((b) c d))) '(a c d))
; cons -> Acepta dos S-expressions
;      -> Devuelve una lista con la combinación de ambas listas

; null?
(check-true (null? (quote ())))
(check-true (null? '()))
(check-false (null? '(a b c)))
(check-false (null? 'spaguetti))
; null? -> Acepta cualquier S-expression
;       -> Devuelve #t si la S-expression es una lista vacía; #f en cualquier otro caso

; atom?
(check-true (atom? 'Harry))
(check-false (atom? '(Harry had a heap of apples)))
(check-true (atom? (car '(Harry had a heap of apples))))
(check-false (atom? (cdr '(Harry had a heap of apples))))
(check-false (atom? (cdr '(Harry))))
(check-true (atom? (car (cdr '(swing low sweet cherry oat)))))
(check-false (atom? (car (cdr '(swing (low sweet) cherry oat)))))
; atom? -> Acepta cualquier S-expression
;       -> Devuelve #t si la S-expression es un Atom; #f en cualquier otro caso

; eq?
(check-true (eq? 'Harry 'Harry))
(check-false (eq? 'margarine 'butter))
(check-false (eq? '() '(strawberry)))
(check-false (eq? 6 7))
(check-true (eq? (car '(Mary had a little lamb chop)) 'Mary))
(check-false (eq? (cdr '(soured milk)) 'milk))
(check-true (eq? (car '(beans beans we need jelly beans)) (car (cdr '(beans beans we need jelly beans)))))
; eq? -> Acepta dos S-expressions
;     -> Devuelve #t si ambas S-expressions son idénticas; #f en cualquier otro caso