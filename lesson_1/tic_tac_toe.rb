
def initialize_board
  b = {}
  (1..9).each {|number| b[number] = " "}
  b
end

def draw_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "-----------"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "-----------"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

def empty_squares(board)
  board.select {|k, v| v == " "}.keys
end

def player_pick_square(board)
  puts "Pick a square (1 to 9)"
  player_choice = gets.chomp.to_i
  if board[player_choice] != " "
    puts "This position is already taken. Chose another one"
    player_pick_square(board)
  else
    board[player_choice] = "X"
  end
end

def computer_pick_square(board)
  smart_computer board 
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |arr|
    return "Player" if board.values_at(*arr).count("X") == 3
    return "Computer" if board.values_at(*arr).count("O") == 3
  end
  nil
end   

def choosed_if_two_in_a_row board, winning_lines, choosed, mark
  winning_lines.each do |arr|
    if board.values_at(*arr).count(mark) == 2 && board.values_at(*arr).include?(" ") && board[5] != " " && choosed == false
      board[arr[0]] = "O" if board[arr[0]] == " "
      board[arr[1]] = "O" if board[arr[1]] == " "
      board[arr[2]] = "O" if board[arr[2]] == " "
      break
    end
  end
end

def choosed_if_not_two_in_a_row board, choosed
  if board[5] == " " && choosed == false
     board[5] = "O"
  else
    computer_choice = board.select { |k, v| v == " " }.keys.sample
     board[computer_choice] = "O"
  end
end

def smart_computer board
  choosed = false
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  number_of_empty_squares = board.values.count(" ")
  choosed_if_two_in_a_row board, winning_lines, choosed, "O" if board.values.count(" ") == number_of_empty_squares
  choosed_if_two_in_a_row board, winning_lines, choosed, "X" if board.values.count(" ") == number_of_empty_squares
  choosed_if_not_two_in_a_row board, choosed if board.values.count(" ") == number_of_empty_squares
end

board = initialize_board
draw_board(board)

begin 
  player_pick_square(board)
  draw_board(board)
  winner = check_winner(board)
  if winner == nil 
    computer_pick_square(board)
    draw_board(board)
    winner = check_winner(board) 
  end
end until winner || empty_squares(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!" 
end 
