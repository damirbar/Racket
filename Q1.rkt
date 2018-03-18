#lang pl


(: min&max_tail_rec : Number Number (Listof Number) -> (Listof Number))
(define (min&max_tail_rec min max array)
  (if (null? array)
      (list min max)
      (if (< (first array) min)
          (min&max_tail_rec (first array) max array)
          (if (> (first array) max)
              (min&max_tail_rec min (first array) array)
              (min&max_tail_rec min max (rest array))))))


(: min&max_list_maker : (Listof Number) -> (Listof Number))
(define (min&max_list_maker array)
  (min&max_tail_rec (first array) (first array) (rest array)))

(: min&max : Number Number Number Number Number  -> (Listof Number))
(define (min&max a1 a2 a3 a4 a5)
  (min&max_list_maker (list a1 a2 a3 a4 a5)))



(test (min&max 2 3 2 7 5) => '(2 7))
(test (min&max 0 0 0 0 0) => '(0 0))
(test (min&max 5 4 3 2 1) => '(1 5))
(test (min&max 1 2 3 4 5) => '(1 5))
(test (min&max 9 1 9 1 9) => '(1 9))
