def palindrome?(str)
  reversed_str = reverse_string(str)
  str == reversed_str
end

def reverse_string(str)
  return "" if str.empty?
  str[-1] + reverse_string(str[0...-1])
end

def substrings(str)
  substrings = []

  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
      substrings << str[start_idx..end_idx]
    end
  end

  substrings
end

def palindrome_substrings(str)
  substrings = substrings(str)
  substrings.select { |str| palindrome?(str) && str.length > 1 }
end