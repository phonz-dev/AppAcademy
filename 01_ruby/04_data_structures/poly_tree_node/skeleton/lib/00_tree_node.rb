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

  def add_child(child_node)
    unless is_child?(child_node)
      children << child_node
      child_node.parent = self
    end
  end

  def remove_child(child_node)
    unless is_child?(child_node)
      raise "child node does not exist"
    end

    child_node.parent = nil
    children.delete(child_node)
  end

  def is_child?(node)
    children.include?(node)
  end

  def dfs(target_val)
    return self if target_val == value

    children.each do |child|
      search_result = child.dfs(target_val)
      return search_result unless search_result.nil?
    end

    nil
  end

  def bfs(target_val)
    queue = [self]

    until queue.empty?
      curr_node = queue.shift
      return curr_node if curr_node.value == target_val
      queue.concat(curr_node.children)
    end

    nil
  end

  def inspect
    { "value" => @value, 
      "parent_value" => @parent.value 
    }.inspect
  end
end
