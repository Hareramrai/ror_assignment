require 'test/unit'
require './collection'

class CollectionTest < Test::Unit::TestCase

  def test_make_flat_should_response 
    assert_respond_to(Collection, :make_flat) 
  end
  
  def test_make_flat_should_return_an_array
    assert_block do
      Collection.make_flat([1,3,[2]]).instance_of? Array
    end
  end
  
  def test_make_flat_should_flatten_the_nested_array
    result = Collection.make_flat [1, 2, 3, [4, 6, [7, 8]], 5, 9, 10]
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], result
  end
  
  def test_make_flat_should_flatten_the_nested_array_with_corrct_sorting
    result = Collection.make_flat [9,8, 3, [4, 10, [1, 2]], 5, 7, 6]
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], result
  end
  

  def test_incorrect_argument_should_be_raise 
    assert_raise ArgumentTypeError do
      Collection.make_flat "string"
    end
  end
  
end