# => ask for user input and store it
# => computer make choice and we strore it
# => r > s,  s > p,  p > r and if they are the same is tie
#
#
#
#
#

CHOICES = {'p' => 'paper',
           'r' => 'rock',
           's' => 'scissor'
          }


def winning_message choice
  case choice
  when "r" then puts "Rock wins against Scissor"
  when "s" then puts "Scissor wins against Paper"
  when "p" then puts "Paper wins against Rock"
  end
end

puts "This is Paper, Rock, Scissor. Challenge the computer.."

loop do
  begin
    puts "Chose one: (p, r, s)"
    user_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(user_choice)

  computer_choice = CHOICES.keys.sample 

  puts "You chosed #{user_choice} and the computer #{computer_choice}."

  if (user_choice == "r" && computer_choice == "s") || (user_choice == "p" && computer_choice == "r") || (user_choice == "s" && computer_choice == "r")
    winning_message(user_choice)
    puts "You Win!"
  elsif user_choice == computer_choice
    puts "This is a tie"
  else
    winning_message(computer_choice)
    puts "You Lose!"
  end

  puts "Do you want to play agin? (y/n)"
  break if gets.chomp.downcase != "y"  
end




