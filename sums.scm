(load "util.scm")

(define (numbers-until min step max)
  (let loop ((numbers '())
             (current min))
    (if (< current max)
        (loop (append numbers (list current))
              (+ current step))
        numbers)))

(pp
  (let ((threes (numbers-until 0 3 1000))
        (fives (numbers-until 0 5 1000)))
    (apply + (distinct (append threes fives)))))
