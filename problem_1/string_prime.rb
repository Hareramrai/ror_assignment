require 'prime'
module StringPrime
  
  refine String do  
    char = "`"
    CHARACTER_TO_PRIME_LOOKUP = Prime.first(26).each_with_object({}) do |prime_value, lookup_hash|
      lookup_hash[char.next!] = prime_value
    end
    
    def prime_product
      self.downcase.each_char.inject(1) { |product, c| product * CHARACTER_TO_PRIME_LOOKUP[c] }
    end
  end
  
end