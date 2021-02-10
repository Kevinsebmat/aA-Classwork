class Piece
    attr_reader :color, :board
    def initialize (pos,board,color)
        @pos= pos
        @board = board
        @color= color
    end

    def to_s

    end

    def empty?

    end

    def valid_moves

    end

    def pos=(val)

    end

    def symbol

    end

    def move(val)
        self.pos = val
    end
    
 private
    def move_into_check?(end_pos)

    end
end