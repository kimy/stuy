;Problem 1
(display "Problem 1: my-abs") (newline)
(define my-abs (lambda (myNumber)
                 (if (> myNumber 0) myNumber (- myNumber))
                 )
  )
;test
(my-abs -9)
"...should be 9"
(my-abs 48.3)
"...should be 48.3"
;Problem 2
(display "Problem 2: Max of Two Numbers") (newline)
(define max2 (lambda (a b) 
               (if (> a b) a b)
               )
  )
;test
(max2 3 5)
"...should be 5"
(max2 15 13)
"...should be 15"
;Problem 3
(display "Problem 3: Max of Three Numbers") (newline)
(define max3 (lambda (a b c)
               (max2 (max2 a b) c) 
               )
  )
;test
(max3 4 7 3)
"...should be 7"
(max3 8 9 9)
"...should be 9"
;Problem 4
(display "Problem 4: Two-Part Function") (newline)
(define two (lambda (x)
              (if (<= x 3) 12 (* 4 x)
                  )
              )
  )
;test
(two 1)
"...should be 12"
(two 10)
"...should be 40"
;Problem 5
(display "Problem 5: Three-part Function") (newline)
(define three (lambda (w)
                (if (< w 0) (- 1) 
                    (if (<= 0 w 4) 3.5 7)
                    )
                )
  )
;test
(three -2)
"...should be -1"
(three 3)
"...should be 3.5"
(three 20)
"...should be 7"
;Problem 6
(display "Problem 6: Max of Four Numbers") (newline)
(define max4 (lambda (a b c d)
               (max3 (max2 a b) (max2 c d) (max2 b c))
               )
  )
;test 
(max4 1 4 6 9)
"...should be 9"
(max4 8 2 5 7)
"...should be 8"
(max4 1 57 24 32)
"...should be 57"
;Problem 7
(display "Problem 7: Three-Part Function (2)") (newline)
(define three-cond (lambda (w) 
                      (cond
                  ((< w 0) (- 1))
                  ((<= 0 w 4) 3.5)
                  (else 7)
                  )
                )
  )
;test
(three-cond -2)
"...should be -1"
(three-cond 3)
"...should be 3.5"
(three-cond 20)
"...should be 7"
;Problem 8
(display "Problem 8: Smallest Divisor") (newline)
(define smallest-div (lambda (myNumber)
                       (cond 
                         ((= myNumber 2) 2)
                         ((= myNumber 3) 3)
                         ((= myNumber 4) 2)
                         ((= myNumber 5) 5)
                         ((= myNumber 6) 2)
                         ((= myNumber 7) 7)
                         ((= myNumber 8) 2)
                         ((= myNumber 9) 3)
                         ((= myNumber 10) 2)
                         )
                       )
  )
;test
(smallest-div 4)
"...should be 2"
(smallest-div 5)
"...should be 5"
(smallest-div 6)
"...should be 2"
(smallest-div 9)
"...should be 3"