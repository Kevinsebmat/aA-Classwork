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
  arr.each_with_index 
end