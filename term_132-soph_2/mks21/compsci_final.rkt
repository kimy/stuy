
(define (find_power number base)
  (floor (/ (log number) (log base)))
  )

;get the ones digit of the number, n
(define (getOnesDigit n (modulo n 10)))

;get the Nth digit of a number  
(define (getNthDigit myNumber n) 
   (getOnesDigit (quotient myNumber (expt 10 (- n 1)))))

;get the base 10 of the number in a given base 
(define (getBase10 number base)
  (if (<= 0 number 9)
      number
      (+ (* (getNthDigit number (+ (find_power number 10) 1)) 
            (expt base (find_power number 10))) 
         (getBase10 (- number 
                       (* (getNthDigit number (+ (find_power number 10) 1))
                          (expt 10 (find_power number 10))
                          ))
                    base)
         )
      )
  )

;from base 10 convert a number to a different base 
(define (fromBase10 number base)
  (if (= (find_power number base) 0)
      number
      (+ (* 10 (fromBase10 (quotient number base) base)) (modulo number base)) 
      )
  )
(find_power 37 6)
(find_power 37 10)
(find_power 7 6)
(find_power 7 10)
(* (getNthDigit 37 (+ (find_power 37 10) 1)) 
            (expt 6 (find_power 37 10)))
(* (getNthDigit 7 (+ (find_power 7 10) 1)) 
            (expt 6 (find_power 7 10))) 
(getBase10 (- 37 
                       (* (getNthDigit 37 (+ (find_power 37 10) 1))
                          (expt 10 (find_power 37 10))
                          ))
                    6)
(getBase10 37 6)
(fromBase10 18 3)

;Change of Base
(define (changeBase number base1 base2)
    (fromBase10 (getBase10 number base1) base2)
    )

(changeBase 6 10 2) "...should be 110" ; -> 110 (converted 6 from base 10 to base 2)
(changeBase 110 2 10) "...should be 6" ; -> 6 (converted 110 from base 2 to base 10)
(changeBase 110 2 3) "...should be 20" ; -> 20 (converted 110 from base 2 to base 3)
