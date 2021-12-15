def proper_factors(num)
  (1...num).select { |divisor| num % divisor == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(num)
  perfect_numbers = []
  i = 6

  while perfect_numbers.length < num
    perfect_numbers << i if perfect_number?(i)
    i += 1
  end

  perfect_numbers
end