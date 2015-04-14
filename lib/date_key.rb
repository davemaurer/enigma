class DateKey
  attr_reader :date_string

  def initialize(date_string = today)
    @date_string = date_string
  end

  def today
    Time.now.strftime("%d%m%y")
  end

  def date_num
    date_string.to_i
  end

  def squared
    date_num ** 2
  end

  def offsets
    squared.to_s.chars.last(4).map(&:to_i)
  end
end
