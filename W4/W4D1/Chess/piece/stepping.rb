module Stepping
  def moves
    x, y = self.pos
  end

  def knight_moves
    knight_arr = []
    first = [1, -1]
    second = [2, -2]
    first.each do |ele|
      second.each do |ele2|
        knight_arr << [ele, ele2]
        knight_arr << [ele2, ele]
      end
    end
    knight_arr
  end

  def king_moves
    king_arr = []
    x = [0, 1]
    y = [-1, 0]
    x.each do |ele|
      y.each do |ele2|
        king_arr << [ele, ele2] unless ele == ele2 || ele + ele2 == 0
        king_arr << [ele2, ele] unless ele == ele2 || ele + ele2 == 0
      end
    end
    king_arr
  end

  private

  def move_diffs
    #subclass implements this
    raise "Error"
  end
end
