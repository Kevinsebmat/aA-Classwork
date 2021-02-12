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
