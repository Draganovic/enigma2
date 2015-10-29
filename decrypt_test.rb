require 'minitest/autorun'
require 'minitest/pride'
require './decrypt'


class TestDecrypt < Minitest::Test
  
  def test_can_decrypt_message
    message = "u1qaxy"
    decrypted = "burger"
    key = "58367"
    date = "221015"
    decrypt = Decrypt.new(message, key, date)

    assert_equal decrypted, decrypt.decrypt
  end

end
