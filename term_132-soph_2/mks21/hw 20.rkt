(display "Problem: Digit to Number") (newline)
(define (digit_to_number L)
  ;base case
  (if (null? L) 0
      (if (= (length L) 1) (car L)
      ;recursive case
      (+ (* (car L) (expt 10 (- (length L) 1))) 
         (digit_to_number (cdr L))
         )
      )
  )
  );end of define
;test
(digit_to_number '(2 0 1 4)) "...should be 2014"
(digit_to_number '(1 2 3)) "...should be 123"
(digit_to_number '( )) "...should be 0"
(digit_to_number '(1)) "...should be 1"

(display "Problem: Number to Digits") (newline)
;definition
(define (number_to_digits myNumber)
  ;base case
   (if (= myNumber 0) '( )
       ;recursive case
      (if (> myNumber 0) 
          (append (number_to_digits (quotient myNumber 10)) (list (modulo myNumber 10)))
          ;special recursive case
          (cons (* -1 (car (number_to_digits (* -1 myNumber)))) 
                (cdr (number_to_digits (* -1 myNumber))))
          )
      )
  ); end of define
;test
(number_to_digits -2453) "...should be (-2 4 5 3)"
(number_to_digits 257) "...should be (2 5 7)"
(number_to_digits 0) "...should be ( )"
(number_to_digits -1) "...should be (-1)"
(number_to_digits -123) "...should be (-1 2 3)"