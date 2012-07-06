# quicky function for determining if F is a factor of N
def factors_into(f, n):
  return (f % n) == 0

def factors_of(num):
  # empty lists for empty people like you
  factors = []

  # just in case it's a negative number, factor out -1
  if num < 0:
    factors.append(-1)
    num = -num
  else:
    factors.append(1)

  # special case: 2 is an unfriendly prime number, write a special loop
  # just for its stupid ass.
  while factors_into(num, 2):
    factors.append(2)
    num /= 2

  # start other factoring at 3
  f = 3
  while num > 1:
    # factor the bitchbag down
    while factors_into(num, f):
      factors.append(f)
      num /= f
    # increment by two because there are guaranteed to be no even
    # factors after checking for all factors of 2
    f += 2

  # done
  return factors
# /factors_of

largenum = 600851475143
print(factors_of(largenum))
