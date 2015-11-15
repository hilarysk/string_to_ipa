require_relative 'minitest_helper'

require 'minitest/autorun'

class TestStringToIpa < Minitest::Test
  DATABASE = SQLite3::Database.new("ipagem.db")

  DATABASE.results_as_hash = true
  DATABASE.execute( "PRAGMA encoding = \"UTF-16\"" );

  def test_that_it_has_a_version_number
    refute_nil ::StringToIpa::VERSION
  end

  def test_return_on_string_in_database
    assert_equal("fˈɪʃ", "fish".to_ipa)
  end

  def test_return_on_string_not_in_database
    assert_equal("asdfsdf", "asdfsdf".to_ipa)
  end

  def test_return_on_phonetic_in_database
    assert_equal("yay", "jˈeɪ".to_word)
  end

  def test_return_on_phonetic_not_in_database
    assert_equal("jˈeɪɪ", "jˈeɪɪ".to_word)
  end
end
