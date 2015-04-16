gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './lib/rotation'
require './lib/key'
require './lib/date_key'
require './lib/rotator'

class RotatorTest < MiniTest::Test
  def test_it_can_take_in_a_file
    file = "./lib/small_message.txt"
    key = Key.new("41521").offsets
    date_key = DateKey.new("020315").offsets
    rotation = Rotation.new(key, date_key)
    result = ["s", "m", "a", "l", "l", " ", "m", "e", "s", "s", "a", "g", "e"]
    assert_equal result, Rotator.new(file, rotation).prep_message
  end

  def test_it_manipulates_a_message
    message = ["s", "m", "a", "l", "l", " ", "m", "e", "s", "s", "a", "g", "e"]
    key = Key.new("41521").offsets
    date_key = DateKey.new("020315").offsets
    rotation = Rotation.new(key, date_key).offsets
    refute_equal message, Rotator.new("./lib/small_message.txt", rotation).rotate_message
  end

  def test_it_can_encrypt_a_message
    file = "small_message.txt"
    rotor = Rotator.new("./lib/#{file}", Rotation.new([81, 12, 25, 57], [2, 2, 2, 5]).offsets)
    encrypted_message = rotor.rotate_message
    assert_equal "x018qla1x613j", encrypted_message
  end

  def test_it_actually_encrypts_the_correct_number_of_rotations
    file = "tiny_text_tester.txt"
    rotor = Rotator.new("./lib/#{file}", Rotation.new([1, 2, 3, 4], [1, 1, 1, 1]).offsets)
    encrypted_message = rotor.rotate_message
    assert_equal "cegigaddh", encrypted_message
  end
end
