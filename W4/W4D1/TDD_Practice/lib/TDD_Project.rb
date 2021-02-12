class Array
    def my_uniq 
        result = []
        self.each do |ele|
            result << ele if !result.include?(ele)
        end

        result 

    end
end

class Array
    def two_sum
        pairs = []
        self.each.with_index do |ele, i|
            ((i + 1)...self.length).each do |j|
                pairs << [i, j] if self[i] + self[j] == 0
            end
        end

        pairs
    end
end

def my_transpose(array)
    raise 'invalid argument; cant be string' if array.is_a?(String)
    raise 'invalid argument; cant be number' if array.is_a?(Integer)
    
    result = []
    (0...array.length).each do |i|
        temparr = []
        array.each do |subarr|
             temparr << subarr[i]

        end
        result << temparr
    end
    result
end

def stockpicker(array_prices)
    pairs = []
    max_profit = 0
    (0...array_prices.length).each do |i|
        (0...array_prices.length).each do |j|
            profit = array_prices[j] - array_prices[i]
            if profit > max_profit && i < j
                max_profit = profit
                pairs.shift
                pairs << [i, j]
            end
        end
    end
    pairs.flatten
end

#[[,,  ], [,], [3,2, 1]]
# if condition to only push the number if the last element on the subarray is less
#than the number being pushed. check if its empty

class Hanoi
    
end

