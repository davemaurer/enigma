require_relative 'decryptor'

decrypto = Decryptor.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
decrypto.write_decrypted_file
