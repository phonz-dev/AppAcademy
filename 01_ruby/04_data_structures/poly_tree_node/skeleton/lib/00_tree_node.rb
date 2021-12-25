class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value)
    @value, @parent, @children = value, nil, []
  end

  def parent=(new_parent)
    parent.remove_child(self) if parent && new_parent
    @parent = new_parent
    return if !new_parent || parent.is_child?(self) 
    parent.children << self
  end

  def add_child(new_child)
    unless is_child?(new_child)
      children << new_child
      new_child.parent = self
    end
  end

  def remove_child(child)
    unless is_child?(child)
      raise "child node does not exist"
    end

    child.parent = nil
    children.delete(child)
  end

  def is_child?(node)
    children.include?(node)
  end

  def inspect
    { "value" => @value, 
      "parent_value" => @parent.value 
    }.inspect
  end
end
