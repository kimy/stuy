;Problem 1 Increment: Adding one
(display "Problem 1, Increment") (newline)
(define inc (lambda (number)
              (+ number 1)))
;test
(inc 2) (newline)
"... should be 3" (newline)
;Problem 2 Mean-2: Average of 2 numbers
(display "Problem 2,Mean-2") (newline)
(define mean2 (lambda (argmnt1 argmnt2)
                (/ (+ argmnt1 argmnt2) 2)))
;test
(mean2 3 5) (newline)
"...should be 4" (newline)
(mean2 4 5) (newline)
"...should be 4.5" (newline)
;Problem 3 Sum-2: Sum of two numbers
(display "Problem 3, Sum-2") (newline)
(define sum2 (lambda (argmnt1 argmnt2)
               (+ argmnt1 argmnt2)))
;test
(sum2 5 7) (newline)
"...should be 12" (newline)
;Problem 4 Circle-Area: Area of a Circle
(display "Problem 4, Circle-Area") (newline)
(define circle-area (lambda (radius)
                      (* radius radius 3.14159)))
;test
(circle-area 1) (newline) 
"...should be 3.14159" (newline)
(circle-area 2) (newline)
"...should be 12.56636" (newline)
;Problem 5 Distance: Euclidean Distance
(display "Problem 5, Distance") (newline)
(define distance (lambda (x1 y1 x2 y2)
                   (sqrt (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2)))))
;test 
(distance 1 2 4 6) (newline)
"...should be 5" (newline)
(distance 0 0 3 4) (newline)
"...shoudld be 5" (newline)
;Problem 6 getOnesDigit: Extract the Ones Digit
(display "Problem 6, getOnesDigit") (newline)
(define getOnesDigit (lambda (myNumber)
                       (modulo myNumber 10)))
;test
(getOnesDigit 125) (newline)
"...should be 5" (newline)
(getOnesDigit 51239) (newline)
"...should be 9" (newline)
(getOnesDigit 2) (newline)
"...should be 2" (newline)
;Problem 7 getTensDigit; Extract the Tens Digit
(display "Problem 7, getTensDigit") (newline)
(define getTensDigit (lambda (myNumber)
                       (- (modulo myNumber 100) (modulo myNumber 10))))
;test 
(getTensDigit 125) (newline)
"...should be 2" (newline)
(getTensDigit 51239) (newline)
"...should be 3" (newline)
(getTensDigit 2) (newline)
"...should be 0" (newline)
;Problem 8 getNthDigit: Retrive the Nth Digit of a Number
(display "Problem 8, getNthDigit") (newline)
(define getNthDigit (lambda (myNumber n)
                      (getOnesDigit (quotient myNumber (expt 10 (- n 1))))))
;test
(getNthDigit 45227 1) (newline)
"...should be 7" (newline)
(getNthDigit 15226 4) (newline)
"...should be 5" (newline)
(getNthDigit 25 3) (newline)
"...should be 0" 

