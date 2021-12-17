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
end
