(display "Problem: isPrefix?") (newline)
(define (isPrefix? Submaybe Main)
  (cond 
    ;base case 
    ((null? Submaybe) #t)
    ;special case
    ((and (= 1 (length Submaybe)) (equal? Submaybe (list (car Main)))) #t)  
    ;recursive case 
    ((and (<= (length Submaybe) (length Main)) (equal? (list (car Main)) (list (car Submaybe)))
         (isPrefix? (cdr Submaybe) (cdr Main))) #t)
    ;what the function will return for everything else
    (else #f)
   )
) ;end of define

;test
(isPrefix? '( ) '(a b c))  "...empty; should be #t"  ; the null list is a prefix of every list
(isPrefix? '(a) '(a b c))  "...single-element; should be #t"

(define L '(use a list bound to an identifier to we can use the same list twice))
(isPrefix? L L)  "...reflexive; should be #t"

(isPrefix? '(a b) '(a b c))  "...typical; should be #t"
(isPrefix? '(a b c) '(a b))  "...not commutative; should be #f"  ;  prefix can't be longer

; sub-lists, thanks to Jong In (Dan) Kim
(isPrefix? '(1 (2 3 4)) '(1 (2 3 4) 5)) "...sub-list; should be #t"
(isPrefix? '(1 (2 3)) '(1 (2 3 4) 5) )   "...sub-list mismatch; should be #f"

;understanding the LIST? function
(list? (cons 1 '(2 3 4 5))) "... should be #t"
(list? (car '(Yubin Kim))) "... should be #f"
