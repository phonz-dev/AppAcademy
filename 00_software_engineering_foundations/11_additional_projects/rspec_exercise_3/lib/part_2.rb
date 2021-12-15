def element_count(arr)
  arr.reduce(Hash.new(0)) do |el_counts, el|
    el_counts[el] += 1
    el_counts
  end
end

def char_replace!(str, hash)
  str.each_char.with_index do |ch, i|
    if hash.has_key?(ch)
      str[i] = hash[ch]
    end
  end

  str
end

def product_inject(nums)
  nums.inject { |product, num| product * num }
end