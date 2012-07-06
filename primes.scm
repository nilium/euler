;; target is two million
(define target 2000000)

;; brute force prime test
;; unfortunately faster than the clever solution.
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
