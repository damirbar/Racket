#lang pl


#|

Question 4:

Solution description:
In this solution I have commented an explanation of the given functions. I don't know why I was ask to write the
comments there. I would rather write the explanations above the type declaration.


|#


(: is-odd? : Natural -> Boolean)
;; Input: A natual number.
;; Output: A boolean, True or False.
;; Operation: This function "plays a ping-pong game" with the function is-even. It takes a natural number and
;;   checks if it is zero. If so, it returns False, because every odd value will be decremented by both functions
;;   until this cycle will be terminated when a True value will be returned from the is-even function. Why?
;;   Well, for every odd number n, when you subtract two floor(n/2) times and then subtract one you will reach zero.
;;   That is because n-(2*(floor(n/2)))-1 = 0.
(define (is-odd? x)
 (if (zero? x)
 false
 (is-even? (- x 1))))


(: is-even? : Natural -> Boolean)
;; Input: A natual number.
;; Output: A boolean, True or False.
;; Operation: This function "plays a ping-pong game" with the function is-odd. It takes a natural number and
;;   checks if it is zero. If so, it returns True, because every even value will be decremented by both functions
;;   until this cycle will be terminated when a True value will be returned, when it is zero. Why? Well, for
;;   every even number n, when you subtract two n/2 times, you will reach zero. That is because n-(2*(n/2)) = 0.
(define (is-even? x)
 (if (zero? x)
 true
 (is-odd? (- x 1))))


;; tests --- is-odd?/is-even?
(test (not (is-odd? 12)))
(test (is-even? 12))
(test (not (is-odd? 0)))
(test (is-even? 0))
(test (is-odd? 1))
(test (not (is-even? 1)))


(: every? : (All (A) (A -> Boolean) (Listof A) -> Boolean))
;; See explanation about the All syntax at the end of the file...
;; Input: A custom condition as a boolean function and a list.
;; Output: A boolean, True or False.
;; Operation: This function checks the given condition "pred" on every element within the list. It does so by
;;   checking if the first element suffices the condition and then applies this function recursively by calling
;;   it on the rest of the list.
(define (every? pred lst)
 (or (null? lst)
 (and (pred (first lst))
 (every? pred (rest lst)))))


;; An example for the usefulness of this polymorphic function
(: all-even? : (Listof Natural) -> Boolean)
;; Input: A list of natural numbers.
;; Output: A boolean, True or False.
;; Operation: This function sends its list argument to the "every?" function to check if all of its elements are
;;   are even, by calling "every?" with the custom "is-even?" condition function.
(define (all-even? lst)
 (every? is-even? lst))


;; tests
(test (all-even? null))
(test (all-even? (list 0)))
(test (all-even? (list 2 4 6 8)))
(test (not (all-even? (list 1 3 5 7))))
(test (not (all-even? (list 1))))
(test (not (all-even? (list 2 4 1 6))))



(: every2? : (All (A B) (A -> Boolean) (B -> Boolean) (Listof A) (Listof B) ->
Boolean))
;; Input: Two custom conditions as boolean functions and two lists, assumingly of same length.
;; Output: A boolean, True or False.
;; Operation: This function checks if the condition "pred1" applies on every element of the list "lst1", AND if the
;;   condition "pred2" applies on every element of the list "lst2". If so, it will return True. Otherwise it will
;;   return false. It does so by checking if the first element of "lst1" suffices "pred1 and if the first element
;;   of "lst2" suffices "pred2" and then applies this function recursively by calling it on the rest of the lists.
(define (every2? pred1 pred2 lst1 lst2)
 (or (null? lst1)
 (and (pred1 (first lst1))
 (pred2 (first lst2))
 (every2? pred1 pred2 (rest lst1) (rest lst2)))))



;; My function and tests:
(: all-even-odd? : (Listof Natural) (Listof Natural) -> Boolean)
(define (all-even-odd? lst1 lst2)
 (every2? is-even? is-odd? lst1 lst2))


(test (all-even-odd? (list 2 4 6 8) (list 1 3 5 7)))
(test (all-even-odd? (list 1 3 5 7) (list 2 4 6 8)) => #f)
