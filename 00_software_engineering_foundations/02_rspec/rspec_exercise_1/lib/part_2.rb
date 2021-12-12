def hipsterfy(word)
  vowels = "aeiou"

  (word.length - 1).downto(0) do |i|
    char = word[i]

    if vowels.include?(char)
      return word[0...i] + word[i + 1..-1]
    end
  end

  word
end

def vowel_counts(str)
  vowels = "aeiou"
  chars = str.split("")

  vowel_counts = chars.inject(Hash.new(0)) do |hash, char|
    if vowels.include?(char.downcase)
      hash[char.downcase] += 1
    end

    hash
  end

  vowel_counts
end

def caesar_cipher(message, num)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  new_message = ""

  message.each_char.with_index do |char, idx|
    if alpha.include?(char)
      old_idx = alpha.index(char)
      new_idx = (old_idx + num) % alpha.length
      new_char = alpha[new_idx]
      new_message += new_char
    else
      new_message += char
    end
  end

  new_message
end