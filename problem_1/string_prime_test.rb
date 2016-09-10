require 'test/unit'
require './string_prime'
using StringPrime

class AStringPrimeTest < Test::Unit::TestCase

  def test_prime_product_should_response 
    assert_nothing_raised NoMethodError do
      "hello".prime_product
    end 
  end
  
  def test_prime_product_should_return_an_number
    assert_block do
      "hello".prime_product.is_a? Numeric
    end
  end
  
  def test_momdad
    assert_equal 7742686, "momdad".prime_product
  end

  def test_blank_string
    assert_equal 1, "".prime_product
  end
  
end