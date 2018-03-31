#lang scheme/base

(define add1
  (lambda (n)
    (+ n 1)
  )
)

(define sub1
  (lambda (n)
    (- n 1)
  )
)

(define o+
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (o+ (add1 n) (sub1 m)))
    )
  )
)

(define o-
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (o- (sub1 n) (sub1 m)))
    )
  )
)

(define tup?
  (lambda (l)
    (cond
      ((null? l) #t)
      (else (and (number? (car l)) (tup? (cdr l))))
    )                        
  )
)

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (o+ (car tup) (addtup (cdr tup))))
    )
  )
)

(define x
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (+ n (x n (sub1 m))))
    )
  )
)

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2))))
    )
  )
)

(define >
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (> (sub1 n) (sub1 m)))
    )
  )
)

(define <
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else (< (sub1 n) (sub1 m)))
    )
  )
)

(define =
  (lambda (n m)
    (not (or (< n m) (> n m)))
  )
)

(define exp
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else (x n (exp n (sub1 m))))
    )
  )
)

(define quotient
  (lambda (n m)
    (cond
      ((< n m) 0)
      (else (add1 (quotient (- n m) m)))
    )
  )
)

(define length
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (length (cdr lat))))
    )
  )
)

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat)))
    )
  )
)

(define rempick
  (lambda (n lat)
    (cond
      ((null? lat) '())
      ((one? n) (cdr lat))
      (else (cons (car lat) (rempick (sub1 n) (cdr lat))))
    )
  )
)

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
      (else (cons (car lat) (no-nums (cdr lat))))
    )
  )
)

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
      (else (all-nums (cdr lat)))
    )
  )
)

(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (= a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2))
    )
  )
)

(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      ((eqan? (car lat) a) (add1 (occur a (cdr lat))))
      (else (occur a (cdr lat)))
    )
  )
)

(define one?
  (lambda (n)
    (= n 1)
  )
)

(provide add1 sub1 o+ o- tup? addtup x tup+ > < = exp quotient length pick rempick no-nums all-nums eqan? occur)