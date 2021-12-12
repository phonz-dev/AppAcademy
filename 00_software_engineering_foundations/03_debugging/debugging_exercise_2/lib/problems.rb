# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  num.downto(2) do |i|
    if is_prime?(i) && num % i == 0
      return i
    end
  end
  
  num
end

def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end