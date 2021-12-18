def factors(n)
  return [1, n] if is_prime?(n)
  (1..n).select { |divisor| n % divisor == 0 }
end

def is_prime?(n)
  return false if n < 2
  (2...n).none? { |divisor| n % divisor == 0 }
end

def subwords(string, words)
  substrings = get_substrings(string)
  substrings
            .select { |str| words.include?(str)}
            .uniq
end

def get_substrings(string)
  substrings = []

  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      substrings << string[start_idx..end_idx]
    end
  end

  substrings
end

def doubler(nums)
  nums.map { |num| num * 2 }
end
