gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key'

class KeyTest < MiniTest::Test

  def setup
    @key = Key.new("41521")
  end

  def test_it_parses_key_string_into_offsets
    assert_equal [41, 15, 52, 21], Key.new("41521").offsets
  end

  def test_it_generates_a_new_random_key_if_one_is_not_provided
    key = Key.new
    assert_equal 4, key.offsets.length
    key.offsets.each do |o|
      assert o.is_a?(Fixnum)
    end
  end


  #takes in a string of numbers?
  #parses that into 4 numbers
  #

end
  # def test_it_will_generate_a_key
  #   result = ["4", "1", "5", "2", "1"]
  #   assert_equal result, @key.number
  # end
  #
  # def test_it_will_make_pairs
  #   result = ["41", "15", "52", "21"]
  #   assert_equal result, @key.make_pairs
  # end
