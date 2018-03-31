#lang scheme/base

(require "../chapter1/functions.scm" "../chapter4/functions.scm")

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((or (equal? (car (cdr aexp)) '+) (equal? (car (cdr aexp)) 'x) (equal? (car (cdr aexp)) 'exp)) (and (numbered? (car aexp)) (numbered? (car (cdr (cdr aexp))))))
      (else #f)
    )
  )
)

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (operator nexp) '+) (o+ (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
      ((eq? (operator nexp) 'x) (x (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
      (else (exp (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
    )
  )
)

(define 1st-sub-exp
  (lambda (aexp)
    (car aexp)
  )
)

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))
  )
)

(define operator
  (lambda (aexp)
    (car (cdr aexp))
  )
)

(define sero?
  (lambda (n)
    (null? n)
  )
)

(define edd1
  (lambda (n)
    (cons '() n)
  )
)

(define zub1
  (lambda (n)
    (cdr n)
  )
)

; (define o+
;   (lambda (n m)
;     (cond
;       ((sero? n) m)
;       (else (edd1 (o+ n (zub1 m))))
;     )
;   )
; )

(provide numbered? value 1st-sub-exp 2nd-sub-exp operator sero? edd1 zub1)