class Queen < Piece
  include Sliding

  def symbol
    "♕".colorize(color)
  end
end
