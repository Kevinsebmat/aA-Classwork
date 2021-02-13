def bad_two_sum?(arr, target)

  (0...arr.length).each do |i|
    (i + 1...arr.length). each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false

end

# O(n^2)

#n/2 * n/ 2

# targ = 10 / 2 
# [1, 4, 5, 6]


def better_two_sum?(arr, target)
  arr = arr.sort                        #nlogn
  arr.each_with_index do |ele , i |
    newarr=arr[0...i] + arr[i+1..-1]
    return true if newarr.bsearch_index{|ele2| target <=> ele2+ele }
  end
  false
end

#nlogn


# p better_two_sum?([1, 4, 5, 6], 2)

def best_two_sum?(arr, target)

  hash={}
  newarr= []  
  arr.each do |ele| 
    hash[ele] = target-ele

  end
  hash.each do |ele,val| 
   newarr <<  ele if hash.has_value?(ele)

  end

  return true if newarr.length > 1 
  else
  return false

end

#0(n)


#p best_two_sum?([1, 4, 5, 6],9)