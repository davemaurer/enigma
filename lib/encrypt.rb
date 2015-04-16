require_relative 'encryptor'

crypto = Encryptor.new(ARGV[0], ARGV[1])
crypto.write_secret_file
