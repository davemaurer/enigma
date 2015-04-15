require_relative 'rotation'
require_relative 'key'
require_relative 'date_key'

class Rotator
  attr_reader :file, :rotation_key

  def initialize(file ="./lib/small_message.txt", rotation_key =[41,15,52,21])
    @map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
    @file = file
    @rotation_key = rotation_key
    @new_message = []
  end

  def prep_message
    File.open("#{@file}", "r").read.delete("\n").downcase.chars
  end

  def rotate_message
    index_count = 0
    prep_message.each do |letter|
      index_count = 0 if index_count > 3
      @new_message << @map.rotate(@rotation_key[index_count])[@map.index(letter)]
      index_count += 1
    end
    return @new_message.join
  end

  def derotate_message
    @map = @map.reverse
    rotate_message
  end
end

# test = Rotator.new("./lib/small_message.txt", Rotation.new(Key.new.offsets,DateKey.new.offsets).offsets)
# puts test.rotate_message
# test = Rotator.new
# puts test.derotate_message

