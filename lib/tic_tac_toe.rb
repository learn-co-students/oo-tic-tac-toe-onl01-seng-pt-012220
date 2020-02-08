class TicTacToe
  attr_accessor :board
  
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
  
   def initialize(board = nil)
    @board = board || Array.new(9, " ")
   end
   
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
  end
  
  def input_to_index(user_input)
    user_input.to_i-1
  end
  
  def move(index,token)
    @board[index]=token
  end 
  
  def position_taken?(index)
   if  ((@board[index] == "X") || (@board[index] == "O"))
     return true 
   else
    return false 
   end
 end 
 
  def valid_move?(index)
  if(( index<=8 && index>=0)) && (!position_taken?(index))
      return true 
    else
     return nil
   end 
 end 
 
 def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn             # ask the method again 
    end
 end

   def turn_count
     number_of_turns = 0 
     @board.each {|board| 
     if board == "X" || board == "O"
     number_of_turns += 1
    end}
     return number_of_turns
   end 
 
 def current_player
  if turn_count%2 == 0 
  "X"
    else
  "O"
  end
end
   
  def won?
   for i in 0..WIN_COMBINATIONS.length-1 do
   if (@board[WIN_COMBINATIONS[i][0]]) == "X" &&  (@board[WIN_COMBINATIONS[i][1]]) == "X" &&(@board[WIN_COMBINATIONS[i][2]]) == "X"
     return @board
       
    elsif (@board[WIN_COMBINATIONS[i][0]]) == "O" && (@board[WIN_COMBINATIONS[i][1]]) == "O" &&(@board[WIN_COMBINATIONS[i][2]]) == "O"
      return @board
    else
    return
     false
    end 
  end 
 end 

  def full?
    @board.all?{|b| b!=" "}
  end
  
  def draw?
  !(won?) && (full?)
  end
 
 def over?
  won? || full? || draw?
 end
 
 def winner
  for i in 0..WIN_COMBINATIONS.length-1 do
   if (@board[WIN_COMBINATIONS[i][0]]) == "X" && (@board[WIN_COMBINATIONS[i][1]]) == "X" && (@board[WIN_COMBINATIONS[i][2]]) == "X"
       return "X"
    elsif (@board[WIN_COMBINATIONS[i][0]]) == "O" && (@board[WIN_COMBINATIONS[i][1]]) == "O" && (@board[WIN_COMBINATIONS[i][2]]) == "O"
       return "O"
    else
    return
     nil
    end 
  end 
  end 
  

def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
    
  elsif draw?
    puts "Cat's Game!"
  end
end



end 