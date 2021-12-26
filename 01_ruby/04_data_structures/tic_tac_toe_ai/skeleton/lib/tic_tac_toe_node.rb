require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # A #losing_node? is described in the following cases:

  # Base case: the board is over AND
  # If winner is the opponent, this is a losing node.
  # If winner is nil or us, this is not a losing node.

  # Recursive case:
  # It is the player's turn, and all the children nodes are losers for the player (anywhere they move they still lose), OR
  # It is the opponent's turn, and one of the children nodes is a losing node for the player (assumes your opponent plays perfectly; they'll force you to lose if they can).
  # NB: a draw (Board#tied?) is NOT a loss, if a node is a draw, losing_node? should return false.

  def losing_node?(evaluator)
    if board.over?
      return false if board.tied?
      return board.winner == evaluator ? false : true 
    end

    if next_mover_mark == evaluator
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    board_positions.each do |pos|
      if board.empty?(pos)
        board_dup = board.dup
        board_dup[pos] = next_mover_mark

        children << self.class.new(board_dup, 
        next_mover_mark == :x ? :o : :x, pos)
      end
    end

    children
  end

  def board_positions
    board_positions = []
    length = board.rows.length

    (0...length).each do |row|
      (0...length).each { |col| board_positions << [ row, col ] }
    end

    board_positions
  end
end

node = TicTacToeNode.new(Board.new, :X, [0,0])

p node.children