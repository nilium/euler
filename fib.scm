;; simple looping fibonacci function
(define (fib n)
  (cond ((= n 0) 0)
        (else (let loop ((left 0)
                         (right 1)
                         (trip n))
                (cond ((<= trip 0) left)
                      (else (loop right
                                  (+ left right)
                                  (- trip 1))))))))

;; Why I did this as a recursive lambda instead of just a function is
;; beyond me. Hell, didn't even need to be recursive.
(letrec ((fibset
          (lambda (x lst)
            ;; get the x'th fibonacci number
            (let ((xfib (fib x)))
              ;; if it's greater than 4 million, we're done
              (if (> xfib 4000000)
                  lst
                  ;; otherwise go deeper
                  (fibset (+ x 1)
                          ;; only append to lst if the term is even
                          (if (even? xfib)
                              (append lst (list xfib))
                              lst))))))) ;fibset
  (pp (apply + (fibset 1 '()))))

;; This could be improved, slightly, by modifying the fib function to
;; build the evens list in a single call. would have to remove the
;; argument, maybe turn it into the terminal number (four million in
;; this case), but otherwise it's possible to do it all in one thing.
;; I just like the way this works more -- more readable.. sort of.