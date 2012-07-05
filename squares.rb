#!/usr/bin/env ruby
r = Range.new 1, 100
sum_of_squares = r.reduce(0) { |m, i| m + (i ** 2) }
square_of_sum = (r.reduce(0) { |m, i| m + i }) ** 2

puts square_of_sum - sum_of_squares