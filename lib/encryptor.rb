require_relative 'rotator'
require_relative 'date_key'
require_relative 'key'
require_relative 'rotation'

class Encryptor
  attr_reader :message_file, :encrypted_file

  def initialize(message_file, encrypted_file)
    @message_file = message_file
    @encrypted_file = encrypted_file
  end

  def generate_keys
    @key_base = Key.new
    @key_string = @key_base.keystring
    @key = @key_base.offsets
    @date_key = DateKey.new.offsets
  end

  def encrypt_message
    generate_keys
    rotor = Rotator.new(@message_file, Rotation.new(@key, @date_key).offsets)
    @encrypted_message = rotor.rotate_message
  end

  def write_secret_file
    encrypt_message
    handle = File.open("#{@encrypted_file}", "w")
    handle.write @encrypted_message
    handle.close
    puts "Created #{@encrypted_file} with the key #{@key_string} and date #{Time.now.strftime("%d%m%y")}"
  end
end

message_file = ARGV[0].to_s
encrypted_file = ARGV[1].to_s
encryptor = Encryptor.new(message_file, encrypted_file)
encryptor.write_secret_file
