class Map
  def initialize
    @pairs = []
  end

  def set(key, value)
    if keys.include?(key)
      key_idx = keys.find_index(key)
      @pairs[key_idx][1] = value
      return
    end

    @pairs << [key, value]
  end

  def get(key)
    return nil unless keys.include?(key)

    key_idx = keys.find_index(key)
    @pairs[key_idx].last
  end

  def delete(key)
    key_idx = keys.find_index(key)
    @pairs.delete_at(key_idx)
  end

  def show 
    @pairs
  end

  def keys
    @pairs.map(&:first)
  end

  def values
    @pairs.map(&:last)
  end
end