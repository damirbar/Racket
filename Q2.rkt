#lang pl


(: sublist-helper : (Listof Any) (Listof Number) -> (Listof Number))
(define (sublist-helper complex-list num-list)
  (if (number? (first complex-list)) (sublist-helper (rest complex-list) (append (list (first complex-list)) num-list))
           (sublist-helper (rest complex-list) num-list)))


(: sublist-numbers : (Listof Any) -> (Listof Number))
(define (sublist-numbers complex-list)
  (sublist-helper complex-list null))

(test (sublist-numbers (list 'any "Benny" 10 'OP 8)) => '(8 19))
;(test (sublist-numbers '('any "Benny" OP (2 3))) => null)
