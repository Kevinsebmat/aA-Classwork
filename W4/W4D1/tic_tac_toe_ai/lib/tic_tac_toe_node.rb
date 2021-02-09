require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end


  def losing_node?(evaluator)
    if board.over? 
      return true if board.winner != nil && board.winner != evaluator
      return false
    elsif self.next_mover_mark == evaluator  #check if its the player turnip
       return self.children.all?{|child| child.losing_node?(evaluator)}
    else
       return self.children.any?{|child| child.losing_node?(evaluator)}
    end

  end

  def winning_node?(evaluator)
    if board.over?
      return true if board.winner == evaluator
      return false
    elsif self.next_mover_mark == evaluator
      return self.children.any? {|child| child.winning_node?(evaluator)}
    else
      return self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    arr = []
    board.rows.each.with_index do |row, i|
      row.each.with_index do |col, j|
        position = [i, j]
        if board[position].nil?
          copy = board.dup
          copy[position] = next_mover_mark
          prev_move_pos = position
          if next_mover_mark == :x
            next_mover_mark = :o
          else
            next_mover_mark = :x
          end
          arr << TicTacToeNode.new(copy, next_mover_mark, prev_move_pos)
          
        end
      end
    end
    arr
  end

end
