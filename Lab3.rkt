#lang racket
(define (f lst)
  ; (a) ;
  (if (null? lst)
      ; (b) ;
      '()
      ; (c) ;
      (cons (+ 1 (car lst)) (f (cdr lst)))))

(f '(5 5 5 5 5 5 5))

(define (member? e lst)
  (if (equal? e (car lst))
      #t
      (if (null? (cdr lst))
          #f
      (member? e (cdr lst)))))
  
(define (set? lst)
  (if (null? (cdr lst))
      #t
  (if (member? (car lst)(cdr lst))
      #f
      (set? (cdr lst)))))

(define (union lst1 lst2)
  
)