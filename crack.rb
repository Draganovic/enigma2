require 'pry'

class Crack

  def initialize(encrypted_message, date)
    @encrypted_message = encrypted_message
    @key = key
    @date = Time.now.strftime('%d%m%y').to_i
    @map = map

  end

  def self.char_map
    char_map = ('a'..'z').to_a + ('0'..'9').to_a + [' ', '.', ',']
  end

  def self.cracked(message, encrypted, map)
    binding.pry
    new_split = message.chars.each_slice(4).to_a
    new_split.encrypted
    last_4 = message.chars.each_slice(4).encrypted
    encrypted_part, known_part =
    case last.length % 4
    when 0 then [last_4, ['n', 'd', '.', '.']]
    when 1 then [last_4, ['e', 'n', 'd', '.']]
    when 2 then [last_4, ['.', 'e', 'n', 'd']]
    when 3 then [last_4, ['.', '.', 'e', 'n']]
    end

    offsets = known_part.chars.zip(encrypted_part.chars).map do |known_value, encrypted_value|
      find_offset map, known_value, encrypted_value
    end
  end

  def self.find_offset(map, first, second)
    map.index(second) - map.index(first)
  end

end
