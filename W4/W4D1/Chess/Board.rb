class Board
 
    def initialize(rows)
        @rows = Array.new(8){Array.new(8)}
    end

    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row,col = pos
        @rows[row][col] = val
    end

    def move_piece(color,start,end)
        piece= self[start]
        raise "error;there is no start pos" if !self[start]
        raise "error; cant be at ened position" if !rows[end]
        # raise "error" if self[start] 
        #we need something that stores color
        piece= self[end]

    end

    # def set_positions
    #     rook_pos=[[0,0],[0,7],[7,0], [7,7]]
    #     knight_pos = [[0,1],[0,6],[7,1], [7,6]]
    #     bishop_pos = [[0,2],[0,5],[7,2], [7,5]]
    #     queen_pos= [[0,3],[7,3]]
    #     king_pos= [[0,4],[7,4]]
    # end

    # def set_pieces
    #     rook_pos.each do |rook|

    #     end
    # end
end

board1= Board.new