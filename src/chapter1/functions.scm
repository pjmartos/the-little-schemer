#lang scheme/base

(define atom?
  (lambda (x)
    (and
      (not (pair? x))
      (not (null? x))
    )
  )
)

(provide atom?)