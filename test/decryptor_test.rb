gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'
require './lib/rotation'
require './lib/key'
require './lib/date_key'

class DecryptorTest < MiniTest::Test
  def test_it_can_take_an_encrypted_file
    skip
    decrypto = Decryptor.new("secret_test_message.txt", "decrypted_test_message.txt", )
    assert_equal "secret_test_message.txt", decrypto.message_file
    # abcde,.f
  end
end
