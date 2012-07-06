(define target 10001)

;; determine if fac is a factor of the input number
(define (factor? fac num)
  (< 0 (modulo num fac)))

;; returns true if any of the factors in facs are a factor of num
(define (factors? facs num)
  (if (not (null? facs))
      (let loop ((facs-iter facs))
       (cond
        ((null? facs-iter) #f)
        ((= 0 (modulo num (car facs-iter))) #t)
        (else (loop (cdr facs-iter)))))))

;; Tests the number against other primes
(define (prime? num divisors)
  (not (factors? divisors num)))

(begin
  (display (car
   (let loop ((prime-count 1)
              (primes '(2))
              (n 3))
     (if (< prime-count target)
       (let ((is-prime (prime? n primes)))
       (begin
         ;(if is-prime (pp (list (+ 1 prime-count) n)))
         (loop (if is-prime
                   (+ prime-count 1)
                   prime-count)
               (if is-prime
                   (cons n primes)
                   primes)
               (+ n 2))))
         primes))))
  (newline))
