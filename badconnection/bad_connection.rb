=begin
Write a program which can imitate a Customer Service Representative whose phone connection is bad with these rules:

If you don’t input anything (just hit enter) they respond with HELLO?!
If you ask a question with any lower-case letters, they respond with I AM HAVING A HARD TIME HEARING YOU.
If you ask a question in all upper-case letters, they respond with NO, THIS IS NOT A PET STORE
The first time you say GOODBYE! they say ANYTHING ELSE I CAN HELP WITH?
The second time you say GOODBYE! they say THANK YOU FOR CALLING! and the program exits.
=end

class CustomerService
  attr_reader :continue_call
  GOODBYE = "GOODBYE!"
  def initialize
    @messages = {}
    @messages[:empty] = 'HELLO!'
    @messages[:downcase] = 'I AM HAVING A HARD TIME HEARING YOU.'
    @messages[:upcase] = 'NO, THIS IS NOT A PET STORE'
    @messages[:goodbye1] = 'ANYTHING ELSE I CAN HELP WITH?'
    @messages[:goodbye2] = 'THANK YOU FOR CALLING!'
    @goodbye_count = 0
    @continue_call = true;
  end

  def answer
    'HELLO, THIS IS A GROCERY STORE!'
  end

  def say_message(input)
    if input.empty?
      input = ''
    end
    
    case input
    #when "\n" only works when not using chomp, which breaks String literal case
    when ''
      @messages[:empty]
    when GOODBYE
      if @goodbye_count == 0
         @goodbye_count += 1
         @messages[:goodbye1]
      elsif @goodbye_count >= 1
        @continue_call = false
        @messages[:goodbye2]
      end
    when input.upcase
      #when /[A-Z]/
      @messages[:upcase]
    when /[a-z]/
      @messages[:downcase]
    end
  end
end

csr = CustomerService.new

puts csr.answer
loop do
 input = gets.chomp
 puts csr.say_message(input)
 break if !csr.continue_call
end
