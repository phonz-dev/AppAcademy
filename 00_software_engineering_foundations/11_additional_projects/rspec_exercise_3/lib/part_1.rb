def is_prime?(num)
  return false if num < 2
  (2...num).none? { |fact| num % fact == 0 }
end

def nth_prime(n)
  prime_tracker = 0
  i = 1

  while prime_tracker < n
    i += 1 
    prime_tracker += 1 if is_prime?(i)
  end

  i 
end

def prime_range(min, max)
  prime_range = []

  i = min

  while i <= max
    prime_range << i if is_prime?(i)
    i += 1
  end
  
  prime_range
end