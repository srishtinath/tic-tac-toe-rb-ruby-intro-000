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

# code your input_to_index and move method here!
def input_to_index(index)
  index = index.to_i - 1
end

def move(board, index, character = "X")
  board[index] = character
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
end # close def
# need to figure out empty board and draw

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
