#lang pl

#|

Question 3:

Solution description:
In this solution I created the functions which I was asked to implement.
First, I defined the new type, KeyStack, with two variants:
- EmptyKS - which represents an empty stack, with no data.
- Push - which represents a cell within a stack. It has key (Symbol), value (String) and the next cell (which is a variant of KeyStack).

The methods:

1) search-stack:
   Input: A symbol and a KeyStack.
   Output: A combination of a string and the value False.
   Operation: This function checks if the given KeyStack is of the variant "EmptyKS". If it is then it means we have reached the
     bottom of the stack and have not found the key. If it isn't then we check if the key equals to the current symbol of the
     KeyStack. If it is then we will return it, otherwise we will search the next stack recursively.

2) pop-stack:
   Input: A KeyStack.
   Output: A combination of a KeyStack and the value False.
   Operation: This function checks if the given KeyStack is of the variant "EmptyKS". If it is then it means that the given stack
     is empty. In that case we will return false. If it isn't then we return the inner stack, which is like popping, because the
     inner stack has everything the given stack has, but the top element.

|#

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





