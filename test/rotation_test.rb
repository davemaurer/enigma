gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/rotation'
require '../lib/key'
require '../lib/date_key'

class RotationTest < MiniTest::Test
  #needs a key
  #needs a datekey
  #needs to get their offsets and
  #combine them somehow
  #needs to produce its own offsets

  def test_it_finds_the_rotation_given_a_date_and_key
    key = Key.new("41521").offsets #offset: [41,15,52,21]
    date_key = DateKey.new("020315").offsets #offsets: [9,2,2,5]
    rotation = [50, 17, 54, 26]
    assert_equal rotation, Rotation.new(key, date_key).offsets
  end

end
