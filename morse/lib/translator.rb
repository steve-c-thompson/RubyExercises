class Translator

  def initialize
    @dictionary = {"a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => " "}
      @reverse_dictionary = @dictionary.invert
  end

  def eng_to_morse(input)
    chars = input.downcase.split('')
    output = chars.map {|c| @dictionary[c]}
    output = output.join('')
  end

  def eng_to_morse_from_file(input_file)
    file = File.open(input_file)
    input =""
    file.each do |line|
      input << line
    end
    eng_to_morse(input)
  end

  def morse_to_eng(input)
    chars = input.downcase.split(/\s/)  # if the input is a single space, run of whitespace is used
    # add a space at every odd index
    output = chars.map do |c|
      if c.empty?
        " "
      else
        @reverse_dictionary[c]
      end
    end
    output = output.join('')
  end
end
