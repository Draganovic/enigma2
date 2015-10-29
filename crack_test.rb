require 'minitest/autorun'
require 'minitest/pride'
require './crack'
require '.enigma'

class TestCrack < Minitest::Test

  def test_assert_can_crack(message)
    # unencrypted = "abcd"
    map = Crack.char_map
    encrypted = Crack.new(message, [7, 37, 22, 91], char_map).encrypt
    cracked = Crack.crack(encrypted, map)
    encrypted = enigma.encrypt
    # decrypted = "burger"
    # key = "58367"
    # date = "221015"
    assert_equal message, cracked
  end

  # def test_can_crack_0_modulo_4
  #   assert_equal "abcde..end..", cracked
  # end
  #
  # def test_can_crack_1_modulo_4
  #   assert 'abcdef..end..'
  # end
  #
  # def test_can_crack_2_modulo_4
  #   assert'abcdefg..end..'
  # end
  #
  # def test_can_crack_3_modulo_4
  #   assert 'abcdefgh..end..'
  # end




end
