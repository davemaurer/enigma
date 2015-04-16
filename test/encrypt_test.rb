gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './lib/rotation'
require './lib/key'
require './lib/date_key'
require './lib/rotator'

class EncryptTest < MiniTest::Test
  def test_it_encrypts_a_message_and_creates_a_file
    File.delete("./lib/encrypted_test.txt")
    crypto = Encryptor.new("small_message.txt", "encrypted_test.txt")
    crypto.write_secret_file
    assert "./lib/encrypted_test.txt"
  end
end
