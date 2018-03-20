#lang pl

#|

Question 2:

Solution description:
In this solution I created 2 functions:

1) sublist-helper:
   Input: Two lists, one of any type and one of numbers.
   Output: A list which contains the numbers from the first list.
   Operation: This function recursively checks if the first element is a number. If it is, it will append it to the current
     number list and call recursively to itself with the first list without the first element an with the new appended number
     list. If it isn't a number, it will call recursively to itself with the first list without the first element an with the
     same number list.

2) sublist-numbers:
   Input: A list of any type.
   Output: A list of numbers.
   Operation: This function calls the function "sublist-helper" with the given list and with an initial empty list (null) which
     will be filled with the numbers by "sublist-helper"

|#


(: sublist-helper : (Listof Any) (Listof Number) -> (Listof Number))
(define (sublist-helper complex-list num-list)
  (if (null? complex-list) num-list
  (if (number? (first complex-list)) (sublist-helper (rest complex-list) (append (list (first complex-list)) num-list))
           (sublist-helper (rest complex-list) num-list))))


(: sublist-numbers : (Listof Any) -> (Listof Number))
(define (sublist-numbers complex-list)
  (sublist-helper complex-list null))



(test (sublist-numbers (list 'any "Benny" 10 'OP 8)) => '(8 10))
(test (sublist-numbers '('any "Benny" OP (2 3))) => null)
(test (sublist-numbers '('any 9 "Benny" 2 OP 156 (2 3) 800)) => '(800 156 2 9))
(test (sublist-numbers (list 1 2 3 4 5)) => '(5 4 3 2 1))
(test (sublist-numbers (list 1)) => '(1))

