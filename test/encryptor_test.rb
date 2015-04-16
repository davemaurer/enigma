gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class EncryptorTest < MiniTest::Test
  def test_it_will_take_args
    crypto = Encryptor.new("small_message.txt", "encrypted_message.txt")

    assert_equal "small_message.txt", crypto.message_file
  end

  def test_the_keystring_is_passed_in
    crypto = Encryptor.new("small_message.txt", "encrypted_message.txt")
    crypto.generate_keys
    assert Key.new
  end

  def test_the_date_key_is_passed_in
    crypto = Encryptor.new("small_message.txt", "encrypted_message.txt")
    crypto.generate_keys
    assert Key.new
  end

  def test_it_can_encrypt_a_message
    file = "small_message.txt"
    crypto = Encryptor.new(file, "encrypted_message.txt")
    rotor = Rotator.new("./lib/#{file}", Rotation.new([81, 12, 25, 57], [2, 2, 2, 5]).offsets)
    encrypted_message = rotor.rotate_message
    assert_equal "x018qla1x613j", encrypted_message
  end
end
