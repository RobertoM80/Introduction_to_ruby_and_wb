
class Hand

  include Comparable

  attr_reader :value

  def initialize(v)
    @value = v
  end

  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == "p" && another_hand.value == "r") ||
    (@value == "r" && another_hand.value == "s") ||
    (@value == "s" && another_hand.value == "p")
      1
    else
      -1
    end
  end

  def display_winning_messsage
    case @value
    when "r" then puts "Rock wins against Scissor"
    when "s" then puts "Scissor wins against Paper"
    when "p" then puts "Paper wins against Rock"
    end
  end

end

class Player

  attr_accessor :hand
  attr_reader :name 

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name} has a choice of #{self.hand.value}."
  end

end

class Person < Player

  def pick_hand
    begin
      puts "Chose one: (p, r, s)"
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)
    self.hand = Hand.new(c)
  end 

end

class Computer < Player

  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
  end

end

class Game

  CHOICES = {'p' => "paper", 'r' => "rock", 's' => "scissor"}

  attr_reader :player, :computer

  def initialize
    @player = Person.new("Roberto")
    @computer = Computer.new("C3PO") 
  end

  def compare_hands
    if player.hand == computer.hand
      puts "it's a tie!"
    elsif player.hand > computer.hand
      player.hand.display_winning_messsage
      puts "#{player.name} won"
    else
      computer.hand.display_winning_messsage
      puts "#{computer.name} won"
    end
  end
  
  def play
    loop do 
      player.pick_hand
      puts player
      computer.pick_hand
      puts computer
      compare_hands
      puts "Do you want to play again? (y/n)"
      break if gets.chomp != "y" 
    end
  end

end


game = Game.new.play



