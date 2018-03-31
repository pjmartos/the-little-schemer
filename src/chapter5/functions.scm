#lang scheme/base

(require "../chapter1/functions.scm" "../chapter4/functions.scm")

(define rember*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((atom? (car l))
        (cond
          ((eq? (car l) a) (rember* a (cdr l)))
          (else (cons (car l) (rember* a (cdr l))))
        )
      )
      (else (cons (rember* a (car l)) (rember* a (cdr l))))
    )
  )
)

(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
        (cond
          ((eq? (car l) old) (cons old (cons new (insertR* new old (cdr l)))))
          (else (cons (car l) (insertR* new old (cdr l))))
        )
      )
      (else (cons (insertR* new old (car l)) (insertR* new old (cdr l))))
    )
  )
)

(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
        (cond
          ((eq? (car l) a) (add1 (occur* a (cdr l))))
          (else (occur* a (cdr l)))
        )
      )
      (else (o+ (occur* a (car l)) (occur* a (cdr l))))
    )
  )
)

(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
        (cond
          ((eq? (car l) old) (cons new (subst* new old (cdr l))))
          (else (cons (car l) (subst* new old (cdr l))))
        )
      )
      (else (cons (subst* new old (car l)) (subst* new old (cdr l))))
    )
  )
)

(define insertL*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
        (cond
          ((eq? (car l) old) (cons new (cons old (insertL* new old (cdr l)))))
          (else (cons (car l) (insertL* new old (cdr l))))
        )
      )
      (else (cons (insertL* new old (car l)) (insertL* new old (cdr l))))
    )
  )
)

(define member*
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((atom? (car l)) (or (eq? (car l) a) (member* a (cdr l))))
      (else (or (member* a (car l)) (member* a (cdr l))))
    )
  )
)

(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else (leftmost (car l)))
    )
  )
)

(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      (else (and (equal? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2))))
    )
  )
)

(define equal?
  (lambda (s1 s2)
    (cond
      ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
      ((or (atom? s1) (atom? s2)) #f)
      (else (eqlist? s1 s2))
    )
  )
)

(define rember
  (lambda (s l)
    (cond
      ((null? l) '())
      ((equal? (car l) s) (cdr l))
      (else (cons (car l) (rember s (cdr l))))	  
    )
  )
)

(provide rember* insertR* occur* subst* insertL* member* leftmost eqlist? equal? rember)