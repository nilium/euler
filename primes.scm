(define target 10001)

;; returns true if any of the factors in facs are a factor of num
(define factors?
 (lambda (facs num)
  (let loop ((facs-iter facs))
   (cond
    ((null? facs-iter) #f)
    ((= 0 (modulo num (car facs-iter))) #t)
    (else (loop (cdr facs-iter)))))))

(begin
  (display (car
   (let loop ((prime-count 1)
              (primes '(2))
              (n 3))
     (if (< prime-count target)
       (let ((is-prime (not (factors? primes n))))
       (begin
         ;(if is-prime (pp (list (+ 1 prime-count) n)))
         (if is-prime
             (loop (+ prime-count 1)
                   (cons n primes)
                   (+ n 2))
             (loop prime-count
                   primes
                   (+ n 2)))))
         primes))))
  (newline))
