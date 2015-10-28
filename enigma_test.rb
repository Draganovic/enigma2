require 'minitest/autorun'
require 'minitest/pride'
require './enigma'


class TestEnigma < Minitest::Test

  def assert_diget(char)
      assert_equal char, char.to_i.to_s
  end

  def test_the_key_is_a_five_digit_string_like_41521
    random_key = Enigma.random_key
    assert_equal String, random_key.class
    assert_equal 5, random_key.length
    assert_diget random_key[0]
    assert_diget random_key[1]
    assert_diget random_key[2]
    assert_diget random_key[3]
    assert_diget random_key[4]
  end

  def test_every_key_is_random
    keys = 1000.times.map {Enigma.random_key}
    assert 1 < keys.uniq.length
  end

  def test_characters_are_0_to_9
    all_seen = 1000.times.map {Enigma.random_key}.join.chars
    all_digets =all_seen.uniq.sort.join
    assert_equal '0123456789', all_digets
  end

  def test_char_map_returns_what_its_supposed_to
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","], Enigma.char_map
  end

  def test_can_encrypt_message
    message = "burger"
    encrypted = "u1qaxy"
    key = "58367"
    date = "221015"
    enigma = Enigma.new(message, key, date)

    assert_equal encrypted, enigma.encrypt
  end

end
