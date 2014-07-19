; problem 1
(define phi ( / (+ 1 (sqrt 5)) 2))
; problem 2 
(define psi ( / (- 1 (sqrt 5)) 2))
; problem 3
(define n 8)
(define F8 ( / (- (expt phi n) (expt psi n)) (sqrt 5))) 
(display F8) (newline)
; problem 4 
(define n 10) 
(display F8) (newline) ; the value of F8 did not change.
(define F10 ( / (- (expt phi n) (expt psi n)) (sqrt 5)))
(display n) (newline)
(display F10) (newline)
; problem 5
(+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))) (newline) ; yields the accepted value
(+ 1.0 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))) (newline) ; floating point numbers
(+ 1.0 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (/ 1 1))))))))))) ; two more divisions
