def anagram?()

end

# str = "cat" --> ["cat", "cta", "act", "atc", "tac", "tca"]

def first_anagram?(str_1, str_2)

  lttr_arr_1 = str_1.split("")             # str1 --> n
  # lttr_arr_2 = str_2.split
  
  p possible_anagrams = lttr_arr_1.permutation.to_a.map { |subArr| subArr.join("") }     # n! * n

  possible_anagrams.include?(str_2)                # n!

end

# n!
def second_anagram?(str_1, str_2)
  return false if str_1.length != str_2.length
  
  str_2 = str_2.split('')
  str_1.each_char do |char| 
   i = str_2.index(char) 
   unless i == nil
      str_2.delete_at(i)
   end
  end
  str_2.empty?
end

p second_anagram?('cat', 'ca')