;; Selects objects from the list for which the predicate isn't false.
;; Example:
;; (select (lambda (x) (> x 15))
;;         '(5 10 15 20 25 30))     =>    (20 25 30)
(define (select predicate lst)
  (let loop ((build '())
             (sub lst))
    (if (null? sub)
        build
        (let ((head (car sub)))
          (loop (if (predicate head)
                    (append build (list head))
                    build)
                (cdr sub))))))

;; Selects objects from the list for which the predicate is false.
;; Same as taking any (select) call and wrapping the entire predicate
;; body in a (not).
(define (reject predicate lst)
  (select (lambda (x) (not (predicate x))) lst))

;; Determines if an object is a member of a list.
;; For example:
;; (member? 2 '(3 2 1))    =>    #t
;; (member? 4 '(3 2 1))    =>    #f
(define (member? item lst)
  (if (null? lst)
      ;; Nothing is a member of a null list
      #f
      ;; Otherwise, loop through the list testing each (member) result
      ;; for equality.
      (let loop ((res (member item lst)))
        ;; test if (member) returns #f when nothing is found.
        (cond ((or (null? res) (not res)) #f)
              ((equal? (car res) item) #t)
              (else (loop (member item res)))))))

;; Returns a list of all distinct members of the input list.
;; e.g., (distinct '(1 1 2 2 3 3 4 4))    =>    (1 2 3 4)
(define (distinct lst)
  (if (not (null? lst))
      (let loop ((distinct-lst '())
                 (sub lst))
        (if (null? sub)
            distinct-lst
            (let ((head (car sub)))
              (loop (if (member? head distinct-lst)
                        distinct-lst
                        (append distinct-lst (list head)))
                    (cdr sub)))))))
