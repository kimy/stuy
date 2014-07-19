(display "Problem0: Get High Order Digit Base10") (newline)
;start definition
(define (getHighOrderDigit_10 myNumber)
  
  ;for debugging
  ;(display "in getHighOrderDigit_10") (newline)
  ;(display " myNumber =") (display myNumber) (newline)
  
  ;base case
  (if (and (<= 0 myNumber) (< myNumber 10)) myNumber
      
      ;recursive case
      (getHighOrderDigit_10 (quotient myNumber 10))
      )
  );end of define

;test Thanks to Vivian Li
(getHighOrderDigit_10 21354234) "...should be 2"
(getHighOrderDigit_10 0) "...should be 0"
(getHighOrderDigit_10 2) "...should be 2"
(getHighOrderDigit_10 11) "...should be 1"

;----------------------------------------------------------

(display "Problem1 Get High Order Digit Base 6") (newline)
;start code
(define (getHighOrderDigit_6 myNumber)
  
  ;for debugging
  ;(display "in getHighOrderDigit_6") (newline)
  ;(display "myNumber =") (display myNumber) (newline)
  
  ;base case 
  (if (< myNumber 6) myNumber
      
      ;recursive case
      (getHighOrderDigit_6 (quotient myNumber 6)) 
      )
  ) ;end of define

;test 
(getHighOrderDigit_6 13) "...should be 2"
(getHighOrderDigit_6 10) "...should be 1" 

;-------------------------------------------------------
(display "Problem2: Test Cases for Functions")

; max function
(display "max function test cases")
(newline)
(max 6 48 32.15 102)
"...should be 102"
(max -100 -40 -23 -3)
"...should be -3"
(newline)

; min function
(display "min function test cases")
(newline)
(min 2 3 4 5 6 7 8)
"...should be 2"
(min 12 24 5 57 6)
"...should be 5"
(newline)

; odd? function
(display "odd? function test cases")
(newline)
(odd? 4567921)
"...should be #t"
(odd? 58)
"...should be #f"
(newline)

; even? function
(display "even? function test cases")
(newline)
(even? 57)
"...should be #f"
(even? 12345744356890)
"...should be #t"