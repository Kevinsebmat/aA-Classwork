#module Sliding
  def moves
    x, y = self.pos
  end

  def diags
    diag_arr = []
    (-7..7).each do |x|
      d_pos = [x, x]
      d_pos2 = [x, -x]
      diag_arr.push(d_pos, d_pos2) unless x == 0
    end
    diag_arr = diag_arr.uniq
  end

  def horivert
    horivert_arr = []
    (-7..7).each do |x|
      hv_pos = [0, x]
      hv_pos2 = [x, 0]
      horivert_arr.push(hv_pos, hv_pos2) unless x == 0
    end
    horivert_arr = horivert_arr.uniq
  end

  private

  def move_dirrs
    #subclass implements this
    raise "Error"
  end

  p diags
#end