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

(define (union? lst1 lst2)
  (if (empty? lst1)
      (display lst2)
  (if (empty? lst2)
      (display lst1)
      (if (member? (car lst2) lst1)
          (union? lst1 (cdr lst2))
          (union? (append lst1 (list (car lst2))) (cdr lst2))))))