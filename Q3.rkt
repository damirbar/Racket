#lang pl

(define-type KeyStack
  [EmptyKS]
  [Push Symbol String KeyStack])


(: search-stack : Symbol KeyStack -> (U String #f))
(define (search-stack key stack)
  (cases stack
    [(EmptyKS) #f]
    [(Push symbol string stk) (if (eq? key symbol) string (search-stack key stk))]))


(: pop-stack : KeyStack -> (U KeyStack #f))
(define (pop-stack stack)
  (cases stack
    [(EmptyKS) #f]
    [(Push symbol string stk) stk]))
  

(test (EmptyKS) => (EmptyKS))
(test (Push 'b "B" (Push 'a "A" (EmptyKS))) => (Push 'b "B" (Push 'a "A" (EmptyKS))))
(test (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS)))) => (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS)))))
(test (search-stack 'a (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) => "AAA")
(test (search-stack 'c (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) => #f)
(test (pop-stack (Push 'a "AAA" (Push 'b "B" (Push 'a "A" (EmptyKS))))) => (Push 'b "B" (Push 'a "A" (EmptyKS))))
(test (pop-stack (EmptyKS)) => #f)

(test (search-stack 'Dog (Push 'Cat "Meow" (Push 'Cow "Moo" (Push 'Tiger "Roar" (Push 'Owl "OOOOO" (Push 'Dog "Woof!"
 (Push 'Elephant "My memory is infinite" (Push 'Monkey "oo oo ah ah" (EmptyKS))))))))) => "Woof!")





