;; Well, that was easy.
(define (numbers-until until)
  (let loop ((n 1)
             (lst '()))
    (if (> n until)
        lst
        (loop (+ n 1)
              (append lst (list n))))))

(define (square x) (expt x 2))

(let* ((lst (numbers-until 10))
       (sum-of-squares (apply + (map square lst)))
       (square-of-sum (square (apply + lst)))
       (difference (- square-of-sum sum-of-squares)))
  (begin
    (display difference)
    (newline)))