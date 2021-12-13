# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f 
  end

  def median
    return nil if self.empty?

    mid = self.length / 2
    sorted = self.sort
    
    if self.length.odd?
      return sorted[mid]
    else
      two_mids = [sorted[mid - 1], sorted[mid]]
      return two_mids.average
    end
  end

  def counts
    self.inject(Hash.new(0)) do |h, el|
      h[el] += 1
      h
    end
  end
end
