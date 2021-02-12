
def my_min(array)
    array.each_with_index do |ele,i|
        subarr = array[0...i]+ array[i+1..-1] 
       return ele if subarr.all? {|ele2| ele2 > ele}
    end
end
# O(n^2)

def my_min(array)
    min = array[0]
    array.each {|ele| min = ele if ele < min}
    min
#O(n)


def largest_contiguous_subsum(list)
    
    sums=[]
    current_sum = 0
    (0...list.length).each do |i|
        (i+1...list.length).each do |j|
            sums << list[i..j]
        end
    end
    newsums = sums.each{&:sum}

    newsums.max

end

#(n * (n - 1)) + (n^3) + (n^3)
#2(n^3)
#O(n^3)

def largest_contiguous_subsum(list) 
    current_sum = list[0]
    largest_sum = list[0]
    list.each do |i|
        current_sum += i
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end

#O(n)

