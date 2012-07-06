(load "util.scm")

;; the target number
(define target 600851475143)

;; determine if fac is a factor of the input number
(define (factor? fac num)
  (= 0 (modulo num fac)))

;; get the factors of a number
(define (factors-of num)
  (let loop ((n 2)
             (results '(1))
             (factored num))
    (cond
      ; case 1: factored = 0
      ((= factored 0) '(0))

      ; case 2: n > factored/2
      ((> n (sqrt factored))
       (if (< 1 factored)
           (append results (list factored))
           results))

      ; case 3: n is a factor
      ((factor? n factored)
       (loop n
             (append results (list n))
             (floor (/ factored n))))

      ; case 4: n is not a factor
      (else
       (loop (if (even? n)
                 (+ n 1)
                 (+ n 2))
             results
             factored)))))

(begin
  (display (last (factors-of target)))
  (newline))
