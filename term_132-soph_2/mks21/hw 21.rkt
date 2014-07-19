(display "Problem 0: Linear Search Time") (newline) 
(define (linearSearchTime maxPage)
  ;base case
  (if (= maxPage 1) 1
      ;recursive case
      (+ 1 (linearSearchTime (- maxPage 1)))
      ) 
  ) ; end of define

;test
(linearSearchTime 111) "...should be 111"
(linearSearchTime 20) "...should be 20"
(linearSearchTime 570) "...should be 570"
(linearSearchTime 1126) "...should be 1126"

(display "Problem 1: Binary Search Time") (newline) 
(display "binarySearchTime") (newline)
(define (binarySearchTime maxPage)
  ;base case 
  (if (= maxPage 1) 0
      ;recursive case
      (+ 1 (binarySearchTime (/ maxPage 2))
         ) 
      )
  ) ; end of define

;test 
(binarySearchTime 1) "...should be 0"
(binarySearchTime 16) "...should be 4"
(binarySearchTime 2048) "...should be 11"
(binarySearchTime 512) "...should be 9"

(display "Problem 3: Logs") (newline)
(define (logBinary maxPage)
  ;base case
  (if (= maxPage 1)
      (/ (log maxPage) (log 2)) 
      ;recursive case
  (+ 1 (logBinary (/ maxPage 2))) 
)
  )
(logBinary 1) "...should be 0"
(logBinary 16) "...should be 4"
(logBinary 2048) "...should be 11"
(logBinary 512) "...should be 9"

