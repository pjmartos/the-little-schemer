#lang scheme/base

(require "../chapter1/functions.scm" "../chapter4/functions.scm" "../chapter7/functions.scm")

(define keep-looking
  (lambda (a sorn lat)
    (cond
      ((number? sorn) (keep-looking a (pick sorn lat) lat))
      (else (eq? sorn a))
    )
  )
)

(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)
  )
)

(define eternity
  (lambda (x)
    (eternity x)
  )
)

(define shift
  (lambda (pair)
    (build (first (first pair)) (build (second (first pair)) (second pair)))
  )
)

(define align
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((a-pair? (first pora)) (align (shift pora)))
      (else (build (first pora) (align (second pora))))
    )
  )
)

(define length*
  (lambda (pora)
    (cond
      ((atom? pora) 1)
      (else (o+ (length* (first pora)) (length* (second pora))))
    )
  )
)

(define weight*
  (lambda (pora)
    (cond
      ((atom? pora) 1)
      (else (o+ (ox (weight* (first pora)) 2) (weight* (second pora))))
    )
  )
)

(define shuffle
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((a-pair? (first pora)) (shuffle (revpair pora)))
      (else (build (first pora) (shuffle (second pora))))
    )
  )
)

(define C
  (lambda (n)
    (cond
      ((one? n) 1)
      ((even? n) (C (quotient n 2)))
      (else (C (add1 (ox 3 n))))
    )
  )
)

(define A
  (lambda (n m)
    (cond
      ((zero? n) (add1 m))
      ((zero? m) (A (sub1 n) 1))
      (else (A (sub1 n) (A n (sub1 m))))
    )
  )
)

(provide looking shift weight* shuffle A)