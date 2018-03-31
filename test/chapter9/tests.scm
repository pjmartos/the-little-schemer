#lang scheme/base

(require schemeunit "../../src/chapter9/functions.scm")

; looking
(check-true (looking 'caviar '(6 2 4 caviar 5 7 3)))
(check-false (looking 'caviar '(6 2 grits caviar 5 7 3)))
; Esta invocación nunca termina
; (check-false (looking 'caviar '(7 1 2 caviar 5 6 3)))

; shift
(check-equal? (shift '((a b) c)) '(a (b c)))
(check-equal? (shift '((a b) (c d))) '(a (b (c d))))

; weight*
(check-equal? (weight* '((a b) c)) 7)
(check-equal? (weight* '(a (b c))) 5)

; shuffle
(check-equal? (shuffle '(a (b c))) '(a (b c)))
(check-equal? (shuffle '(a b)) '(a b))
; Esta invocación nunca termina
; (check-equal? (shuffle '((a b) (c d))) null)

; A
(check-equal? (A 1 0) 2)
(check-equal? (A 1 1) 3)
(check-equal? (A 2 2) 7)

(check-equal?
  (((lambda (mk-length)
    (mk-length mk-length))
      (lambda (mk-length)
        (lambda (l)
          (cond
            ((null? l) 0)
	      (else (add1 ((mk-length mk-length) (cdr l)))))))) '(apples)) 1)