gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class RotationTest < MiniTest::Test
  def test_it_takes_in_a_key_and_datekey
    key = Key.new("41521").offsets
    date_key = DateKey.new("020315").offsets
    assert_equal [41,15,52,21], Rotation.new(key, date_key).key
    assert_equal [9,2,2,5], Rotation.new(key, date_key).date_key
  end

  def test_it_finds_the_rotation_given_a_date_and_key
    key = Key.new("41521").offsets #offset: [41,15,52,21]
    date_key = DateKey.new("020315").offsets #offsets: [9,2,2,5]
    rotation = [50, 17, 54, 26]
    assert_equal rotation, Rotation.new(key, date_key).offsets
  end
end
