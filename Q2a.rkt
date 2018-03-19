#lang pl
;;Q2A


(: sublist-helper : (Listof Any) (Listof Number) -> (Listof Number))
(define (sublist-helper complex-list num-list)
  (if (null? complex-list) num-list
  (if (number? (first complex-list)) (sublist-helper (rest complex-list) (append (list (first complex-list)) num-list))
           (sublist-helper (rest complex-list) num-list))))


(: sublist-numbers : (Listof Any) -> (Listof Number))
(define (sublist-numbers complex-list)
  (sublist-helper complex-list null))


;;(sublist-numbers (list 'any "Benny" 10 'OP 8))
;;(sublist-numbers '('any "Benny" OP (2 3)))
;;(sublist-numbers '('any 9 "Benny" 2 OP 156 (2 3) 800))
(test (sublist-numbers (list 'any "Benny" 10 'OP 8)) => '(8 10))
(test (sublist-numbers '('any "Benny" OP (2 3))) => null)
(test (sublist-numbers '('any 9 "Benny" 2 OP 156 (2 3) 800)) => '(800 156 2 9))
(test (sublist-numbers (list 1 2 3 4 5)) => '(5 4 3 2 1))
(test (sublist-numbers (list 1)) => '(1))

