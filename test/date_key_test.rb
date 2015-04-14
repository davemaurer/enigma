gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/date_key'

class DateKeyTest < MiniTest::Test
  # sometimes pass in date string ("041415")
  # sometimes generate default using Today's date
  # turn that date string into offset
  # turn date string int a number
  # square it
  #take last 5 digits of the square

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
    today = "140415"
    assert_equal today, DateKey.new.today
  end

end



  # def setup
  #   @date = Date.new
  # end
  #
  # def test_it_starts_with_the_current_date
  #   result = "041415"
  #   assert_equal result, @date.date
  # end
