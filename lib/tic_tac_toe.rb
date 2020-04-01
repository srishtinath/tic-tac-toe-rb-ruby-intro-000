#WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, character = "X")
  board[index] = character
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index >= 0 && index <= 8
    if position_taken?(board,index) == false
      true
    else
      false
    end
  else
    false
  end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

    if valid_move?(board,index)
      move(board, index, "X")
      display_board(board)
    elsif valid_move?(board,index) == false
      puts "Please enter valid number."
      turn(board)
    end
end

def turn_count(board)
  counter = 0
  board.each do |value|
    if (value == "X" || value == "O")
      counter +=1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 != 0
    return "O"
  else
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each { |win_combination|
    value_1 = board[win_combination[0]]
    value_2 = board[win_combination[1]]
    value_3 = board[win_combination[2]]

      if (value_1 == "X" && value_2 == "X" && value_3 == "X") || (value_1 == "O" && value_2 == "O" && value_3 == "O")
          return win_combination
      end #close if statement

  }
  return false
end

def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  if full?(board) && (won?(board) == false)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board)
    return true
  else
    return false
  end

end

def winner(board)
  if draw?(board)
    return nil
  elsif over?(board)
    return board[won?(board)[0]]
  else
    return nil
  end

end

def play(board)
  input = gets
  until over?(board)
    turn(board)
    if winner(board) == "X"
      puts "Congratulations on winning, player 1!"
      elsif winner(board) == "O"
        puts "Congratulations on winning, player 2!"
      elsif winner(board).nil?
        puts "It was a draw!"
    end
  end
end
end
