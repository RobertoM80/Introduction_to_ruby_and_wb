require 'pry'
def ask words
  puts "----------------------------------".center(45)
  puts words.center(45)
end

puts "Welcome to simple calculator!".center(45)

def check_valid_input
  ask "Chose the first number for you calculation:"
  first_num = gets.chomp
  if !first_num.include?(" ") && first_num =~ (/\A[+-]?\d+?(\.\d+)?\Z/) 
    def num2 first_num
      ask "Chose now the second number:"
      second_num = gets.chomp
      if !second_num.include?(" ") && second_num =~ (/\A[+-]?\d+?(\.\d+)?\Z/)
        def operator(second_num, first_num)
          ask "Chose an operator:"
            #binding.pry
          puts "press 1 to sum #{first_num} and #{second_num}".center(45)
          puts "press 2 to subtract #{first_num} and #{second_num}".center(45)
          puts "press 3 to divide #{first_num} and #{second_num}".center(45)
          puts "press 4 to multiply #{first_num} and #{second_num}".center(45)
          operator = gets.chomp
          puts ".....................................".center(45)
            if operator == "1"
              puts "#{first_num} plus #{second_num} = #{first_num.to_i + second_num.to_i}".center(45)
            elsif operator == "2"
              puts "#{first_num} minus #{second_num} = #{first_num.to_i - second_num.to_i}".center(45) 
            elsif operator == "3"
              puts "#{first_num} divided by #{second_num} = #{first_num.to_f / second_num.to_f}".center(45)
            elsif operator == "4"
              puts "#{first_num} multiplied by #{second_num} = #{first_num.to_i * second_num.to_i}".center(45)
            else
              puts "This is not a valid operator".center(45)
              operator(second_num, first_num)
            end
        end
        operator(second_num, first_num)
      else
        puts "I am sorry, as I told you, the valid imputs are just numbers with no spaces and special characters... "
        num2 first_num
      end
       #end
    end
    num2 first_num
  else
    puts "I am sorry, the valid imputs are just numbers with no spaces and special characters... "
    check_valid_input
  end
  puts "'''''''''''''''''''''''''''''''''''''".center(45)
end

check_valid_input


