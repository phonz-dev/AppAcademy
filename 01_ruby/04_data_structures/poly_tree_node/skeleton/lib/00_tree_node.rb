class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value)
    @value, @parent, @children = value, nil, []
  end

  def parent=(new_parent)
    parent.children.delete(self) if parent && new_parent
    @parent = new_parent
    return if !new_parent || parent.children.include?(self) 
    parent.children << self
  end

  def add_child(new_child)
    unless children.include?(new_child)
      children << new_child
      new_child.parent = self
    end
  end

  def inspect
    { "value" => @value, 
      "parent_value" => @parent.value 
    }.inspect
  end
end
