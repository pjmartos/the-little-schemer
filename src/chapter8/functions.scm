#lang scheme/base

(require "../chapter1/functions.scm" "../chapter4/functions.scm" "../chapter5/functions.scm" "../chapter6/functions.scm")

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? (car l) a) (cdr l))
        (else (cons (car l) ((rember-f test?) a (cdr l))))
      )
    )
  )
)

(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a)
    )
  )
)

(define eq?-salad
  (eq?-c 'salad)
)

(define rember-eq?
  (rember-f eq?)
)

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old) (cons new (cons old (cdr l))))
        (else (cons (car l) ((insertL-f test?) new old (cdr l))))
      )
    )
  )
)

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old) (cons old (cons new (cdr l))))
        (else (cons (car l)) ((insertR-f test?) new old (cdr l)))
      )
    )
  )
)

(define seqL
  (lambda (new old l)
    (cons new (cons old l))
  )
)

(define seqR
  (lambda (new old l)
    (cons old (cons new l))
  )
)

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((eq? (car l) old) (seq new old (cdr l)))
        (else (cons (car l) ((insert-g seq) new old (cdr l))))
      )
    )
  )
)

(define insertL
   (insert-g
     (lambda (new old l)
       (cons new (cons old l))
     )
   )
)

(define insertR
   (insert-g seqR)
)

(define seqS
  (lambda (new old l)
    (cons new l)
  )
)

(define subst
  (insert-g seqS)
)

(define seqrem
  (lambda (new old l)
    l
  )
)

(define rember
  (lambda (a l)
    ((insert-g seqrem) #f a l)
  )
)

(define atom-to-function
  (lambda (x)
    (cond
      ((eq? x '+) o+)
      ((eq? x 'x) ox)
      (else exp)
    )
  )
)

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      (else (atom-to-function (operator nexp)) (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp)))
    )
  )
)

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (multirember a (cdr lat)))
      (else (cons (car lat) (multirember a (cdr lat))))
    )
  )
)

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
        ((null? lat) '())
        ((test? (car lat) a) ((multirember-f test?) a (cdr lat)))
        (else (cons (car lat) ((multirember-f test?) a (cdr lat))))
      )
    )
  )
)

(define multirember-eq?
  (multirember-f eq?)
)

(define eq?-tuna
  (eq?-c 'tuna)
)

(define multiremberT
  (lambda (test? lat)
    (cond
      ((null? lat) '())
      ((test? (car lat)) (multiremberT test? (cdr lat)))
      (else (cons (car lat) (multiremberT test? (cdr lat))))
    )
  )
)

(define multirember&co
  (lambda (a lat col)
    (cond
      ((null? lat) (col '() '()))
      ((eq? (car lat) a) (multirember&co a (cdr lat)
        (lambda (newlat seen)
          (col newlat (cons (car lat) seen))
        ))
      )
      (else (multirember&co a (cdr lat)
        (lambda (newlat seen)
          (col (cons (car lat) newlat) seen)
        ))
      )
    )
  )
)

(define a-friend
  (lambda (x y)
    (null? y)
  )
)

(define last-friend
  (lambda (x y)
    (length x)
  )
)

(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons new (cons old (multiinsertL new old (cdr lat)))))
      (else (cons (car lat) (multiinsertL new old (cdr lat))))
    )
  )
)

(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons old (cons new (multiinsertR new old (cdr lat)))))
      (else (cons (car lat) (multiinsertR new old (cdr lat))))
    )
  )
)

(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) oldL) (cons new (cons oldL (multiinsertLR new oldL oldR (cdr lat)))))
      ((eq? (car lat) oldR) (cons oldR (cons new (multiinsertLR new oldL oldR (cdr lat)))))
      (else (cons (car lat) (multiinsertLR new oldL oldR (cdr lat))))
    )
  )
)

(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond
      ((null? lat) (col '() 0 0))
      ((eq? (car lat) oldL) (multiinsertLR&co new oldL oldR (cdr lat)
        (lambda (newlat L R)
          (col (cons new (cons oldL newlat)) (add1 L) R)
        ))
      )
      ((eq? (car lat) oldR) (multiinsertLR&co new oldL oldR (cdr lat)
        (lambda (newlat L R)
          (col (cons oldR (cons new newlat)) L (add1 R))
        ))
      )
      (else (multiinsertLR&co new oldL oldR (cdr lat)
        (lambda (newlat L R)
          (col (cons (car lat) newlat) L R)
        ))
      )
    )
  )
)

(define even?
  (lambda (n)
    (= (ox (quotient n 2) 2) n)
  )
)

(define evens-only*
  (lambda (l)
    (cond
      ((null? l) '())
      ((atom? (car l))
        (cond
          ((even? (car l)) (cons (car l) (evens-only* (cdr l))))
          (else (evens-only* (cdr l)))
        )
      )
      (else (cons (evens-only* (car l)) (evens-only* (cdr l))))
    )
  )
)

(define evens-only*&co
  (lambda (l col)
    (cond
      ((null? l) (col '() 1 0))
      ((atom? (car l))
        (cond
          ((even? (car l)) (evens-only*&co (cdr l)
            (lambda (newl p s)
              (col (cons (car l) newl) (ox (car l) p) s)
            ))
          )
          (else (evens-only*&co (cdr l)
            (lambda (newl p s)
              (col newl p (o+ (car l) s))
            ))
          )
        )
      )
      (else (evens-only*&co (car l)
        (lambda (al ap as)
          (evens-only*&co (cdr l)
            (lambda (dl dp ds)
              (col (cons al dl) (ox ap dp) (o+ as ds))
            )
          )
        ))
      )
    )
  )
)

(define the-last-friend
  (lambda (newl product sum)
    (cons sum (cons product newl))
  )
)

(provide rember-f eq?-c eq?-salad rember-eq? insertR atom-to-function multirember-f eq?-tuna multiremberT multirember&co a-friend last-friend multiinsertLR&co evens-only* evens-only*&co the-last-friend)