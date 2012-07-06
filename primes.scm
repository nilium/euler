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

(begin
  (display
    (let loop ((primes '(2))
               (n 3)
               (sum 2))
      (if (< n target)
        (let ((is-prime (not (factors? primes n))))
        ; (begin
          ; (if is-prime (pp n))
          (if is-prime
              (loop (cons n primes)
                    (+ n 2)
                    (+ sum n))
              (loop primes
                    (+ n 2)
                    sum)))
          sum)))
  (newline))
