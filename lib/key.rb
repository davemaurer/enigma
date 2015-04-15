require 'pry'

class Key
  attr_reader :keystring

  def initialize(keystring = generate)
    @keystring = keystring
  end

  def generate
    (0...5).map {rand(9)}.join
  end

  def offsets
    # "41521" -> [41, 15, 52, 21]
    keystring.chars.each_cons(2).map(&:join).map(&:to_i)
  end
end

