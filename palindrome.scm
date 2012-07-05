(define (palindrome? num)
 ;; probably safe to ignore non-numbers
 (if (number? num)
     (let* ((numstr (number->string num))
            (numlen (string-length numstr))
            (halflen (floor (/ numlen 2))))
          (let ((left (string->list (substring numstr 0 halflen)))
                (right (reverse
                        (string->list
                         (substring numstr
                                    ;; ignore middle digits
                                    (if (even? numlen)
                                        halflen
                                        (+ halflen 1))
                                    numlen)))))
           (equal? left right)))))

(define (get-palindrome-y x)
 (let loop ((y-iter 999))
  (let ((res (* x y-iter)))
   (if (palindrome? res)
       (cons #t res)
       (if (> y-iter 99)
           (loop (- y-iter 1))
           (cons #f 0))))))

(define (get-palindrome)
 ;; store the max palindrome since the first product isn't guaranteed
 ;; to be the largest product.
 (let loop ((x-iter 999)
            (max-pal 0))
  (let* ((res (get-palindrome-y x-iter))
         (resnum (cdr res))
         (resbit (car res)))
   (if (> x-iter 99)
       (loop (- x-iter 1)
             (if (and resbit (> resnum max-pal))
                 resnum
                 max-pal))
       max-pal))))

(begin
  (display (get-palindrome))
  (newline))