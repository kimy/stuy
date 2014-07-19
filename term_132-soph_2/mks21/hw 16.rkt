(display "Problem: listReverse") (newline)
;start definition 

(define (listReverse L) 
  
  ; for debugging
  (display "in listReverse") (newline) 
  (display "   L =" ) (display L) (newline)
  
  ;base case
  (if (<= (length L) 1) L
      
     ;recursive case
      (append (listReverse (cdr L)) (list (car L)))
      )
  ) ;end of define

;test 
;thanks to Kevin Yan
(listReverse '(a)) "...should be (a)"
(listreverse '(a b)) "...should be (b a)"
(listReverse '(a b c)) "...should be (c b a)"
(listReverse '(a (b c) d)) "...should be (d (b c) a)"
(listReverse '() ) "...should be ()"

;-----------------------------------------------------------
(display "Problem: Towers of Hanoi")

;start definition
(define (ToH disks) 
  
  ; for debugging
  (display "in ToH") (newline)
  (display "   disks =") (display disks) (newline)
  
  ;base case
  (if (= disks 0) 0    
      ;2nd base case
      (if (= disks 1) 1 
          ;recursive case
          (+ 1 (* 2 (ToH (- disks 1))))  
      )
  )
) ; end of define

;test Thanks to Piazza
(ToH 1) "...should be 1"
(ToH 2) "...should be 3"
(ToH 3) "...should be 7"
(ToH 4) "...should be 15"
(ToH 5) "... should be 31"
(ToH 10) "... should be 1023"
(ToH 64) "... should be 18446744073709551615"


