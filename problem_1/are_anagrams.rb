require './string_prime'
using StringPrime

module AreAnagrams
  def self.are_anagrams? (string_a, string_b)
		if string_a.length != string_b.length 
      false
    else
      string_a.prime_product ==  string_b.prime_product
    end
	end
end