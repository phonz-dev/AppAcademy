def factors(n)
  return [1, n] if is_prime?(n)
  (1..n).select { |divisor| n % divisor == 0 }
end

def is_prime?(n)
  return false if n < 2
  (2...n).none? { |divisor| n % divisor == 0 }
end