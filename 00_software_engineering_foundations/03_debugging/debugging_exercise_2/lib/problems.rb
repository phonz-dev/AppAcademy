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

def unique_chars?(str)
  seen = []

  str.each_char do |char|
    return false if seen.include?(char)
    seen << char
  end

  true
end

def dupe_indices(arr)
  arr_indices = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index { |el, i| arr_indices[el] << i }
  arr_indices.select { |k, v| v.length > 1 }
end

def ana_array(arr_1, arr_2)
  el_counts_1 = get_element_counts(arr_1)
  el_counts_2 = get_element_counts(arr_2)

  el_counts_1 == el_counts_2
end

def get_element_counts(arr)
  arr.inject(Hash.new(0)) do |hash, el|
    hash[el] += 1
    hash
  end
end
