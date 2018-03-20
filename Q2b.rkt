#lang pl

#|

Question 2b:

Solution description:
In this solution I created 2 functions:

1) min&max-lists-helper:
   Input: Two lists. One contains lists of any type, and one containing lists of two numbers.
   Output: A list which contains lists of two numbers - minimum and maximum - for every given complex list.
   Operation: This function uses the function from the previous questions, by checking if an element is a number and by checking
     minimality and maximality. Then it returns the list of the lists of the minimum and maximum.

2) min&max-lists:
   Input: A list of lists of any type.
   Output: A list of list of numbers. A list of minimum and maximum for every list within the given list.
   Operation: This function calls the function "min&max-lists-helper" with the given list and with an initial empty list (null) which
     will be filled with the lists of minimums and maximums by "min&max-lists-helper".

|#


;;Q1 part:
(: min&max_tail_rec : Number Number (Listof Number) -> (Listof Number))
(define (min&max_tail_rec min max array)
  (if (null? array)
      (list min max)
      (if (< (first array) min)
          (min&max_tail_rec (first array) max array)
          (if (> (first array) max)
              (min&max_tail_rec min (first array) array)
              (min&max_tail_rec min max (rest array))))))


(: min&max_list_taker : (Listof Number) -> (Listof Number))
(define (min&max_list_taker array)
  (if (null? array) null (min&max_tail_rec (first array) (first array) (rest array))))


;;Q2 part:
(: sublist-helper : (Listof Any) (Listof Number) -> (Listof Number))
(define (sublist-helper complex-list num-list)
  (if (null? complex-list) num-list
  (if (number? (first complex-list)) (sublist-helper (rest complex-list) (append (list (first complex-list)) num-list))
           (sublist-helper (rest complex-list) num-list))))


(: sublist-numbers : (Listof Any) -> (Listof Number))
(define (sublist-numbers complex-list)
  (sublist-helper complex-list null))



;;Q2b part:
(: min&max-lists-helper : (Listof (Listof Any)) (Listof (Listof Number)) -> (Listof (Listof Number)))
(define (min&max-lists-helper complex-list minmax-list)
  (if (null? complex-list) (reverse minmax-list)
      (min&max-lists-helper (rest complex-list) (cons (min&max_list_taker (sublist-numbers (first complex-list))) minmax-list ))))


(: min&max-lists : (Listof (Listof Any)) -> (Listof (Listof Number)))
(define (min&max-lists complex-list)
  (if (null? complex-list) null (min&max-lists-helper complex-list null)))



(test (min&max-lists '((any "Benny" 10 OP 8) (any "Benny" OP (2 3)))) => '((8 10) ()))
(test (min&max-lists '()) => '())
(test (min&max-lists '((2 3 2 7 5) (0 0 0 0 0) (5 4 3 2 1) (1 2 3 4 5) (9 1 9 1 9))) => '((2 7) (0 0) (1 5) (1 5) (1 9)))
(test (min&max-lists '(() () () () ())) => '(() () () () ()))
(test (min&max-lists '((1 2) (2 3) (3 4) (4 5) (5 6))) => '((1 2) (2 3) (3 4) (4 5) (5 6)))
(test (min&max-lists '((2 1) (3 2) (4 3) (5 4) (6 5))) => '((1 2) (2 3) (3 4) (4 5) (5 6)))
