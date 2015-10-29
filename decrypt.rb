
class Decrypt

  def self.random_key
    Array.new(5) { random_character }.join
  end

  def self.random_character
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].sample
  end

  def initialize(encrypted_message, key, date)
    @encrypted_message = encrypted_message
    @key = key
    @date = Time.now.strftime('%d%m%y').to_i
  end

  def self.char_map
    char_map = ('a'..'z').to_a + ('0'..'9').to_a + [' ', '.', ',']
  end

  def decrypt
    parts = @encrypted_message.chars.each_slice(4).to_a
    decrypted_parts = parts.map { |part| decrypt_part(part) }
    decrypted_parts.join
  end

  def decrypt_part(part)
    date_square = (@date.to_i ** 2).to_s
    offsets = date_square[-4..-1]

    part.map.with_index { |char, i| decrypt_char(char, @key[i..i+1].to_i, offsets[i].to_i)}
  end

  def decrypt_char(character, rotation, offset)
    encrypted_index = Decrypt.char_map.reverse.index character
    decrypted_sum = encrypted_index + rotation + offset
    decrypted_index = decrypted_sum % Decrypt.char_map.length
    Decrypt.char_map.reverse[decrypted_index]
  end

end
