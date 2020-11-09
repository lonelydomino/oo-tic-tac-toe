class TicTacToe

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def initialize
    @board = [" "," "," ",
              " "," "," ",
              " "," "," ",]
end
def input_to_index(n)
    num = n.to_i
    num = num - 1
    return num
  end
  def move(index, char)
    index = index.to_i
    @board[index] = char
  end
  def position_taken?(i)
    if @board[i] == "X" || @board[i] == "O"
      return true
    elsif @board[i] == ""
      return false
    elsif @board[i] == " "
      return false
      elsif @board[i] == NIL
      return false 
    end
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    correctmove = false
    while correctmove == false
      input = gets.strip
      input = input_to_index(input)
      correctmove = valid_move?(input)
      if correctmove == true
        break
      end
      puts "Please enter correct input."
    end
    move(input, current_player)
    display_board
  end
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else
      return "O"
    end
  end
  def turn_count
    count = 0
    @board.each do |thing|
      
      if thing == " "
        
    else
      count += 1
    end
  
    end
    return count
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combination = win_combination.to_a
        return win_combination
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combination = win_combination.to_a
        return win_combination
      end
    end
    return nil
  end
  def full?
    @board.each do |this|
      if this == " "
        return false
      end
    end
  end
  def draw?
    status = full?
    if status && !won?
      return true
    elsif status == false && won? == false
      return false
    elsif won? == true
      return false
    end
  end
  def over?
    if full? || draw? || won?
      return true
    else
      return false
    end
  end
  def winner
    winCombo = won?
    if winCombo == nil
      return nil
    end
    
    index1 = winCombo[0]
    index2 = winCombo[1]
    index3 = winCombo[2]
    if @board[index1] == "X" && @board[index2] == "X" && @board[index3]  == "X"
        return "X"
      end
    if @board[index1]  == "O" && @board[index2]  == "O" && @board[index3]  == "O"
        return "O"
    end
  end
  def play
    until over? == true
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif winner == nil
      puts "Cat's Game!"
    end
  end
end