def all_words_capitalized?(words)
  words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
  valid_domains = ['.com', '.net', '.io', '.org']
  urls.none? { |url| valid_domains.any? { |d| url.end_with?(d) } }
end

class Array
  def average
    self.sum / self.length.to_f
  end
end

def any_passing_students?(students)
  students.any? { |student| student[:grades].average >= 75 }
end

