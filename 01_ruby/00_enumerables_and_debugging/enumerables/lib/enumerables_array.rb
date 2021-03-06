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

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |a, b| a <=> b }

    not_sorted = true

    while not_sorted
      not_sorted = false

      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          not_sorted = true
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  def my_each(&prc)
    self.length.times { |i| prc.call(self[i]) }
    self
  end

  def my_map(&prc)
    mapped = []
    self.length.times { |i| mapped << prc.call(self[i]) }
    mapped
  end

  def my_select(&prc)
    selected = []
    self.my_each { |el| selected << el if prc.call(el) }
    selected
  end

  def my_inject(&prc)
    acc = self[0]
    (1...self.length).each do |i|
      acc = prc.call(acc, self[i])
    end
    acc
  end
end

def concatenate(strings)
  strings.inject("") { |acc, str| acc += str }
end