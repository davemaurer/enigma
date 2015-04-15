gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class EncryptorTest < MiniTest::Test
  def test_it_will_take_args
    ARGV[0] = "./lib/small_message.txt"
    ARGV[1] = "./lib/encrypted_message.txt"
    crypto = Encryptor.new
    assert_equal "./lib/small_message.txt", crypto
  end
end
