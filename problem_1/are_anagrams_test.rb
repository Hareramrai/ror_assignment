require 'test/unit'
require './are_anagrams'

class AreAnagramsTest < Test::Unit::TestCase

  def test_are_anagrams_method_should_response 
    assert_respond_to(AreAnagrams, :are_anagrams?) 
  end
  
  def test_are_anagrams_should_return_an_boolean
    assert_block do
       [true, false].include? AreAnagrams.are_anagrams?('apple', 'mango')
    end
  end
  
  def test_momdad_dadmom
    assert_equal true,AreAnagrams.are_anagrams?('momdad', 'dadmom')
  end

  def test_mac_windows
    assert_equal false, AreAnagrams.are_anagrams?('mac', 'windows')
  end
  
end