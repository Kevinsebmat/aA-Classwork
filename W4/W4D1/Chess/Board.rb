require_relative 'Piece'
class Board
 
    def initialize(rows = Array.new(8){Array.new(8)})
        @rows = rows
    end

    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row,col = pos
        @rows[row][col] = val
    end

    def move_piece(color,start_pos,end_pos)
        piece = self[start_pos]
        raise "error;there is no start pos" if !self[start_pos]
        # raise "error; cant be at end position" if !self[end_pos]
        # raise "error" if self[start] 
        #we need something that stores color
        move_piece!(start_pos, end_pos)
        self[end_pos].move(end_pos)
    end


    

    def move_piece!(start_pos, end_pos)
    #raise 'piece cannot move like that' unless piece.moves.include?(end_pos)

    self[end_pos] = self[start_pos]
    self[end_pos].move(end_pos)
    self[start_pos] = nil
  end

    def set_positions
        # rook_pos=[[0,0],[0,7],[7,0], [7,7]]
        # knight_pos = [[0,1],[0,6],[7,1], [7,6]]
        # bishop_pos = [[0,2],[0,5],[7,2], [7,5]]
        # queen_pos= [[0,3],[7,3]]
        # king_pos= [[0,4],[7,4]]
        # piece_pos = [[0,0]]
    end

    def test_pieces
        tester = Piece.new([0,1], self, :black)
        self[[0,0]] = tester
        # rook_pos.each do |rook|

        # end
    # end
    end
end

board1 = Board.new
board1.test_pieces
board1.move_piece(:black,[0,0], [0,2])
p board1