(display "Problem: Last Element") (newline)
;Song of Recursion
(display "Song of Recursion") (newline)
(display "The question is how to find the last element of a list of n elements, 
 If i could solve this problem for a list with n-1 elements, 
 I know how to use that ability to solve for the last element for a list with n elements.
 I first the cdr of the n elements and keep going
 I know how to find the last element of a list of 1 element." )
 ;end of song of recursion 
(newline)
(newline)
;definition 
(define (lastElement L)
  (if (= (length L) 1) 
      (car L)
      (lastElement (cdr L))
      )
  ) ;end of define
;test 
(lastElement '(3 2 1 liftoff) )  "...should be liftoff"
(lastElement '(mks21))  "...should be mks21"
(lastElement '(first (last element is a sublist)) )  "...should be (last element is a sublist)"
(newline)
;Trace Diagram
(display "Trace Diagram for (lastElement '(zero one two three))") 
"...should be three" 
"Step 1: (lastElement '(one two three))" 
"Step 2: (lastElement '(two three))" 
"Step 3: (lastElement '(three))" 
"Step 4: >three" ;end of trace diagram
(newline)
(newline)


(display "Problem: All But Last") (newline)
;Song of Recursion 
(display "Song of Recursion") (newline)
(display "The question is how to find the list of all but the last element of a list of n elements, 
 If i could solve this problem for a list with n-1 elements, 
 I know how to use that ability to solve for the list of all elements but the last element.
 I first the first element of the list of n elements
 and pair it with the all but last list of n-1 element. 
 I know how to find the allButLast list of a list of 1 element.");end of song of recursion
(newline)
;definition
(define (allButLast inputList)
  (if (>  (length inputList) 1)
      (cons (car inputList) (allButLast (cdr inputList)))
      (cdr inputList)
      )
  ); end of define
;test
(allButLast '(3 2 1 liftoff))  "...should be (3 2 1)"
(allButLast '(mks21))  "...should be null list"
(allButLast '((sublists ok) omega ))  "...should be (sublists ok)"
(newline)

;Trace Diagram
(display "Trace Diagram for (allButLast '(zero one two three))") (newline)
(allButLast '(zero one two three)) "...should be '(zero one two three)"
"Step 1: (cons zero (allButLast '(one two three)))" 
"Step 2: (cons zero (cons one (allButLast '(two three))))" 
"Step 3: (cons zero (cons one (cons two (allButLast (three)))))" 
"Step 4: (cons zero (cons one (cons two ())))" 
"Step 5: (cons zero (cons one '(two)))" 
"Step 6: (cons zero '(one two))" 
"Step 7: > '(zero one two)" (newline)
 ;end of trace diagram

