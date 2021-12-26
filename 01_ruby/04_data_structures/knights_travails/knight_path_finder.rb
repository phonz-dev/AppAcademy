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
    row, col = pos

    moves = DELTAS.map { |(dx, dy)| [row + dx, col + dy] }
    moves.select do |move|
      move.all? { |coord| coord.between?(BOUNDARY.first, BOUNDARY.last) }
    end
  end

  def initialize(start_pos)
    @start_pos = PolyTreeNode.new(start_pos)
    @considered_positions = [ start_pos ]
  end

  def new_move_positions(pos)
    positions = KnightPathFinder.valid_moves(pos)
    new_move_positions = positions.select do  |pos|
      !@considered_positions.include?(pos)
    end
    @considered_positions.concat(new_move_positions)
    new_move_positions
  end
end
