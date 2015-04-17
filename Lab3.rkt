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
      (display "Provided value is in the list")
      (if (null? (cdr lst))
          (display  "Provided value isn't in provided list.")
          (member? e (cdr lst)))))


(member? 5 '(0 1 2 3 4 5))
  
