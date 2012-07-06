;; a + b + c = 1000
;; iterate through a
;; iterate through b
;; c = 1000 - (a + b)

(define (is-pythagorean? a b c)
  (= (+ (expt a 2) (expt b 2)) (expt c 2)))

(define (triplet-b a)
  (let loop ((b-iter (+ a 1)))
    (let ((c (- 1000 a b-iter)))
      (cond
        ((< c b-iter) (cons #f 0))
        ((is-pythagorean? a b-iter c) (cons #t b-iter))
        (else (loop (+ b-iter 1)))))))

(define (triplet-a)
  (let loop ((a-iter 1))
    (let* ((res (triplet-b a-iter))
           (resbit (car res))
           (b (cdr res))
           (c (- 1000 b a-iter)))
    (if resbit
        (list a-iter b c)
        (loop (+ a-iter 1))))))

(begin
  (display (apply * (triplet-a)))
  (newline))