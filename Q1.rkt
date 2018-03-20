#lang pl
#|

Solution description:
In this solution I created 3 functions:

1) min&max_tail_rec:
   Input: Two numbers, minimum and maximum, and a list of numbers.
   Output: A list of two numbers. The minimum and the maximum of the given list.
   Operation: This function recursively checks for minimum and maximum within the given list.
     If the list is empty, it will return the current minimum and maximum as a list.
     If the list is not empty, it will perform a comparison between the current minimum and the first
     element of the array. If it is minimal, call recursively with the new minimum and the given list
     without the first element. If it is not minimal, a same process will be applied with a maximality
     check. If neither of the minimum and maximum are to change, it will call recursively with the same
     values for the minimum and maximum and the given list without the first element.

2) min&max_list_maker:
   Input: A list of numbers.
   Output: A list of two numbers. The minimum and the maximum of the given list.
   Operation: This function calls the function "min&max_tail_rec" with the initial minimum and maximum
     as the first element of the given list and with the given list. The calculation is done within the
     function min&max_tail_rec.

3) min&max:
   Input: Five numbers.
   Output: A list of two numbers. The minimum and the maximum.
   Operation: This function calls the function "min&max_list_maker" with the fiver numbers input as a
     list.

|#

(: min&max_tail_rec : Number Number (Listof Number) -> (Listof Number))
(define (min&max_tail_rec min max array)
  (if (null? array)
      (list min max)
      (if (< (first array) min)
          (min&max_tail_rec (first array) max (rest array))
          (if (> (first array) max)
              (min&max_tail_rec min (first array) (rest array))
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
