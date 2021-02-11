class Bishop < Piece
  include Sliding

  def symbol
    "♗".colorize(color)
  end

  def move_dirs
    diags
  end
end
