class MaxIntSet
  attr_reader :store
  def initialize(max)
   @store = Array.new(max, false) 
  end

  def insert(num)
   if num < @store.length && num > -1
      @store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if num < @store.length && num > -1
      @store[num]
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !@store.include?(num)
      @store[num % @store.length] << num
    end
  end

  def remove(num)
    @store[num% @store.length].delete(num)
  end

  def include?(num)
     @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count , :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    
    unless self.include?(num)
      @store[num % num_buckets ] << num
      @count += 1
    end
  end

  def remove(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!

    newstore= Array.new(num_buckets*2) { Array.new }
    oldstore=@store
    @store = newstore
      oldstore.flatten.each do |ele|
        @store[ele % @store.length] << ele  
      end
    
  end
  
end
