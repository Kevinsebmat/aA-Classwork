def anagram?()

end

# str = "cat" --> ["cat", "cta", "act", "atc", "tac", "tca"]

def first_anagram?(str_1, str_2)

  lttr_arr_1 = str_1.split("")             # str1 --> n
  # lttr_arr_2 = str_2.split
  
  p possible_anagrams = lttr_arr_1.permutation.to_a.map { |subArr| subArr.join("") }     # n! * n

  possible_anagrams.include?(str_2)                # n!

end

# O(n * n!)
def second_anagram?(str_1, str_2)
  return false if str_1.length != str_2.length
  
  str_2 = str_2.split('')     #+n
  str_1.each_char do |char|   #+n
   i = str_2.index(char)      #*n
   unless i == nil
      str_2.delete_at(i)
   end
  end
  str_2.empty?
end

#O(n^2)
# p second_anagram?('cat', 'ca')

def third_anagram?(str_1, str_2)
  p sorted_1 = str_1.chars.sort #n + n^2 or nlogn + n
  p sorted_2 = str_2.chars.sort #m + m^2 or mlogm + m
  sorted_1 == sorted_2
end

#O(nlogn + mlogm)

# p third_anagram?('applepine', 'pineapple')

def fourth_anagram?(str_1, str_2)
  hash = Hash.new(0)
  str_1.each_char { |lttr| hash[lttr] += 1 } # n
  str_2.each_char { |lttr| hash[lttr] -= 1 } # n 
  hash.each do |k, v| # n
    return false if v != 0
  end
  true
end

p fourth_anagram?('applpenige', 'pineapple')
#O(n)

