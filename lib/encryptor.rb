require_relative 'rotator'
require_relative 'date_key'
require_relative 'key'
require_relative 'rotation'

class Encryptor
  def initialize(message_file, encrypted_file)
    @message_file = message_file
    @encrypted_file = encrypted_file
  end

  def generate_keys
    @key_base = Key.new
    @key = @key_base.offsets
    @date_key_base = DateKey.new
    @date_key = @date_key_base.offsets
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
    puts "Created #{@encrypted_file} with the key #{@key_base} and date #{@date_key_base}"
  end
end

message_file = ARGV[0]
encrypted_file = ARGV[1]
encryptor = Encryptor.new(message_file, encrypted_file)
encryptor.write_secret_file
