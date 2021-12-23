#Problem 1: 

def sum_recur(array)
  return 0 if array.empty?
  array.first + sum_recur(array[1..-1])
end

#Problem 2: 

def includes?(array, target)
  return false if array.empty?
  return true if array.first == target
  includes?(array[1..-1], target)
end

# Problem 3: 

def num_occur(array, target)
end

# Problem 4: 

def add_to_twelve?(array)
end

# Problem 5: 

def sorted?(array)
end

# Problem 6: 

def reverse(string)
end
