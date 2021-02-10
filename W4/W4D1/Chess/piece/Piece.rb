require 'byebug'
class Piece
    attr_reader :color, :board, :pos
    def initialize (pos,board,color)
        @pos = pos
        @board = board
        @color= color
        board[pos] = self
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        self.is_a?(nullPiece)
    end

    def valid_moves
        raise "Can't use this one!"
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        raise "Can't use this one!"
    end

    def move(val)
        self.pos = val
    end
    
 private
    def move_into_check?(end_pos)

    end
end