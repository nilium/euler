;; minimum number of divisors required
(define min-divisors 501)

(define (count-divisors fornum)
  ;; 1 is a special case
  (if (= 1 fornum)
      fornum
      (let loop ((divisor 2)
                 ;; start off terminating at fornum (this decreases with each
                 ;; divisor found, typically)
                 (loop-term fornum)
                 ;; divisor count starts at 2 to account for 1 and fornum
                 (divisor-count 2))
        (let ((div-quot (quotient fornum divisor))
              (div-even? (= 0 (modulo fornum divisor))))
          (if (<= loop-term divisor)
              divisor-count
              (if div-even?
                  ;; evenly divides, is a divisor
                  (loop (+ divisor 1)
                        ;; terminate the loop after the lowest quotient since
                        ;; that's also the largest divisor and already counted
                        (min loop-term div-quot)
                        ;; if the divisor is different from the quotient, it's
                        ;; also a divisor, so count it.
                        (+ divisor-count
                           (if (= divisor div-quot) 1 2)))
                  ;; number doesn't evenly divide, not a divisor
                  (loop (+ divisor 1)
                        loop-term
                        divisor-count)))))))

(begin
  (display
    (let loop ((triangle-sum 1)
               (triangle-next 2))
      (let ((divisor-count (count-divisors triangle-sum)))
        (if (<= min-divisors divisor-count)
            (cons triangle-sum (- triangle-next 1))
            (loop (+ triangle-sum triangle-next)
                  (+ triangle-next 1))))))
  (newline))
