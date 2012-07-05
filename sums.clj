(defn numbers-until [min step max]
  (loop [numbers []
         current min]
    (let [next (+ current step)]
         (if (< current max)
           (recur (conj numbers current)
                  next)
           numbers))))

(println
 (let [threes (numbers-until 0 3 1000)
       fives  (numbers-until 0 5 1000)]
      (let [combined (distinct (concat threes fives))]
           (apply + combined))))