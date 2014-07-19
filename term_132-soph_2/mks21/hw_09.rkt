;Problem 1 
(display "1. oneOrThree")
(define (oneOrThree testValue)
  (or (= testValue 1) (= testValue 3)
      )
  ) (newline) ;endofdefinition
;test
(oneOrThree 4) "...should be #f"
(oneOrThree 12) "...should be #f"
(oneOrThree 1) "...should be #t"
(oneOrThree (+ 1 2)) "...should be #t"
(newline)
;Problem 2
(display "2. outside?") 
(define (outside? testValue)
  (or (<= testValue -1) (> testValue 3)
      )
  ) (newline) ;endofdefinition
;test
(outside? 0) "...should be #f"
(outside? -1) "...should be #t"
(outside? 4) "...should be #t"
(outside? 3) "...should be #f"
(newline)
;Problem 3
(display "3. define interval only once") 
(define (inside? testValue)
  (and (> testValue -1) (<= testValue 3))
  ) ; endofpreliminarydefinition
(define (notInside testValue)
  (not (inside? testValue)
       )
  ) (newline) ;endofdefinition
;test
(notInside -1)    "...should be #t"
(notInside -0.7)   "...should be #f"
(notInside 3)     "...should be #f"
(newline)
;Problem 4
(display "4. inside4") 
(define (inside4 testValue)
  (or (< -1 testValue 0.7) (and (< 0.7 testValue) (<= testValue 3))
      )
  ) (newline) ;endofdefinition
;test
(inside4 3) "...should be #t"
(inside4 0.7) "...should be #f"
(inside4 -2) "...should be #f"
(inside4 5) "...should be #f"
(inside4 -1) "...should be #f"
(inside4 0) "...should be #t"
(newline)
;Problem 5
(display "5. outside5")
(define (outside5 testValue)
  (or (<= testValue -1) (= testValue 0.7) (> testValue 3))
  ) (newline) ;endofdefinition
;test
(outside5 0) "...should be #f"
(outside5 -1) "...should be #t"
(outside5 0.7) "...should be #t"
(outside5 4) "...should be #t"
(outside5 2) "...should be #f" 
(newline)
;Problem 6
(display "6. inside6")
(define (inside6 testValue)
  (or (and (> testValue -1) (<= testValue 3)) 
      (and (>= testValue 4) (< testValue 6))
      )
  ) (newline) ;endofdefinition
;test
(inside6 0) "...should be #t"
(inside6 -1) "...should be #f"
(inside6 3.5) "...should be #f"
(inside6 4) "...should be #t"
(inside6 3) "...should be #t"
(inside6 6) "...should be #f"