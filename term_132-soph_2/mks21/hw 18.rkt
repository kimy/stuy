(display "Problem 0: Fibonacci Number") (newline)
(define (Fibonacci n)
  (cond
    ;just to narrow things down more 
    ((<= n 0) 0)
    ;base case
    ((= n 1) 1)
    ;base case
    ((= n 2) 1)
    ;recursive case
    (else (+ (Fibonacci (- n 1)) (Fibonacci (- n 2))))
    )
  ) ;end of define
;test
(Fibonacci 18) "...should be 2584"
(Fibonacci 7) "...should be 13"
(Fibonacci 1) "...should be 1"
(Fibonacci 2) "...should be 1"
;---------------------------------------------------------

(display "Problem 1: Range") (newline)
(define (range count)
  ; base case
  (if (= count 0) '() 
      ;recursive case
      (append (range (- count 1)) (list (- count 1))
              )
      )
  ) ;end of define
;test Thanks to Stacey Wong
(range 0)  "...should be ()"
(range 1)  "...should be (0)"
(range 5)  "...should be (0 1 2 3 4)"
(range 18) "...should be (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17)"
;------------------------------------------------------------

(display "Problem 2: Flatten") (newline)
(define (flatten L) 
  ;base case
  (if (null? L) '() 
     (append 
      (if (list? (car L)) 
          ;recursive case 
          (flatten (car L)) 
          ;recursive case
          (list (car L)))   
               (flatten (cdr L))
               )
     )
  ) ;end of define
; tests
(flatten '( a b c))  "...should be (a b c)"
(flatten '( a (b c) d))  "...should be (a b c d)"
(flatten '( a (b (c) d) e))  "...should be (a b c d e)"
(flatten '(a () b))  "...should be (a b)"

;-----------------------------------------------------------------
(display "Problem 3: Range With Cons") (newline)
(define (rangeViaCons count)
  ; base case
  (if (= count 0) '( ) 
      ;recursive case
    (reverse (cons (- count 1) (reverse (rangeViaCons (- count 1)))))
    )
  ) ;end of define 

; tests
(rangeViaCons 0)  "...should be ()"
(rangeViaCons 1)  "...should be (0)"
(rangeViaCons 5)  "...should be (0 1 2 3 4)"
(rangeViaCons 18) "...should be (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17)"

