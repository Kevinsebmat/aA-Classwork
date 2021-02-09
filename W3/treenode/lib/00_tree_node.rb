class PolyTreeNode
  
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil #node instance
    @children = [] #array of node instances
  end

  def inspect
      children_values = @children.map {|child| child.value}
      if @parent == nil
        parent_value = nil
      else
        parent_value = @parent.value
      end
      # {'value' => @value, 'parent_value' => parent_value, 'children_value' => children_values }.inspect
      # {'children_value' => children_values }.inspect
      {'value' => @value }.inspect
  end


  #original parent = node1 --> remove current node from children array of node1
  #changing parent to node2
  # node1
  # node1.parent(node2)

  def parent=(new_parent)
    old_parent = self.parent

    # if old parent is another node, remove the current node from its children
    if old_parent != nil
     old_parent.children.delete(self)
    end

    @parent = new_parent
    return nil if self.parent == nil
    
    self.parent.children << self
  end

  # node1
  # node1.add_child(node2)
  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if !self.children.include?(child_node)
        raise "not a child of current node"
    end

    child_node.parent= nil
  end

# 15
# 10 20
# 1,3  5,6
  # node1.dfs(target_value)
  # node1_child.dfs(target_value)
  # node1_child's_child
  def dfs(target_value)
    if target_value == self.value
        return self
    elsif !children.empty?
        children.each do |child|
            answer = child.dfs(target_value)
            return answer unless answer==nil
        end
    end
    nil
  end
  

  # 15
# 10 20
# 1,3  5,6

# queue = [15]
# queue = [],,, first = 15
# queue = [10, 20]



  def bfs(target_value)
    queue = [self]
    until queue.empty?
      first = queue.shift
      if first.value == target_value
        return first 
      else
        queue += first.children
      end

    end
    nil
  end


end