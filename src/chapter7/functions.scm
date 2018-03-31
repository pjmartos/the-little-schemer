#lang scheme/base

(require "../chapter1/functions.scm" "../chapter2/functions.scm" "../../src/chapter3/functions.scm")
 
(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else (set? (cdr lat)))
    )
  )
)

(define makeset
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else (cons (car lat) (makeset (multirember (car lat) (cdr lat)))))
    )
  )
)

(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      (else (and (member? (car set1) set2) (subset? (cdr set1) set2)))
    )
  )
)

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2) (subset? set2 set1))
  )
)

(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      (else (or (member? (car set1) set2) (intersect? (cdr set1) set2)))
    )
  )
)

(define intersect
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2) (cons (car set1) (intersect (cdr set1) set2)))
      (else (intersect (cdr set1) set2))
    )
  )
)

(define union
  (lambda (set1 set2)
    (cond
      ((null? set1) set2)
      ((member? (car set1) set2) (union (cdr set1) set2))
      (else (cons (car set1) (union (cdr set1) set2)))
    )
  )
)

(define difference
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2) (difference (cdr set1) set2))
      (else (cons (car set1) (difference (cdr set1) set2)))
    )
  )
)

(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else (intersect (car l-set) (intersectall (cdr l-set))))
    )
  )
)

(define a-pair?
  (lambda (x)
    (not (or (null? x) (atom? x) (null? (car x)) (null? (car (cdr x)))))
  )
)

(define first
  (lambda (p)
    (car p)
  )
)

(define second
  (lambda (p)
    (car (cdr p))
  )
)

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))
  )
)

(define third
  (lambda (l)
    (car (cdr (cdr l)))
  )
)

(define fun?
  (lambda (rel)
    (set? (firsts rel))
  )
)

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else (cons (revpair (car rel)) (revrel (cdr rel))))
    )
  )
)

(define revpair
  (lambda (pair)
    (build (second pair) (first pair))
  )
)

(define fullfun?
  (lambda (fun)
    (set? (seconds fun))
  )
)


(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))
  )
)

(provide set? makeset subset? eqset? intersect? intersect union intersectall a-pair? fun? revrel fullfun? one-to-one?)