;hw_13
(display "Problem: Get Element") (newline)
;Song of Recursion
(display "Song of Recursion") (newline)
"The question is how to get the nth Element of a list.
If I could get the n-1th element of a lsit, I know that I can find the nth element of a list.
I can do this by decreasing the list and number of element by one every time.
I know how to solve this problem when n=0 by taking the car of the list."
;Definition
(define (getElement List nElement)
  ;base Case 
  (if (= nElement 0) (car List)
      ;Recursive case
      (getElement (cdr List) (- nElement 1))
      )
  ) ;end of define 
;test
(getElement '(Brooks Dyrland-Weaver Brown Zamansky) 2) "...should be Brown"
(getElement '(0 1 2 3 4 5 6) 0) "...should be 0"
(getElement '(the cold (never bothered) me anyways) 4) "...should be anyways"

;--------------------------------------------------------------------------
(display "Problem: Ax Element") (newline)
;Song of Recursion
(display "Song of Recursion") (newline)
"The question is how to extract the nth element of a list. 
If I could extract the n-1 element of a lsit, I know that I can extract the nth element of a list.
I can do this by decreasing the list and number of element by one every time.
I know how to solve this problem when n=0 by taking the cdr of this list."
;Definition
(define (axElement L n)
  ;base case
  (if (= n 0) (cdr L)
      ;recursive case
      (cons (car L) (axElement (cdr L) (- n 1)))
      )
  ) ;end of define
;test
(axElement '(Brooks Dyrland-Weaver Brown Zamansky) 2) "...should be (Brooks Dyrland-Weaver Zamansky)"
(axElement '(0 1 2 3 4 5 6) 0) "...should be (1 2 3 4 5 6)"
(axElement '(let the storm rage on) 4) "....should be (let the storm rage)"