#1.  ask user for input number one and store it
#2.  ask user for input number two and store it
#3.  ask user for input operator and store it
#4.  if inputs are not number, has spaces ask again for an apropriate input
# => else continue
#5.  calculate results and display
#
#
def ask words
  puts words
end

def re_ask words
  puts words
end


loop do  
  ask "This is a calculator, chose the first number for you calculation: "
  number_1 = gets.chomp

  ask "Chose now your second number:"
  number_2 = gets.chomp

  ask "Chose now your operator ( + , - , * , / ) :"
  operator = gets.chomp

  puts "#{number_1} + #{number_2} = #{number_1.to_i + number_2.to_i}" if operator == "+"
  puts "#{number_1} - #{number_2} = #{number_1.to_i - number_2.to_i}" if operator == "-"
  puts "#{number_1} * #{number_2} = #{number_1.to_i * number_2.to_i}" if operator == "*"
  puts "#{number_1} / #{number_2} = #{number_1.to_f / number_2.to_f}" if operator == "/"

  puts "Do you want to perform another calculation? (Y/N)"
  replay = gets.chomp

  break if replay.downcase == "n"
end 



