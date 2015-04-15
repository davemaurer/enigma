gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date_key'

class DateKeyTest < MiniTest::Test
  def test_it_takes_in_a_date_string
    assert_equal 20315, DateKey.new("020315").date_num
  end

  def test_it_parses_date_string_into_int
    assert_equal 412699225, DateKey.new("020315").squared
  end

  def test_it_takes_last_four_digits_from_squared_date
    assert_equal [9,2,2,5], DateKey.new("020315").offsets
  end

  def test_it_uses_todays_date_if_none_is_provided
    today = Time.now.strftime("%d%m%y")
    assert_equal today, DateKey.new.today
  end
end
