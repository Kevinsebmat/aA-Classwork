require_relative './lib/00_tree_node.rb'
class KnightPathFinder

    BORDER = (0..7).to_a

    def self.valid_moves(pos)
      moves = [] 
       
      x, y = pos[0], pos[1]
      [1, -1].each do |a|
        [2, -2].each do |b|
          moves += [[x + a, y + b], [x + b, y + a]]
        end
      end

      valid = moves.select {|pos| BORDER.include?(pos[0]) && BORDER.include?(pos[1])}

      valid
    end

    attr_reader :root_node, :move_tree

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @move_tree = []
        @considered_positions = [start_pos]
    end

    def new_move_positions(pos)
      moves = KnightPathFinder.valid_moves(pos)
      valid = moves.select {|pos| !@considered_positions.include?(pos)}
      @considered_positions += valid
      valid
    end

    def build_move_tree
      queue = [@root_node]
      until queue.empty?
        current_node = queue.shift
        @move_tree << current_node
        new_moves = new_move_positions(current_node.value)
        new_moves.each do |new_pos|
          new_node = PolyTreeNode.new(new_pos)
          new_node.parent = current_node
          current_node.add_child(new_node)
          queue << new_node
        end
      end
    end

end

# p KnightPathFinder.valid_moves([0,0])
tree = KnightPathFinder.new([0,0])
# p tree.new_move_positions([0,0])
tree.build_move_tree
p tree.move_tree