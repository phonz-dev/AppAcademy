# PHASE 1

# duos
# Write a method duos that accepts a string as an argument and returns the count of 
# the number of times the same character appears consecutively in the given string.

def duos(str)
  (0...str.length - 1).count { |i| str[i] == str[i + 1] }
end

# Examples

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

##########################################################################################