;HW10 (My Problem)
(display "Summer-Olaf") (newline)
(define Summer '((Winter’s a good time to stay in and cuddle) But put me in summer and I’ll be a (happy snowman!))
  )
(display "extract- 'summer'") (newline) ;putanswerhere
(car (cddddr (cdr Summer))) ;answers
(newline)

;Problem 1: Break-Alina Sheikh 
(display "break") (newline)
(define SpringBreak '(Oh my goodness only (four more days) until Spring Break))
(display "extract 'more' : ") ; put answer here
(cadr (car (cddddr SpringBreak))) ;answer
(newline)

; Problem 2: Do You Want to Build A Snowman?-Larisa Jiao
(display "Do You Want to Build A Snowman?") (newline)
(define BuildASnowman '(Do you want to (build) a snowman?))
(display "extract 'build' : ") ; put answer here
(caar (cddddr BuildASnowman)) ;answer
(newline)

;Problem 3: looking for alaska-Hayoung Ahn
(display "Sometimes you lose a battle but mischief always wins the war") (newline)
(define johngreen '(Sometimes you lose a battle (but mischief always wins the war)))
(display "extract 'battle': ") ; put answer here
(car (cddddr johngreen)) ;answer
(newline)

;Problem 4: Cookie Monster- Hyun Su Kim
(display "CookieMonster")
(newline)
(define Friend '(( me (say (a friend is) someone) to share) last cookie with))
(display "Extract 'friend': ") ;put asnwer here
(cadr (cadr (cadr (car Friend))))
(newline)

;Problem 5: Anna Karenina -Rebecca You
(display "Anna Karenina") (newline)
(define Tolstoy '(Each (unhappy) family (is unhappy (in)) its own way. ))
(display "extract 'in': ") ; put answer here
(car (caddr (cadddr Tolstoy)))
(newline)