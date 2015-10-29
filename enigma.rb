class Enigma

  def self.random_key
    Array.new(5) { random_character }.join
  end

  def self.random_character
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].sample
  end

  def initialize(unencrypted_message, key, date)
    @unencrypted_message = unencrypted_message
    @key = key
    @date = Time.now.strftime('%d%m%y').to_i
  end

  def encrypt
    parts = @unencrypted_message.chars.each_slice(4).to_a
    encrypted_parts = parts.map { |part| encrypt_part(part) }
    encrypted_parts.join
  end

  def encrypt_part(part)
    date_square = (@date.to_i ** 2).to_s
    offsets = date_square[-4..-1]
    part.map.with_index { |char, i| encrypt_char(char, @key[i..i+1].to_i, offsets[i].to_i)}

  #Kept trying to pass in character when it should have been an integer
      # encrypted_index_a = encrypt_char(part[0], @key[0..1].to_i, offsets[0].to_i)
      # encrypted_index_b = encrypt_char(part[1], @key[1..2].to_i, offsets[1].to_i)
      # encrypted_index_c = encrypt_char(part[2], @key[2..3].to_i, offsets[2].to_i)
      # encrypted_index_d = encrypt_char(part[3], @key[3..4].to_i, offsets[3].to_i)
      #
      # require 'pry';  binding.pry
      # encrypted_a = Enigma.char_map[encrypted_index_a]
      # encrypted_b = Enigma.char_map[encrypted_index_b]
      # encrypted_c = Enigma.char_map[encrypted_index_c]
      # encrypted_d = Enigma.char_map[encrypted_index_d]
      # encrypted_a + encrypted_b + encrypted_c + encrypted_d
  end

  def encrypt_char(character, rotation, offset)
    unencrypted_index = Enigma.char_map.index character
    encrypted_sum = unencrypted_index + rotation + offset
    encrypted_index = encrypted_sum % Enigma.char_map.length
    Enigma.char_map[encrypted_index]
  end

  def self.char_map
    char_map = ('a'..'z').to_a + ('0'..'9').to_a + [' ', '.', ',']
  end

end
