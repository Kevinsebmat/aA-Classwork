class Knight < Piece
  include Stepping

  def symbol
    "♘".colorize(color)
  end
end
