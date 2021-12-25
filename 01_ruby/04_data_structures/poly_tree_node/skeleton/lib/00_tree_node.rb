class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value, @parent, @children = value, nil, []
  end
end
