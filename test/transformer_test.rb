gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encryptor'
require '../lib/rotation'
require '../lib/key'
require '../lib/date_key'
require '../lib/transformer'

class EncryptorTest < MiniTest::Test

  def test_it_can_take_in_a_file
    file = File.open("./tester.txt", "r")

  end
end
