require 'pry'

class Rotation
  attr_reader :key, :date_key

  def initialize(key, date_key)
    @key = key
    @date_key = date_key
  end

  def offsets
    key.zip(date_key).map{|nums| nums = nums[0] + nums[1]}
  end
end
