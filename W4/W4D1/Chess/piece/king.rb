class King < Piece
  include Stepping

  def symbol
    "♔".colorize(color)
  end
end
