class Array
  def my_each(&prc)
    i = 0

    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    selected = []
    self.my_each { |el| selected << el if prc.call(el) }
    selected
  end

  def my_reject(&prc)
    new_array = []
    self.my_each { |el| new_array << el unless prc.call(el) }
    new_array
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false unless prc.call(el) }
    true
  end

  def my_flatten
    flattened = []

    self.my_each do |el|
      if el.is_a?(Array)
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end

    flattened
  end

  def my_zip(*args)
    all_arrays = [self, *args]

    (0...self.length).map do |i|
      (0..args.length).map { |j| all_arrays[j][i] }
    end
  end

  def my_rotate(turns = 1)
    self.drop(turns % self.length) + self.take(turns % self.length)
  end

  def my_join(separator = "")
    joined = ""
    self.each_with_index do |el, i|
      if i == self.length - 1
        joined += el.to_s
      else
        joined += el.to_s + separator
      end
    end
    joined
  end

  def my_reverse
    reversed = []
    i = self.length - 1

    while i >= 0
      reversed << self[i]
      i -= 1
    end

    reversed
  end
end
