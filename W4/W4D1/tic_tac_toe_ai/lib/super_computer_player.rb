require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    winning_children = node.children.select {|child| child.winning_node?(mark)}
    if winning_children.length > 0
      return winning_children[0].prev_move_pos
    else
      not_losers = node.children.select {|child| !child.losing_node?(mark)}
      return not_losers[0].prev_move_pos
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
