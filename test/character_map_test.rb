gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/character_map'

class MapTest < Minitest::Test

  def setup
    @map = CharacterMap.new
  end

  def test_it_contains_all_of_the_required_characters_in_an_array
    result = [
              "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
              "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
              "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
              "7", "8", "9", " ", ".", ","
              ]
    assert_equal result, @map
  end
end
