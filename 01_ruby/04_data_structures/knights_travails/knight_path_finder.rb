require_relative "poly_tree_node"

class KnightPathFinder
  DELTAS = [
    [-2, 1 ],
    [-2,-1 ],
    [-1,-2 ],
    [-1, 2 ],
    [ 1,-2 ],
    [ 2,-1 ],
    [ 1, 2 ],
    [ 2, 1 ]
  ].freeze

  BOUNDARY = [0, 7]

  def self.valid_moves(pos)
    curr_x, curr_y = pos

    moves = DELTAS.map { |(dx, dy)| [curr_x + dx, curr_y + dy] }
    moves.select do |move|
      move.all? { |coord| coord.between?(BOUNDARY.first, BOUNDARY.last) }
    end
  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [ start_pos ]
    build_move_tree
  end

  def find_path(end_pos)
    curr_node = root_node.dfs(end_pos)
    trace_path_back(curr_node)
  end

  private_constant :DELTAS

  private

  attr_reader :root_node, :considered_positions

  def trace_path_back(end_pos)
    curr_node = end_pos
    path = []

    until curr_node.nil?
      path << curr_node.value
      curr_node = curr_node.parent
    end

    path.reverse
  end

  def new_move_positions(pos)
    positions = KnightPathFinder.valid_moves(pos)
    new_move_positions = positions.select do  |pos|
      !considered_positions.include?(pos)
    end
    considered_positions.concat(new_move_positions)
    new_move_positions
  end

  def build_move_tree
    tree = [ root_node ]

    until tree.empty?
      curr_node = tree.shift
      curr_node_moves = new_move_positions(curr_node.value)

      curr_node_children = curr_node_moves.map{ |move| PolyTreeNode.new(move) }
      curr_node_children.each do |child|
        curr_node.add_child(child)
        child.parent = curr_node
      end

      tree.concat(curr_node_children)
    end
  end
end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 7])