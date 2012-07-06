;; target is two million
(define target 2000000)

;; returns true if any of the factors in facs are a factor of num
(define factors?
 (lambda (facs num)
  (let loop ((facs-iter facs))
   (cond
    ((null? facs-iter) #f)
    ((= 0 (modulo num (car facs-iter))) #t)
    (else (loop (cdr facs-iter)))))))

(define (prime? num)
  (and (< 0 (modulo num 2))
       (let ((term (sqrt num)))
         (let loop ((iter 3))
           (cond
            ((< term iter) #t)
            ((< 0 (modulo num iter))
             (loop (+ iter 2)))
            (else #f))))))

(begin
  (display
    (let loop ((n 3)
               (sum 2))
      (if (< n target)
        (let ((is-prime (prime? n)))
        ; (begin
          ; (if is-prime (pp n))
          (loop (+ n 2)
                (if is-prime
                    (+ sum n)
                    sum)))
          sum)))
  (newline))
