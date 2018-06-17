require './lib/translator'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class TranslatorTests < MiniTest::Test
  def test_translator_instance_exists
    translator = Translator.new
    assert_instance_of(Translator, translator)
  end

  def test_translator_translates_lowercase_letters_to_morse
    translator = Translator.new
    output = translator.eng_to_morse("hello world")
    assert_equal("......-...-..--- .-----.-..-..-..", output)
  end

  def test_translator_translates_uppercase_and_lowercase_letters_and_numbers_to_morse
    translator = Translator.new
    output = translator.eng_to_morse("Hello World")
    assert_equal("......-...-..--- .-----.-..-..-..", output)
    output = translator.eng_to_morse("There are 3 ships")
    assert_equal("-......-.. .-.-.. ...-- ..........--....", output)
  end

  def test_translator_translates_file_contents_to_morse
    translator = Translator.new
    output = translator.eng_to_morse_from_file("input.txt")
    assert_equal(".. .--- ..-. .- ..-....-...", output)
  end

  def test_translator_translates_morse_to_english
    translator = Translator.new
    output = translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")
    assert_equal("hello world", output)
  end

end
